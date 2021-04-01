function L=ButterworthHighPassFilter(img_input,D0)
%D0截止频率
I=im2double(img_input);
               
M=2*size(I,1);                   %滤波器的行数

N=2*size(I,2);                   %滤波器的列数

u=-M/2:(M/2-1);

v=-N/2:(N/2-1);

[U,V]=meshgrid(u,v);

D=sqrt(U.^2+V.^2);

n=6;                             %巴特沃斯滤波器的阶数

H=1./(1+(D0./D).^(2*n));         %设计滤波器

J=fftshift(fft2(I,size(H,1),size(H,2)));%时域图像转换为频域

K=J.*H;                            %滤波

L=ifft2(ifftshift(K));             %频域图像转换为时域

L=L(1:size(I,1),1:size(I,2));      %调整大小