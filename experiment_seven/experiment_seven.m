clear all;
I=imread('Goldhill.tif'); %读入原图像
F=fft2(double(I));   %快速傅里叶变换
F=fftshift(F);       %图像零频点移动到频谱图中心

[M,N]=size(F);       %计算矩阵F的大小
%调用低通滤波器函数
low_H1=lpfilter('ideal',M,N,40);   %理想
low_H2=lpfilter('btw',M,N,40);     %巴特沃兹
low_H3=lpfilter('gaussian',M,N,40);%高斯

%调用高通滤波器函数
high_H1=hpfilter('ideal',M,N,40);    %理想
high_H2=hpfilter('btw',M,N,40);      %巴特沃兹
high_H3=hpfilter('gaussian',M,N,40); %高斯

% H=fftshift(H);
% G =F .* H;        %频域滤波
% %傅里叶反变换
% g=ifft2(G);
% %显示并比较结果

figure
%%理想低通滤波%%
[H,G,g]=convert(low_H1,F);
subplot(3,5,1),imshow(I);  title('显示原图像');
subplot(3,5,2),imshow(log(1+abs(F)),[]);  title('傅立叶变换后的频谱图');
subplot(3,5,3),imshow(H,[]);title('理想低通滤波器频域图像');
%title('高通滤波器频域图像');
subplot(3,5,4),imshow(log(1+abs(G)),[]);title('理想低通滤波器的频谱图');
%title('高通滤波器处理后的频谱图');
subplot(3,5,5),imshow(abs(real(g)),[]);title('傅里叶反变换后图像');

%%巴特沃兹低通滤波%%
[H,G,g]=convert(low_H2,F);
subplot(3,5,6),imshow(I);  title('显示原图像');
subplot(3,5,7),imshow(log(1+abs(F)),[]);  title('傅立叶变换后的频谱图');
subplot(3,5,8),imshow(H,[]);title('巴特沃兹低通滤波器频域图像');
%title('高通滤波器频域图像');
subplot(3,5,9),imshow(log(1+abs(G)),[]);title('巴特沃兹低通滤波器的频谱图');
%title('高通滤波器处理后的频谱图');
subplot(3,5,10),imshow(abs(real(g)),[]);title('傅里叶反变换后图像');

%%高斯低通滤波%%
[H,G,g]=convert(low_H3,F);
subplot(3,5,11),imshow(I);  title('显示原图像');
subplot(3,5,12),imshow(log(1+abs(F)),[]);  title('傅立叶变换后的频谱图');
subplot(3,5,13),imshow(H,[]);title('高斯低通滤波器频域图像');
%title('高通滤波器频域图像');
subplot(3,5,14),imshow(log(1+abs(G)),[]);title('高斯低通滤波器处理后的频谱图');
%title('高通滤波器处理后的频谱图');
subplot(3,5,15),imshow(abs(real(g)),[]);title('傅里叶反变换后的图像');



figure
%%理想滤波%%
[H,G,g]=convert(high_H1,F);
subplot(3,5,1),imshow(I);  title('显示原图像');
subplot(3,5,2),imshow(log(1+abs(F)),[]);  title('傅立叶变换后的频谱图');
subplot(3,5,3),imshow(H,[]);title('理想高通滤波器频域图像');
%title('高通滤波器频域图像');
subplot(3,5,4),imshow(log(1+abs(G)),[]);title('理想高通滤波器的频谱图');
%title('高通滤波器处理后的频谱图');
subplot(3,5,5),imshow(abs(real(g)),[]);title('傅里叶反变换后图像');

%%巴特沃兹低通滤波%%
[H,G,g]=convert(high_H2,F);
subplot(3,5,6),imshow(I);  title('显示原图像');
subplot(3,5,7),imshow(log(1+abs(F)),[]);  title('傅立叶变换后的频谱图');
subplot(3,5,8),imshow(H,[]);title('巴特沃兹高通滤波器频域图像');
%title('高通滤波器频域图像');
subplot(3,5,9),imshow(log(1+abs(G)),[]);title('巴特沃兹高通滤波器的频谱图');
%title('高通滤波器处理后的频谱图');
subplot(3,5,10),imshow(abs(real(g)),[]);title('傅里叶反变换后图像');

%%高斯低通滤波%%
[H,G,g]=convert(high_H3,F);
subplot(3,5,11),imshow(I);  title('显示原图像');
subplot(3,5,12),imshow(log(1+abs(F)),[]);  title('傅立叶变换后的频谱图');
subplot(3,5,13),imshow(H,[]);title('高斯高通滤波器频域图像');
%title('高通滤波器频域图像');
subplot(3,5,14),imshow(log(1+abs(G)),[]);title('高斯高通滤波器处理后的频谱图');
%title('高通滤波器处理后的频谱图');
subplot(3,5,15),imshow(abs(real(g)),[]);title('傅里叶反变换后的图像');