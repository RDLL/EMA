% PR = 10*log(Pi/Pr)
clc;
Pir = 1:1000;

PR = 10 * log10(1./Pir);

figure(1)
plot(Pir, PR)

Gamma = 0:0.1:1;
VSWR = (1 + Gamma)./(1 - Gamma);
figure(2)
plot(Gamma, VSWR)
xlabel('Coeficiente de Reflexión')
ylabel('VSWR')