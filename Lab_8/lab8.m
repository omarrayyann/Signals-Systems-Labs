clc; close all; clear;

% Setting up required functions
u = @(n)double(n>=0);
del = @(n)double(n==0);

%% Plotting Coeffeicent An

K = 20;
n = -K:K;
T = 6;
syms xx;
a = @(n)double((1/T)*int(xx*exp((-2*pi*i*n*xx)/(T)),xx,0,2) + (1/T)*int((6-2*xx)*exp((-2*pi*i*n*xx)/(T)),xx,2,3));
figure;                                                                 
plot(n,abs(a(n)));
xlabel("n");
ylabel("An");
title("An");
grid on;

%% x(t) plot

t = linspace(0,10,10000);
x = zeros(size(t));

for i = 1:length(t)
    if mod(t(i), 6) >= 0 && mod(t(i), 6) <= 2
        x(i) = mod(t(i), 6);
    elseif mod(t(i), 6) > 2 && mod(t(i), 6) < 3
        x(i) = 6 - 2 * mod(t(i), 6);
    else
        x(i) = 0;
    end
end

f = figure;
f.Position = [0 100 540 600];
subplot(5,1,1);
plot(t,x);
xlabel("t");
ylabel("x(t)");
title("Actual x(t)");
hold on;
grid on;
hold off;

% K = 2

K = 2;
estimate = zeros(size(t));
for coeff_index = -K:K
   estimate = estimate + (a(coeff_index)*exp(j*2*pi*(coeff_index)*t/T)); 
end

subplot(5,1,2);
plot(t,abs(estimate));
xlabel("t");
ylabel("x(t)");
title("x(t) at K=2");
hold on;
grid on;
hold off;

% K = 10

K = 10;
estimate = zeros(size(t));
for coeff_index = -K:K
   estimate = estimate + (a(coeff_index)*exp(j*2*pi*(coeff_index)*t/T)); 
end


subplot(5,1,3);
plot(t,abs(estimate));
xlabel("t");
ylabel("x(t)");
title("x(t) at K=10");
hold on;
grid on;
hold off;

% K = 15

K = 15;
estimate = zeros(size(t));
for coeff_index = -K:K
   estimate = estimate + (a(coeff_index)*exp(j*2*pi*(coeff_index)*t/T)); 
end

subplot(5,1,4);
plot(t,abs(estimate));

xlabel("t");
ylabel("x(t)");
title("x(t) at K=15");
hold on;
grid on;
hold off;

% K = 25

K = 25;
estimate = zeros(size(t));
for coeff_index = -K:K
   estimate = estimate + (a(coeff_index)*exp(j*2*pi*(coeff_index)*t/T)); 
end

subplot(5,1,5);
plot(t,abs(estimate));

xlabel("t");
ylabel("x(t)");
title("x(t) at K=25");
hold on;
grid on;
hold off;

%% Last Question 
% I tried out different Ks and it seems like afer K=25, the differences in
% the plots become less and less significant. While the plot gets more
% pointy and straighter with even greater Ks, I think 25 is a good place to
% stop as the changes are nto significant by incrementing K by 1 at a time
% at least.