function letter=read_letter(imagn,num_letras)
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 42 x 24 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
global templates
comp=[ ];
for n=1:num_letras
    sem=corr2(templates{1,n},imagn);
    comp=[comp sem];
end
    
    flag=0;
 if max(comp)>=0.41
    flag=1;
 else
    letter='*';
 end
if flag==1
vd=find(comp==max(comp));

%*-*-*-*-*-*-*-*-*-*-*-*-*-
if vd==1
    letter='1';
elseif vd==2
    letter='2';
elseif vd==3
    letter='3';
elseif vd==4
    letter='4';
elseif vd==5
    letter='5';
elseif vd==6
    letter='6';
elseif vd==7
    letter='7';
elseif vd==8
    letter='8';
elseif vd==9
    letter='9';
elseif vd==10
    letter='0';
    %*-*-*-*-*
elseif vd==11
    letter='X';
elseif vd==12
    letter='Y';
elseif vd==13
    letter='��';
elseif vd==14
    letter='��';
elseif vd==15
    letter='��';
elseif vd==16
    letter='��';
elseif vd==17
    letter='��';
elseif vd==18
    letter='��';
elseif vd==19
    letter='��';
elseif vd==20
    letter='��';
elseif vd==21
    letter='��';
elseif vd==22
    letter='��';
elseif vd==23
    letter='��';
elseif vd==24
    letter='ס';
elseif vd==25
    letter='ַ';
elseif vd==26
    letter='��';
elseif vd==27
    letter='��';
elseif vd==28
    letter='��';
elseif vd==29
    letter='֤';
elseif vd==30
    letter='��';
elseif vd==31
    letter='��';
elseif vd==32
    letter='��';
elseif vd==33
    letter='Ů';
elseif vd==34
    letter='��';
elseif vd==35
    letter='3';
else
    letter='*';
end
end
