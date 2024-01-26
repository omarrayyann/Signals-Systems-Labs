clc; close all; clear;

% Setting up required functions
u = @(n)double(n>=0);
del = @(n)double(n==0);

%% QUESTION 1

% a) Transfer Function H(z):
% H(z) = 1/(-1+3.5z^-1-1.5z^-2)
% ROC: |0.5| < z < |3|

b = [1];
a = [-1,3.5,-1.5];

[H, w] = freqz(b,a);

figure;
subplot(2,1,1);
plot(w,abs(H));
xlabel("w");
ylabel("|H(z)|");
title("Amplitude");
grid on;

subplot(2,1,2);
plot(w,angle(H));
xlabel("w");
ylabel("|Angle(H(z))|");
title("Phase Angle");
grid on;

% Impulse Response: 0.2*0.5^nu(n) + 1.2*3^nu(-n-1)
% Derivation: https://drive.google.com/file/d/1bgMN640S_4OW6PIggLRphnLC7_SCfPdP/view?usp=drivesdk

n = -10:10;
h = 0.2*(0.5.^n).*u(n) + 1.2*(3.^n).*u(-n-1);

figure;
stem(n,h);
grid on;
ylabel("h[n]");
xlabel("n");
title("Impulse Response");

% Stable Inverse Response (Frequency Domain)

b = [-1,3.5,-1.5];
a = [1];

[G, w] = freqz(b,a);

figure;
subplot(2,1,1);
plot(w,abs(G));
xlabel("w");
ylabel("|G(z)|");
title("Amplitude");
grid on;

subplot(2,1,2);
plot(w,angle(H));
xlabel("w");
ylabel("|Angle(G(z))|");
title("Phase Angle");
grid on;

% Stable Inverse Response (Time Domain)

n = -10:10;
g = -1.5*del(n-2)+3.5*del(n-1)-del(n);

figure;
stem(n,h);
grid on;
ylabel("h[n]");
xlabel("n");
title("Inverse Impulse Response");

% Check H(z)*G(z) = 1 ?

HG = H.*G;

figure;
plot(w,abs(HG));
xlabel("w");
ylabel("|G(z)|");
title("Amplitude");
grid on;

% Yes, = 1

% Check h(n) convolve g(n) ?

n = -20:20;
hg = conv(h,g);

figure;
stem(n,hg);
ylabel("hg[n]");
xlabel("n");
title("Inverse Impulse Response");

% Yes, = direct delta

%% QUESTION 2

% Inverse (freq domain)

b = [1,-2.5,1];
a = [1,-1,0.7];

[H,w] = freqz(b,a);

figure;
subplot(2,1,1);
plot(w,abs(H));
xlabel("w");
ylabel("|H(z)|");
title("Amplitude");
grid on;

subplot(2,1,2);
plot(w,angle(H));
xlabel("w");
ylabel("|Angle(H(z))|");
title("Phase Angle");
grid on;

b = [1,-1,0.7];
a = [1,-2.5,1];

[G,w] = freqz(b,a);

figure;
subplot(2,1,1);
plot(w,abs(G));
xlabel("w");
ylabel("|G(z)|");
title("Inverse - Amplitude");
grid on;

subplot(2,1,2);
plot(w,angle(G));
xlabel("w");
ylabel("|Angle(G(z))|");
title("Inverse - Phase Angle");
grid on;

% checking H(w)G(w)

HG = H.*G;
figure;
plot(w,abs(HG));
xlabel("w");
ylabel("|HG(z)|");
title("HG - Amplitude");
grid on;

% equal one!

%% Inverse (time domain)

b = [1,-1,0.7];
a = [1,-2.5,1];
    
[r,p,k] = residuez(b,a)

n = -20:20;

g = k*del(n) + r(1).*((-p(1)).^n).*u(-n-1) + r(2).*((p(2)).^n).*u(n);

figure;
stem(n,g);
grid on;
ylabel("g[n]");
xlabel("n");
title("Impulse Response");

b = [1,-2.5,1];
a = [1,-1,0.7];

[r,p,k] = residuez(b,a);

h = k*del(n) + r(1).*(-(p(1)).^n).*u(n) + r(2).*(-(p(2)).^n).*u(n);

figure;
stem(n,h);
grid on;
ylabel("h[n]");
xlabel("n");
title("Impulse Response");

hg = conv(h,g);
n = -40:40;
figure;
stem(n,hg);
grid on;
ylabel("hg[n]");
xlabel("n");
title("Impulse Response");

% e: yes

