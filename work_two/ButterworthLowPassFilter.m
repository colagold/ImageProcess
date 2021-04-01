function filter_img = ButterworthLowPassFilter(input_img,D0)
%--巴特沃斯低通滤波器
n=5;
I = input_img;
I = im2double(I);
N = 2*size(I,1);
M = 2*size(I,2);
u = -M/2:(M/2-1);
v = -N/2:(N/2-1);
[U,V] = meshgrid(u,v);
D = sqrt(U.^2 + V.^2);
D0 = D0;

n = n;
H2 = 1./(1+(D./D0).^(2*n));
J2 = fftshift(fft2(I,size(H2,1),size(H2,2))); %转换到频域图像
K2 = J2.*H2;
L2 = ifft2(ifftshift(K2));
L2 = L2(1:size(I,1),1:size(I,2));
filter_img = uint8(L2*255);
end
