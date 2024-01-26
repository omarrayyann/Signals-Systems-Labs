% Signals and Systems: Lab 2
% Name: Omar Rayyan
% Net-Id: olr7742

clear
close all

%% Question 1: Plotting Continuos-Time Signal
subplot(3,1,1)
t = 0:2*pi; plot(t,sin(t))
title('Plot 1')
xlabel('t(s)')
ylabel('y(t)')
grid on
axis([0 2*pi -1.2 1.2]);

subplot(3,1,2)
t = 0:0.2:2*pi; plot(t,sin(t));
title('Plot 2')
xlabel('t(s)')
ylabel('y(t)')
grid on
axis([0 2*pi -1.2 1.2]);

subplot(3,1,3)
t = 0:0.02:2*pi; plot(t,sin(t));
axis([0 2*pi -1.2 1.2]);
% Adding a title, axis labels and changing the axis
title('My Favorite Function');


xlabel('t (Seconds)');
ylabel('y(t)');
grid on
axis([0 2*pi -1.2 1.2]);

%%
% Explain why the plots are different? The first plot range increments by the integer values only so not as smooth.
% As for the second plot, the range of t is from 0 to
% 2pi with a step size of 0.2, so the plot is not that smooth but smoother than the first graph. Finally, and
% as for the 3rd plot, it has the same range as the first two plots but
% it is smoother because of its smaller step size (an order of magnitude lower
% than the 2nd plot.


% Put two plots on the same axis
figure;
t = 0:0.2:2*pi; plot(t,sin(t),t,sin(2*t))
title('Two plots on same axis');
xlabel('t (Seconds)');
ylabel('y(t)')
axis([0 2*pi -1.2 1.2])
grid on

% Produce a plot without connecting the points
figure;
t = 0:0.2:2*pi; plot(t,sin(t),'.')
title('Without connecting lines');
xlabel('t (Seconds)');
ylabel('y(t)')
axis([0 2*pi -1.2 1.2])
grid on

% Produce a plot without connecting the points
figure; 
t = 0:0.2:2*pi; plot(t,sin(t),t,sin(t),'r.')
title('Last Plot');
xlabel('t (Seconds)');
ylabel('y(t)')
axis([0 2*pi -1.2 1.2])
grid on

%%
% What does r do? r changes the color of the points to red

