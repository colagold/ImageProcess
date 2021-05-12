clc;
clear;
img=imread('Goldhill.bmp');
J=imnoise(img,'gauss',0.02);
ave1=fspecial('average',3);              %产生3×3的均值模版
ave2=fspecial('average',5);              %产生5×5的均值模版
K = filter2(ave1,J)/255;                 %均值滤波3×3
L = filter2(ave2,J)/255;                 %均值滤波5×5
M = medfilt2(J,[3 3]);                  %中值滤波3×3模板
N = medfilt2(J,[4 4]);                   %中值滤波4×4模板
subplot(231);imshow(img);title('原图');
subplot(232);imshow(J);title('添加高斯噪声');
subplot(233);imshow(K);title('3×3均值滤波');
subplot(234);imshow(L);title('5×5均值滤波');
subplot(235);imshow(M);title('3×3中值滤波');
subplot(236);imshow(N);title('5×5中值滤波');
