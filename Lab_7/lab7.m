clc; close all; clear;

% Setting up required functions
u = @(n)double(n>=0);
del = @(n)double(n==0);

%% Question 1

w = linspace(0,10,1000);
H = 1+2*exp(-25i*w);
magnitude = abs(H);
wrapped_angles = angle(H);
unwrapped_angles_unwrap = unwrap(wrapped_angles);
unwrapped_angles_myfunc = my_unwrap(wrapped_angles);

figure;
subplot(2,2,1);
plot(w,magnitude);
xlabel("w");
title("|H(w)|");
ylabel("|H(w)|");
grid on;

subplot(2,2,2);
plot(w,wrapped_angles);
xlabel("w");
title("Wrapped Phase Angle of H(w)");
ylabel("Phase Angle of H(w)");
grid on;

subplot(2,2,3);
plot(w,unwrap(angle(H)));
xlabel("w");
title("Unwrapped phae angle using unwrap");
ylabel("Phase Angle of H(w)");
grid on;

subplot(2,2,4);
plot(w,unwrapped_angles_myfunc);
xlabel("w");
title("Unwrapped phae angle using own function");
ylabel("Phase Angle of H(w)");
grid on;

%% Question 2:

[x, Fs] = audioread('analog computer data.mp3');
x = x(:,1);
x = x';
figure;
T = 1/Fs;
t = 0:T:(length(x)-1)*T;
plot(t',x);
xlabel("t(s)");
ylabel("Signal");
xlim([0,0.06]);
grid on;

[X,f] = dtft(x,T);
magnitude = abs(X);

figure;
plot(f,magnitude);
xlabel("w");
title("|H(w)|");
ylabel("|H(w)|");
xlim([-500,500]);
grid on;

[yMax,locs] = max(X);
for i = 1 : length(locs)
    xValue = f(locs(i));
    disp("Dominant Frequency: " + xValue);
end

% Dominant Frequencies: 157.654 and -157.654

%% Functions

function new_angles = my_unwrap(angles)
    new_angles = angles;
    add = 0;
    for i = 2 : length(angles)
        if((angles(i)*angles(i-1))<0 && angles(i)>0)
            add = add - 2*pi;
        end
        new_angles(i) = new_angles(i) + add;
    end
end