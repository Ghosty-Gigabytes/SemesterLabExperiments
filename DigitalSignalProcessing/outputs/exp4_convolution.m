% yl: linear; yc: N-point circular; yf: circular with full linear length.
x = input('x = ');
h = input('h = ');
N = input('N = ');
L = length(x)+length(h)-1;
yl = conv(x,h)
yc = cconv(x,h,N)
yf = cconv(x,h,L)
S = {x,h,yl,yc};
figure;
for i = 1:4
    subplot(2,2,i); stem(0:length(S{i})-1,S{i});
end
