clear;clc;close all;
% baboon_gray=imread('Baboon.tif');
% baboon_rgb=imread('BaboonRGB.tif');
baboon_gray=imread('Baboon.tif');
baboon_rgb=imread('BaboonRGB.tif');
peppers_gray=imread('Peppers.tif');
peppers_rgb=imread('PeppersRGB.tif');

%图像加法
lp_add_img_1 = imadd(baboon_rgb,peppers_rgb);%彩色加彩色
% lp_add_img_2 = imadd(lena_gray,peppers_rgb);%灰色加彩色,无法运算
% lp_add_img_3 = imadd(lena_rgb,peppers_gray);%彩色加灰色，无法运算
lp_add_img_2 = imadd(baboon_gray,peppers_gray);%灰色加灰色
%灰度图像处理
lena_gray_img_1=imadd(baboon_gray,50);%使图像的亮度增加,值可以取负数
lena_gray_img_3 = imsubtract(baboon_gray,50);%使图像的亮度降低
%图像的乘法运算
img_multi=immultiply(baboon_gray,1.5);
%图像除法
Ip = imdivide(baboon_gray, peppers_gray);
%四则运算
Z = imlincomb(0.5,baboon_gray,0.8,peppers_gray,1);

%图像展示
subplot(331);imshow(lp_add_img_1);title('baboonRGB ADD PeppersRGB');
subplot(332);imshow(lp_add_img_2);title('baboon ADD Peppers');
subplot(333);imshow(lena_gray_img_1);title('baboon add 50');
subplot(334);imshow(lena_gray_img_3);title('baboon sub 50');
subplot(335);imshow(baboon_gray);title('原图');
subplot(336);imshow(img_multi);title('baboon multi 1.5');
subplot(337);imshow(Ip);title('baboon divide Peppers');
subplot(338);imshow(Z);title('四则运算');
