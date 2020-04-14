% Question 2 Taylor's series
x = 90;
y1 = cosTay(x);
y2 = cosd(x);
fprintf('cos(%d) with Taylors series %d and Matlab %d\n',x,y1,y2);

% Question 3 RL Filter
R = 600;
L = 0.14e-6;
w = linspace(10,10^6,10000);
LRFilt2 = @(R,L,w) 1./(sqrt(1+((w*L)./R).^2));
RV = LRFilt2(R,L,w);
%RV = LRFilt(R,L,w);
figure; semilogx(w,RV)
xlabel('Frequency rad/s')
ylabel('RV')

% Question 4 circuit that filters out a certain frequency
C = 160e-6;
L = 45e-3;
R = 200;
w = linspace(10,10^6,1000000);
filtfreq2 = @(R,C,L,w) abs(R*(1-w.^2*L*C))./(sqrt((R-R*w.^2*L*C).^2+(w*L).^2));
RV = filtfreq2(R,C,L,w);
figure; loglog(w,RV)
xlabel('Frequency rad/s')
ylabel('RV')
