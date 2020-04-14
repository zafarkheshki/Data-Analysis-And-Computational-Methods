%Practical 6

%Question 2
%x = input('Please Enter array of numbers >')
x = randi([-20,20],1,16);
x1 = x(x < 0)
x2 = x(x >= 0)


%Question 3

%Question 4
theta = linspace(0,2*pi,100);
y = zeros(1,100);

for i = 1:nume1(theta)
    if 0<= theta(i) <= pi/2
        y(i) = 6*(2*theta(i) - 0.5*sin(theta(i)))/pi;
    elseif pi/2 <= theta(i) && theta(i) <= 2*pi/3
        y(i) = 6;
    elseif 2*pi/3 <= theta(i) && theta(i) <= 4*pi/3
        y(i) = 6 - 3*(1 - 0.5*cos(3*(theta(i) - 2*pi/3)));
    elseif 4*pi/3 <= theta(i) && theta(i) <= 3*pi/2
        y(i) = 3;
    elseif 3*pi/2 <= theta(i) && theta(i) <= 7*pi/4
        y(i) = 3 - 1.5*((theta(i) - 3*pi/2)/(pi/4))^2;
    elseif 7*pi/4 <= theta(i) && theta(i) <= 2*pi
        y(i) = 0.75 - 0.75*(1 - ((t - 7*pi/4)/(pi/4)))^2;
        
