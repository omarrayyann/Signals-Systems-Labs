% Question 1: Plotting Continuos-Time Signal
figure; t = 0.2*pi; plot(t,sin(t));
figure; t = 0:0.2:2*pi; plot(t,sin(t));
figure; t = 0:0.02:2*pi; plot(t,sin(t));
% Explain why the plots are different? The first plot is a single point as
% t is a constant. As for the second plot, then the range of t is from 0 to
% 2pi with a step size of 0.2, so the plot is not that smooth. Finally, and
% as for the 3rd plot, it has the same range as the second plot except that
% it is smoother as it has a step size of 0.02 (an order of magnitude lower
% than the 2nd plot.
% Adding a title, axis labels and changing the axis
title('My Favorite Function');
xlabel('t (Seconds)');
ylabel('y(t)');
axis([0 2*pi -1.2 1.2]);
% Put two plots on the same axis
figure; 0:0.2:2*pi; plot(t,sin(t),t,sin(2*t));
% Produce a plot without connecting the points
figure; t = 0:0.2:2*pi; plot(t,sin(t),'.');
% Produce a plot without connecting the points
figure; t = 0:0.2:2*pi; plot(t,sin(t),'r.');
% What does r do? Makes the color of the points red