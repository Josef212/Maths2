function varargout = Rotate(varargin)
% ROTATE MATLAB code for Rotate.fig
%      ROTATE, by itself, creates a new ROTATE or raises the existing
%      singleton*.
%
%      H = ROTATE returns the handle to a new ROTATE or the handle to
%      the existing singleton*.
%
%      ROTATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROTATE.M with the given input arguments.
%
%      ROTATE('Property','Value',...) creates a new ROTATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rotate_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rotate_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rotate

% Last Modified by GUIDE v2.5 27-May-2016 10:06:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Rotate_OpeningFcn, ...
    'gui_OutputFcn',  @Rotate_OutputFcn, ...
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


% --- Executes just before Rotate is made visible.
function Rotate_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rotate (see VARARGIN)

% Choose default command line output for Rotate
handles.output = hObject;

M = [ -1  -1 1;   %Node 1
    -1   1 1;   %Node 2
    1   1 1;   %Node 3
    1  -1 1;   %Node 4
    -1  -1 -1;  %Node 5
    -1   1 -1;  %Node 6
    1   1 -1;  %Node 7
    1  -1 -1]; %Node 8

x1 = M(:,1);
y1 = M(:,2);
z1 = M(:,3);

%    trisurf(tri,M(:,1),M(:,2),M(:,3), )

con = [1 2 3 4;
    5 6 7 8;
    4 3 7 8;
    1 2 6 5;
    1 4 8 5;
    2 3 7 6]';

x = reshape(x1(con(:)),[4,6]);
y = reshape(y1(con(:)),[4,6]);
z = reshape(z1(con(:)),[4,6]);

c = 1/255*[255 0 0;
    255 171 0;
    0 170 0;
    0 170 255;
    255 255 255;
    255 255 0];


h = fill3(x,y,z, 1:6);

for q = 1:length(c)
    h(q).FaceColor = c(q,:);
end

xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
zlabel('$z$','Interpreter','latex');

p = (handles.axes1);
set(p,'Children',h);
p.YMinorGrid = 'off';
p.YGrid = 'on';
p.XMinorGrid = 'off';
p.XGrid = 'on';
p.ZMinorGrid = 'off';
p.ZGrid = 'on';
p.GridLineStyle = ':';
p.MinorGridLineStyle = ':';
p.XColor = [1,0,0];
p.YColor = [0,1,0];
p.ZColor = [0,0,1];
p.XLim = [-2,2];
p.YLim =  [-2,2];
p.ZLim =  [-2,2];
p.Projection = 'perspective';
p.DataAspectRatio = [1 1 1];
p.FontSize = 15;
p.View = [-61.0361328125 24.8255859375];

setappdata(handles.pushbuttonStop,'flag',0)
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Rotate wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rotate_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbuttonConnect.
function pushbuttonConnect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonConnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.textConectorState,'Value') < 1
clear m;
connector off;

connector on;
set (handles.textConectorState,'String','Connector: ON');
set (handles.textConectorState,'Value',1);

m = mobiledev;


    if m.Connected == 0
        set (handles.MobileConnected,'String','Not Connected');
    else
        m.Logging = 1;
        set (handles.MobileConnected,'String','Connected');
        set (handles.MobileConnected,'Value',1);
        Movethecube(handles,m);
    end

setappdata(hObject,'mobdev',m)
end

if get(handles.MobileConnected,'Value') < 1
    m = getappdata(hObject,'mobdev');
    if m.Connected == 0
        set (handles.MobileConnected,'String','Not Connected');
    else
        m.Logging = 1;
        set (handles.MobileConnected,'String','Connected');
        set (handles.MobileConnected,'Value',1);
        Movethecube(handles,m);
    end
else
    Movethecube(handles,getappdata(hObject,'mobdev'));
end
    
% --- Executes on button press in pushbuttonStop.
function pushbuttonStop_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'Value',1);
setappdata(hObject,'flag',1);
guidata(hObject, handles);

function Movethecube(handles,m)
%% 
setappdata(handles.pushbuttonStop,'flag',0)
m.SampleRate = 'High';
h = handles.axes1.Children;

T = retrieveSensorOrientation(m);%trim value
while isempty(T)
    pause(.001)
    T = retrieveSensorOrientation(m);
end

while getappdata(handles.pushbuttonStop,'flag') ~= 1
Ea = retrieveSensorOrientation(m,T);% Ea is a vector with the euler angles 
% relative to the initial position

%% TO DO 
%Process Euler angle data to convert it to:
mat = EulerAngles2rotM(Ea(1),Ea(2),Ea(3));
set(handles.eulerAngles, 'String', Ea);
%   Euler principal axis and angle  //Done
[angle, U] = EulerAngleAxisFromRotMat(mat);
set(handles.eulAngl, 'String', angle);
set(handles.eulAx, 'String', U);
%   Rotation Vector  //Done
set(handles.rotVec, 'String', (RotationVector(angle, U)));
%   Quaternion  //Done
set(handles.rotQuat, 'String', (RotationQuaternion(angle, U)));
%   Rotation matrix  //Done
set(handles.rotMat, 'Data', mat);
% Show the obtained values on the guide figure.

%%
pause(.01)

%% TO DO 

%Implement the function 
M = RotateM(Ea);
% M = [ -1  -1 1;
%         -1   1 1;
%         1   1 1;
%         1  -1 1;
%         -1  -1 -1;
%         -1   1 -1;
%         1   1 -1;
%         1  -1 -1]';
    
% M must be the presented nodes after transforming by the rotation
% measured by the sensors
%%
refreshPlot(M,h);
end
m.discardlogs;


% --- Executes during object creation, after setting all properties.
function eulAngl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eulAngl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function text1_Callback(hObject, eventdata, handles)
% hObject    handle to eulAngl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eulAngl as text
%        str2double(get(hObject,'String')) returns contents of eulAngl as a double
