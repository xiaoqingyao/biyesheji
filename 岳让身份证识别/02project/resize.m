I = imread('picture/zu.bmp');
%figure, imshow(I);title('ԭʼͼ��');
I=imresize(I,[36 23]);
I=rgb2gray(I);%ת�Ҷ�ͼ
thresh=graythresh(I);
BW=im2bw(I,thresh);
%figure, imshow(I);
imwrite(I,'picture\end\zu.bmp');