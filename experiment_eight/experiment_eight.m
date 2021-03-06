rgb_image=imread('LenaRGB.tif');   %读取图像flower.tif
fR=rgb_image(:,:,1);            %获取图像的红色分量
fG=rgb_image(:,:,2);            %获取图像的绿色分量
fB=rgb_image(:,:,3);            %获取图像的蓝色分量
subplot(131);imshow(fR),imwrite(fR,'red.jpg');title('red.jpg');           %分别显示图像
subplot(132);imshow(fG),imwrite(fG,'green.jpg') ;title('green.jpg');
subplot(133);imshow(fB),imwrite(fB,'blue.jpg') ;title('blue.jpg');

%实现rgb图像转化为NTSC彩色空间的图像
yiq_image=rgb2ntsc(rgb_image); 
fY=yiq_image(:,:,1);           %图像的亮度
fI=yiq_image(:,:,2);            %图像的色调
fQ=yiq_image(:,:,3);           %图像的饱和度
figure(2);
subplot(131);imshow(fY);title('图像亮度分量');
subplot(132);imshow(fI);title('图像色调分量');
subplot(133);imshow(fQ);title('图像饱和度分量');

fR=histeq(fR,256);      %对彩色图像的分量进行直方图均衡化
fG=histeq(fG,256);
fB=histeq(fB,256);
RGB_image=cat(3,fR,fG,fB);  %将直方图均衡化后的彩色图像合并
figure(3);
subplot('131');imshow(RGB_image);title('处理后的彩色图色度');   %观察处理后的彩色图色度，亮度参照前面
f1=imread('red.jpg');
f2=imread('green.jpg');      
f3=imread('blue.jpg');
f4=imread('green.jpg');
ture_color=cat(3,f1,f2,f3);

subplot('132');imshow(ture_color);title('合成的彩色图');    %显示由红、绿、蓝三幅图合成的彩色图
false_color=cat(3,f4,f2,f3);    %用G图像代替R分量
subplot('133');imshow(false_color);title('合成的假彩色图');   %显示由绿、绿、蓝三幅图合成的假彩色图

f=imread('LenaRGB.tif');
cut_1=imadjust(f,[0.0925 0.5],[0.0925 0.5]);%提取灰度在16-128之间的像素
cut_2=imadjust(f,[0.5 1],[0.5 1]);         %提取灰度在128-256之间的像素
figure(4)
subplot(121);imshow(cut_1),colormap(hot);title('hot模型彩色化');  %显示图像cut_1,并使用hot模型彩色化
subplot(122);imshow(cut_2),colormap(cool);title('cool模型彩色化'); %显示图像cut_2,并使用cool模型彩色化
