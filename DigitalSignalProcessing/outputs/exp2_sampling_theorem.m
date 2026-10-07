% Rows of results: [sampling frequency, apparent frequency, MSE].
fm = 50;
t = 0:1/20000:0.2;
x = cos(2*pi*fm*t);
fs = [500 100 60];
mid = t>=0.05 & t<=0.15;
figure;
subplot(2,2,1); plot(t,x);
for i = 1:3
    Ts = 1/fs(i);
    n = 0:floor(0.2/Ts);
    xs = cos(2*pi*fm*n*Ts);
    xr = xs*sinc((t-n'*Ts)/Ts);
    results(i,:) = [fs(i), abs(fm-round(fm/fs(i))*fs(i)), mean((x(mid)-xr(mid)).^2)];
    subplot(2,2,i+1); plot(t,x,t,xr); hold on;
    stem(n*Ts,xs); hold off;
end
results
