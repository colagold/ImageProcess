function [H,G,g] = convert(H,F)
H=fftshift(H);
G =F .* H;        %频域滤波
%傅里叶反变换
g=ifft2(G);
%显示并比较结果
end

