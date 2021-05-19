I=imread('Peppers.tif');   %读入原图像文件
imshow(I);title('原图像');               %显示原图像
fftI=fft2(I);                %二维离散傅立叶变换
sfftI=fftshift(fftI);           %直流分量移到频谱中心
%取傅立叶变换的实部
RR=real(sfftI);
%取傅立叶变换的虚部
II=imag(sfftI);             
A=sqrt(RR.^2+II.^2);       %计算频谱幅值
A=(A-min(min(A)))/(max(max(A))-min(min(A)))*225;    %归一化
figure;                   %设定窗口
imshow(A);title('原图像的归一化频谱');               %显示原图像的归一化频谱

margin=log(abs(sfftI));      %图像幅度谱，加log便于显示
phase=log(angle(sfftI));     %图像相位谱
l=log(sfftI);           
figure(3)
subplot(2,2,1),imshow(I),title('原图像');
subplot(2,2,2),imshow(l,[]),title('图像频谱');
subplot(2,2,3),imshow(margin,[]),title('图像幅度谱');
subplot(2,2,4),imshow(phase,[]),title('图像相位谱');

margin=abs(fftI);      %图像幅度谱，加log便于显示
phase=angle(fftI);     %图像相位谱
I1=ifft2(margin);
I2=ifft2(exp(j*phase));
figure(4)
subplot(1,3,1),imshow(I),title('原图像');
subplot(1,3,2),imshow(log(1+abs(I1)),[]),title('图像幅度谱恢复');
subplot(1,3,3),imshow(I2,[]),title('图像相位谱恢复');

M=ifft2(abs(fftI).*exp(j*angle(fftI))); %利用幅度和相位恢复原图像
figure(4)
imshow(M,[]);title('恢复图像');
