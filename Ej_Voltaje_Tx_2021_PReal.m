%simulación ecuaciones del telegrafo
clc;
lambda = 1;
D = 10 * lambda;
M = 1e3;
z = linspace(0,D,M);
beta = 2*pi/lambda;
alpha = 0.5;
gamma = alpha + j*beta;

A1 = 1;
A2 = 0.00657;
omega = 2*pi;
t = linspace(0,8,120);

for n = 1:length(t)
    Vpz = A1 * exp(-alpha*z) .* cos(omega*t(n)-beta*z); %Voltaje transmitido
    Vmz = A2 * exp(alpha*z) .* cos(omega*t(n)+beta*z); %Voltaje reflejado
    Vz = Vpz + Vmz; %Voltaje total
    
    figure(1)
    subplot(2,1,1);
    plot(z,Vpz,'b','LineWidth',1); %Voltaje transmitido
    hold on;
    plot(z,Vmz,'r','LineWidth',1); %Voltaje reflejado
    plot(z,Vz,'k','LineWidth',2); %Voltaje total
    hold off;
    
    axis([z(1) z(end) -1.1*(A1+A2) 1.1*(A1+A2)]);
    
    pause(0.1)
end