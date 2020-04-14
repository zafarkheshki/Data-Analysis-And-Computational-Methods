% Practical 9
% Question 1
m = 25; % mass of the body
g = 9.81; %m/s^2
mu = 0.55; % friction coefficient
F = 150; % N
f = @(theta) ((mu*m*g)./(cosd(theta)+mu*sind(theta))) - F;
plot(0:90,f(0:90), 'r-')
theta = fzero(f,[0 90]);
disp(theta)

% Question 2
a = 5; % lb^(1/3)
b = 2 % per day
w0 = 0.5; % lb

dwdt = @(t,w) a*w^(2/3) - 2*w;
[t,w] = ode45(dwdt, 0:0.5:50, w0);
[max_w, max_w_idx] = max(w);

figure;
plot(t,w,t(max_w_idx),max_w,'r*')
xlabel('Time')
ylabel('Weight')
grid on;

% Question 3
v0 = 300;
% By solving the DE, determine and plot the velocity
% As a function of time from t = 0s untill the airplane stops
dvdt = @(t,v) -0.0053*v^2-3;
[t,v] = ode45(dvdt, 0:0.1:100, v0);

idx = find(v >= 0);
tp = t(idx);
vp = v(idx);

figure;
plot(tp,vp)
xlabel('Time (s)')
ylabel('Velocity (m/s)')
grid on;
% Using numerical integration to determine the distance x the airplane
% travels
% As a function of time, make a plot of x versus time
figure;
hold on;
x = 0;
for i = 1:length(tp)
    ti = tp(1:i);
    vi = vp(1:i);
    x(i) = trapz(ti,vi)
    plot(tp(i), trapz(ti,vi),'r*')
end
hold off
xlabel('Time (s)')
ylabel('Velocity (m/s)')
grid on;


% Question 4
Nm = 5000;
k = 0.000095;
N0 = 100;
dNdt = @(t,N) k*N*(Nm - N);
[t,N] = ode45(dNdt,0:0.1:20,N0);

figure;
plot(t,N)
xlabel('Time')
ylabel('N - polulation size')
grid on;