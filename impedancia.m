C = 3e8;
f = 1e9;
epsilonr = 1.5;
lambda = C/(f*sqrt(epsilonr));
M=1e3;
l = linspace(0,2*lambda, M);
%%
alpha=0.2;
beta=2*pi/lambda;
ZL=75;
Z0=50;

gamma = alpha+j*beta;

Ze= Z0 * (ZL + Z0*tanh(gamma*l))./(Z0 + ZL*tanh(gamma*l));

plot(l, real(Ze))
hold on
plot(l,imag(Ze))
hold off
grid on
xlabel('Distancia desde la carga, $l$','Fontsize',24,...,
    'Interpreter','Latex')
ylabel('Impedancia de entrada, $Z_e(l)$','Fontsize',24,...,
'Interpreter','Latex')