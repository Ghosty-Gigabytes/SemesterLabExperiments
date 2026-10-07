% Basic signals; plots follow the order in x and y.
t = (-20000:40000)*1e-4;
x = {(t>=0 & t<0.0499)/0.05, double(t>=0), t.*(t>=0), ...
     exp(0.5*t).*(t>=0), double(abs(t)<=0.5)};
figure;
for i = 1:5
    subplot(3,2,i); plot(t,x{i});
end
t = (0:2999)*1e-5;
w = 100*t;
saw = 2*(w-floor(w+1e-9))-1;
y = {sin(2*pi*w), 2*(mod(floor(2*w+1e-9),2)==0)-1, saw, 2*abs(saw)-1};
figure;
for i = 1:4
    subplot(2,2,i); plot(t,y{i});
end
