clc;
R = linspace(0,1e2,1e5);
x = 1e8;
Zn = R + j*x;

figure(1)
hold on
plot(real(Zn), imag(Zn), '.')


Gamma = (Zn - 1) ./ (Zn + 1);

figure(2)
hold on
plot(real(Gamma), imag(Gamma),'.')