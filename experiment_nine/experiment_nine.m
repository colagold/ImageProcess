f=imread('coin.jpg');
f=rgb2gray(f);
[gv,t1]=edge(f,'sobel','vertical');%使用edge函数对图像f提取垂直的边缘
figure(1),imshow(gv);title('sobel vertical');
[gb,t2]=edge(f,'sobel','horizontal');%使用edge函数对图像f提取水平的边缘
figure(2),imshow(gb);title('sobel horizontal');
w45=[-2 -1 0;-1 0 1;0 1 2];%指定模版使用imfilter计算45度方向的边缘
g45=imfilter(double(f),w45,'replicate');
T=0.3*max(abs(g45(:)));  %设定阈值
g45=g45>=T;           %进行阈值处理
figure(3),imshow(g45);title('45度方向的边缘');


%%读取并显示灰度图像
I = imread('coin.jpg');%读取图像
I=rgb2gray(I);
figure,imshow(I)%显示图像
title('Original Image')%添加标签
%%指定关注对象周围的初始轮廓。显示该轮廓
mask = zeros(size(I));%初始化一个与I图像一样大小的值都为0的图像mask
%mask(Y1:Y2,X1:X2),(X1,Y1)为矩形左上角，（X1，Y2）为矩形右下角
mask(25:end-25,25:end-25) = 1;%调整mask区域，x轴为（25~X_max_size-25),y轴为（25~Y_max_size-25)的区域赋值为1（纯白)
figure,imshow(mask)%显示mask图像
title('Initial Contour Location')%添加标签
%%使用默认方法的300次迭代对图像进行分割
bw = activecontour(I,mask,300);%调用activecontour函数
figure, imshow(bw);%显示分割图像
title('Segmented Image');%添加标签

