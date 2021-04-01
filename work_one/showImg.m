clc;clear;
I=imread('lena.tiff');
%彩色图片转化为灰度图像
grayImg=rgb2gray(I);
%图片上下翻转,用于灰度图像翻转，RGB图像翻转则为三张图片。
upToDownImg=grayImg(end:-1:1,:);
%图片左右翻转
rightToLeftImg=grayImg(:,end:-1:1);
%二值化图像，im2bw(img,LEVEL);0<LEVEL<1;
I2=im2bw(I,0.5);
%添加椒盐噪声
J = imnoise(grayImg,'salt & pepper',0.02);
% Wiener 滤波器，作用于灰度图
K = wiener2(J,[5 5]);
%平均值滤波，灰度图
Kaverage = filter2(fspecial('average',3),J)/255;
%https://ww2.mathworks.cn/help/images/contrast-enhancement-techniques.html
%对比度增强
grayimadjust = imadjust(grayImg);
%扩展
%使用盲反卷积算法对图像进行去模糊
%https://ww2.mathworks.cn/help/images/deblurring-images-using-the-blind-deconvolution-algorithm.html
%标记控制的分水岭分割
%https://ww2.mathworks.cn/help/images/marker-controlled-watershed-segmentation.html

%图片展示
subplot(331);imshow(I);title('原图');
subplot(332);imshow(grayImg);title('灰度图');
subplot(333);imshow(upToDownImg);title('上下翻转');
subplot(334);imshow(I2);title('二值化');
subplot(335);imshow(rightToLeftImg);title('左右翻转');
subplot(336);imshow(J);title('椒盐噪声');
subplot(337);imshow(K);title('Wiener滤波');
subplot(338);imshow(Kaverage);title('平均值滤波');
subplot(339);imshow(grayimadjust);title('对比度增强');