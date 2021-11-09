clc;
A1 = 1;
A2 = 0.01;
omega = 2*pi;
beta = 2*pi;
lambda = 1;
z = linspace(0,20,1000);
t = linspace(0,4,200);
alpha = 0.3; 

for n = 1:length(t)
    Vi = A1 * exp(-alpha * z) .* cos(omega * t(n) - beta * z);
    Vr = A2 * exp(alpha * z) .* cos(omega * t(n) + beta * z);
    Vt = Vi + Vr;
    plot(z, Vi);
    hold on
    plot(z,Vr)
    plot(z,Vt,'LineWidth',2)
    axis([z(1) z(end) -(A1 + A2) (A1 + A2)])
    hold off
    legend('Onda incidente','Onda reflejada','Onda total')
    pause(0.01)
end