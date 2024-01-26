clc; close all; clear;

% Setting up required functions
u = @(n)double(n>=0);
del = @(n)double(n==0);

%% Part 1: Plot each of the following Fourier transform pairs

t = linspace(0,10,500);
w = linspace(-10,10,500);
alpha = 1;
sigma = 1;
t0 = 1;

% y = exp(-alpha*t).*u(t);x

figure;
subplot(3,1,1);
y = exp(-alpha*t).*u(t);
plot(t,y)
title("f(t) = e^{-t}u(t)")
xlabel("t");
ylabel("f(t)");
grid on;

subplot(3,1,2);
z = 1./(alpha+w*1i);
plot(w,abs(z))
title("Fourier Transformation Magnitude")
xlabel("Frequency (w)");
ylabel("|H(w)|");
xlim([-10,10]);
grid on;

subplot(3,1,3);
plot(w,angle(z));
title("Fourier Transformation Phase Angle")
xlabel("Frequency (w)");
ylabel("Phase(H(w))")
xlim([-10,10]);
grid on;

% y = t*exp(-alpha*t).*u(t);

figure;
y = exp(-alpha*t).*u(t).*t;
z = (1./(alpha+w*1i)).^2;

subplot(3,1,1);
plot(t,y)
xlabel("t");
ylabel("f(t)");
title("f(t) = te^{-t}u(t)")
grid on;

subplot(3,1,2);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|H(w)|");
title("Fourier Transformation Magnitude")
xlim([-10,10]);
grid on;

subplot(3,1,3);
plot(w,angle(z));
xlabel("Frequency (w)");
ylabel("Phase(H(w))")
title("Fourier Transformation Phase Angle")
xlim([-10,10]);
grid on;

% y = exp((-t.^2)/2*sigma^2)./sqrt(2*pi*sigma^2);

figure;
t = linspace(-10,10,500);
y = exp((-t.^2)/(2*sigma^2))./sqrt(2*pi*sigma^2);
z = exp(-(sigma^2)*(w.^2)/2);

subplot(3,1,1);
plot(t,y)
xlabel("t");
ylabel("f(t)")
title("f(t) = exp^{-t^2/2sigma^2}/sqrt(2*pi*sigma^2)")
grid on;

subplot(3,1,2);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|H(w)|");
title("Fourier Transformation Magnitude")
xlim([-10,10]);
grid on;

subplot(3,1,3);
plot(w,angle(z));
xlabel("Frequency (w)");
ylabel("Phase(H(w))")
title("Fourier Transformation Phase Angle")
xlim([-10,10]);
grid on;

% y = delta(t-t0)

figure;
z = exp(-1i.*w*t0);

subplot(2,1,1);
plot(w,abs(z));
title("delta(t-t0)");
xlabel("Frequency (w)");
ylabel("|H(w)|");
xlim([-10,10]);
grid on;

subplot(2,1,2);
plot(w,angle(z));
xlabel("Frequency (w)");
ylabel("Phase(H(w))")
xlim([-10,10]);
grid on;

% y = d/dt

figure;
y = ones(size(t));
z = i*w;

subplot(3,1,1);
plot(t,y)
xlabel("t");
ylabel("d/dt")
title("d/dt")
grid on;

subplot(3,1,2);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|H(w)|");
xlim([-10,10]);
grid on;

subplot(3,1,3);
plot(w,angle(z));
xlabel("Frequency (w)");
ylabel("Phase(H(w))")
xlim([-10,10]);
grid on;

% Plot the Fourier transform of the first pair above but this time, plot the real and imaginary
% parts as functions of frequency instead of the magnitude and phase.

figure;
z = 1./(alpha+w*1i);
t = linspace(0,10,500);
figure;
subplot(2,1,1);
y = exp(-alpha*t).*u(t);
plot(t,y)
title("f(t) = e^{-t}u(t)")
xlabel("t");
ylabel("f(t)")
grid on;
subplot(2,1,2);
plot(t,real(z));
hold on;
plot(t,imag(z));
xlabel("Frequency (w)");
ylabel("Real and Imaginary value of of z");
title("Real and Imaginary value of of z");
legend(["real","imaginary"])
grid on;

% Plot the Fourier transform of the second pair above but this time, plot the magnitude in
% dB, i.e., plot 20log10(|H(ω)|).


% y = t*exp(-alpha*t).*u(t);

figure;
t = linspace(0,10,500);
y = exp(-alpha*t).*u(t).*t;
z = (1./(alpha+w*1i)).^2;

subplot(2,1,1);
plot(t,y)
xlabel("t");
ylabel("f(t)")
ylabel("f(t) = e^{-t}u(t)")
grid on;

subplot(2,1,2);
plot(w,20*log10(abs(z)));
xlabel("Frequency (w)");
ylabel("20*log10(abs(H(w)))) (dB)");
xlim([-10,10]);
grid on;



%% Time Shifting

t = linspace(-15,15,500);

% u(t)-u(t-10)

figure;
subplot(3,1,1);
h = u(t)-u(t-10);
plot(t,h);
ylim([0,2])
xlim([-1,11])
xlabel("t");
ylabel("h(t)")
grid on;
subplot(3,1,2);
z = (1-exp(-10*w*i))./(i*w);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("abs(fourier)")
grid on;
subplot(3,1,3);
plot(w,angle(z));
xlabel("Frequency (w)");
ylabel("angle(fourier)")
grid on;

% u(t+5)-u(t-5)

figure;
subplot(3,1,1);
h = u(t+5)-u(t-5);
plot(t,h);
ylim([0,2])
xlim([-11,11])
xlabel("t");
ylabel("h(t)")
grid on;
subplot(3,1,2);
z = (exp(5*w*i)-exp(-5*w*i))./(i*w);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("abs(fourier)")
grid on;
subplot(3,1,3);
plot(w,angle(z));
xlabel("Frequency (w)");
ylabel("angle(fourier)")
grid on;

% Comment on your observations comparing these two signals and their Fourier transforms 
% Both signals seem to have similar amplitudes in across the
% frequency range. However, the phase angle see to vary differnently
% between the two. The second time shifted unit step function seem to
% always stay positive in the u(t+5)-u(t-5) unlike u(t)-u(t-10) where it
% seems to  be positibe at the negative frequencies and negative in the
% positibev frequenies. Additionally, it seems to be dropping by 2 radians
% at a time linearly before going back to the original after the drop finishes in 
% the u(t)-u(t-10) unlike u(t+5)-u(t-5) where the jumps seem to happen
% discretly, behaving like unit step functions.
%% Time Scaling

figure;
y = exp((-t.^2)/2*sigma^2)./sqrt(2*pi*sigma^2);
z = exp(-(sigma^2)*(w.^2)/2);
w = linspace(-10,10,500);
t = linspace(-10,10,500);

for sigma = 0:0.1:3
    subplot(2,1,1);
    y = exp((-t.^2)/(2*sigma^2))./sqrt(2*pi*sigma^2);
    plot(t,y);
    xlabel("t");
    ylabel("Gaussian(t) at sigma = " + num2str(sigma));
    title("Gaussian(t) at sigma = " + num2str(sigma));
    grid on;
    subplot(2,1,2);
    z = exp(-(sigma^2)*(w.^2)/2);
    plot(w,abs(z));
    xlabel("Frequency (w)");
    ylabel("|Fourier of Gaussian| at sigma = " + num2str(sigma));
    title("|Fourier of Gaussian| at sigma = " + num2str(sigma));
    grid on;
    drawnow;
    pause(0.1);
end

figure;

subplot(3,2,1);
sigma = 1;
y = exp((-t.^2)/(2*sigma^2))./sqrt(2*pi*sigma^2);
plot(t,y);
xlabel("t");
ylabel("Gaussian(t) at sigma = " + num2str(sigma));
title("Gaussian(t) at sigma = " + num2str(sigma));
grid on;
subplot(3,2,2);
z = exp(-(sigma^2)*(w.^2)/2);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|Fourier of Gaussian|")
title("|Fourier of Gaussian|")
grid on;

subplot(3,2,3);
sigma = 2;
y = exp((-t.^2)/(2*sigma^2))./sqrt(2*pi*sigma^2);
plot(t,y);
xlabel("t");
ylabel("Gaussian(t) at sigma = " + num2str(sigma));
title("Gaussian(t) at sigma = " + num2str(sigma));
grid on;
subplot(3,2,4);
z = exp(-(sigma^2)*(w.^2)/2);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|Fourier of Gaussian|")
title("|Fourier of Gaussian|")
grid on;

subplot(3,2,5);
sigma = 3;
y = exp((-t.^2)/(2*sigma^2))./sqrt(2*pi*sigma^2);
plot(t,y);
xlabel("t");
ylabel("Gaussian(t) at sigma = " + num2str(sigma));
title("Gaussian(t) at sigma = " + num2str(sigma));
grid on;
subplot(3,2,6);
z = exp(-(sigma^2)*(w.^2)/2);
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|Fourier of Gaussian|")
title("|Fourier of Gaussian|")
grid on;

% Comment on your observations. Is there a certain trend you see when increasing σ?
% Yes, it seems like the fourier transformation magnitude plot is getter narrower and
% narrower as sigma inerases, with a fixed peak value of 1. As for the
% function in the time domain, the opposite behavior is occuring where the
% plot continously gets wider with a decreasing peak limit.

%% Pick a different Fourier transform pair and do the previous time scaling demonstration
%% for it as well.


% y = t*exp(-alpha*t).*u(t);

figure;
y = exp(-alpha*t).*u(t).*t;
z = (1./(alpha+w*1i)).^2;

w = linspace(-10,10,500);
t = linspace(0,10,500);

for alpha = 0:0.1:3
    subplot(2,1,1);
    y = exp(-alpha*t).*u(t).*t;
    plot(t,y);
    xlabel("t");
    ylabel("f(t)");
    title("f(t) = exp(-alpha*t).*u(t).*t at alpha = " + num2str(alpha));
    grid on;
    subplot(2,1,2);
    z = (1./(alpha+w*1i)).^2;
    plot(w,abs(z));
    xlabel("Frequency (w)");
    ylabel("|Fourier| at alpha = " + num2str(alpha));
    title("|Fourier| at alpha = " + num2str(alpha));
    grid on;
    drawnow;
    pause(0.1);
end

figure;

subplot(3,2,1);
alpha = 0.5;
y = exp(-alpha*t).*u(t).*t;
plot(t,y);
xlabel("t");
ylabel("f(t)");
title("f(t) = exp(-alpha*t).*u(t).*t; at alpha = " + num2str(alpha));
grid on;
subplot(3,2,2);
z = (1./(alpha+w*1i)).^2;
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|Fourier|")
title("|Fourier|")
grid on;

subplot(3,2,3);
alpha = 2;
y = exp(-alpha*t).*u(t).*t;
plot(t,y);
xlabel("t");
ylabel("f(t)");
title("f(t) = exp(-alpha*t).*u(t).*t; at alpha = " + num2str(alpha));
grid on;
subplot(3,2,4);
z = (1./(alpha+w*1i)).^2;
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|Fourier|")
title("|Fourier|")
grid on;

subplot(3,2,5);
alpha = 3;
y = exp(-alpha*t).*u(t).*t;
plot(t,y);
xlabel("t");
ylabel("f(t)");
title("f(t) = exp(-alpha*t).*u(t).*t at alpha = " + num2str(alpha));
grid on;
subplot(3,2,6);
z = (1./(alpha+w*1i)).^2;
plot(w,abs(z));
xlabel("Frequency (w)");
ylabel("|Fourier|")
title("|Fourier|")
grid on;