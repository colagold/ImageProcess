function [U,V] = dftuv( M,N )
%DFTUV computes meshgrid frequency matrices
%set up range of variables
u=0:(M-1);
v=0:(N-1);
%compute the indices for use in meshgrid
idx=find(u > M/2);
u(idx)=u(idx)-M;
idy=find(v > N/2);
v(idy)=v(idy)-N;
%compute the meshgrid arrays
[V,U]=meshgrid(v,u);
end
