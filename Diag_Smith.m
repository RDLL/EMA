clc;
R = [0:0.05:0.7 0.8:0.1:1.4 1.6:0.2:3];
X = linspace(-100,100,1e4);

Zn = R(1) + j *X;
Gamma = (Zn-1)./(Zn+1);
figure(1)
plot(real(Gamma), imag(Gamma),'.')
axis([-1.1 1.1 -1.1 1.1])

%X = linspace(-1,1,1e4)
for n = 2:length(R)
    Zn = R(n) + j *X;
    Gamma = (Zn-1)./(Zn+1);
    figure(1)
    plot(real(Gamma), imag(Gamma),'b')
    axis([-1.1 1.1 -1.1 1.1])dfd
    plot(real(Gamma), imag(Gamma),'b')
    axis([-1.1 1.1 -1.1 1.1])
    grid on
    hold on
end
%%
X = [-3:0.1:-1 1:0.1:3];
R = linspace(0,100,1e4);

for n = 2:length(X)
    Zn = R + j *X(n);
    Gamma = (Zn-1)./(Zn+1);
    figure(1)
    plot(real(Gamma), imag(Gamma),'b')
    
    axis([-1.1 1.1 -1.1 1.1])
    grid on
    hold on
end
%%
ZL = 75 - j*25;
Z0 = 50;
Zn = ZL/Z0;
Gamma = (Zn-1)/(Zn+1);
plot(real(Gamma), imag(Gamma),'x','MarkerSize',16)

hold off