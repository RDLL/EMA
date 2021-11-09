%Simulación impedancia de entrada
clc;
C = 3e8;
f = 1e9;
epsilonr = 1.5;
lambda = C/(f*sqrt(epsilonr));
M = 1e3;
l = linspace(0,20*lambda, M);
%%
alpha = 0.2;
beta = 2*pi/lambda;

ZL = 75;
Z0 = 50;

gamma = alpha+j*beta;

Ze = Z0 * (ZL + Z0 * tanh(gamma* l))./(Z0 + ZL * tanh(gamma * l));

figure(1)
plot(l, real(Ze))
hold on
plot(l,imag(Ze))
hold off
grid on
xlabel('Distancia desde la carga, $l$','FontSize',24,'Interpreter','Latex')
ylabel('Impedancia de entrada, $Z_e(l)$','FontSize',24,'Interpreter','Latex')

for n = 1:length(l)
    figure(2) %Dejarlo afuera del for sobreescribe la figura 1
    Ze = Z0 * (ZL + Z0 * tanh(gamma* l(1:n)))./(Z0 + ZL * tanh(gamma * l(1:n)));
    plot(real(Ze), imag(Ze));
    hold on
    plot(real(Ze(end)), imag(Ze(end)),'o');
    hold off
    axis([-75 75 -75 75])
    pause(0.01)
end