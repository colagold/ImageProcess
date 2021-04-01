function L=GaussianHighPassFilter(img_input,D0)
I=im2double(img_input);

M=2*size(I,1);     %滤波器的行数

N=2*size(I,2);     %滤波器的列数

u=-M/2:(M/2-1);

v=-N/2:(N/2-1);

[U,V]=meshgrid(u,v);

D=sqrt(U.^2+V.^2);
 

H=1-exp(-(D.^2)./(2*(D0^2)));%设计高斯高通滤波器

J=fftshift(fft2(I,size(H,1),size(H,2)));%时域图像转换到频域

K=J.*H;                      %滤波

L=ifft2(ifftshift(K));       %频域转换到时域图像

L=L(1:size(I,1),1:size(I,2));%改变图像大小  