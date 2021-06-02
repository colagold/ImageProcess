function [H,D] = lpfilter( type,M,N,D0,n)
%lpfilter computes frequency domin lowpass filters
%H creates the transfer function of a lowpass filter
%use function dftuv to set up the meshgrid arrays needed for computing 
%the required distances
[U,V]=dftuv(M,N);
D=sqrt(U.^2+V.^2);
%begin filter computations
switch type
    case 'ideal'
        H=double(D<=D0);
    case 'btw'
        if nargin ==4
            n=1;
        end
        H=1./(1+(D./D0).^(2*n));
    case 'gaussian'
        H=exp(-(D.^2)./(2*(D0^2)));
    otherwise
        error('unknown filter type')  
end        
end
