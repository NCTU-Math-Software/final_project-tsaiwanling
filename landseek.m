function varargout = landseek(varargin)
% LANDSEEK MATLAB code for landseek.fig
%      LANDSEEK, by itself, creates a new LANDSEEK or raises the existing
%      singleton*.
%
%      H = LANDSEEK returns the handle to a new LANDSEEK or the handle to
%      the existing singleton*.
%
%      LANDSEEK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LANDSEEK.M with the given input arguments.
%
%      LANDSEEK('Property','Value',...) creates a new LANDSEEK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before landseek_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to landseek_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help landseek

% Last Modified by GUIDE v2.5 19-Dec-2020 00:17:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @landseek_OpeningFcn, ...
                   'gui_OutputFcn',  @landseek_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   [] );
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before landseek is made visible.
function landseek_OpeningFcn(hObject, eventdata, handles, varargin)
    s=get(0,'ScreenSize');
    set(handles.figure1,'Units', 'pixels','Position', [(s(3)-600)/2 (s(4)-500)/2 600 500]);
    
    set(handles.axes1,'Units', 'pixels','Position', [0 0 600 500]);
    
    set(handles.pushbutton1,'Units', 'pixels','Position', [100 110 70 40]);
    set(handles.pushbutton2,'Units', 'pixels','Position', [265 110 70 40]);
    set(handles.pushbutton3,'Units', 'pixels','Position', [430 110 70 40]);
    
    backgroundImage = imread('mine.png');
    axes(handles.axes1);
    image(backgroundImage);
    axis off;
    
    button = imread('button.png');
    set(handles.pushbutton1,'CDATA',button);
    set(handles.pushbutton2,'CDATA',button);
    set(handles.pushbutton3,'CDATA',button);
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to landseek (see VARARGIN)

% Choose default command line output for landseek
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes landseek wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = landseek_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    close(gcbf)
    Landseeker(1)
    
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    close(gcbf)
    Landseeker(2)
    
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
    close(gcbf)
    Landseeker(3)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
