function II=erzhihua(I,deltax,deltay)
%将图像分块处理，水平方向为deltay个，竖直方向为deltax个，这总共为N=deltay*deltax个
[m,n]=size(I);
II=zeros(m,n);
ax=floor(m/deltax);
ay=floor(n/deltay);
for i=1:deltax  %两个循环，分块处理
       x_min=1+(i-1)*ax;
    if i<deltax 
        x_max=i*ax;
    else  
        x_max=m;
    end
  for j=1:deltay
       y_min=1+(j-1)*ay;
    if j<deltay
       y_max=j*ay;
    else
        y_max=n;
    end
        
    I1=I(x_min:x_max,y_min:y_max); %把块内的值取出来
    J=imagebw(I1);%得到二值化的图--调用imagebw函数
    II(x_min:x_max,y_min:y_max)=J;%把二值化处理后图像传入
  end
end
