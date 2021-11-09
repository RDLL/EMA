%Simulación coeficiencte de reflexión
clc;
C = 3e8;
f = 1e9;
epsilonr = 1.5;
lambda = C/(f*sqrt(epsilonr));
M = 1e3;
l = linspace(0,10*lambda, M);
%%
alpha = 0.2;
beta = 2*pi/lambda;
 
ZL = 75;
Z0 = 50;

gamma = alpha+j*beta;

Gamma = exp(-2*gamma*l)*(ZL-Z0)/(ZL+Z0);
%%
figure(1)
plot(l/lambda,abs(Gamma));
hold on
plot(l/lambda,real(Gamma))
plot(l/lambda,imag(Gamma))
hold off
grid on
legend('Valor absoluto','Parte real','Parte imaginaria')
%%


for n = 1:length(l)
    Gamma = exp(-2*gamma*l(1:n))*(ZL-Z0)/(ZL+Z0);
    figure(2) %Dejarlo afuera del for sobreescribe la figura 1
    plot(real(Gamma), imag(Gamma));
    hold on
    plot(real(Gamma(end)), imag(Gamma(end)),'o');
    hold off
    axis([-1.3 1.3 -1.3 1.3])
    pause(0.01)
end
grid on