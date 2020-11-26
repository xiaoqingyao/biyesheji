function [] = demo_1()
    close all;
    clear;
    [pictureName] = uigetfile('*.jpg', '请选择图片');
    pictureInit = init(pictureName); 
    tic;            %开始计时
    pictureCut = cut(pictureInit);
    pictureRo = rotate(pictureCut);
    pictureLo = location(pictureRo);
    char(pictureLo);
end

%图像的预处理函数
function [pictureOut] = init(pictureName)
    global picture;
    picture = imread(pictureName);
    picture2Gray = rgb2gray(picture);                %转为灰度图像
%     figure,
%     subplot(1, 3, 1),imshow(picture);title('原始图像');          
%     subplot(1, 3, 2),imshow(picture2Gray);title('原始图像的灰度图');
%     subplot(1, 3, 3),imhist(picture2Gray);title('原始图像的灰度直方图');colorbar;
    
%     grayEn = imadjust(picture2Gray, [], [0.25, 0.75], 2);       %灰度图增强
    grayEn = histeq(picture2Gray);              %灰度图均匀化
%     figure, 
%     subplot(1, 2, 1), imshow(grayEn);title('灰度增强之后的图像');
%     subplot(1, 2, 2), imhist(grayEn);title('灰度增强之后的直方图');
    %边缘检测
    grayEn = imfilter(grayEn, fspecial('average', 3));      %均值平滑增强之后的灰度图像
    pictureOut = edge(grayEn, 'sobel');     
%     figure,
%     imshow(pictureOut), title('sobel边缘检测之后的图像');
    close all;
end

%图像的初步定位
function [pictureOut] = cut(pictureIn)
    global picture;
    %腐蚀处理去除边界点
    se1 = [1 ; 1 ; 1];
    pictureErode = imerode(pictureIn, se1);
%     figure, imshow(pictureErode), title('边缘检测+腐蚀的图像'); 
    %闭运算，先膨胀后腐蚀去除孔洞，可以平滑图像
    se2 = strel('rectangle', [48, 48]);
    pictureClose = imclose(pictureErode, se2);
%     figure, imshow(pictureClose), title('经过腐蚀+开运算后的图像'); 
    pictureCut = bwareaopen(pictureClose, 10000);                    %把小面积去掉
    pictureCut = removeLargeArea(pictureCut, 50000);             %把大面积去掉
%     figure, imshow(pictureCut), title('初步裁剪完之后的图像');
    % 定位车牌的区域
    pictureRe = regionprops(pictureCut, 'area', 'boundingbox');
%     areas = [pictureRe.Area];                                                    %将面积对象保存到areas里
    rects = cat(1, pictureRe.BoundingBox);                               %将面积对象的边界条件链接并保存到rects，顺序为[起始点x坐标, 起始点y坐标, 面积对象长度(x), 面积对象宽度(y)]      
%     figure, imshow(pictureCut), title('红色框标记完之后的图像');  
    rectangle('position', rects(1, :), 'EdgeColor', 'r');                     %定位车牌区域，并用红色的框标记
    pictureOut = imcrop(picture, rects(1, :));                               %按照红线框切割车牌区域
%     figure, imshow(pictureOut), title('裁剪完之后的图像');
    close all;
end

% 对倾斜的角度进行调整
function [pictureOut] = rotate(pictureIn)
    pictureGray1 = rgb2gray(pictureIn);
    %水平方向调整
    T=affine2d([0 1 0;1 0 0;0 0 1]);
    pictureTr=imwarp(pictureGray1,T);              % 图像转置，顺时针旋转90°调整水平方向
    theta = -20 : 20;                                          %设置倾斜角度的范围
    r1 = radon(pictureTr, theta);                        %radon变换确定倾斜角
    result1 = sum(abs(diff(r1)), 1);                      %求出行倒数绝对值的累加和，最大的对应倾斜角
    rot1 = find(result1==max(result1))-21;
    pictureRo = imrotate(pictureIn, rot1);
%     figure, imshow(pictureRo), title('调整水平角度之后的图像');
    %竖直方向调整
    pictureGray2 = rgb2gray(pictureRo);
    r2 = radon(pictureGray2, theta);
    result2 = sum(abs(diff(r2)), 1);
    rot2 = (find(result2==max(result2))-21)/57.3;           %将数值转为角度
    if rot2>0
        T1 = affine2d([1 0 0 ; -tan(rot2) 1 0 ; size(pictureGray2, 1) * tan(rot2) 0 1]);
    else
        T1 = affine2d([1 0 0 ; tan(-rot2) 1 0 ; size(pictureGray2, 1) * tan(-rot2) 0 1]);
    end
    pictureOut = imwarp(pictureRo, T1);
%     figure, imshow(pictureOut), title('水平+竖直调整之后的图像');
    close all;
end

%图像的精确定位
function [pictureOut] = location(pictureIn)
    % 去除上、下边框以及铆钉
    pictureGray1 = rgb2gray(pictureIn);
    [mY1, nY1] = size(pictureGray1);
    yresult = sum(abs(diff(pictureGray1)), 2);%1为列， 2为行
    yresult = imfilter(yresult, fspecial('average', 6));
    %计算上界坐标
    yTemp1 = yresult(10 : ceil(mY1/4), 1);
    [~, ymin] = max(yTemp1);
    %计算下界坐标
    yTemp2 = yresult(ceil(mY1/4) : (mY1 - 1), 1);
    [~, ymax] = max(yTemp2);
    ymax = ymax + ceil(mY1/4);
    pictureCutY =  imcrop(pictureIn, [1, ymin+5, nY1 , (ymax - ymin)-8]);
    
    % 去除左、右边框
    pictureGray2 = rgb2gray(pictureCutY);
    [mX, nX] = size(pictureGray2);
    xdiff = zeros(mX, nX-1);
    for i = 1:mX
        xdiff(i, :) = abs(diff(pictureGray2(i, :)));            %计算各列之间的差值并累加
        xresult = sum(xdiff, 1);
    end
    xresult = imfilter(xresult, fspecial('average', 6));
    %计算左界坐标
    xTemp1 = xresult( 1, 1 : ceil(nX/5));
    [~, xmin] = max(xTemp1);
    %计算右界坐标
    xTemp2 = xresult( 1, ceil(4*nX/5):(nX - 1));
    [~, xmax] = max(xTemp2);
    xmax = xmax + ceil(4*nX/5);
    pictureOut =  imcrop(pictureCutY, [xmin, 1,  (xmax - xmin) , mX]);
%     figure, imshow(pictureOut), title('精确定位之后的图像');
    close all;
end

function [] = char(pictureIn)
    pictureGray = rgb2gray(pictureIn);
    level = graythresh(pictureGray);          %ostu自动分割阈值法
    pictureBw = imbinarize(pictureGray, level);
    pictureBw1 = imfilter(pictureBw, fspecial('average', 3));
%     figure, imshow(pictureBw1), title('ostu二值化+均匀滤波后的图像');
    [~, nY] = size(pictureBw1);
    distance = round(nY/15);            %分成15份可以把中间的点去掉
    pictureWord1 =  imresize(pictureBw1(:, 1:distance*2), [48 24]);                %归一化切割处理
    pictureWord2 =  imresize(pictureBw1(:, distance*2 : distance*4), [48 24]);
    pictureWord3 =  imresize(pictureBw1(:, distance*5 : distance*7), [48 24]);
    pictureWord4 =  imresize(pictureBw1(:, distance*7 : distance*9), [48 24]);
    pictureWord5 =  imresize(pictureBw1(:, distance*9 : distance*11), [48 24]);
    pictureWord6 =  imresize(pictureBw1(:, distance*11 : distance*13), [48 24]);
    pictureWord7 =  imresize(pictureBw1(:, distance*13 : end), [48 24]);
    figure,
    subplot(1, 7, 1), imshow(pictureWord1), title('1');
    subplot(1, 7, 2), imshow(pictureWord2), title('2');
    subplot(1, 7, 3), imshow(pictureWord3), title('3');
    subplot(1, 7, 4), imshow(pictureWord4), title('4');
    subplot(1, 7, 5), imshow(pictureWord5), title('5');
    subplot(1, 7, 6), imshow(pictureWord6), title('6');
    subplot(1, 7, 7), imshow(pictureWord7), title('7');
	num(1, 1) = shibiehanzi(pictureWord1);
    num(1, 2) = shibiezimu(pictureWord2);
    num(1, 3) = shibiehunhe(pictureWord3);
    num(1, 4) = shibiehunhe(pictureWord4);
    num(1, 5) = shibiehunhe(pictureWord5);
    num(1, 6) = shibiehunhe(pictureWord6);
    num(1, 7) = shibiehunhe(pictureWord7);
    msgbox(num, '检测结果');   
    text(200, 200, 'num');
end






