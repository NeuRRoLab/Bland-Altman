function varargout = BAGUI(varargin)
% BAGUI MATLAB code for BAGUI.fig
%      BAGUI, by itself, creates a new BAGUI or raises the existing
%      singleton*.
%
%      H = BAGUI returns the handle to a new BAGUI or the handle to
%      the existing singleton*.
%
%      BAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BAGUI.M with the given input arguments.
%
%      BAGUI('Property','Value',...) creates a new BAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BAGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BAGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BAGUI

% Last Modified by GUIDE v2.5 11-Apr-2016 20:15:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @BAGUI_OpeningFcn, ...
    'gui_OutputFcn',  @BAGUI_OutputFcn, ...
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


% --- Executes just before BAGUI is made visible.
function BAGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BAGUI (see VARARGIN)

% Choose default command line output for BAGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.text4,'UserData',true);

% UIWAIT makes BAGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = BAGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SelectData.
function SelectData_Callback(hObject, eventdata, handles)
% hObject    handle to SelectData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[DataFile,DataPath] = uigetfile('*.xlsx','Select an excel data file');
guidata(BAGUI);
%set(handels.text4,'Data',true);

set(handles.GroupingVar,'Value',1)
set(handles.InterestVar,'Value',1)

try
    [DataNum, DataText, DataRaw] = xlsread([DataPath, DataFile],get(handles.NumSheets,'Value'));
    set(handles.errors,'String','')
catch ME
    set(handles.errors,'String','Unable to open file and sheet combination')
end

Headers = cell(1,size(DataRaw,2));
for i = 1:length(Headers);
    Headers{i} = DataRaw{1,i};
end
DataTotal = {DataNum,DataText,DataRaw,Headers};
set(handles.SelectData,'UserData',DataTotal)
set(handles.GroupingVar,'String',Headers)
set(handles.InterestVar,'String',Headers)





function NumSheets_Callback(hObject, eventdata, handles)
% hObject    handle to NumSheets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumSheets as text
%        str2double(get(hObject,'String')) returns contents of NumSheets as a double
set(handles.NumSheets,'Value',str2num(get(handles.NumSheets,'String')))




% --- Executes during object creation, after setting all properties.
function NumSheets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumSheets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in GroupingVar.
function GroupingVar_Callback(hObject, eventdata, handles)
% hObject    handle to GroupingVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns GroupingVar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GroupingVar




% --- Executes during object creation, after setting all properties.
function GroupingVar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GroupingVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in InterestVar.
function InterestVar_Callback(hObject, eventdata, handles)
% hObject    handle to InterestVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns InterestVar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from InterestVar



% --- Executes during object creation, after setting all properties.
function InterestVar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InterestVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in IDGrpVar.
function IDGrpVar_Callback(hObject, eventdata, handles)
% hObject    handle to IDGrpVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DataTotal = get(handles.SelectData,'UserData');
DataNum = DataTotal{1};
DataText = DataTotal{2};
DataRaw = DataTotal{3};
Headers = DataTotal{4};

useall = get(handles.useall,'Value');
Data = zeros(size(DataRaw,1)-1,size(DataRaw,2));

if useall == false
    Vars = get(handles.GroupingVar,'Value');
    DataStrings = cell(1,length(DataText)-1);
    DStringsTot = cell(1,length(Vars));
    SubVarNames = cell(length(Vars));
     for i = 1:length(Vars)
        VarNames{i} = Headers{Vars(i)};
        for j = 1:length(DataRaw)-1
            if ~ischar(DataRaw{j+1,Vars(i)})
                DataStrings{j} = num2str(DataRaw{j+1,Vars(i)});
            else
                DataStrings{j} = DataRaw{j+1,Vars(i)};
            end
        end
        SubVarNames{i} = unique(DataStrings,'stable');
        DStringsTot{i} = DataStrings';
    end
    
    SubInds = cell(1,length(Vars));
    for i = 1:length(Vars)
        [Selection,ok] = listdlg('PromptString',['Select variables to keep for ', VarNames{i}],...
            'SelectionMode','multiple',...
            'ListSize',[200 300],...
            'ListString', SubVarNames{i});
        SubInds{i} = Selection;
    end
    
    DataInd = false(size(DataRaw,1)-1,length(Vars));
    Condition = cell(1,length(Vars));
    for j = 1:length(Vars)
        Condition{j} = SubVarNames{j}(SubInds{j});
        for i = 1:size(DataRaw,1)-1
            for k = 1:length(Condition{j})
                if strcmp(Condition{j}(k), num2str(DataRaw{i+1,Vars(j)}))
                    DataInd(i,j) = true;
                end
            end
        end
    end
    
    Filter = logical(prod(DataInd,2));
    for i = 1:length(DStringsTot)
        DStringsTot{i} = DStringsTot{i}(Filter);
    end
    for i = 1:size(DataRaw,1)-1
        for j = 1:size(DataRaw,2)
            if ischar(DataRaw{i+1,j})
                Data(i,j) = NaN;
            else
                Data(i,j) = DataRaw{i+1,j};
            end
        end
    end
    Data = Data(Filter,:);
    allData = {Data,DStringsTot,Condition};
    
else
    for i = 1:size(DataRaw,1)-1
        for j = 1:size(DataRaw,2)
            if ischar(DataRaw{i+1,j})
                Data(i,j) = NaN;
            else
                Data(i,j) = DataRaw{i+1,j};
            end
        end
    end
    allData = {Data,{},{}};
end

set(handles.IDGrpVar,'UserData',allData)




% --- Executes on button press in CalculateBA.
function CalculateBA_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateBA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DataTotal = get(handles.SelectData,'UserData');
DataNum = DataTotal{1};
DataText = DataTotal{2};
DataRaw = DataTotal{3};
Headers = DataTotal{4};

Data = get(handles.IDGrpVar,'UserData');

Condition = Data{3};
DStringsTot = Data{2};
Data = Data{1};

Vars = get(handles.InterestVar,'Value');
if length(Vars)==2
    set(handles.errors,'String','')
    Var1 = Headers{Vars(1)};
    Var2 = Headers{Vars(2)};
    tfv1 = zeros(1,2);
    tfv2 = zeros(1,2);
    for i = 1:length(Headers);
        tfv1(1) = strcmp(Var1, Headers{i});
        if tfv1(1) == 1
            tfv1(2) = i;
            break
        end
    end
    for i = 1:length(Headers);
        tfv2(1) = strcmp(Var2, Headers{i});
        if tfv2(1) == 1
            tfv2(2) = i;
            break
        end
    end
    
    %All stats can be calculated from the following data
    
    diff = Data(:,tfv1(2))-Data(:,tfv2(2));
    mmean = mean(Data(:,[tfv1(2),tfv2(2)]),2);
    
    [testt,testp] = ttest(diff);
    
    if testt == 0
        set(handles.Stats, 'String', ['t test is not significant with a value of p= ',...
            num2str(testp), ' no statistical difference between compared variables'])
    else
        set(handles.Stats, 'String', ['t test is significant with a value of p= ',...
            num2str(testp), ' compared variables are statistically different'])
    end
    
    useall = get(handles.useall,'Value');
    
    if useall == false
        %Filter based on the variable name for plotting
        l = 1;
        for j = 1:length(Condition)
            for k = 1:length(Condition{j})
                for i = 1:size(Data,1)
                    if strcmp(Condition{j}(k),DStringsTot{j}(i))
                        FurtherFilt(i,l)= 1;
                        Names{l} = Condition{j}(k);
                    end
                end
                l = l+1;
            end
        end
        
        if length(Condition)<2
            Names1 = Names;
            FurtherFilt1 = FurtherFilt;
        else
            l = 1;
            for i = 1:length(Names);
                for j = i+1:length(Names);
                    FurtherFilt1(:,l) = FurtherFilt(:,i).*FurtherFilt(:,j);
                    Names1{l} = strcat(Names{i}, {' & '}, Names{j});
                    l = l+1;
                end
            end
        end
        FurtherFilt1 = logical(FurtherFilt1);
        l = 1;
        for i = 1:size(FurtherFilt1,2);
            if sum(FurtherFilt1(:,i)) > 0;
                FurtherFilt2(:,l) = FurtherFilt1(:,i);
                Names2(l) = Names1{i};
                l = l+1;
            end
        end
    else
        Names2 = {'Data'};
    end
    %Begin Plotting
    axes(handles.plotaxes)
    cla
    if get(handles.text4,'UserData') == true;
    Units = ['(', get(handles.Units,'String'),')'];
    
    PlotProps = cell(12,3);
    PlotProps{1,1} = ['Bland-Altman Plot of ',Var1,' & ',Var2]; %title
    PlotProps{2,1} = 'Arial';%font
    PlotProps{3,1} = 20;%title size
    PlotProps{4,1} = 'bold'; %Title font weight
    PlotProps{5,1} = ['Average Measurement ', Units];%xlab
    PlotProps{6,1} = 16;%xlab font sz
    PlotProps{7,1} = 'bold'; %x lab font weight
    PlotProps{8,1} = ['Difference ', Units];%ylab
    PlotProps{9,1} = 16;%ylab font sz
    PlotProps{10,1} = 'bold'; %y lab font weight
    PlotProps{11,1} = 12; %axes font size
    PlotProps{12,1} = 6;% marker size
    PlotProps{13,1} = 1.5;%linewidth
    PlotProps{14,1} = [.5];%
    PlotProps{14,2} = [.5];% Set the line color to RGB
    PlotProps{14,3} = [.5];%
    PlotProps{15,1} = [0];%
    PlotProps{15,2} = [.4470];% Set the plot color scheme 1
    PlotProps{15,3} = [.7410];%
    PlotProps{16,1} = [.850];%
    PlotProps{16,2} = [.3250];% Set the plot color scheme 2
    PlotProps{16,3} = [.0980];% 
    PlotProps{17,1} = [.9290];%
    PlotProps{17,2} = [.6940];% Set the plot color scheme 3
    PlotProps{17,3} = [.1250];%
    PlotProps{18,1} = [.4940];%
    PlotProps{18,2} = [.1840];% Set the plot color scheme 4
    PlotProps{18,3} = [.5560];%
    PlotProps{19,1} = [.4];% offset for y axes
    set(handles.PlotPropsTab,'Data',PlotProps);
    set(handles.text4,'UserData',false);
    set(handles.PlotPropsTab,'UserData',get(handles.PlotPropsTab,'Data'));
    end
    
    PlotProps = get(handles.PlotPropsTab,'Data');
    
    hold on
    
    plotcol = [PlotProps{15,1} PlotProps{15,2} PlotProps{15,3};...
        PlotProps{16,1} PlotProps{16,2} PlotProps{16,3};...
        PlotProps{17,1} PlotProps{17,2} PlotProps{17,3};...
        PlotProps{18,1} PlotProps{18,2} PlotProps{18,3}];
    
    for i = 1:length(Names2)
        if length(Names2) > 1;
            baplot = plot(mmean(FurtherFilt2(:,i)),diff(FurtherFilt2(:,i)),'o',...
                'MarkerSize', PlotProps{12,1},'MarkerEdgeColor',plotcol(i,:));
            set(baplot, 'MarkerFaceColor', plotcol(i,:));
        else
            baplot = plot(mmean,diff,'o','MarkerSize',PlotProps{12,1},'MarkerEdgeColor',plotcol(1,:));
            set(baplot, 'MarkerFaceColor', plotcol(1,:));
        end
    end
        
    diff(isnan(diff)) = [];
    meandiff = mean(diff);
    stddiff = std(diff);
    stddiffline = zeros(1,2);
    stddiffline(1) = meandiff+(1.96*stddiff);
    stddiffline(2) = meandiff-(1.96*stddiff);
    
    
    set(handles.plotaxes,'FontName',PlotProps{2,1},'FontSize',PlotProps{11,1})
    xlabel(PlotProps{5},...
        'FontName',PlotProps{2,1},'FontSize',PlotProps{6,1},...
        'FontWeight',PlotProps{7,1})
    ylabel(PlotProps{8,1},...
        'FontName',PlotProps{2,1},'FontSize',PlotProps{9,1},...
        'FontWeight',PlotProps{10,1})
    title(PlotProps{1,1},'FontName',PlotProps{2,1},'FontSize',PlotProps{3,1},...
        'FontWeight',PlotProps{4,1})
    
%     xlabel(['Average Measurement ', Units],...
%         'FontName','Arial','FontSize',16,...
%         'FontWeight','bold')
%     ylabel(['Difference ', Units],...
%         'FontName','Arial','FontSize',16,...
%         'FontWeight','bold')
%     title(['Bland-Altman Plot of ',Var1,' & ',Var2],...
%         'FontName','Arial','FontSize',20,...
%         'FontWeight','bold')
%     set(gca,'FontName','Arial','FontSize',12)
    offset = .1;
    axis([min(mmean)-offset*abs(min(mmean)), max(mmean)+offset*abs(max(mmean)),...
        min(diff)-offset*abs(min(diff)), max(diff)+abs(offset*max(diff))]);
    
    mline = refline([0,meandiff]);
    mline.Color = [PlotProps{14,1} PlotProps{14,2} PlotProps{14,3}];
    mline.LineWidth =  PlotProps{13,1};
    
    sdline1 = refline([0,stddiffline(1)]);
    sdline2 = refline([0,stddiffline(2)]);
    sdline1.Color = [PlotProps{14,1} PlotProps{14,2} PlotProps{14,3}];
    sdline1.LineWidth =  PlotProps{13,1};
    sdline1.LineStyle = '--';
    Names2{end+1} = 'Mean Difference';
    Names2{end+1} = 'Limit of Agreement';
    legend(Names2,'Box','off','Location','northeast')
    %legend('boxoff','Location','east')
    %legend('Location','Best')
    %legend('hide')
    
    sdline2.Color = [PlotProps{14,1} PlotProps{14,2} PlotProps{14,3}];
    sdline2.LineWidth =  PlotProps{13,1};
    sdline2.LineStyle = '--';
    
    offsety = PlotProps{19,1};
    y = abs(stddiffline(1)-meandiff)+abs(stddiffline(1)-meandiff)*offsety;
    %y sets an equal distance for the y axis
    axis([min(mmean)-offset*min(mmean), max(mmean)+offset*max(mmean),...
        meandiff-y, meandiff+y]);
    hold off
    %get(handles.Export,'UserData')
    get(legend,'Position')
    set(handles.Export,'UserData',Names2)
else
    set(handles.errors,'String','Please select 2 variables')
end


% --- Executes on button press in Export.
function Export_Callback(hObject, eventdata, handles)
% hObject    handle to Export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PlotExport = figure;
set(PlotExport,'Units','Normalized')
PlotExport.PaperUnits = 'inches';


% pos = get(PlotExport,'Position');
% pos = pos - 1;
% pos(3) = 7;
% pos(4) = 5;
% set(PlotExport,'Position',pos)



expax = copyobj(handles.plotaxes, PlotExport);
leg = legend(get(handles.Export,'UserData'),'Box','off','Location','northeast');
set(expax,'Units','Normalized','ActivePositionProperty','OuterPosition')%'Position',get(expax,'TightInset'))%[0.1 .1 .8 .8])

PlotExport.PaperPosition = [0 0 5 5];
print('5by3DimensionsFigure','-dpng','-r0')
set(PlotExport,'Color','w')

%set(PlotExport,'Compression','none','Resolution',300)
%[filename, pathname] = uiputfile('*.*','Save Figure as');
%saveas(PlotExport, [pathname,filename], 'tiff'); %save figure
%print(PlotExport, '-dtiff', '-r300', filename);
%close(gcf); %and close it



function Units_Callback(hObject, eventdata, handles)
% hObject    handle to Units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Units as text
%        str2double(get(hObject,'String')) returns contents of Units as a double


% --- Executes during object creation, after setting all properties.
function Units_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uitoggletool2_OnCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in useall.
function useall_Callback(hObject, eventdata, handles)
% hObject    handle to useall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of useall
%IDGrpVar_Callback(hObject, eventdata, handles)



function Plottitle_Callback(hObject, eventdata, handles)
% hObject    handle to Plottitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Plottitle as text
%        str2double(get(hObject,'String')) returns contents of Plottitle as a double


% --- Executes during object creation, after setting all properties.
function Plottitle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Plottitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tfsize_Callback(hObject, eventdata, handles)
% hObject    handle to tfsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tfsize as text
%        str2double(get(hObject,'String')) returns contents of tfsize as a double


% --- Executes during object creation, after setting all properties.
function tfsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tfsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Font_Callback(hObject, eventdata, handles)
% hObject    handle to Font (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Font as text
%        str2double(get(hObject,'String')) returns contents of Font as a double


% --- Executes during object creation, after setting all properties.
function Font_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Font (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Updateplot.
function Updateplot_Callback(hObject, eventdata, handles)
% hObject    handle to Updateplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CalculateBA_Callback(hObject, eventdata, handles)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text4,'UserData',true);
CalculateBA_Callback(hObject, eventdata, handles)

function hitcallback_ex1(src,evnt)
%Executes when the legend is hit



% --------------------------------------------------------------------
function uitoggletool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
