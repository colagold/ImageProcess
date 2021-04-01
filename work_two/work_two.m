img=imread('lena.tiff');
gray_img=rgb2gray(img);
noise_img=imnoise(gray_img,'gaussian',0,0.005);%灰度图添加高斯噪声
rgb_noise_img=imnoise(img,'gaussian',0,0.005);%RGB图添加高斯噪声

%空间域
% 空间锐化滤波的图像增强方法：
%     1、拉普拉斯算子锐化法
double_img=im2double(gray_img); %将f转换归一化的double类图像
w=fspecial('laplacian',0);%构建算子
laplacian_img=imfilter(img,w,'replicate');%处理图像,得到边缘轮廓
strengthen_img=gray_img-laplacian_img;

%图像平滑、降噪：均值滤波,中值滤波
% Wiener 滤波器;去噪滤波
wiener_img = wiener2(noise_img,[5 5]);

%频率域
%噪声消除-频率域低通滤波:1巴特沃斯低通滤波器、2高斯低通滤波器
gauss_low_img=GaussianLowPassFilter(noise_img,50);%高斯低通滤波器
butter_low_img=ButterworthLowPassFilter(noise_img,50);%巴特沃斯低通滤波器

%图像增强-频率域高通滤波 1巴特沃斯高通滤波器、2高斯高通滤波器、3拉普拉斯算子
gauss_high_img=GaussianHighPassFilter(gray_img,50);
gauss_strengthen_img=im2double(gray_img)+gauss_high_img;
butter_high_img=ButterworthHighPassFilter(gray_img,50);

%图像显示
subplot(3,3,1);imshow(gray_img);title('灰度图');
subplot(3,3,2);imshow(noise_img);title('高斯噪声灰度图');
subplot(3,3,3);imshow(laplacian_img);title('拉普拉斯锐化');
subplot(3,3,4);imshow(wiener_img);title('wiener滤波降噪');
subplot(3,3,5);imshow(gauss_low_img);title('高斯低通滤波降噪(D=50)');
subplot(3,3,6);imshow(butter_low_img);title('巴特沃斯低通滤波降噪(D=50)');
subplot(3,3,7);imshow(butter_high_img);title('巴特沃斯高通滤波增强(D=50)');
subplot(3,3,8);imshow(gauss_high_img);title('高斯高通滤波增强(D=50)');
subplot(3,3,9);imshow(gauss_strengthen_img);title('高斯高通滤波增强合成');