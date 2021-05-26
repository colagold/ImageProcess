function H = hpfilter( type,M,N,D0,n )
%hpfilter computes frequency domin highpass filters
%H creates the transfer function of a highpass filter
%the transfer function Hhp of a highpass filter is 1-Hlp
%we can use function lpfilter to generate highpass filters.
if nargin==4
    n=1; 
end
%generate highpass filter.
hlp=lpfilter(type,M,N,D0,n);
H=1-hlp;
end
