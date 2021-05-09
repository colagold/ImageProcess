f=imread('Lenna.jpg');
figure
imhist(f,256);    %显示其直方图
g1=imadjust(f,[0 1],[1 0]);    %灰度转换，实现明暗转换(负片图像)
figure,imshow(g1);title('亮度增强');

%将0.5到0.75的灰度级扩展到范围[0 1]
g2=imadjust(f,[0.5 0.75],[0 1]);
figure,imshow(g2);title('亮度减弱');

J=imadjust(f,[0.1 0.5],[0 1],0.4);  %调整图像灰度并调高亮度
K=imadjust(f,[0.1 0.5],[0 1],4);  %调整图像灰度并调低亮度
figure,
subplot(131),imshow(uint8(f));
subplot(132),imshow(uint8(J));
subplot(133),imshow(uint8(K));

%通过函数stretchlim（）和imadjust（）进行图像增强
%I=imread('Lenna.jpg');
I=imread('point.jpg');
M=stretchlim(I);  %获取最佳区间
J=imadjust(I,M,[]);  %调整灰度范围
figure,
subplot(121),imshow(uint8(I));
subplot(122);imshow(uint8(J));

g=imread('point.jpg');
h=log(1+double(g));           %对输入图像对数映射变换
h=mat2gray(h);               %将矩阵h转换为灰度图片
h=im2uint8(h);               %将灰度图转换为8位图
figure,imshow(h)
