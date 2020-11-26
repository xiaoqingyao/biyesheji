function varargout = homework2(varargin)
% HOMEWORK2 M-file for homework2.fig
%      HOMEWORK2, by itself, creates a new HOMEWORK2 or raises the existing
%      singleton*.
%
%      H = HOMEWORK2 returns the handle to a new HOMEWORK2 or the handle to
%      the existing singleton*.
%
%      HOMEWORK2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEWORK2.M with the given input arguments.
%
%      HOMEWORK2('Property','Value',...) creates a new HOMEWORK2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homework2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homework2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homework2

% Last Modified by GUIDE v2.5 26-Mar-2019 20:18:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homework2_OpeningFcn, ...
                   'gui_OutputFcn',  @homework2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before homework2 is made visible.
function homework2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homework2 (see VARARGIN)

% Choose default command line output for homework2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homework2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = homework2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%����ԭʼ���֤ͼ��Ļص�����
% --- Executes on button press in OriginalImg.
function OriginalImg_Callback(hObject, eventdata, handles)
% hObject    handle to OriginalImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg','Select an image');
if PathName~=0
    str = [PathName,FileName];
    T=imread(str);
    axes(handles.Img);
    imshow(T);
end

%ͼ���Զ����ȵ����Ļص�����
% --- Executes on button press in autoLight.
function autoLight_Callback(hObject, eventdata, handles)
% hObject    handle to autoLight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.Img);
T=getimage;

low_out=0.2; high_out=0.9;
gamma=1.518;
hsv=rgb2hsv(T);
I=hsv(:,:,3);
minL=min(min(I));
maxL=max(max(I));
J=imadjust(I,[minL;maxL],[low_out;high_out],gamma);
hsv(:,:,3)=J;
rgb_atuoI=hsv2rgb(hsv);
axes(handles.Light);
imshow(rgb_atuoI);

%ͼ���ֵ���Ļص�����
% --- Executes on button press in DIP.
function DIP_Callback(hObject, eventdata, handles)
% hObject    handle to DIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.Img);
I=getimage;
[m,n,r]=size(I);%ͼ�������Ϊwidth*height
%%%%%��ɫ������
myI=double(I);

for i=1:m
    for j=1:n
            if((myI(i,j,1)>=15)&&(myI(i,j,1)<=130)&&((myI(i,j,2)<=165)&&(myI(i,j,2)>=90))&&((myI(i,j,3)<=220)&&(myI(i,j,3)>=135))) % ��ɫRGB�ĻҶȷ�Χ
              I(i,j,1)=40; %��ɫ����
              I(i,j,2)=40; %��ɫ����
              I(i,j,3)=40; %��ɫ����
           end  
    end       
end
%figure, imshow(I);title('��ɫ���ͼ��');

width=round(0.9*n);height=round(0.87*m);
rx=round(0.05*n);cy=round(0.075*m);
I=subim(I,height,width,rx,cy);
%figure,imshow(I);


if sum(size(I)>0)==3 %�����ǲ�ɫͼ--2ά*3����ת���ɻҶ�ͼ
I=rgb2gray(I);
end
%figure,imhist(I);
x=3;%������Ϊx����
y=1;%������Ϊy����
BW=erzhihua(I,x,y);

[n m l]=size(BW);%ͼ�������Ϊm*n
c = [0.65*m 0.65*m m m];
r = [0 0.85*n 0.85*n 0];
BW = roifill(BW,c,r);

BW=imadjust(BW);%ʹ��imadjust������ͼ�������ǿ�Աȶ�
% Convert to BW
threshold = graythresh(BW);
BW =~im2bw(BW,0.6*threshold);

[image_h image_w]=size(BW);
% Remove all object containing fewer than (imagen/80) pixels
BW = bwareaopen(BW,floor(image_w/80));
% �˲�
%h=fspecial('average',1);
%BW=im2bw(round(filter2(h,BW)));
%imwrite(d,'4.��ֵ�˲���.jpg');
axes(handles.Binary);
imshow(BW);


%ͼ��ָ���ʶ��ť�Ļص�����
% --- Executes on button press in OCR.
function OCR_Callback(hObject, eventdata, handles)
% hObject    handle to OCR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.Binary);
imagen = getimage;
[image_h image_w]=size(imagen);
%figure;imshow(imagen);title('INPUT IMAGE')

% Convert to gray scale
if size(imagen,3)==3 %RGB image
    imagen=rgb2gray(imagen);
end

%Storage matrix word from image
word=[ ];
re=imagen;
%Opens text.txt as file for write
fid = fopen('ID_card.txt', 'wt');
% Load templates
load templates
global templates
% Compute the number of letters in template file
num_letras=size(templates,2);
figure;
plot_flag=1;
while 1
    %Fcn 'lines' separate lines in text
    [fl re]=lines(re);
    imgn=fl;
    [line_h line_w]=size(fl);%��¼���и������һ���ַ��ĳ���
    %Uncomment line below to see lines one by one
    % imshow(fl);pause(1)    
    %-----------------------------------------------------------------     
    % Label and count connected components
   [L Ne] = bwlabel(imgn);    

      n=1;%��¼ѭ������
while(n<=Ne)
        char_flag=0;%Ϊ0ʱ���ǵ�һ���ж������ͨ��
        flag=1;%��ʼ��������ͨ������ͬ���ַ�
   while(flag==1)       
      if char_flag==0
        [r,c] = find(L==n);
        Width0=max(r)-min(r);%��ͨ����
        Height0=max(c)-min(c);%��ͨ��߶�
        Radio0=Width0/Height0;%��ͨ���߱�
        Square0=Width0*Height0;%��ͨ�����
        maxr=max(r);
        maxc=max(c);
        minr=min(r);
        minc=min(c);
      end
       if n<Ne
          [r1,c1] = find(L==(n+1));%Ѱ����һ����ͨ��
          Width1=max(r)-min(r);%��ͨ����
          Height1=max(c)-min(c);%��ͨ��߶�
          Radio1=Width1/Height1;%��ͨ���߱�
          Square1=Width1*Height1;%��ͨ�����
          Uheight=max(maxc,max(c1))-min(minc,min(c1));%�ϲ���߶�
          Uwidth=max(maxr,max(r1))-min(minr,min(r1));%�ϲ�����
          Uradio=Uwidth/Uheight;%�ϲ���Ŀ�߱�
          Oheigth=Height0+Height1-Uheight;%�ص��߶�
          Owidth=Width0+Width1-Uwidth;%�ص����
          Osquare=Oheigth*Owidth;%�ص����
       else
           flag=0;%������һ�����һ����ͨ��
       end
           ph=5;%�߽�����
           pw=7;
       if(flag==1)&&((Owidth>=-(image_w/pw)&&Owidth<=0)||(Oheigth>=-(line_h*0.3)&&Oheigth<=0))%������ͨ��Ͻ��������ص�
           if((Uradio>=0.8)&&(Uradio<=1.2))%��Ϊ������ͨ������ͬһ���ַ�
           elseif Uheight<line_h*0.4;%��ͨ��ĺϲ�֮��߶ȹ�С�ģ���Ϊ��һ���ַ���һ���֣��ܿ����Ǳ��Բ���
           else flag=0;%������������ͨ�����ڲ�ͬ�ַ�  
           end
       elseif(flag==1)&&(Owidth<-(image_w/pw))%������ͨ��������Զ
           flag=0;%������ͨ�����ڲ�ͬ�ַ�
     % elseif(flag==1)&&((Owidth>0)||(Oheigth>0))%����ͨ���ص�
      elseif(flag==1)&&((Owidth>0))%����ͨ���ص�
               if(((Uradio>=0.78)&&(Uradio<=1.3)))%��Ϊ������ͨ������ͬһ���ַ�
               elseif(Osquare>=0.4*min(Square0,Square1)&&(Uwidth<image_w/45))
               else
               flag=0;%������ͨ�����ڲ�ͬ�ַ�
           end
       else flag=0;%������ͨ�����ڲ�ͬ�ַ�
       end
       if flag==1%���������жϣ�������ͨ������ͬһ���ַ���������ͨ��ϲ�
           Width0=Uwidth;%��ͨ����
           Height0=Uheight;%��ͨ��߶�
           Radio0=Width0/Height0;%��ͨ���߱�
           Square0=Width0*Height0;%��ͨ�����
           maxr=max(maxr,max(r1));
           maxc=max(maxc,max(c1));
           minr=min(minr,min(r1));
           minc=min(minc,min(c1));
           n=n+1;%ָ����һ����ͨ��
           char_flag=1;
       end
   end  %while(flag==1)��end
           
        
        
        % Extract letter
        n1=imgn(minr:maxr,minc:maxc);  
        % Resize letter (same size of template)
        img_r=imresize(n1,[36 23]);
        subplot(10,10,plot_flag),imshow(img_r);title(plot_flag);
        plot_flag=plot_flag+1;
        %Uncomment line below to see letters one by one
        % imshow(img_r);title(n);pause(0.5)
        %-------------------------------------------------------------------
        % Call fcn to convert image to text
        letter=read_letter(img_r,num_letras);
        % Letter concatenation
        word=[word letter];
        n=n+1;
    end % while(n<=Ne)��end
    %fprintf(fid,'%s\n',lower(word));%Write 'word' in text file (lower)
    fprintf(fid,'%s\n',word);%Write 'word' in text file (upper)
    % Clear 'word' variable
    word=[ ];
    %*When the sentences finish, breaks the loop
    if isempty(re)  %See variable 're' in Fcn 'lines'
        break
    end    
end
fclose(fid);
%Open 'ID_card.txt' file
winopen('ID_card.txt')


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close all;
close(gcf);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over autoLight.
function autoLight_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to autoLight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over DIP.
function DIP_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to DIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
