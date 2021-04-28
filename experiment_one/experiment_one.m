clear;
clc;
close all;
img=imread('flower.png');
grayImg=rgb2gray(img);
%图像二值化
img_2=im2bw(img,0.5);
%图片另存为
imwrite(img,'flower_jpg.jpg','quality',80);%另存为jpg文件,压缩50%
imwrite(img,'flower.bmp');%另存为bmp文件
img_jpg=imread('flower_jpg.jpg');

%提取该读入图像的基本信息，在命令行展示
whos img
%来获取图像文件的压缩，颜色等等其他的详细信息,在命令行展示
imfinfo('flower.png')

%读取lenna.jpg以及cammema.jpg
lenna_img=imread('lenna.jpg');
camema_img=imread('camema.jpg');
%用imfinfo()获取图像Lenna.jpg和camema.jpg 的大小；
lenna_info=imfinfo('lenna.jpg');
camema_info=imfinfo('camema.jpg');
lenna_info.FileSize
camema_info.FileSize

subplot(331);imshow(img);title('原图');
subplot(332);imshow(grayImg);title('灰度图');
subplot(333);imshow(img_jpg);title('压缩80%');
subplot(334);imshow(img_2);title('二值化图像');
subplot(335);imshow(lenna_img);title('Lenna');
subplot(336);imshow(camema_img);title('camema');
