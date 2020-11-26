I = imread('picture/zu.bmp');
%figure, imshow(I);title('原始图像');
I=imresize(I,[36 23]);
I=rgb2gray(I);%转灰度图
thresh=graythresh(I);
BW=im2bw(I,thresh);
%figure, imshow(I);
imwrite(I,'picture\end\zu.bmp');