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
    letter='姓';
elseif vd==14
    letter='名';
elseif vd==15
    letter='性';
elseif vd==16
    letter='别';
elseif vd==17
    letter='民';
elseif vd==18
    letter='族';
elseif vd==19
    letter='出';
elseif vd==20
    letter='生';
elseif vd==21
    letter='年';
elseif vd==22
    letter='月';
elseif vd==23
    letter='日';
elseif vd==24
    letter='住';
elseif vd==25
    letter='址';
elseif vd==26
    letter='公';
elseif vd==27
    letter='身';
elseif vd==28
    letter='份';
elseif vd==29
    letter='证';
elseif vd==30
    letter='号';
elseif vd==31
    letter='码';
elseif vd==32
    letter='男';
elseif vd==33
    letter='女';
elseif vd==34
    letter='汉';
elseif vd==35
    letter='3';
else
    letter='*';
end
end
