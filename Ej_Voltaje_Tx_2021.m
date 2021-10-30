%simulación ecuaciones del telegrafo
clc;
lambda = 1;
D = 40*lambda;
M = 1e3;
z = linspace(0,D,M);
beta = 2*pi/lambda;
alpha = 0.1;
gamma = alpha + j*beta;

A1 = 1;
A2 = A1*exp(-gamma*z(end));
Vpz = A1*exp(-gamma*z); %Voltaje transmitido
Vmz = A2*exp(gamma*z); %Voltaje reflejado
Vz = Vpz + Vmz; %Voltaje total

figure(1)
subplot(2,1,1);
plot(z,real(Vpz),'b'); %Voltaje transmitido
hold on;
plot(z,real(Vmz),'r'); %Voltaje reflejado
plot(z,real(Vz),'m'); %Voltaje total
hold off;

subplot(2,1,2);
plot(z,imag(Vpz),'b'); %Voltaje transmitido
hold on;
plot(z,imag(Vmz),'r'); %Voltaje reflejado
plot(z,imag(Vz),'m'); %Voltaje total
hold off;

% figure(1);
% plot(z,real(Vpz),z,imag(Vpz));
