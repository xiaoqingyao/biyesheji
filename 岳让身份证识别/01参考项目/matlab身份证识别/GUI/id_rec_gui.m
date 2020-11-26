function varargout = id_rec_gui(varargin)
% ID_REC_GUI MATLAB code for id_rec_gui.fig
%      ID_REC_GUI, by itself, creates a new ID_REC_GUI or raises the existing
%      singleton*.
%
%      H = ID_REC_GUI returns the handle to a new ID_REC_GUI or the handle to
%      the existing singleton*.
%
%      ID_REC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ID_REC_GUI.M with the given input arguments.
%
%      ID_REC_GUI('Property','Value',...) creates a new ID_REC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before id_rec_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to id_rec_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help id_rec_gui

% Last Modified by GUIDE v2.5 23-May-2013 21:56:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @id_rec_gui_OpeningFcn, ...
    'gui_OutputFcn',  @id_rec_gui_OutputFcn, ...
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


% --- Executes just before id_rec_gui is made visible.
function id_rec_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to id_rec_gui (see VARARGIN)

% Choose default command line output for id_rec_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes id_rec_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = id_rec_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathname filenames current_select_idx
[filenames,pathname]=uigetfile({'*.jpg;*.png;*.gif','All Image Files';'*.*','All Files' },'MultiSelect','on');
if isequal(filenames,0)
    return;
end
% init
current_select_idx=1;

if ~iscell(filenames)
    filenames={filenames};
    set(handles.img_idx,'String','')
    set(handles.img_idx_slider,'Visible','off')
else
    set(handles.img_idx_slider,'Visible','on')
    set(handles.img_idx_slider,'Min',0)
    set(handles.img_idx_slider,'Max',length(filenames)-1)
    set(handles.img_idx_slider,'SliderStep',ones(1,2)/(length(filenames)-1))
end
preprocess(handles)
process(handles)


function preprocess(handles)
global pathname filenames current_select_idx img_gray
if length(filenames)>1
    img_idx_str=sprintf('%d / %d',current_select_idx,length(filenames));
    set(handles.img_idx,'String',img_idx_str)
    set(handles.img_idx_slider,'Value',current_select_idx-1)
    set(handles.img_idx_slider,'TooltipString',img_idx_str)
end

name=fullfile(pathname,filenames{current_select_idx});
fileinfo=imfinfo(name);
if strcmpi(fileinfo.ColorType,'indexed')
    [X,map]=imread(name);
    img_data=ind2rgb(X,map);
else
    img_data=imread(name);
end
% show the org image
r=size(img_data,1);
c=size(img_data,2);
img_tmp=img_data;
if r>1200
    img_tmp=imresize(img_tmp,1200/r);
end
if c>1200
    img_tmp=imresize(img_tmp,1200/c);
end
axes(handles.img)
imshow(img_tmp),title(name,'Interpreter','None')

img_data=im2double(img_data);
if ndims(img_data)==3
    img_gray=rgb2gray(img_data);
else
    img_gray=img_data;
end
img_gray=imresize(img_gray,[350 500]);
img_gray=img_gray(round(size(img_gray,1)*2/3):end,round(size(img_gray,2)/4):end);
set(handles.thresh_value,'Visible','on')
set(handles.thresh_value,'value',.68*graythresh(img_gray))


function process(handles)
global code_stats img_gray model filenames current_select_idx iteration area_codes
try
    % init all controls
    for i=1:18
        set(eval(sprintf('handles.result%d',i)),'BackgroundColor',[1 1 1])
        set(eval(sprintf('handles.result%d',i)),'String','')
    end
    set(handles.birthday,'BackgroundColor',[1 1 1])
    set(handles.birthday,'String','')
    set(handles.ID_code,'BackgroundColor',[1 1 1])
    set(handles.ID_code,'String','')
    set(handles.gender,'BackgroundColor',[1 1 1])
    set(handles.gender,'String','')
    set(handles.address,'BackgroundColor',[1 1 1])
    set(handles.address,'String','')
    set(handles.train,'Enable','off')
    
    % process
    iteration=1;
    thresh=get(handles.thresh_value,'value');
    [id_codes,id_bw,code_stats,thresh]=id_rec_process(img_gray,model,thresh);
    set(handles.thresh_value,'value',thresh)
    set(handles.thresh_value,'TooltipString',num2str(thresh))
    axes(handles.bw)
    id_bw=padarray(id_bw,[120 0],'pre');
    imshow(id_bw),title(sprintf('Current threshold value: %.4f, %d iteration(s)',thresh,iteration))
    id_error_flag=0;
    birthday_error_flag=0;
    gender_error_flag=0;
    address_error_flag=0;
    for i=1:length(id_codes)
        axes(eval(sprintf('handles.seg%d',i)))
        imshow(code_stats(i).Image)
        set(eval(sprintf('handles.result%d',i)),'String',id_codes(i))
        % check
        if ~strcmpi(id_codes(i),filenames{current_select_idx}(i))
            id_error_flag=1;
            if i<=6
                address_error_flag=1;
            end
            if i>=7 && i<=14
                birthday_error_flag=1;
            end
            if i==17 && mod(id_codes(i),2)~=mod(filenames{current_select_idx}(i),2)
                gender_error_flag=1;
            end
            set(eval(sprintf('handles.result%d',i)),'BackgroundColor',[1 0 0])
        end
    end
    set(handles.train,'Enable','on')
    
    % set results
    set(handles.ID_code,'String',id_codes)
    if id_error_flag
        set(handles.ID_code,'BackgroundColor',[1 0 0])
    end
    set(handles.birthday,'String',id_codes(7:14))
    if birthday_error_flag
        set(handles.birthday,'BackgroundColor',[1 0 0])
    end
    if mod(id_codes(17),2)
        set(handles.gender,'String','Male')
    else
        set(handles.gender,'String','Female')
    end
    if gender_error_flag
        set(handles.gender,'BackgroundColor',[1 0 0])
    end
    try
        address=area_codes{uint32(str2double(id_codes(1:6)))};
        if isempty(address)
            address=area_codes{uint32(str2double(id_codes(1:4)))};
        end
        if isempty(address)
            address=area_codes{uint32(str2double(id_codes(1:2)))};
        end
        if isempty(address)
            set(handles.address,'String','NO RECORD')
        else
            set(handles.address,'String',address)
        end
        if address_error_flag || isempty(address)
            set(handles.address,'BackgroundColor',[1 0 0])
        end
    catch e
        set(handles.address,'String','NO RECORD')
        set(handles.address,'BackgroundColor',[1 0 0])
    end
catch e
    msgbox(e.message,'Error','error')
    rethrow(e)
end


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if strcmp(questdlg('Do you really want to exit application?','Exit'),'Yes')
    delete(hObject);
    clear all
end



function ID_code_Callback(hObject, eventdata, handles)
% hObject    handle to ID_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ID_code as text
%        str2double(get(hObject,'String')) returns contents of ID_code as a double


% --- Executes during object creation, after setting all properties.
function ID_code_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ID_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in train.
function train_Callback(hObject, eventdata, handles)
% hObject    handle to train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filenames current_select_idx code_stats
if strcmp(questdlg('Do you want to put the results into training data?','Information'),'Yes')
    seq=zeros(11,1);
    h=waitbar(0,'Please wait...');
    count=length(code_stats);
    for i=1:count
        img=imresize(code_stats(i).Image,[47 31]);
        result=get(eval(sprintf('handles.result%d',i)),'String');
        filename=filenames{current_select_idx};
        switch result
            case 'X'
                seq(end)=seq(end)+1;
                name=fullfile('X',sprintf('%s_%d',filename(1:strfind(filename,'.')-1),seq(end)));
            otherwise
                % 0-9
                d=uint8(str2double(result));
                seq(d+1)=seq(d+1)+1;
                name=fullfile(result,sprintf('%s_%d',filename(1:strfind(filename,'.')-1),seq(d+1)));
        end
        imwrite(img,fullfile('GUI','id_rec','training_data',[name '.bmp']) )
        waitbar(i/count)
    end
    close(h)
end


function result1_Callback(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result1 as text
%        str2double(get(hObject,'String')) returns contents of result1 as a double


% --- Executes during object creation, after setting all properties.
function result1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result2_Callback(hObject, eventdata, handles)
% hObject    handle to result2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result2 as text
%        str2double(get(hObject,'String')) returns contents of result2 as a double


% --- Executes during object creation, after setting all properties.
function result2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result3_Callback(hObject, eventdata, handles)
% hObject    handle to result3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result3 as text
%        str2double(get(hObject,'String')) returns contents of result3 as a double


% --- Executes during object creation, after setting all properties.
function result3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result4_Callback(hObject, eventdata, handles)
% hObject    handle to result4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result4 as text
%        str2double(get(hObject,'String')) returns contents of result4 as a double


% --- Executes during object creation, after setting all properties.
function result4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result5_Callback(hObject, eventdata, handles)
% hObject    handle to result5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result5 as text
%        str2double(get(hObject,'String')) returns contents of result5 as a double


% --- Executes during object creation, after setting all properties.
function result5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result6_Callback(hObject, eventdata, handles)
% hObject    handle to result6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result6 as text
%        str2double(get(hObject,'String')) returns contents of result6 as a double


% --- Executes during object creation, after setting all properties.
function result6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result7_Callback(hObject, eventdata, handles)
% hObject    handle to result7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result7 as text
%        str2double(get(hObject,'String')) returns contents of result7 as a double


% --- Executes during object creation, after setting all properties.
function result7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result12_Callback(hObject, eventdata, handles)
% hObject    handle to result12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result12 as text
%        str2double(get(hObject,'String')) returns contents of result12 as a double


% --- Executes during object creation, after setting all properties.
function result12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result8_Callback(hObject, eventdata, handles)
% hObject    handle to result8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result8 as text
%        str2double(get(hObject,'String')) returns contents of result8 as a double


% --- Executes during object creation, after setting all properties.
function result8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function result15_Callback(hObject, eventdata, handles)
% hObject    handle to result15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result15 as text
%        str2double(get(hObject,'String')) returns contents of result15 as a double


% --- Executes during object creation, after setting all properties.
function result15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result16_Callback(hObject, eventdata, handles)
% hObject    handle to result16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result16 as text
%        str2double(get(hObject,'String')) returns contents of result16 as a double


% --- Executes during object creation, after setting all properties.
function result16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result17_Callback(hObject, eventdata, handles)
% hObject    handle to result17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result17 as text
%        str2double(get(hObject,'String')) returns contents of result17 as a double


% --- Executes during object creation, after setting all properties.
function result17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result18_Callback(hObject, eventdata, handles)
% hObject    handle to result18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result18 as text
%        str2double(get(hObject,'String')) returns contents of result18 as a double


% --- Executes during object creation, after setting all properties.
function result18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result14_Callback(hObject, eventdata, handles)
% hObject    handle to result14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result14 as text
%        str2double(get(hObject,'String')) returns contents of result14 as a double


% --- Executes during object creation, after setting all properties.
function result14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result11_Callback(hObject, eventdata, handles)
% hObject    handle to result11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result11 as text
%        str2double(get(hObject,'String')) returns contents of result11 as a double


% --- Executes during object creation, after setting all properties.
function result11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result9_Callback(hObject, eventdata, handles)
% hObject    handle to result9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result9 as text
%        str2double(get(hObject,'String')) returns contents of result9 as a double


% --- Executes during object creation, after setting all properties.
function result9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result13_Callback(hObject, eventdata, handles)
% hObject    handle to result13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result13 as text
%        str2double(get(hObject,'String')) returns contents of result13 as a double


% --- Executes during object creation, after setting all properties.
function result13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result10_Callback(hObject, eventdata, handles)
% hObject    handle to result10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result10 as text
%        str2double(get(hObject,'String')) returns contents of result10 as a double


% --- Executes during object creation, after setting all properties.
function result10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load_model
% create training data folder
base_path=fullfile('GUI','id_rec','training_data');
if isempty(dir(fullfile(base_path,'X')))
    folder=fullfile(base_path,'X');
    mkdir(folder)
    fprintf('Create folder "%s" success.\n',folder)
end
for i=0:9
    if isempty(dir(fullfile(base_path,num2str(i))))
        folder=fullfile(base_path,num2str(i));
        mkdir(folder)
        fprintf('Create folder "%s" success.\n',folder)
    end
end



% --- Executes on button press in reload.
function reload_Callback(hObject, eventdata, handles)
% hObject    handle to reload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(questdlg('Do you want to reload model?','Information'),'Yes')
    load_model
    if strcmp(questdlg('Reload model success. Do you want to reprocess the image?','Information'),'Yes')
        process(handles)
    end
end

function load_model
global model area_codes
try
    load GUI\id_rec\model.mat
    model=net;
catch e
    msgbox('Cannot load model. Please check the file "GUI\id_rec\model.mat" whether exists.','Error','Error')
    rethrow(e)
end

try
    % load area codes
    fileID=fopen(fullfile('GUI','id_rec','area_code.txt'));
    C=textscan(fileID,'%d\t%s');
    fclose(fileID);
    area_codes=cell(999999,1);
    count=size(C{2},1);
    for i=1:count
        area_codes{C{1}(i)}=C{2}{i};
    end
catch e
    msgbox('Cannot load area codes. Please check the file "GUI\id_rec\area_code.txt" whether exists.','Error','Error')
    rethrow(e)
end


% --- Executes on slider movement.
function thresh_value_Callback(hObject, eventdata, handles)
% hObject    handle to thresh_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
thresh=get(handles.thresh_value,'value');
set(hObject,'TooltipString',num2str(thresh))
process(handles)


% --- Executes during object creation, after setting all properties.
function thresh_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thresh_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on result1 and none of its controls.
function result1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result2 and none of its controls.
function result2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result3 and none of its controls.
function result3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result3 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result4 and none of its controls.
function result4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result4 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result5 and none of its controls.
function result5_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result5 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result6 and none of its controls.
function result6_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result6 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result7 and none of its controls.
function result7_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result7 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result8 and none of its controls.
function result8_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result8 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result9 and none of its controls.
function result9_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result9 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result10 and none of its controls.
function result10_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result10 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result11 and none of its controls.
function result11_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result11 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result12 and none of its controls.
function result12_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result12 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result13 and none of its controls.
function result13_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result13 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result14 and none of its controls.
function result14_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result14 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result15 and none of its controls.
function result15_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result15 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result16 and none of its controls.
function result16_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result16 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result17 and none of its controls.
function result17_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result17 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])


% --- Executes on key press with focus on result18 and none of its controls.
function result18_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to result18 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'BackgroundColor',[0 1 1])



function birthday_Callback(hObject, eventdata, handles)
% hObject    handle to birthday (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of birthday as text
%        str2double(get(hObject,'String')) returns contents of birthday as a double


% --- Executes during object creation, after setting all properties.
function birthday_CreateFcn(hObject, eventdata, handles)
% hObject    handle to birthday (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gender_Callback(hObject, eventdata, handles)
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gender as text
%        str2double(get(hObject,'String')) returns contents of gender as a double


% --- Executes during object creation, after setting all properties.
function gender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function address_Callback(hObject, eventdata, handles)
% hObject    handle to address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of address as text
%        str2double(get(hObject,'String')) returns contents of address as a double


% --- Executes during object creation, after setting all properties.
function address_CreateFcn(hObject, eventdata, handles)
% hObject    handle to address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function img_idx_slider_Callback(hObject, eventdata, handles)
% hObject    handle to img_idx_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global current_select_idx
img_idx=round(get(hObject,'Value'));
current_select_idx=img_idx+1;
preprocess(handles)
process(handles)



% --- Executes during object creation, after setting all properties.
function img_idx_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to img_idx_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
