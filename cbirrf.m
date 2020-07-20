function varargout = cbirrf(varargin)
% CBIRRF MATLAB code for cbirrf.fig
%      CBIRRF, by itself, creates a new CBIRRF or raises the existing
%      singleton*.
%
%      H = CBIRRF returns the handle to a new CBIRRF or the handle to
%      the existing singleton*.
%
%      CBIRRF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CBIRRF.M with the given input arguments.
%
%      CBIRRF('Property','Value',...) creates a new CBIRRF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cbirrf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cbirrf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cbirrf

% Last Modified by GUIDE v2.5 01-Feb-2020 18:38:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cbirrf_OpeningFcn, ...
                   'gui_OutputFcn',  @cbirrf_OutputFcn, ...
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


% --- Executes just before cbirrf is made visible.
function cbirrf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cbirrf (see VARARGIN)

% Choose default command line output for cbirrf
handles.output = hObject;

a=imread('min.bmp');

axes(handles.axes1);
imshow(a);

axes(handles.axes2);
imshow(a);

axes(handles.axes3);
imshow(a);

axes(handles.axes4);
imshow(a);

axes(handles.axes5);
imshow(a);

axes(handles.axes6);
imshow(a);

axes(handles.axes7);
imshow(a);

axes(handles.axes8);
imshow(a);

axes(handles.axes9);
imshow(a);

axes(handles.axes10);
imshow(a);

axes(handles.axes11);
imshow(a);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cbirrf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cbirrf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in QueryButton.
function QueryButton_Callback(hObject, eventdata, handles)
% hObject    handle to QueryButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[query_fname, query_pathname] = uigetfile('*.jpg; *.png; *.bmp', 'Select query image');

if (query_fname ~= 0)
    query_fullpath = strcat(query_pathname, query_fname);
    imgInfo = imfinfo(query_fullpath);
    [pathstr, name, ext] = fileparts(query_fullpath); % fiparts returns char type
    
    if ( strcmp(lower(ext), '.jpg') == 1 || strcmp(lower(ext), '.png') == 1 ...
            || strcmp(lower(ext), '.bmp') == 1 )
        
        queryImage = imread( fullfile( pathstr, strcat(name, ext) ) );
        axes(handles.axes1);
        imshow(queryImage);   
    end
end

im2vector(queryImage);
combinedfeatures;

% --- Executes on button press in SearchButton.
function SearchButton_Callback(hObject, eventdata, handles)
% hObject    handle to SearchButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%--------------- Open database txt file... for reading...
% fidd = fopen('DatasetLTLL.txt');
NumOfImages = 483;
load('My code/featureScores/feature_vector.mat', 'feature_vector');
% FeatureNumbers = 23 + (48 * 23);
% allImagesFeatures = zeros(NumOfImages, FeatureNumbers);
% iCount = 1;
% 
% while 1
%     imagename = imread(strcat('Rename/', num2str(i),'.jpg'));
%     imagename = fgetl(fidd);
%     if ~ischar(imagename), break, end
%     imageInProgress = imread(imagename);
%     allImagesFeatures(iCount, :) = im2vector(imageInProgress);
%     iCount = iCount + 1;
% end
% fclose(fidd);
% save('allImagesFeatures.mat', 'allImagesFeatures');
SearchInDataset(handles, feature_vector);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    set(handles.SearchButton,'Enable','Off')
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in AdvancedSearch.
function AdvancedSearch_Callback(hObject, eventdata, handles)
% hObject    handle to AdvancedSearch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('My code\featureScores\allImagesFeatures.mat', 'allImagesFeatures');

RelFeedback(handles,allImagesFeatures);
%RelevanceFeedback(handles, allImagesFeatures);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject,'Value')
    set(handles.AdvancedSearch,'Enable','off');
end


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11
