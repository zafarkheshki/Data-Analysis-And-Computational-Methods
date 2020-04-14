%Q#1
x = 20:10:70;
y = (2.*sind(x) + cosd(x).^2)./(sind(x).^2)

%Q#2
v = [15,8,-6];
u = [3,-2,6];
q2a = v./u
q2b = u'*v
q2c = u*v'

%Q#3
x = 8.4;
r = 14;
y = sqrt(r^2 - x^2);
A = [x y];
B = [-r 0];
C = [r 0];
rAB = B - A;
rAC = C - A;
alpha1 = acosd(dot(rAB,rAC)/(norm(rAB)*norm(rAC)));
alpha2 = asind(cross([rAB 0],[rAC 0])/(norm(rAB)*norm(rAC)));

%Q#4
n1 = 10; n2 = 50; n3 = 100;
k = 1:n2; %change this
q4 = sum(((9/10).^k)./k);
q4
log(10)
