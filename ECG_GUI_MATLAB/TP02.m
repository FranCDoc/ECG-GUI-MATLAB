function varargout = TP02(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP02_OpeningFcn, ...
                   'gui_OutputFcn',  @TP02_OutputFcn, ...
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

function TP02_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
ud = get(0,'userdata');
axes(handles.axes14);
mesh(zeros(1,5),zeros(1,10),zeros(10,5));
SetLimitsX1(handles);
SetLimitsX2(handles);
SetLimitsX3(handles);
SetLimitsY1(handles);
SetLimitsY2(handles);
SetLimitsY3(handles);
SetLimitsZ3(handles);
% x=load('data.mat','data');
[hdr, record]=edfread('chb01_04.edf');
ud.fs =256;
pre=120/(1/ud.fs); % 2 minutos en forma de posiciones en el vector "recorddata"
principio=375552-pre;
final=382464+pre;
N=final-principio;
ud.record = record(:,principio:final-1);
ud.t=(1:N)/ud.fs;
ud.f=(0:N-1)*ud.fs/N;
ud.recordfiltrada=[];
ud.N=N;
set(0,'userdata',ud);

function varargout = TP02_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function editXMAX1_Callback(hObject, eventdata, handles)
SetLimitsX1(handles);

function editXMAX1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editXMIN1_Callback(hObject, eventdata, handles)
SetLimitsX1(handles);

function editXMIN1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editYMIN1_Callback(hObject, eventdata, handles)
SetLimitsY1(handles);

function editYMIN1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editYMAX1_Callback(hObject, eventdata, handles)
SetLimitsY1(handles);

function editYMAX1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editYMAX2_Callback(hObject, eventdata, handles)
SetLimitsY2(handles);

function editYMAX2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editYMIN2_Callback(hObject, eventdata, handles)
SetLimitsY2(handles);

function editYMIN2_CreateFcn(hObject, eventdata, handles)% hObject    handle to editYMIN2 (see GCBO)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editXMIN2_Callback(hObject, eventdata, handles)
SetLimitsX2(handles);

function editXMIN2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editXMAX2_Callback(hObject, eventdata, handles)
SetLimitsX2(handles);

function editXMAX2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editZMAX3_Callback(hObject, eventdata, handles)
SetLimitsZ3(handles);

function editZMAX3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editZMIN3_Callback(hObject, eventdata, handles)
SetLimitsZ3(handles);

function editZMIN3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editYMIN3_Callback(hObject, eventdata, handles)
SetLimitsY3(handles);

function editYMIN3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editYMAX3_Callback(hObject, eventdata, handles)
SetLimitsY3(handles);

function editYMAX3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editXMAX3_Callback(hObject, eventdata, handles)
SetLimitsX3(handles);

function editXMAX3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editXMIN3_Callback(hObject, eventdata, handles)
SetLimitsX3(handles);

function editXMIN3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SetLimitsX1(handles)
XMIN1=str2double(get(handles.editXMIN1,'string'));
XMAX1=str2double(get(handles.editXMAX1,'string'));
axes(handles.axes1);
xlim([XMIN1 XMAX1]);

function SetLimitsY1(handles)
YMIN1=str2double(get(handles.editYMIN1,'string'));
YMAX1=str2double(get(handles.editYMAX1,'string'));
axes(handles.axes1);
ylim([YMIN1 YMAX1]);

function SetLimitsX2(handles)
XMIN2=str2double(get(handles.editXMIN2,'string'));
XMAX2=str2double(get(handles.editXMAX2,'string'));
axes(handles.axes2);
xlim([XMIN2 XMAX2]);

function SetLimitsY2(handles)
YMIN2=str2double(get(handles.editYMIN2,'string'));
YMAX2=str2double(get(handles.editYMAX2,'string'));
axes(handles.axes2);
ylim([YMIN2 YMAX2]);

function SetLimitsX3(handles)
XMIN3=str2double(get(handles.editXMIN3,'string'));
XMAX3=str2double(get(handles.editXMAX3,'string'));
axes(handles.axes14);
xlim([XMIN3 XMAX3]);

function SetLimitsY3(handles)
YMIN3=str2double(get(handles.editYMIN3,'string'));
YMAX3=str2double(get(handles.editYMAX3,'string'));
axes(handles.axes14);
ylim([YMIN3 YMAX3]);

function SetLimitsZ3(handles)
ZMIN3=str2double(get(handles.editZMIN3,'string'));
ZMAX3=str2double(get(handles.editZMAX3,'string'));
axes(handles.axes14);
zlim([ZMIN3 ZMAX3]);

function pushbuttonLIMPIARGRAFICO1_Callback(hObject, eventdata, handles)
axes(handles.axes1);
hold off;
plot(0);
SetLimitsX1(handles);
SetLimitsY1(handles);

function pushbuttonLIMPIARGRAFICO2_Callback(hObject, eventdata, handles)
axes(handles.axes2);
hold off;
plot(0);
SetLimitsX2(handles);
SetLimitsY2(handles);

function pushbuttonLIMPIARGRAFICO3_Callback(hObject, eventdata, handles)
axes(handles.axes14);
hold off;
plot(0);
mesh(zeros(1,5),zeros(1,10),zeros(10,5));
SetLimitsX3(handles);
SetLimitsY3(handles);
SetLimitsZ3(handles);

%GRAFICAR 23 CANALES TIEMPO
function pushbuttonGRAFICARTODOTIEMPO_Callback(hObject, eventdata, handles)
GRAFICARTODOTIEMPO(handles);

function GRAFICARTODOTIEMPO(handles)
axes(handles.axes1);
ud=get(0,'userdata');
for n=1:23
    plot(ud.t,ud.record(n,:));
    SetLimitsX1(handles);
    SetLimitsY1(handles);
    hold on;
end
title('Todos los canales');
set(0,'userdata',ud);

function editCANALTIEMPO_Callback(hObject, eventdata, handles)

function editCANALTIEMPO_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonGRAFICOPARTTIEMPO_Callback(hObject, eventdata, handles)
GRAFICOESPARTTIEMPO(handles);

%GRAFICAR CANAL TIEMPO
function GRAFICOESPARTTIEMPO(handles)
axes(handles.axes1);
ud=get(0,'userdata');
m=str2double(get(handles.editCANALTIEMPO,'String'));
plot(ud.t,ud.record(m,:));
SetLimitsX1(handles);
SetLimitsY1(handles);
title('Canales');
hold on;
set(0,'userdata',ud);

function popupmenuWINDOWS_Callback(hObject, eventdata, handles)

function popupmenuWINDOWS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenuRANGOFREQ_Callback(hObject, eventdata, handles)

function popupmenuRANGOFREQ_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editOVERLAP_Callback(hObject, eventdata, handles)

function editOVERLAP_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonGRAFICARTODOESPEC_Callback(hObject, eventdata, handles)
GRAFICARTODOESPEC(handles);

function GRAFICARTODOESPEC(handles)
axes(handles.axes14);
ud=get(0,'userdata');		    
rango = get(handles.popupmenuRANGOFREQ,'value');
nfft = 64;
noverlap=str2double(get(handles.editOVERLAP,'String'));
tipowindow = get(handles.popupmenuWINDOWS,'value');
if (tipowindow==1)
    for n=1:23
        ud.recordfiltrada=RANGOFREQ(rango,n);
        [B,f,t] = spectrogram(ud.recordfiltrada,rectwin(nfft),noverlap,nfft,ud.fs);
        mesh(t,f,abs(B)); % contour o mesh
        xlabel('Tiempo (s)');
        ylabel('Frec (Hz)');
        SetLimitsX3(handles);
        
        SetLimitsY3(handles);
        
        SetLimitsZ3(handles);
        
        hold on;
        title('Espectro todos los canales');
    end
end
if (tipowindow==3)
    for n=1:23
        ud.recordfiltrada=RANGOFREQ(rango,n);
        [B,f,t] = spectrogram(ud.recordfiltrada,hamming(nfft),noverlap,nfft,ud.fs);
        mesh(t,f,abs(B)); % contour o mesh
        xlabel('Tiempo (s)');
        ylabel('Frec (Hz)');
        SetLimitsX3(handles);
       
        SetLimitsY3(handles);
       
        SetLimitsZ3(handles);
        
        hold on;
        title('Espectro todos los canales');
    end
end
if (tipowindow==2)
    for n=1:23
        ud.recordfiltrada=RANGOFREQ(rango,n);
        [B,f,t] = spectrogram(ud.recordfiltrada,blackman(nfft),noverlap,nfft,ud.fs);
        mesh(t,f,abs(B)); % contour o mesh
        xlabel('Tiempo (s)');
        ylabel('Frec (Hz)');
        SetLimitsX3(handles);
      
        SetLimitsY3(handles);
        
        SetLimitsZ3(handles);
        
        hold on;
        title('Espectro todos los canales');
    end
end
set(0,'userdata',ud);

function editCANALESPEC_Callback(hObject, eventdata, handles)

function editCANALESPEC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonGRAFICARPARTESPEC_Callback(hObject, eventdata, handles)
GRAFICARPARTESPEC(handles);

function y=RANGOFREQ(rango,canal)
ud=get(0,'userdata');
if (rango==1)
    w1 = 4/(ud.fs/2);
    [b, a] = butter(8,w1); 
    y = filter(b,a,ud.record(canal,:)); % filtramos el ruido con la iir butterworth de 4to orden
end
if (rango==2)
    w1 = 4/(ud.fs/2);
    w2 = 8/(ud.fs/2);
    [b, a] = butter(4,[w1 w2]); % allow frequency range between w1 and w2.
    y = filter(b,a,ud.record(canal,:)); % filtramos el ruido con la iir butterworth de 4to orden
end
if (rango==3)
    w1 = 8/(ud.fs/2);
    w2 = 12/(ud.fs/2);
    [b, a] = butter(4,[w1 w2]); % allow frequency range between w1 and w2.
    y = filter(b,a,ud.record(canal,:)); % filtramos el ruido con la iir butterworth de 4to orden
end
if (rango==4)
    w1 = 12/(ud.fs/2);
    w2 = 30/(ud.fs/2);
    [b, a] = butter(8,[w1 w2]); % allow frequency range between w1 and w2.
    y = filter(b,a,ud.record(canal,:)); % filtramos el ruido con la iir butterworth de 4to orden
end
if (rango==5)
    w1 = 30/(ud.fs/2);
    w2 = 64/(ud.fs/2);
    [b, a] = butter(8,[w1 w2]); % allow frequency range between w1 and w2.
    y = filter(b,a,ud.record(canal,:)); % filtramos el ruido con la iir butterworth de 4to orden
end
if (rango==6)
    y = ud.record(canal,:);
end
set(0,'userdata',ud);

function GRAFICARPARTESPEC(handles)
ud=get(0,'userdata');	
axes(handles.axes14);
nfft = 64;
noverlap=str2double(get(handles.editOVERLAP,'String'));
tipowindow = get(handles.popupmenuWINDOWS,'value');
rango = get(handles.popupmenuRANGOFREQ,'value');
canal = str2double(get(handles.editCANALESPEC,'String'));
ud.recordfiltrada=RANGOFREQ(rango,canal);
if (tipowindow==1) %RECTANGULAR
    [B,f,t] = spectrogram(ud.recordfiltrada,rectwin(nfft),noverlap,nfft,ud.fs);
    mesh(t,f,abs(B)); % contour o mesh
    SetLimitsX3(handles);
  
    SetLimitsY3(handles);
    
    SetLimitsZ3(handles);
    
    title('Espectro canal');
    xlabel('Tiempo(s)');
    ylabel('Freq.(Hz)');
    hold on;
end
if (tipowindow==3) %HAMMING
    [B,f,t] = spectrogram(ud.recordfiltrada,hamming(nfft),noverlap,nfft,ud.fs);
    mesh(t,f,abs(B)); % contour o mesh
    SetLimitsX3(handles);
   
    SetLimitsY3(handles);
    
    SetLimitsZ3(handles);
   
    title('Espectro canal');
    xlabel('Tiempo(s)');
    ylabel('Freq.(Hz)');
    hold on;
end
if (tipowindow==2) %BLACKMAN
    [B,f,t] = spectrogram(ud.recordfiltrada,blackman(nfft),noverlap,nfft,ud.fs);
    mesh(t,f,abs(B)); % contour o mesh
    SetLimitsX3(handles);
 
    SetLimitsY3(handles);
    
    SetLimitsZ3(handles);
       
    title('Espectro canal');
    xlabel('Tiempo(s)');
    ylabel('Freq.(Hz)');    
    hold on;
end
set(0,'userdata',ud);

function popupmenuRITMOSCEREBRALES_Callback(hObject, eventdata, handles)

function popupmenuRITMOSCEREBRALES_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editCANAL_Callback(hObject, eventdata, handles)

function editCANAL_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DESCOMPOSICION(handles)
ud=get(0,'userdata');
nodo = get(handles.popupmenuRITMOSCEREBRALES,'value');
if nodo==1 % Utilizando la funcion [tn_pal,tn_seq] = otnodes(T) se vio el orden de los nodos
    ud.NODO=31;
end
if nodo==2
    ud.NODO=32;
end
if nodo==3
    ud.NODO=34;
end
if nodo==4
    ud.NODO=8;
end
if nodo==5
    ud.NODO=4;
end
m=str2double(get(handles.editCANAL,'String'));
x=ud.record(m,:);
L=5; 
ud.T=wpdec(x,L,'db4');%  uno menos para que no haya allias
coef=wpcoef(ud.T,ud.NODO);% Retrieve the wavelet packet coefficients for the node
axes(handles.axes1);
t=(0:length(coef)-1)*267/(length(coef)-1);
plot(t,coef);
SetLimitsX1(handles);
SetLimitsY1(handles);
title('Descomposición');
xlabel('Tiempo(s)');
set(0,'userdata',ud);

function pushbuttonDESCOMPOSICION_Callback(hObject, eventdata, handles)
DESCOMPOSICION(handles);

function RECONSTRUCCION(handles) % Si no le hice nada va a ser la misma
ud=get(0,'userdata');
x=wprec(ud.T);
axes(handles.axes2);
plot(ud.t,x);
SetLimitsX2(handles);
SetLimitsY2(handles);
title('Reconstrucción');
xlabel('Tiempo(s)');

function pushbuttonRECONSTRUCCION_Callback(hObject, eventdata, handles)
RECONSTRUCCION(handles)

function ORIGINAL(handles) 
ud=get(0,'userdata');
axes(handles.axes2);
m=str2double(get(handles.editCANAL,'String'));
plot(ud.t,ud.record(m,:),'r');
SetLimitsX2(handles);
SetLimitsY2(handles);
title('Original');
xlabel('Tiempo(s)');

function pushbuttonORIGINAL_Callback(hObject, eventdata, handles)
ORIGINAL (handles);


%filtros parametricos
function YULEWALKER(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:)+rand(1,ud.N);
order=str2double(get(handles.editORDEN,'String'));
[Ps,f]=pyulear(x,order,ud.N,ud.fs);
axes(handles.axes2);
ud.gra=plot(f,Ps);
SetLimitsX2(handles);
SetLimitsY2(handles);
xlabel('Freq.(Hz)');
hold on;
set(0,'userdata',ud); 

function BURG(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:)+rand(1,ud.N);
order=str2double(get(handles.editORDEN,'String'));
[Ps,f]=pburg(x,order,ud.N,ud.fs);
axes(handles.axes2);
ud.b=plot(f,Ps);
SetLimitsX2(handles);
SetLimitsY2(handles);
xlabel('Freq.(Hz)');
hold on;
set(0,'userdata',ud); 

function COVARIANZA(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:)+rand(1,ud.N);
order=str2double(get(handles.editORDEN,'String'));
[Ps,f]=pcov(x,order,ud.N,ud.fs);
axes(handles.axes2);
ud.c=plot(f,Ps);
SetLimitsX2(handles);
SetLimitsY2(handles);
xlabel('Freq.(Hz)');
hold on;
set(0,'userdata',ud); 

function COVARIANZAMODIFICADA(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:)+rand(1,ud.N);
order=str2double(get(handles.editORDEN,'String'));
[Ps,f]=pmcov(x,order,ud.N,ud.fs);
axes(handles.axes2);
ud.cm=plot(f,Ps);
SetLimitsX2(handles);
SetLimitsY2(handles);
xlabel('Freq.(Hz)');
hold on;
set(0,'userdata',ud); 

%espectro original
function ESPECTROORIGINAL(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:)+rand(1,ud.N);
X=fft(x);
axes(handles.axes1);
plot(ud.f(1:ud.N/2),abs(X(1:ud.N/2)).^2,'red');
SetLimitsX1(handles);
SetLimitsY1(handles);
xlabel('Freq.(Hz)');
title('Espectro en potencia con ruido');

function ESPECTRO(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:);
X=fft(x);
axes(handles.axes1);
plot(ud.f(1:ud.N/2),abs(X(1:ud.N/2)).^2,'blue');
SetLimitsX1(handles);
SetLimitsY1(handles);
xlabel('Freq.(Hz)');
title('Espectro en potencia sin ruido');

%filtros no parametricos
function MUSIC(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:)+rand(1,ud.N);
nfft=length(x);
[PS,f,v,e] = pmusic(x,32,nfft,ud.fs);
axes(handles.axes2);
ud.m=plot(f,PS);
SetLimitsX2(handles);
SetLimitsY2(handles);
xlabel('Freq.(Hz)');
hold on;
set(0,'userdata',ud); 

function PISARENKO(handles)
ud=get(0,'userdata');
m=str2double(get(handles.editCANALRUIDO,'String'));
x=ud.record(m,:)+rand(1,ud.N);
nfft=length(x);
[PS,f,v,e] = peig(x,32,nfft,ud.fs);
axes(handles.axes2);
ud.p=plot(f,PS);
SetLimitsX2(handles);
SetLimitsY2(handles);
xlabel('Freq.(Hz)');
hold on;
set(0,'userdata',ud); 

function editCANALRUIDO_Callback(hObject, eventdata, handles)

function editCANALRUIDO_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editORDEN_Callback(hObject, eventdata, handles)

function editORDEN_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function checkboxYULEWALKER_Callback(hObject, eventdata, handles)
ud=get(0,'userdata');
if get(handles.checkboxYULEWALKER,'Value')==1
    YULEWALKER(handles);
end
if get(handles.checkboxYULEWALKER,'Value')==0
     set(ud.gra,'visible','off');
end

function checkboxBURG_Callback(hObject, eventdata, handles)
ud=get(0,'userdata');
if get(handles.checkboxBURG,'Value')==1
    BURG(handles);
end
if get(handles.checkboxBURG,'Value')==0
     set(ud.b,'visible','off');
end

function checkboxCOVARIANZA_Callback(hObject, eventdata, handles)
ud=get(0,'userdata');
if get(handles.checkboxCOVARIANZA,'Value')==1
    COVARIANZA(handles);
end
if get(handles.checkboxCOVARIANZA,'Value')==0
     set(ud.c,'visible','off');
end

function checkboxCOVARIANZAMODIFICADA_Callback(hObject, eventdata, handles)
ud=get(0,'userdata');
if get(handles.checkboxCOVARIANZAMODIFICADA,'Value')==1
    COVARIANZAMODIFICADA(handles);
end
if get(handles.checkboxCOVARIANZAMODIFICADA,'Value')==0
     set(ud.cm,'visible','off');
end

function pushbuttonFFT_Callback(hObject, eventdata, handles)
ESPECTROORIGINAL(handles);

function checkboxMUSIC_Callback(hObject, eventdata, handles)
ud=get(0,'userdata');
if get(handles.checkboxMUSIC,'Value')==1
    MUSIC(handles);
end
if get(handles.checkboxMUSIC,'Value')==0
     set(ud.m,'visible','off');
end 

function checkboxPISARENKO_Callback(hObject, eventdata, handles)
ud=get(0,'userdata');
if get(handles.checkboxPISARENKO,'Value')==1
    PISARENKO(handles);
end
if get(handles.checkboxPISARENKO,'Value')==0
     set(ud.p,'visible','off');
end


function PCA(handles)
ud=get(0,'userdata');
[U,S,V] = svd(ud.record,'econ');
eigen = diag(S).^2;
axes(handles.axes1);
plot(eigen,'k');
SetLimitsX1(handles);

SetLimitsY1(handles);

xlabel('N');
ylabel('Eigenvalue');
title('Scree Plot');
% total_eigen = sum(ud.eigen);
% for i = 1:23
%    pct(i) = 100 * sum(ud.eigen(i:23))/total_eigen;
% end 

function pushbuttonSCREEPLOT_Callback(hObject, eventdata, handles)
PCA(handles);

function ICA(handles)
ud=get(0,'userdata');
nu_ICA=str2double(get(handles.editINDEP,'String'));
W = jadeR(ud.record,nu_ICA);	
ic = W*ud.record;
axes(handles.axes2);
%title('Scatter Plot Independent Components');
hold on;
for k = 1:nu_ICA
   plot(ud.t,ic(k,:)+20*(k-1),'k');
   
end  
%hold on;
SetLimitsX2(handles);
SetLimitsY2(handles);

xlabel('Tiempo(s)');
title('PCI');
ud.data=ic;
set(0,'userdata',ud);

function editINDEP_Callback(hObject, eventdata, handles)
ICA(handles);

function editINDEP_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%EJERCICIO 6
%callbacks
function editLAGEJ6_Callback(hObject, eventdata, handles)

function editLAGEJ6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editRESOLEJ6_Callback(hObject, eventdata, handles)

function editRESOLEJ6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editDECRAEJ6_Callback(hObject, eventdata, handles)

function editDECRAEJ6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editAINIEJ6_Callback(hObject, eventdata, handles)

function editAINIEJ6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenuPARAMETROEJ6_Callback(hObject, eventdata, handles)

function popupmenuPARAMETROEJ6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editOVERLAPEJ6_Callback(hObject, eventdata, handles)

function editOVERLAPEJ6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editCANALEJ6_Callback(hObject, eventdata, handles)

function editCANALEJ6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonCALCULAREJ6_Callback(hObject, eventdata, handles)
EJERCICIO6(handles);

%funcion ejercicio6
function EJERCICIO6(handles)
ud=get(0,'userdata');
parametro=get(handles.popupmenuPARAMETROEJ6,'Value');
canal1=str2double(get(handles.editCANALEJ6,'string'));
deltaT= 1;% Defino el ancho de la ventana como 1 segundo en el EEG.
winSamps=round((deltaT)*ud.fs); % 1 segundo en el EEG equivale a 256 puntos.
% Por lo tanto mi ventana va a ser de 256 puntos.
avance=str2double(get(handles.editOVERLAPEJ6,'string'))/100;
stepT=1-avance;
stepSamps=round(stepT*ud.fs); % "stepSamps" es la cantidad de puntos que la ventana avanza por salto.  
overlapSamps=round((deltaT-stepT)*ud.fs); % "overlapSamps" son los puntos de overlap
w=hanning(winSamps); % Defino la ventana como Hanning. 
numFrames=floor((length(ud.record)-winSamps)/stepSamps)+1; 
% "numFrames" es la cantidad de segmentos sobre los cuales la ventana va a ir 
% saltando.
vectort=(round(winSamps/2):stepSamps:(length(ud.record)-round(winSamps/2)));
t=vectort/ud.fs; 
vectorf=(round(winSamps/2):stepSamps:(length(ud.record)-round(winSamps/2)))/length(ud.record);
f=vectorf*ud.fs;

if parametro == 1 %varianza
    axes(handles.axes1);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        frame=ud.record(canal1,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
        frameW=frame.*w'; 
        VAR(i+1)=var(frameW);
    end
    VAR=VAR/(max(VAR));
    plot(t,VAR);
    title('Varianza');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
    
    hold on;
end
if parametro == 2 %desviacion estandar
    axes(handles.axes1);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        frame=ud.record(canal1,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
        frameW=frame.*w'; 
        STD(i+1)=std(frameW); 
    end
    STD=STD/(max(STD));
    plot(t,STD);
    title('Desviación estandar');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
    
    hold on;
end
if parametro == 3 %promedio de variacion absoluta
    axes(handles.axes1);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        frame=ud.record(canal1,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
        frameW=frame.*w'; 
        PVA(i+1)=sum(abs(frameW))/winSamps; 
    end
    PVA=PVA/(max(PVA));
    plot(t,PVA);
    title('Promedio de variación absoluta');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
    
    hold on;
end
if parametro == 4 %covarianza
    axes(handles.axes1);
    COV=zeros(1,numFrames);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        if comienzo <= ud.N - 2*winSamps
            frame=ud.record(canal1,comienzo:comienzo+winSamps-1); 
            frameprox=ud.record(canal1,comienzo+winSamps:comienzo+winSamps*2-1);
            frameW=frame.*w'; 
            frameWprox=frameprox.*w';
            c=cov(frameW,frameWprox);
            COV(i+1)=c(1,2);
            %COV(i+1)=max(max(((cov(frameW,frameWprox))))); % Guardo el valor máximo
        end
    end
    COV=COV/max(abs(COV));
    plot(t,COV);
    title('Covarianza');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
   
    hold on;
end
if parametro == 5 %Pearson
    axes(handles.axes1);
%     pxx=0;
     PEARSON=zeros(1,numFrames);
%     for i=0:numFrames-1
%         comienzo=i*stepSamps+1; 
%         if comienzo <= ud.N - 2*winSamps
%             frame=ud.record(canal1,comienzo:comienzo+winSamps-1); 
%             frameprox=ud.record(canal1,comienzo+winSamps:comienzo+winSamps*2-1);
%             frameW=frame.*w'; 
%             frameWprox=frameprox.*w';
%             for k=1:winSamps
%                 pxx = pxx + (frameW(k)-mean(frameW))*(frameWprox(k)-frameWprox);
%             end
%             pxx=pxx/(winSamps*var(frameW)*var(frameWprox));
%             PEARSON(i+1) = max(pxx);
%         end
%     end
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        if comienzo <= ud.N - 2*winSamps
            frame=ud.record(canal1,comienzo:comienzo+winSamps-1); 
            frameprox=ud.record(canal1,comienzo+winSamps:comienzo+winSamps*2-1);
            frameW=frame.*w'; 
            frameWprox=frameprox.*w';
            c=corrcoef(frameW,frameWprox);
            PEARSON(i+1)=c(1,2);
            %COV(i+1)=max(max(((cov(frameW,frameWprox))))); % Guardo el valor máximo
        end
    end
    plot(t,PEARSON);
    title('Coef. Pearson');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
  
    SetLimitsY1(handles);
    
    hold on;
end
if parametro == 6 %correlacion cruzada con lag 0
    axes(handles.axes1);
    CROSS=zeros(1,numFrames);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        if comienzo <= ud.N - 2*winSamps
            frame=ud.record(canal1,comienzo:comienzo+winSamps-1); 
            frameprox=ud.record(canal1,comienzo+winSamps:comienzo+winSamps*2-1);
            frameW=frame.*w'; 
            frameWprox=frameprox.*w';
            c=xcorr(frameW,frameWprox);
            CROSS(i+1)=c(1,length(frameW));
            %CROSS(i+1)=max(max(((cov(frameW,frameWprox))))); % Guardo el valor máximo
        end
    end
    %     for i=0:numFrames-1
%         comienzo=i*stepSamps+1; 
%         if comienzo <= ud.N - 2*winSamps
%             frame=ud.record(canal1,comienzo:comienzo+winSamps-1); 
%             frameprox=ud.record(canal1,comienzo+winSamps:comienzo+winSamps*2-1);
%             frameW=frame.*w'; 
%             frameWprox=frameprox.*w';
%             CROSS(i+1)=max(xcorr(frameW,frameWprox));
%         end
%    end
    CROSS=CROSS/max(abs(CROSS));
    plot(t,CROSS);
    title('Correlación cruzada');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
   
    SetLimitsY1(handles);
    
    hold on;
end
if parametro == 7 %autocorrelacion lAG 0
    axes(handles.axes1);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        frame1=ud.record(canal1,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
        frameW=frame1.*w'; 
        c=xcorr(frameW,frameW);
        ACORR(i+1)=c(1,length(frameW));
    end
    ACORR=ACORR/max(abs(ACORR));
    plot(t,ACORR);
    title('Auto-correlación');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
    
    hold on;
end
if parametro == 8 %autocov
    axes(handles.axes1);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        frame=ud.record(canal1,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
        frameW=frame.*w'; 
        c=cov(frameW,frameW);
        ACOV(i+1)=c(1,1);
    end
    ACOV=ACOV/max(abs(ACOV));
    plot(t,ACOV);
    title('Auto-covarianza');
    xlabel('Tiempo(s)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
   
    hold on;
end
% if parametro == 9 %cov cruzada
%     axes(handles.axes1);
%     for i=0:numFrames-1
%         comienzo=i*stepSamps+1; 
%         frame1=ud.record(canal1,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
%         frame2=ud.record(canal2,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
%         frameW1=frame1.*w'; 
%         frameW2=frame2.*w';
%         XCOV=xcov(frameW1,frameW2); 
%         lag=str2double(get(handles.editLAGEJ6,'string'));
%         XCOVV(i+1)=XCOV(length(frameW1)+lag);
%     end
%     plot([1:numFrames],XCOVV);
%     title('Covarianza cruzada');
%     xlabel('Frame');
%     SetLimitsX1(handles);
%     SetLimitsY1(handles);
%     hold on;
% end
if parametro == 10 %espectro en potencia
    axes(handles.axes1);
    for i=0:numFrames-1
        comienzo=i*stepSamps+1; 
        frame=ud.record(canal1,comienzo:comienzo+winSamps-1); %tomo ventana rectangular
        frameW=frame.*w'; 
        PS(i+1)=sum(abs(fft(frameW)).^2)/(winSamps); 
    end
%     Caso de pedir PS para el canal:

%     PS=abs(fft(ud.record(canal1,:)).^2)/(ud.N);
%     plot(ud.f,PS);
    plot(f,PS);
    title('Espectro en potencia');
    xlabel('Freq.(Hz)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
    
    hold on;
end
if parametro == 11 %PERIODOGRAMA
    axes(handles.axes1);
    [PM,fwelch] = pwelch(ud.record(canal1,:),winSamps,overlapSamps,f,ud.fs);
    plot(fwelch,PM);
    title('Periodograma');
    xlabel('Freq.(Hz)');
    SetLimitsX1(handles);
    
    SetLimitsY1(handles);
   
    hold on;
end
if parametro == 12 %WAVELET CONTINUA
    axes(handles.axes14);
    b = (1:68352)/ud.fs;
    resol_level = str2double(get(handles.editRESOLEJ6,'string')); %40;	% numero de niveles de a
    decr_a = str2double(get(handles.editDECRAEJ6,'string'));%2;        %decremento de a
    a_init = str2double(get(handles.editAINIEJ6,'string')); %0.5;		 % a inicial
    wo = pi * sqrt(2/log2(2));
    for k = 1:resol_level
        a(k) = a_init/(k*decr_a); 
        tw = b/a(k); 
        wav = (exp(-tw.^2).* cos(wo*tw))/sqrt(a(k)); % Morlet Wavlet
        psi = [fliplr(wav) wav(2:end)]; % Simétrico en 0
        wlet(k,:) = psi; 
        CW_Trans(:,k) =conv(ud.record(canal1,:),psi,'same'); % Acá se define qué canal analizar   
    end
    mesh(a,b,abs(CW_Trans),gradient(abs(CW_Trans)));    % Plot in 3 dimensions
    title('Wavelet continua');
    xlabel('a (Scale)','FontSize',14);
    ylabel('b (sec)','FontSize',14);
    zlabel('CWT','FontSize',14)
    
    SetLimitsX3(handles);
   
    SetLimitsY3(handles);
  
    SetLimitsZ3(handles);
    
    
    hold on;
end
set(0,'userdata',ud);

%LYAPUNOV
function LYAPUNOV(handles)
ud=get(0,'userdata');
canal1=str2double(get(handles.editCANAL1,'String'));
canal2=str2double(get(handles.editCANAL2,'String'));
for n=1:ud.N
    d(n)=log(sqrt(abs(ud.data(canal1,n)-ud.data(canal2,n))));
end
axes(handles.axes1);
n=1:6912;
d=d(30721:37632);
plot(n,d,'.k');
SetLimitsX1(handles);

title('Lyapunov');
xlabel('Muestras');
p = polyfit(n,d,1);
y1=p(1)*n + p(2);
set(handles.editCOEFLYAPUNOV,'string',num2str(p(1)));
hold on;
plot(n,y1,'red');
SetLimitsY1(handles);

a=sum((d-y1).^2);
b=sum((d-mean(d)).^2);
r2=abs(1-a/b);
set(handles.editR,'string',num2str(r2));

function editCANAL1_Callback(hObject, eventdata, handles)

function editCANAL1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editCANAL2_Callback(hObject, eventdata, handles)

function editCANAL2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonGRAFICAR_Callback(hObject, eventdata, handles)
LYAPUNOV(handles);

function editR_Callback(hObject, eventdata, handles)

function editR_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editCOEFLYAPUNOV_Callback(hObject, eventdata, handles)

function editCOEFLYAPUNOV_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbuttonFFTsinruido_Callback(hObject, eventdata, handles)
ESPECTRO(handles);

function pushbutton32_Callback(hObject, eventdata, handles)
ESPECTROORIGINAL(handles);
