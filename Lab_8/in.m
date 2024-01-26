clc; close all; clear;

% Setting up required functions
u = @(n)double(n>=0);
del = @(n)double(n==0);
ramp = @(n)double(n.*(n>=0));

t = -40:0.01:40;

x = -t .* u(-t);
h = u(t).*exp(-3*t);

anss = conv(x,h);

t2 = -80:0.01:80;
my_answer = (1/3)*ramp(-t2) + (1/9)*exp(3*t2).*u(-t2) - (1/9)*u(-t2);

ms_answer = u(-t2).*((1/9) - (t2/3)) + u(t2).*((1/9)*exp(-3*t2));

figure;
subplot(3,1,1);
plot(t2,anss);
xlim([-200,200])
title("Matlab Answer")
subplot(3,1,2);
plot(t2,my_answer);
title("My Answer")
xlim([-200,200])
subplot(3,1,3);
plot(t2,ms_answer);
title("Markscheme Answer")
xlim([-200,200])

