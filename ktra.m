function varargout = ktra(varargin)
% KTRA MATLAB code for ktra.fig
%      KTRA, by itself, creates a new KTRA or raises the existing
%      singleton*.
%
%      H = KTRA returns the handle to a new KTRA or the handle to
%      the existing singleton*.
%
%      KTRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KTRA.M with the given input arguments.
%
%      KTRA('Property','Value',...) creates a new KTRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ktra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ktra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ktra

% Last Modified by GUIDE v2.5 03-Jan-2021 20:46:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ktra_OpeningFcn, ...
                   'gui_OutputFcn',  @ktra_OutputFcn, ...
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


% --- Executes just before ktra is made visible.
function ktra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ktra (see VARARGIN)

% Choose default command line output for ktra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ktra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ktra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global HinhAnh

[FileName,PathName] = uigetfile('*.');

fullname=strcat(PathName,FileName);

HinhAnh=imread(fullname);

axes(handles.axes1);

imshow(HinhAnh);


% --- Executes on button press in pushbutton2.
%---------------- LOC TRUNG VI--------------------%
function pushbutton2_Callback(hObject, eventdata, handles)
global img;
global HinhAnh;
img = HinhAnh;
img = im2double(img);
[m n] = size(img);
Med = [];
for i=3:m-2
    for j=3:n-2
       
        
        q=1;
        for g=-2:2
            for l=-2:2
                Med(q) = img(i+l,j+g);
                q = q + 1;
            end
            %q = 1;
        end
        
        
        img(i,j) = median(Med);
%  temp = 0;
%         for k=1:24
%             for h=k+1:25
%                 if(Med(k)<Med(h))
%                     temp = Med(k);
%                     Med(k) = Med(h);
%                     Med(h) = temp;
%                  end
%             end
%         end
%         img(i,j) = Med(13);

    end
end
axes(handles.axes2);
imshow (img);
%% HAM
% A=rgb2gray(HinhAnh);
% 
% A=im2double(A);
% 
% [m n]=size(A);
% 
% Med =[];
% 
% K=medfilt2(A);
% axes(handles.axes2);
% 
%  imshow(K);

% --- Executes on button press in pushbutton3.
%----------------LOC TRUNG BINH --------------%%
function pushbutton3_Callback(hObject, eventdata, handles)
global img;
global HinhAnh;
img = HinhAnh;
img = im2double(img);
[m n] = size(img);
Med = [];
for i=3:m-2
    for j=3:n-2
       
        
        q=1;
        for g=-2:2
            for l=-2:2
                Med(q) = img(i+l,j+g);
                q = q + 1;
            end
            %q = 1;
        end
        sum=0;
        for k=1:25
            sum = sum + Med(k);
        end
        
        img(i,j) = sum/25;
    end
end
axes(handles.axes2);
imshow (img);
% ham 
% A=im2double(HinhAnh);
% 
% [m n]=size(A);
% 
% Med =[];
% 
% H=fspecial('average');
% 
% K=imfilter(A,H,'replicate');
% axes(handles.axes2);
% 
%  imshow(K);

% --- Executes on button press in pushbutton4.
%------------- LOC THONG CAO -----------------%
function pushbutton4_Callback(hObject, eventdata, handles)
global HinhAnh

[m,n] = size(HinhAnh);

b=double(HinhAnh);

w = [1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9];

for i=2:1:m-1

for j=2:1:n-1

r(i,j)=b(i-1,j-1)*w(1)+b(i-1,j)*w(2)+b(i-1,j+1)*w(3)+b(i,j-1)*w(4)+b(i,j)*w(5)+b(i,j+1)*w(6)+b(i+1,j-1)*w(7)+b(i+1,j)*w(8)+b(i+1,j+1)*w(9);

end

end

axes(handles.axes2);

imshow(uint8(r));


% --- Executes on button press in pushbutton5.
%---------------- LOC THONG THAP--------------%%%
function pushbutton5_Callback(hObject, eventdata, handles)
global HinhAnh
[m,n] = size(HinhAnh);

b=double(HinhAnh);

w = [-1/9 -1/9 -1/9;-1/9 -1/9 8/9;-1/9 -1/9 -1/9];

for i=2:1:m-1

for j=2:1:n-1

r(i,j)=b(i-1,j-1)*w(1)+b(i-1,j)*w(2)+b(i-1,j+1)*w(3)+b(i,j-1)*w(4)+b(i,j)*w(5)+b(i,j+1)*w(6)+b(i+1,j-1)*w(7)+b(i+1,j)*w(8)+b(i+1,j+1)*w(9);

end

end

axes(handles.axes2);

imshow(uint8(r));


% --- Executes on button press in pushbutton6.
% -------------------RGB -> HSV----------------%
function pushbutton6_Callback(hObject, eventdata, handles)
global HinhAnh
hsv=rgb2hsv(HinhAnh);


axes(handles.axes2);

imshow(hsv);


% --- Executes on button press in pushbutton7.
%--------------- RGB CHUYEN SANG CMY ---------------%
function pushbutton7_Callback(hObject, eventdata, handles)
global HinhAnh;
global cmy;
img = im2double(HinhAnh);
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

c = 1 - r;
m = 1 - g;
y = 1 - b;
cmy = cat(3,c,m,y);
axes(handles.axes2);
imshow(cmy);


% --- Executes on button press in pushbutton8.
%---------------- CMY CHUYEN SANG RGB ------------%%
function pushbutton8_Callback(hObject, eventdata, handles)
global cmy      

c = cmy(:,:,1);
m = cmy(:,:,2);
y = cmy(:,:,3);

r = 1 - c;
g = 1 - m;
b = 1 - y;
rgb = cat(3,r,g,b);
axes(handles.axes2);
imshow(rgb);


% --- Executes on button press in pushbutton9.
%%------------------- PHAT HIEN BIEN ANH -------------%%%%
function pushbutton9_Callback(hObject, eventdata, handles)
global HinhAnh;
% %code BIEN ANH
% in = HinhAnh;
% A=zeros(3);
% gx=[-1 0 1;-2 0 2;-1 0 1];
% gy=[1 2 1;0 0 0;-1 -2 -1];
% out_matrix=zeros(size(in,1)-2,size(in,2)-2);
% for i=1:size(in,1)
%     for j=1:size(in,2)
%         x=i+2;y=j+2;
%         if(x>size(in,1)||y>size(in,2))
%             continue;
%         else
%             A(1:3,1:3)=in(i:x,j:y);
%             sx=gx*A;
%             sy=gy*A;
%             ssx=sum(sx(:));
%             ssy=sum(sy(:));
%             M=sqrt(ssx^2+ssy^2);
%             out_matrix(i,j)=M;
%         end
%     end
% end
% out=uint8(out_matrix);
% axes(handles.axes2);
% imshow(out);
%ham bien anh
A = rgb2gray(HinhAnh);
Canny = edge(double(A),'canny');
axes(handles.axes2);
imshow(Canny);


% --- Executes on button press in pushbutton10.
                   %--------- CONG PIXEL-------------%%
function pushbutton10_Callback(hObject, eventdata, handles)
global HinhAnh;
cong=imadd(HinhAnh,50);

axes(handles.axes2);

imshow(cong);


% --- Executes on button press in pushbutton11.
%%%------------- TRU PIXEL-------------%%%%%%
function pushbutton11_Callback(hObject, eventdata, handles)
global HinhAnh;
tru=imsubtract(HinhAnh,50);

axes(handles.axes2);

imshow(tru);


% --- Executes on button press in pushbutton12.
%&--------------------- LOC RANK -------------------------%%
function pushbutton12_Callback(hObject, eventdata, handles)
global HinhAnh
gray=rgb2gray(HinhAnh);

rank=ordfilt2(gray,1,ones(3,3));

axes(handles.axes2);

imshow(rank);


% --- Executes on button press in pushbutton13.
%%------------------ CHIA NGUONG ANH ---------------------%%
function pushbutton13_Callback(hObject, eventdata, handles)
global HinhAnh
gray = rgb2gray(HinhAnh);

im2bw1= im2bw(gray,0.5);

figure, imshow(im2bw1);

I=rgb2gray(HinhAnh);

% nguong tu cho

sz=size(I);

bin=zeros(sz);

for i=1:sz(1)

for j=1:sz(2)

if(I(i,j)>100) % 150 co the doi theo de nhe

bin(i,j)=1;

end

end

end

axes(handles.axes2);

imshow(bin);


% --- Executes on button press in pushbutton14.
%%%% ------------ XOI MON ANH - GIAN NO ANH----------%%%%
function pushbutton14_Callback(hObject, eventdata, handles)
global HinhAnh
k=ones(3,3);
% xoi mon
% xoimon=imerode(HinhAnh,k);
% 
% axes(handles.axes2);
% 
% imshow(xoimon);

%Giãn n?

gianno=imdilate(HinhAnh,k);
axes(handles.axes2);
% figure,
imshow(gianno);


% --- Executes on button press in pushbutton15.
%%-------------LOC MAX--------------%%
function pushbutton15_Callback(hObject, eventdata, handles)
global HinhAnh
gray=rgb2gray(HinhAnh);

rank=ordfilt2(gray,9,ones(3,3));

axes(handles.axes2);

imshow(rank);


% --- Executes on button press in pushbutton16.
%----------------LOC MIN -----------------%
function pushbutton16_Callback(hObject, eventdata, handles)
global HinhAnh
gray=rgb2gray(HinhAnh);

rank=ordfilt2(gray,1,ones(3,3));

axes(handles.axes2);

imshow(rank);


% --- Executes on button press in pushbutton17.
%% ----------------------- ANH AM BAN--------------%%%
function pushbutton17_Callback(hObject, eventdata, handles)
global HinhAnh
amban=imcomplement(HinhAnh);

axes(handles.axes2);

imshow(amban);

img=255-HinhAnh;

axes(handles.axes2);

imshow(img);

% --- Executes on button press in pushbutton18.
% ----------------- Anh mau sang anh xam--------------%%
function pushbutton18_Callback(hObject, eventdata, handles)
global HinhAnh
gray=rgb2gray(HinhAnh);

axes(handles.axes2);

imshow(gray);
