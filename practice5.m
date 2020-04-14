%Practical 5
% Question 1
% approach 1
x = -4:4;
f = -3*x.^4 + 10*x.^2 - 3;
figure;
plot(f)
% approach 2
figure;
fplot(@(x) -3*x.^4 + 10*x.^2 - 3, [-4,4])

% Question 2



%Question 3
L = 16;
a = 6;
b = a;
c = L - (a+b);
w1 = 400;
w2 = 200;

x = 0:0.5:L;
RA = (w1*a*(2*L-a)+w2*b^2)/(2*L);
RB = (w2*b*(2*L-a)+w1*a^2)/(2*L);

figure;
fplot(@(x) RA.*x-(w1*x.^2)./2,[0,a])
hold on;
fplot(@(x) RA.*x-((w1*a)/2)*(2*x-a),[a,(a+b)])
hold on;
fplot(@(x) RB*(L-x)-(w2*(L-x).^2)./2, [(a+b),L])
hold off;

%Question 4
Q = 300; %L/(m2-day)
L0 = [5 10 20];
figure;
fplot(@(D) L0(1)/(1 + (2.5*D.^(2/3))/sqrt(Q)),[100,2000])
hold on;
fplot(@(D) L0(2)/(1 + (2.5*D.^(2/3))/sqrt(Q)),[100,2000])
hold on;
fplot(@(D) L0(3)/(1 + (2.5*D.^(2/3))/sqrt(Q)),[100,2000])
hold off;
legend({'L0 = 5','L0 = 10', 'L0 = 20'})
xlabel('Depth of the filter(m)')
ylabel('Biological oxygen demand (mg/L)')