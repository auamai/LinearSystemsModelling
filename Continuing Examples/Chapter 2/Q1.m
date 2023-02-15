clear;

A = [0 1 0 0;-15 -0.75 5 0.25;0 0 0 1;10 0.5 -10 -0.5];
B = [0 0;0.025 0;0 0;0 0.05];
C = [1 0 0 0;0 0 1 0];
D = [0 0;0 0];

sys = ss(A,B,C,D);

t = 0:0.01:50;

U = ones(length(t),2);
U(:,1) = 20;
U(:,2) = 10;

x0 = [0 0 0 0]';

[Yo,to,Xo]=lsim(sys,U,t,x0);

subplot(211), plot(t,Yo(:,1));
grid; xlabel('Time [s]'), ylabel('Output 1');
title('System Response to Step Inputs')

subplot(212), plot(t,Yo(:,2));
grid;
xlabel('Time [s]'), ylabel('Output 2')


%damp(A)

Xss = [Yo(end,1), Yo(end,2)]';

disp(['Steady-state value of output 1: ' num2str(Xss(1,1))])
disp(['Steady-state value of output 2: ' num2str(Xss(2,1))])