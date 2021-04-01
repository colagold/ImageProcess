function [g] =GaussianLowPassFilter (image_input , D0)
%GULS 高斯低通滤波器,D0为截至频率的（相当于设置在傅里叶谱图的半径值）
%判断图像是否为灰度图，不是灰度图的话，将图像变为灰度图
f = image_input;
f = mat2gray(f,[0 255]);
% 1.给定一幅大小为M*N的输入图像f(x,y),得到填充参数P = 2M,Q = 2N
[m,n] = size(f);
P = 2 * m;
Q = 2 * n; 
% 2.对f(x,y)添加必要数量的0，形成大小为P * Q的填充后的图像fp(x,y)
fp = zeros(P,Q);
fp(1:m,1:n) = f(1:m,1:n);
% 3.用(-1)^(x+y)乘以fp(x,y)移到其交换的中心
for i = 1 : m
    for j = 1 : n 
        fp(i,j) = double(fp(i,j)*(-1)^(i+j));
    end
end
% 4.计算来自步骤3的图像的DFT，得到F(u,v)
F = fft2(fp,P,Q);
% 5.生成一个实的、对称的滤波函数H(u,v),其大小为P*Q，中心在（P/2,Q/2）处。
% 用阵列相乘形成乘积G(u,v) = H(u,v)F(u,v);即G(i,k)=H(i,k)F(i,k)
H = zeros(P,Q);
a = 2 * D0^2;
for u = 1 :P
    for v = 1:Q
        D = (u-(m+1.0))^2+(v-(n+1.0))^2;
        H(u,v) = exp((-D)/a);
    end
end
G = H.*F;
% 6.得到处理后的图像
gp = ifft2(G); 
gp = real(gp);
for i = 1 : m
    for j = 1 : n 
        gp(i,j) = double(gp(i,j)*(-1)^(i+j));
    end
end
% 7.通过从gp(x,y)的左上象限提取M*N区域，得到最终处理结果g(x,y)
g(1:m,1:n) = gp(1:m,1:n);
