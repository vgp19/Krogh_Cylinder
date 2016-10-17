function varargout = Patel_Vivekkumar_Krogh(varargin)
% PATEL_VIVEKKUMAR_KROGH MATLAB code for Patel_Vivekkumar_Krogh.fig
%      PATEL_VIVEKKUMAR_KROGH, by itself, creates a new PATEL_VIVEKKUMAR_KROGH or raises the existing
%      singleton*.
%
%      H = PATEL_VIVEKKUMAR_KROGH returns the handle to a new PATEL_VIVEKKUMAR_KROGH or the handle to
%      the existing singleton*.
%
%      PATEL_VIVEKKUMAR_KROGH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PATEL_VIVEKKUMAR_KROGH.M with the given input arguments.
%
%      PATEL_VIVEKKUMAR_KROGH('Property','Value',...) creates a new PATEL_VIVEKKUMAR_KROGH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Patel_Vivekkumar_Krogh_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Patel_Vivekkumar_Krogh_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Patel_Vivekkumar_Krogh

% Last Modified by GUIDE v2.5 19-Nov-2015 15:49:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Patel_Vivekkumar_Krogh_OpeningFcn, ...
                   'gui_OutputFcn',  @Patel_Vivekkumar_Krogh_OutputFcn, ...
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


% --- Executes just before Patel_Vivekkumar_Krogh is made visible.
function Patel_Vivekkumar_Krogh_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Patel_Vivekkumar_Krogh (see VARARGIN)

% Choose default command line output for Patel_Vivekkumar_Krogh
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Patel_Vivekkumar_Krogh wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Patel_Vivekkumar_Krogh_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r_c=str2double(get(handles.edit10,'String'));
t_m=str2double(get(handles.edit11,'String'));
V=str2double(get(handles.edit12,'String'));
C0=str2double(get(handles.edit13,'String'));
R0=str2double(get(handles.edit14,'String'));
dt=str2double(get(handles.edit15,'String'));
K0=str2double(get(handles.edit16,'String'));
z_min=str2double(get(handles.edit17,'String'));
z_max=str2double(get(handles.edit18,'String'));

if  size(str2num(get(handles.edit10,'String'))) == 0;
            set(handles.text40,'String','Error - Box 1 is not a number.');
elseif size(str2num(get(handles.edit11,'String'))) == 0;
            set(handles.text40,'String','Error - Box 2 is not a number.');
elseif  size(str2num(get(handles.edit12,'String'))) == 0;
            set(handles.text40,'String','Error - Box 3 is not a number.');
elseif  size(str2num(get(handles.edit13,'String'))) == 0;
            set(handles.text40,'String','Error - Box 4 is not a number.');
elseif  size(str2num(get(handles.edit14,'String'))) == 0;
            set(handles.text40,'String','Error - Box 5 is not a number.');
elseif  size(str2num(get(handles.edit15,'String'))) == 0;
            set(handles.text40,'String','Error - Box 6 is not a number.');
elseif  size(str2num(get(handles.edit16,'String'))) == 0;
            set(handles.text40,'String','Error - Box 7 is not a number.');
elseif  size(str2num(get(handles.edit17,'String'))) == 0;
            set(handles.text40,'String','Error - Box 8 is not a number.');
elseif  size(str2num(get(handles.edit18,'String'))) == 0;
            set(handles.text40,'String','Error - Box 9 is not a number.');
elseif (r_c<=0)||(t_m<=0)||(V<=0)||(C0<=0)||(R0<=0)||(dt<=0)||(K0<=0)||(z_max<=0)
    set(handles.text40,'String','Error - Enter number greater than zero in Box 1 to 7 and 9.');
elseif (z_max<=z_min)
    set(handles.text40,'String','Error - Zmax should be greater than Zmin.');
else
    
set(handles.text40,'String','No Error.');

A=(4.*dt*C0)./(R0.*(r_c+t_m).^2);
B=(4.*dt)./(V.*r_c.^2);
C=(2.*dt)./(r_c.*K0);
D=1-A;



Es=0.001;
i=1;
for z = z_min:z_max/100:z_max
    x_old=65;
    E=B.*z;
f=@(x) (x.*log(x))-x+D+((E+C).*(x-1));
f_prime=@(x) x.*log(x)+E+C;
    while(1);
        x_new = x_old-(f(x_old)/f_prime(x_old));
        Ea=abs(x_new-x_old)/x_new;
        if Ea<=Es
            break;
        end
        x_old=x_new;
    end
    r_crit=sqrt(x_new).*(r_c+t_m);
    r_store(i)=r_crit;
    z_store(i)=z;
    i=i+1;
    k=i;
 

end

rc_store(1:k)=r_c;
[rc_x,rc_y,rc_z]=cylinder(rc_store,50);
[rx,ry,rz]=cylinder(r_store,50);
d=z_max-z_min;

h = rotate3d(handles.axes6);
h.RotateStyle = 'box';
h.Enable = 'on';
cla(handles.axes6,'reset');
set(handles.text41,'String',' ');
set(handles.axes6,'Box','on');
cap=surf(handles.axes6,rc_x,rc_y,rc_z*d);
set(cap,'FaceAlpha',0.5,'EdgeColor','b','EdgeAlpha',0.2,...
'DiffuseStrength',1,'AmbientStrength',1,'FaceColor','b');
hold on;
krogh_cylinder=surf(handles.axes6,rx,ry,rz*d);
set(krogh_cylinder,'FaceAlpha',0.5,'EdgeColor','r','EdgeAlpha',0.2,...
'DiffuseStrength',1,'AmbientStrength',1,'FaceColor','r');
zlabel(handles.axes6,'Axial distance, z [cm]');
zlim([z_min-(z_max/10) z_max+(z_max/10)]);
title(handles.axes6,'Krogh Cylinder');
grid on;
set(handles.text41,'String','Rotate the graph for a better view.');
hold off;

plot(handles.axes5,z_store,r_store);
set(handles.axes5,'XGrid','on');
set(handles.axes5,'YGrid','on');
xlabel(handles.axes5,'Axial distance, z [cm]');
ylabel(handles.axes5,'Critical Radius, r_c_r_i_t [cm]');
title(handles.axes5,'Critical Radius vs Axial Distance');
legend(handles.axes5,'r_c_r_i_t [cm]');


set(handles.uitable1,'data',[ [],[]]);
set(handles.uitable1,'data',[z_store',r_store']);


end
            % --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit10,'String','0');
set(handles.edit11,'String','0');
set(handles.edit12,'String','0');
set(handles.edit13,'String','0');
set(handles.edit14,'String','0');
set(handles.edit15,'String','0');
set(handles.edit16,'String','0');
set(handles.edit17,'String','0');
set(handles.edit18,'String','0');
cla(handles.axes5,'reset');
cla(handles.axes6,'reset');
set(handles.text40,'String',' ');
set(handles.text41,'String',' ');
set(handles.uitable1,'data',[ [],[]]);
rotate3d off;





function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
