clc;clear;
I=imread('lena.tiff');
%��ɫͼƬת��Ϊ�Ҷ�ͼ��
grayImg=rgb2gray(I);
%ͼƬ���·�ת,���ڻҶ�ͼ��ת��RGBͼ��ת��Ϊ����ͼƬ��
upToDownImg=grayImg(end:-1:1,:);
%ͼƬ���ҷ�ת
rightToLeftImg=grayImg(:,end:-1:1);
%��ֵ��ͼ��im2bw(img,LEVEL);0<LEVEL<1;
I2=im2bw(I,0.5);
%��ӽ�������
J = imnoise(grayImg,'salt & pepper',0.02);
% Wiener �˲����������ڻҶ�ͼ
K = wiener2(J,[5 5]);
%ƽ��ֵ�˲����Ҷ�ͼ
Kaverage = filter2(fspecial('average',3),J)/255;
%https://ww2.mathworks.cn/help/images/contrast-enhancement-techniques.html
%�Աȶ���ǿ
grayimadjust = imadjust(grayImg);
%��չ
%ʹ��ä������㷨��ͼ�����ȥģ��
%https://ww2.mathworks.cn/help/images/deblurring-images-using-the-blind-deconvolution-algorithm.html
%��ǿ��Ƶķ�ˮ��ָ�
%https://ww2.mathworks.cn/help/images/marker-controlled-watershed-segmentation.html

%ͼƬչʾ
subplot(331);imshow(I);title('ԭͼ');
subplot(332);imshow(grayImg);title('�Ҷ�ͼ');
subplot(333);imshow(upToDownImg);title('���·�ת');
subplot(334);imshow(I2);title('��ֵ��');
subplot(335);imshow(rightToLeftImg);title('���ҷ�ת');
subplot(336);imshow(J);title('��������');
subplot(337);imshow(K);title('Wiener�˲�');
subplot(338);imshow(Kaverage);title('ƽ��ֵ�˲�');
subplot(339);imshow(grayimadjust);title('�Աȶ���ǿ');