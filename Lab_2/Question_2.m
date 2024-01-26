clc; clear; close all; 
set(0,'defaultTextInterpreter','latex');

%% Question 2: Plotting Discrete-Time Signals

% Setting up needed functions
u = @(n)double(n>=0);
del = @(n)double(n==0);

figure;
n = -10:10;
f = n>=0;
stem(n,f);title('$Unit Step Fuction$');
xlabel('n');
ylabel('f(n)');
grid on

% First Plot: f(n) = u(n)-u(n-4)
figure;
n = -3:6;
f = u(n)-u(n-4);
stem(n,f), title('$f(n) = u(n)-u(n-4)$');
xlabel('n');
ylabel('f(n)');
grid on

% Second Plot: g(n) = n*u(n)-2(n-4)*u(n-4)+(n-8)*u(n-8)
figure;
n = 0:10;
g = n.*u(n)-2*(n-4).*u(n-4)+(n-8).*u(n-8);
stem(n,g), title('$g(n) = n*u(n)-2(n-4)*u(n-4)+(n-8)*u(n-8)$');
xlabel('n');
ylabel('g(n)');
grid on

% Third Plot: x(n) = impulse(n)-2implse(n-4)
figure;
n = -1:5;
x = del(n)- 2*del(n-4);
stem(n,x), title('$x(n) = impulse(n)-2implse(n-4)$');
xlabel('n');
ylabel('x(n)');
grid on

% Fourth Plot: y(n) = (0.9^n)(u(n)-u(n-20))
figure;
n = 0:20;
y = (0.9.^n).*(u(n)-u(n-20));
stem(n,y), title('$y(n) = (0.9^n)*(u(n)-u(n-20))$');
xlabel('n');
ylabel('y(n)');
grid on

% Fifth Plot: v(n) = cos(0.12pin)u(n)
figure;
n = 0:100;
v = cos(0.12*pi*n) .* u(n);
stem(n,v), title('$v(n) = cos(0.12pin)u(n)$');
xlabel('n');
ylabel('v(n)');
grid on
