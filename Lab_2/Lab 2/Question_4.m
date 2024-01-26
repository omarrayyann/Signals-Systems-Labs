% Question 4: Plotting a Sampled-Signal
% t = Time range
t = 0:0.3:3.3;
% x(t)
x = [6 -1.3 -8 -11.7 -11 -6 1.3 8 11.7 11 6 -1.3];
% Plotting
figure; plot(t,x);
% Formatting Plot
title("Sampled-Signal");
xlabel("Time (Seconds)")