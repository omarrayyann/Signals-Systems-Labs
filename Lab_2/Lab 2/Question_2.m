% Question 2: Plotting Discrete-Time Signals
n = -10:10;
f = n>=0;
stem(n,f);
% First Plot: f(n) = u(n)-u(n-4)
n = -3:6;
f = (n>=0) - (n>=4);
figure, stem(n,f), title('f(n) = u(n)-u(n-4)');
% Second Plot: g(n) = n*u(n)-2(n-4)*u(n-4)+(n-8)*u(n-8)
n = 0:10;
g = n.*(n>=0)-2*(n-4).*(n>=4)+(n-8).*(n>=8);
figure, stem(n,g), title('g(n) = n*u(n)-2(n-4)*u(n-4)+(n-8)*u(n-8)');
% Third Plot: x(n) = impulse(n)-2implse(n-4)
n = -1:5;
x = (n==0)+ 2*(n==4)
figure, stem(n,x), title('x(n) = impulse(n)-2implse(n-4)');
% Fourth Plot: y(n) = (0.9^n)(u(n)-u(n-20))
n = 0:20;
y = (0.9.^n).*((n>=0) - (n>=20))
figure, stem(n,y), title('y(n) = (0.9^n)(u(n)-u(n-20))');
% Fifth Plot: v(n) = cos(0.12pin)u(n)
n = 0:(2/0.12);
v = cos(0.12*pi*n) .* (n>=0)
figure, stem(n,v), title('v(n) = cos(0.12pin)u(n)');
