function [H,G,g] = convert(H,F)
H=fftshift(H);
G =F .* H;        %Ƶ���˲�
%����Ҷ���任
g=ifft2(G);
%��ʾ���ȽϽ��
end

