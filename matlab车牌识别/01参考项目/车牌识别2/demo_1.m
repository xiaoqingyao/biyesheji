function [] = demo_1()
    close all;
    clear;
    [pictureName] = uigetfile('*.jpg', '��ѡ��ͼƬ');
    pictureInit = init(pictureName); 
    tic;            %��ʼ��ʱ
    pictureCut = cut(pictureInit);
    pictureRo = rotate(pictureCut);
    pictureLo = location(pictureRo);
    char(pictureLo);
end

%ͼ���Ԥ������
function [pictureOut] = init(pictureName)
    global picture;
    picture = imread(pictureName);
    picture2Gray = rgb2gray(picture);                %תΪ�Ҷ�ͼ��
%     figure,
%     subplot(1, 3, 1),imshow(picture);title('ԭʼͼ��');          
%     subplot(1, 3, 2),imshow(picture2Gray);title('ԭʼͼ��ĻҶ�ͼ');
%     subplot(1, 3, 3),imhist(picture2Gray);title('ԭʼͼ��ĻҶ�ֱ��ͼ');colorbar;
    
%     grayEn = imadjust(picture2Gray, [], [0.25, 0.75], 2);       %�Ҷ�ͼ��ǿ
    grayEn = histeq(picture2Gray);              %�Ҷ�ͼ���Ȼ�
%     figure, 
%     subplot(1, 2, 1), imshow(grayEn);title('�Ҷ���ǿ֮���ͼ��');
%     subplot(1, 2, 2), imhist(grayEn);title('�Ҷ���ǿ֮���ֱ��ͼ');
    %��Ե���
    grayEn = imfilter(grayEn, fspecial('average', 3));      %��ֵƽ����ǿ֮��ĻҶ�ͼ��
    pictureOut = edge(grayEn, 'sobel');     
%     figure,
%     imshow(pictureOut), title('sobel��Ե���֮���ͼ��');
    close all;
end

%ͼ��ĳ�����λ
function [pictureOut] = cut(pictureIn)
    global picture;
    %��ʴ����ȥ���߽��
    se1 = [1 ; 1 ; 1];
    pictureErode = imerode(pictureIn, se1);
%     figure, imshow(pictureErode), title('��Ե���+��ʴ��ͼ��'); 
    %�����㣬�����ͺ�ʴȥ���׶�������ƽ��ͼ��
    se2 = strel('rectangle', [48, 48]);
    pictureClose = imclose(pictureErode, se2);
%     figure, imshow(pictureClose), title('������ʴ+��������ͼ��'); 
    pictureCut = bwareaopen(pictureClose, 10000);                    %��С���ȥ��
    pictureCut = removeLargeArea(pictureCut, 50000);             %�Ѵ����ȥ��
%     figure, imshow(pictureCut), title('�����ü���֮���ͼ��');
    % ��λ���Ƶ�����
    pictureRe = regionprops(pictureCut, 'area', 'boundingbox');
%     areas = [pictureRe.Area];                                                    %��������󱣴浽areas��
    rects = cat(1, pictureRe.BoundingBox);                               %���������ı߽��������Ӳ����浽rects��˳��Ϊ[��ʼ��x����, ��ʼ��y����, ������󳤶�(x), ���������(y)]      
%     figure, imshow(pictureCut), title('��ɫ������֮���ͼ��');  
    rectangle('position', rects(1, :), 'EdgeColor', 'r');                     %��λ�������򣬲��ú�ɫ�Ŀ���
    pictureOut = imcrop(picture, rects(1, :));                               %���պ��߿��и������
%     figure, imshow(pictureOut), title('�ü���֮���ͼ��');
    close all;
end

% ����б�ĽǶȽ��е���
function [pictureOut] = rotate(pictureIn)
    pictureGray1 = rgb2gray(pictureIn);
    %ˮƽ�������
    T=affine2d([0 1 0;1 0 0;0 0 1]);
    pictureTr=imwarp(pictureGray1,T);              % ͼ��ת�ã�˳ʱ����ת90�����ˮƽ����
    theta = -20 : 20;                                          %������б�Ƕȵķ�Χ
    r1 = radon(pictureTr, theta);                        %radon�任ȷ����б��
    result1 = sum(abs(diff(r1)), 1);                      %����е�������ֵ���ۼӺͣ����Ķ�Ӧ��б��
    rot1 = find(result1==max(result1))-21;
    pictureRo = imrotate(pictureIn, rot1);
%     figure, imshow(pictureRo), title('����ˮƽ�Ƕ�֮���ͼ��');
    %��ֱ�������
    pictureGray2 = rgb2gray(pictureRo);
    r2 = radon(pictureGray2, theta);
    result2 = sum(abs(diff(r2)), 1);
    rot2 = (find(result2==max(result2))-21)/57.3;           %����ֵתΪ�Ƕ�
    if rot2>0
        T1 = affine2d([1 0 0 ; -tan(rot2) 1 0 ; size(pictureGray2, 1) * tan(rot2) 0 1]);
    else
        T1 = affine2d([1 0 0 ; tan(-rot2) 1 0 ; size(pictureGray2, 1) * tan(-rot2) 0 1]);
    end
    pictureOut = imwarp(pictureRo, T1);
%     figure, imshow(pictureOut), title('ˮƽ+��ֱ����֮���ͼ��');
    close all;
end

%ͼ��ľ�ȷ��λ
function [pictureOut] = location(pictureIn)
    % ȥ���ϡ��±߿��Լ�í��
    pictureGray1 = rgb2gray(pictureIn);
    [mY1, nY1] = size(pictureGray1);
    yresult = sum(abs(diff(pictureGray1)), 2);%1Ϊ�У� 2Ϊ��
    yresult = imfilter(yresult, fspecial('average', 6));
    %�����Ͻ�����
    yTemp1 = yresult(10 : ceil(mY1/4), 1);
    [~, ymin] = max(yTemp1);
    %�����½�����
    yTemp2 = yresult(ceil(mY1/4) : (mY1 - 1), 1);
    [~, ymax] = max(yTemp2);
    ymax = ymax + ceil(mY1/4);
    pictureCutY =  imcrop(pictureIn, [1, ymin+5, nY1 , (ymax - ymin)-8]);
    
    % ȥ�����ұ߿�
    pictureGray2 = rgb2gray(pictureCutY);
    [mX, nX] = size(pictureGray2);
    xdiff = zeros(mX, nX-1);
    for i = 1:mX
        xdiff(i, :) = abs(diff(pictureGray2(i, :)));            %�������֮��Ĳ�ֵ���ۼ�
        xresult = sum(xdiff, 1);
    end
    xresult = imfilter(xresult, fspecial('average', 6));
    %�����������
    xTemp1 = xresult( 1, 1 : ceil(nX/5));
    [~, xmin] = max(xTemp1);
    %�����ҽ�����
    xTemp2 = xresult( 1, ceil(4*nX/5):(nX - 1));
    [~, xmax] = max(xTemp2);
    xmax = xmax + ceil(4*nX/5);
    pictureOut =  imcrop(pictureCutY, [xmin, 1,  (xmax - xmin) , mX]);
%     figure, imshow(pictureOut), title('��ȷ��λ֮���ͼ��');
    close all;
end

function [] = char(pictureIn)
    pictureGray = rgb2gray(pictureIn);
    level = graythresh(pictureGray);          %ostu�Զ��ָ���ֵ��
    pictureBw = imbinarize(pictureGray, level);
    pictureBw1 = imfilter(pictureBw, fspecial('average', 3));
%     figure, imshow(pictureBw1), title('ostu��ֵ��+�����˲����ͼ��');
    [~, nY] = size(pictureBw1);
    distance = round(nY/15);            %�ֳ�15�ݿ��԰��м�ĵ�ȥ��
    pictureWord1 =  imresize(pictureBw1(:, 1:distance*2), [48 24]);                %��һ���и��
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
    msgbox(num, '�����');   
    text(200, 200, 'num');
end






