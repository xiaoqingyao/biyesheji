function II=erzhihua(I,deltax,deltay)
%��ͼ��ֿ鴦��ˮƽ����Ϊdeltay������ֱ����Ϊdeltax�������ܹ�ΪN=deltay*deltax��
[m,n]=size(I);
II=zeros(m,n);
ax=floor(m/deltax);
ay=floor(n/deltay);
for i=1:deltax  %����ѭ�����ֿ鴦��
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
        
    I1=I(x_min:x_max,y_min:y_max); %�ѿ��ڵ�ֵȡ����
    J=imagebw(I1);%�õ���ֵ����ͼ--����imagebw����
    II(x_min:x_max,y_min:y_max)=J;%�Ѷ�ֵ�������ͼ����
  end
end
