%practical 4

% Question 1:
N = 1; %Initial bacterium is 1
k = log(2); %constant
N0 = 1;
bacteria = [];
for t = 0:3:36 %1 iteration equals 40 mins, so 36 in 24hours
    N = N0*exp(t*k)
    bacteria = [N bacteria];
end
figure;plot(0:3:36,bacteria)

% Question 2:
halflife = 13.3;
k = log(0.5)/halflife;
iodine = [];
for t = 0:4:48
    A = exp(t*k);
    iodine = [iodine A];
end
figure;plot(0:4:48,iodine)

%Question 3:
M = 20;
b = 0.25;
t = 0.01;
a = 0.25;

alpha = a/b;
beta = (pi*alpha)/2;
sigma = (6*M)/(t*b^2);
C = sqrt(tan(beta)/beta)*[(0.923+0.199*(1-sin(beta)^2))/cos(beta)];
K = C*sigma*sqrt(pi*a);
disp(K)

fprintf('The stress intensity factor for a beam that is %.4f m wide and %.4f m thick')
