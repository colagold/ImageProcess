I=imread('lena.jpg');
grayImg=rgb2gray(I);
subplot(121);imshow(I);title('原图');
subplot(122);imshow(grayImg);title('灰度图');