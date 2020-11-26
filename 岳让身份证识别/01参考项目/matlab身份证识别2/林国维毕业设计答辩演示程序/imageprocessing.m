%��������
screen=get(0,'ScreenSize');
W=screen(3);H=screen(4);
hf=figure('Color',[1,1,1],...
       'Name','���֤����ʶ����ʾϵͳ','NumberTitle','off','MenuBar','none');
 
   %�滭��[left bottom width height]
%uicontrol(gcf,'Style','Frame','Position',[0,0.55,0.45,0.45],...
  %'Units','normalized','back',[1,1,1]);
 
%����Plot�˵���,gcfͼ�δ��ھ��,hfileһ���˵����
hfile=uimenu(gcf,'Label','&�ļ�');
hprocess=uimenu(gcf,'Label','&ͼ����');

[namefile,pathname]=uigetfile('*.bmp','��ͼ��');
[i2,map]=imread(strcat(pathname,namefile));%ѡ���ͼƬ
I2 =rgb2gray(i2);%�Ҷ�ͼ��
i3=im2bw(I2,0.75);%����ת��Ϊ��ֵͼ��
i4=imcrop(i3,[300 350 400 300]);%�ָ�ͼ�� 
i5=imcrop(i3,[300 430 400 40]); %��λ���֤����

i6=medfilt2(i5,[2 2]);  %���ڴ�СΪ2*2
i7=double(i6);            %������㲻֧��unit8���ͣ�%���Խ�ͼ�����ת��Ϊdouble����                         
h=[0   1   0
   1  -4   0
   0   1  0];
j=conv2(i,h,'same');     %�������Ӷ�ͼ���˲�
k=i-j;                    %��ǿͼ��Ϊԭʼͼ���ȥ���������˲���ͼ��
se=strel('line',2,45);
i8=imdilate(i7,se);%����
se=strel('line',2,45);
i9=imerode(i8,se)%��ʴ

uimenu(hfile,'Label','��','Call',['subplot(1,1,1);','imshow(i2)']);%��ʾԭͼ
uimenu(hfile,'Label','�˳�','Call','close(gcf)');
uimenu(hprocess,'Label','�Ҷ�ͼ��','Call',['subplot(1,1,1);','imshow(I2)']);%��ʾ�Ҷ�ͼ��
uimenu(hprocess,'Label','��ֵ��ͼ��','Call',['subplot(1,1,1);','imshow(i3)']);%��ʾ��ֵ��ͼ��
uimenu(hprocess,'Label','�ָ�ͼ��','Call',['subplot(1,1,1);','imshow(i4)']);%�ָ�ͼ��
uimenu(hprocess,'Label','��λ���֤����','Call',['subplot(1,1,1);','imshow(i5)']);%��λ���֤����
uimenu(hprocess,'Label','��ֵ�˲�','Call',['subplot(1,1,1);','imshow(i6)']);%��ֵ�˲�
uimenu(hprocess,'Label','��','Call',['subplot(1,1,1);','imshow(i8)']);%��
%����˫�巨��һ���Ҷ�ͼ����лҶȷָ��

%��Ӱ�ť����
 hpush1=uicontrol(gcf,'Style','push','Unit','normalized',...
       'Posi',[0.02,0.05,0.15,0.08],'String',...
'��ֵ��','Call',['imshow(i3)']);
uicontrol(gcf,'Style','push','Unit','normalized',...
       'Posi',[0.90,0.05,0.10,0.10],'String',...
'�� ��','Call','close all');

hpopup=uicontrol(gcf,'Style','popup','Unit','normalized',...
'Posi',[0.85,0.8,0.15,0.15],'String',...
'�Ҷ�ͼ��|��ֵ��ͼ��|�ָ�ͼ��|��λ���֤����','Call',...
'imshow(I2)');

hc=uicontextmenu;             %������ݲ˵�
hls=uimenu(hc,'Label','������ɫ');    %�����˵���
uimenu(hls,'Label','&Red','Accelerator','r',...
'Call','set(gcf,''Color'',''r'');');
uimenu(hls,'Label','&Blue','Accelerator','b',...
'Call','set(gcf,''Color'',''b'');');
uimenu(hls,'Label','&Yellow','Call',...
'set(gcf,''Color'',''y'');');     
uimenu(hls,'Label','&White','Call',...
'set(gcf,''Color'',''w'');');  
set(gcf,'UIContextMenu',hc);     %���ÿ�ݲ˵������߶�����ϵ����

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�и����
I=im2bw(i5,0.43);
[y x]=size(I);


Top=zeros(1,x);         % �����������
for i=1:x
        j=1;
    while ((I(j,i)==1)&(j<y))
        j=j+1;
    end
    Top(i)=y-j;
end

Bottom=zeros(1,x);      % �ײ��������
for i=1:x
        j=y;
    while ((I(j,i)==1)&(j>1))
        j=j-1;
    end
    Bottom(i)=y-j;
end

Height=Top-Bottom;
WordHeight=max(Height);    % ���ָ߶�

%=== �����ߵİ���� ===%
TopD=zeros(1,x-1);
Concave=1;                            % ��¼����������λ��, 1��ʾĬ����ʼ��Ϊ��һ��Concave
Deep=0;                               % �½�ֵ
DeepH=0;                              %  ����ֵ
DeepT=5;                              % �������������ֵ
Sign=0;
for i=1:x-1
    TopD(i)=Top(i+1)-Top(i);
end
for i=1:x-2
    if (TopD(i)<0)  % �ж��Ƿ�Ϊ������
        Sign=1;     % �ñ�־λ
        DeepH=0;
        Deep=Deep+TopD(i);
        tempX=i+1;  % ��һ�п���Ϊ�зֵ�Concave�� ��ӽ������
    end
    if ((Sign==1)&(TopD(i)>0))
        if (abs(Deep)>=DeepT)
            DeepH=DeepH+TopD(i);
            if (abs(DeepH)>=DeepT)
               Concave=[Concave tempX];
               Sign=0;    % ȷ��Ϊ���󣬸�λ��־λ
               DeepH=0;
           end
        else
           Sign=0;    % ȷ��Ϊ���󣬸�λ��־λ
           Deep=0;           
        end      
    end
end

%=== �����ߵ�͹��� ===%
BottomD=zeros(1,x-1);
Convex=1;
Asend=0;                     % ����ֵ
Desend=0;                    % �½�ֵ
ConvexT=3;                   %  ͹�̶���ֵ
Sign=0;
for i=1:x-1
    BottomD(i)=Bottom(i+1)-Bottom(i);
end
for i=1:x-2
    if (BottomD(i)>0)
        Sign=1;
        Desend=0;
        Asend=Asend+BottomD(i);        
        tempX=i+1;         % ��ӽ������
    end
    if((Sign==1)&(BottomD(i)<0))
        if (abs(Asend)>=ConvexT)
            Desend=Desend+BottomD(i);
            if (abs(Desend)>=ConvexT)
                Convex=[Convex tempX];
                Sign=0;             % ��λ                                    
                Desend=0;
            end
        else
        Sign=0;             % ��λ
        Asend=0;     
        end  
    end
end

%=== �з� ===%

[mytemp n]=size(Concave);   % ע�� Concave �ĵ�һ����ֵ��Ч
StrokeT=5;                  % �ʻ������ֵ
GapT=8;
W=zeros(1,n);

for i=1:n-1
    W(i)=Concave(i+1)-Concave(i);
end
W(n)=x-Concave(n);
Width=median(W);           % ���Ƶ��ַ����

    PXR1=1;                 % ��¼��һ���з�λ��
    PXR2=1;                 % ��¼�ڶ����з�λ��
       
    Mark=0;         % ��¼�ڰ�ת���Ĵ���
    %CrossSign=0;    % ����ճ���ı�־
    
    Black=zeros(1,x);        % ͳ�Ʊʻ����ص�
    BP=zeros(1,x);
    SegSoke=zeros(3,x);      % �зֵ㴦�ıʻ����
    RH=zeros(1,x);           % �зֺ�ĸ߶ȱ�
    RW=zeros(1,x);           % �зֺ�Ŀ�ȱ�    
    Score=zeros(1,x);        % ����ֵ���ܵ÷�
    
    XGood=1;                 %  X�з�λ��    
    SegY=1;         % ��¼��һ���зֵ�Y���

for k=2:n
    WordH=max(Height(Concave(k-1):Concave(k)));
    WordW=Concave(k)-Concave(k-1);
    if ((WordW>=0.5*Width)&(WordW<=1.5*Width))
             
        % ѡ���зֵ�����
        PX1=Concave(k);
        PX2=PX1;              
        while ((TopD(PX2)==0)&(PX2<x))
               PX2=PX2+1;                % ���ұߵ���λ��
        end
            
       i=fix((PX1+PX2)/2);
   
       if (Top(i)==1)                  % ��ճ��
           PXR1=[PXR1 i];
           PXR2=[PXR2 i];
       else                            
            j=y+1-Top(i);                % PYΪʵ�ʵ�y����ֵ���˴���Ϊ��ɫ���ص�
            Mark=0;        
            while((j<y)&(Mark<2)) 
                if (I(j,i)==0)
                    Black(i)=Black(i)+1; % ��¼��ɫ���ص���            
                    Si=i;
                    while ((Si>1)&(I(j,Si)==0))   % ��ʻ����
                            Si=Si-1;
                            SegSoke(1,i)=SegSoke(1,i)+1;
                    end   
                        
                    Si=i;
                    while ((Si<x)&(I(j,Si)==0))   % �ұʻ����
                           Si=Si+1;
                           SegSoke(2,i)=SegSoke(2,i)+1;
                     end
               end
                 
                Mark=Mark+abs(I(j+1,i)-I(j,i));  % ����Ƿ�ͨ���ʻ�
                j=j+1;
            end
            SegY=[SegY j-1];                           % ��һ���зֽ�ֹ��
            if (j==38)
                PXR1=[PXR1 i];
                PXR2=[PXR2 i];
            else                                       % ����ճ��  
                SLi=i;
                while ((SLi>1)&(I(j-1,SLi)==1))        % ѡ��������߽�
                       SLi=SLi-1;
                end
        
                SRi=i;
                while ((SRi<x)&(I(j-1,SRi)==1))        % ѡ�������ұ߽�
                       SRi=SRi+1;
                end
                [Mytemp PX2]=max(Bottom(SLi:SRi));
                PXR2=[PXR2 PX2+SLi-1];
                PXR1=[PXR1 i];
            end
      end    
         
    else if (WordW>1.5*Width)
             PX=fix((Concave(k)+Concave(k-1))/2);  % ����ˮƽ���ᡱ��ճ��
             k=k-1;
         end
                      %  �����ȹ�С�����з�       
   end            
               
end

%==== Segmentʶ����� ===%
Char_str='0123456789';
ch2='.bmp';
Find_Chinese='';    
max_v=0;
J=0;
d=zeros(18);
   figure;
   Hstr=''
   
for i=2:18
    rc=zeros(1,10);
        for j=1:10
 WI=I(:,fix((PXR1(i-1)+PXR2(i-1))):fix((PXR1(i)+PXR2(i))));
    subplot(5,5,i),imshow(WI);title('');
       Y=imresize(WI,[40,20]);
    
      ch3=Char_str(j);
        ch=[ch3,ch2];
        NI1=imread(ch);
        NI2=rgb2gray(NI1);
        NI3=im2bw(NI2);
        rc(j)=corr2(NI3,Y);   
    end
  [D,e]=max(rc(:));
  c=e-1;
    
  fprintf(num2str(c))
  
 Hstr=[Hstr,num2str(c)];
uicontrol(gcf,'Style','text', 'Unit','normalized',...
       'Posi',[0.43,0.1,0.25,0.1],'String',...
'��ʾʶ����','Horizontal','center');
 Htext=uicontrol(gcf,'Style','edit','Unit','normalized',...
       'Posi',[0.63,0.1,0.25,0.1],'String',...
Hstr,'Horizontal','center');
end 
end

Char_str='0123456789';
ch2='.bmp';
Find_Chinese='';    
max_v=0;
J=0;
    rc=zeros(1,10);
        for j=1:10
    WI=I(:,fix((PXR1(18)+PXR2(18))):x);
    subplot(5,5,19),imshow(WI);title('');
       Y=imresize(WI,[40,20]);
        ch3=Char_str(j);
        ch=[ch3,ch2];
        NI1=imread(ch);
        NI2=rgb2gray(NI1);
        NI3=im2bw(NI2);
        rc(j)=corr2(NI3,Y);       
    end
  [D,e]=max(rc(:));
  c=e-1; 
  fprintf(num2str(c)) 
  
 Hstr=[Hstr,num2str(c)];
uicontrol(gcf,'Style','text', 'Unit','normalized',...
       'Posi',[0.43,0.1,0.25,0.1],'String',...
'��ʾʶ����','Horizontal','center');
 Htext=uicontrol(gcf,'Style','edit','Unit','normalized',...
       'Posi',[0.63,0.1,0.25,0.1],'String',...
Hstr,'Horizontal','center');

end 

