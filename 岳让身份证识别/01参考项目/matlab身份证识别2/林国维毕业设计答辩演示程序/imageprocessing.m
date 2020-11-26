%产生窗口
screen=get(0,'ScreenSize');
W=screen(3);H=screen(4);
hf=figure('Color',[1,1,1],...
       'Name','身份证号码识别演示系统','NumberTitle','off','MenuBar','none');
 
   %绘画框[left bottom width height]
%uicontrol(gcf,'Style','Frame','Position',[0,0.55,0.45,0.45],...
  %'Units','normalized','back',[1,1,1]);
 
%定义Plot菜单项,gcf图形窗口句柄,hfile一级菜单句柄
hfile=uimenu(gcf,'Label','&文件');
hprocess=uimenu(gcf,'Label','&图像处理');

[namefile,pathname]=uigetfile('*.bmp','打开图像');
[i2,map]=imread(strcat(pathname,namefile));%选择打开图片
I2 =rgb2gray(i2);%灰度图像
i3=im2bw(I2,0.75);%将其转化为二值图像
i4=imcrop(i3,[300 350 400 300]);%分割图像 
i5=imcrop(i3,[300 430 400 40]); %定位身份证号码

i6=medfilt2(i5,[2 2]);  %窗口大小为2*2
i7=double(i6);            %卷积运算不支持unit8类型，%所以将图像矩阵转化为double类型                         
h=[0   1   0
   1  -4   0
   0   1  0];
j=conv2(i,h,'same');     %拉氏算子对图像滤波
k=i-j;                    %增强图像为原始图像减去拉氏算子滤波的图像
se=strel('line',2,45);
i8=imdilate(i7,se);%膨胀
se=strel('line',2,45);
i9=imerode(i8,se)%腐蚀

uimenu(hfile,'Label','打开','Call',['subplot(1,1,1);','imshow(i2)']);%显示原图
uimenu(hfile,'Label','退出','Call','close(gcf)');
uimenu(hprocess,'Label','灰度图像','Call',['subplot(1,1,1);','imshow(I2)']);%显示灰度图像
uimenu(hprocess,'Label','二值化图像','Call',['subplot(1,1,1);','imshow(i3)']);%显示二值化图像
uimenu(hprocess,'Label','分割图像','Call',['subplot(1,1,1);','imshow(i4)']);%分割图像
uimenu(hprocess,'Label','定位身份证号码','Call',['subplot(1,1,1);','imshow(i5)']);%定位身份证号码
uimenu(hprocess,'Label','中值滤波','Call',['subplot(1,1,1);','imshow(i6)']);%中值滤波
uimenu(hprocess,'Label','锐化','Call',['subplot(1,1,1);','imshow(i8)']);%锐化
%利用双峰法对一幅灰度图像进行灰度分割处理

%添加按钮命令
 hpush1=uicontrol(gcf,'Style','push','Unit','normalized',...
       'Posi',[0.02,0.05,0.15,0.08],'String',...
'二值化','Call',['imshow(i3)']);
uicontrol(gcf,'Style','push','Unit','normalized',...
       'Posi',[0.90,0.05,0.10,0.10],'String',...
'关 闭','Call','close all');

hpopup=uicontrol(gcf,'Style','popup','Unit','normalized',...
'Posi',[0.85,0.8,0.15,0.15],'String',...
'灰度图像|二值化图像|分割图像|定位身份证号码','Call',...
'imshow(I2)');

hc=uicontextmenu;             %建立快捷菜单
hls=uimenu(hc,'Label','背景颜色');    %建立菜单项
uimenu(hls,'Label','&Red','Accelerator','r',...
'Call','set(gcf,''Color'',''r'');');
uimenu(hls,'Label','&Blue','Accelerator','b',...
'Call','set(gcf,''Color'',''b'');');
uimenu(hls,'Label','&Yellow','Call',...
'set(gcf,''Color'',''y'');');     
uimenu(hls,'Label','&White','Call',...
'set(gcf,''Color'',''w'');');  
set(gcf,'UIContextMenu',hc);     %将该快捷菜单和曲线对象联系起来

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%切割程序
I=im2bw(i5,0.43);
[y x]=size(I);


Top=zeros(1,x);         % 顶端轮廓检测
for i=1:x
        j=1;
    while ((I(j,i)==1)&(j<y))
        j=j+1;
    end
    Top(i)=y-j;
end

Bottom=zeros(1,x);      % 底部轮廓检测
for i=1:x
        j=y;
    while ((I(j,i)==1)&(j>1))
        j=j-1;
    end
    Bottom(i)=y-j;
end

Height=Top-Bottom;
WordHeight=max(Height);    % 文字高度

%=== 轮廓线的凹检测 ===%
TopD=zeros(1,x-1);
Concave=1;                            % 记录凹轮廓处的位置, 1表示默认起始列为第一个Concave
Deep=0;                               % 下降值
DeepH=0;                              %  上升值
DeepT=5;                              % 凹轮廓的深度阈值
Sign=0;
for i=1:x-1
    TopD(i)=Top(i+1)-Top(i);
end
for i=1:x-2
    if (TopD(i)<0)  % 判断是否为凹轮廓
        Sign=1;     % 置标志位
        DeepH=0;
        Deep=Deep+TopD(i);
        tempX=i+1;  % 下一列可能为切分的Concave， 最接近于左端
    end
    if ((Sign==1)&(TopD(i)>0))
        if (abs(Deep)>=DeepT)
            DeepH=DeepH+TopD(i);
            if (abs(DeepH)>=DeepT)
               Concave=[Concave tempX];
               Sign=0;    % 确认为凹后，复位标志位
               DeepH=0;
           end
        else
           Sign=0;    % 确认为凹后，复位标志位
           Deep=0;           
        end      
    end
end

%=== 轮廓线的凸检测 ===%
BottomD=zeros(1,x-1);
Convex=1;
Asend=0;                     % 上升值
Desend=0;                    % 下降值
ConvexT=3;                   %  凸程度阈值
Sign=0;
for i=1:x-1
    BottomD(i)=Bottom(i+1)-Bottom(i);
end
for i=1:x-2
    if (BottomD(i)>0)
        Sign=1;
        Desend=0;
        Asend=Asend+BottomD(i);        
        tempX=i+1;         % 最接近于左端
    end
    if((Sign==1)&(BottomD(i)<0))
        if (abs(Asend)>=ConvexT)
            Desend=Desend+BottomD(i);
            if (abs(Desend)>=ConvexT)
                Convex=[Convex tempX];
                Sign=0;             % 复位                                    
                Desend=0;
            end
        else
        Sign=0;             % 复位
        Asend=0;     
        end  
    end
end

%=== 切分 ===%

[mytemp n]=size(Concave);   % 注意 Concave 的第一个数值无效
StrokeT=5;                  % 笔划宽度阈值
GapT=8;
W=zeros(1,n);

for i=1:n-1
    W(i)=Concave(i+1)-Concave(i);
end
W(n)=x-Concave(n);
Width=median(W);           % 近似的字符宽度

    PXR1=1;                 % 记录第一次切分位置
    PXR2=1;                 % 记录第二次切分位置
       
    Mark=0;         % 记录黑白转换的次数
    %CrossSign=0;    % 交错粘连的标志
    
    Black=zeros(1,x);        % 统计笔划像素点
    BP=zeros(1,x);
    SegSoke=zeros(3,x);      % 切分点处的笔划宽度
    RH=zeros(1,x);           % 切分后的高度比
    RW=zeros(1,x);           % 切分后的宽度比    
    Score=zeros(1,x);        % 特征值的总得分
    
    XGood=1;                 %  X切分位置    
    SegY=1;         % 记录第一次切分的Y深度

for k=2:n
    WordH=max(Height(Concave(k-1):Concave(k)));
    WordW=Concave(k)-Concave(k-1);
    if ((WordW>=0.5*Width)&(WordW<=1.5*Width))
             
        % 选定切分的区域
        PX1=Concave(k);
        PX2=PX1;              
        while ((TopD(PX2)==0)&(PX2<x))
               PX2=PX2+1;                % 凹右边的列位置
        end
            
       i=fix((PX1+PX2)/2);
   
       if (Top(i)==1)                  % 无粘连
           PXR1=[PXR1 i];
           PXR2=[PXR2 i];
       else                            
            j=y+1-Top(i);                % PY为实际的y坐标值，此处已为黑色像素点
            Mark=0;        
            while((j<y)&(Mark<2)) 
                if (I(j,i)==0)
                    Black(i)=Black(i)+1; % 记录黑色象素点数            
                    Si=i;
                    while ((Si>1)&(I(j,Si)==0))   % 左笔划宽度
                            Si=Si-1;
                            SegSoke(1,i)=SegSoke(1,i)+1;
                    end   
                        
                    Si=i;
                    while ((Si<x)&(I(j,Si)==0))   % 右笔划宽度
                           Si=Si+1;
                           SegSoke(2,i)=SegSoke(2,i)+1;
                     end
               end
                 
                Mark=Mark+abs(I(j+1,i)-I(j,i));  % 检测是否通过笔划
                j=j+1;
            end
            SegY=[SegY j-1];                           % 第一次切分截止处
            if (j==38)
                PXR1=[PXR1 i];
                PXR2=[PXR2 i];
            else                                       % 单点粘连  
                SLi=i;
                while ((SLi>1)&(I(j-1,SLi)==1))        % 选定区域左边界
                       SLi=SLi-1;
                end
        
                SRi=i;
                while ((SRi<x)&(I(j-1,SRi)==1))        % 选定区域右边界
                       SRi=SRi+1;
                end
                [Mytemp PX2]=max(Bottom(SLi:SRi));
                PXR2=[PXR2 PX2+SLi-1];
                PXR1=[PXR1 i];
            end
      end    
         
    else if (WordW>1.5*Width)
             PX=fix((Concave(k)+Concave(k-1))/2);  % 避免水平“横”的粘连
             k=k-1;
         end
                      %  如果宽度过小，则不切分       
   end            
               
end

%==== Segment识别程序 ===%
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
'显示识别结果','Horizontal','center');
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
'显示识别结果','Horizontal','center');
 Htext=uicontrol(gcf,'Style','edit','Unit','normalized',...
       'Posi',[0.63,0.1,0.25,0.1],'String',...
Hstr,'Horizontal','center');

end 

