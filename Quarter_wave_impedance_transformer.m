clc 

R = [0:0.1:1.5 2:5]; %Componente real
X = linspace(-1e2,1e2,1e4); %Componente imaginaria

%Generación de circulos
figure(1)
hold off

for n = 1:length(R)
    Z = R(n) + 1i *X; %Impedancia
    Y = (Z - 1)./ (Z + 1); %Coeficiente de reflexion
    if (R(n)~=1) && (R(n)~=0)
        plot(real(Y), imag(Y), 'b:')
    else
        plot(real(Y),imag(Y),'k--')
    end
    hold on
end

%Generación de arcos
X = [-20 -4 -2 -1:0.1:1 2 4 20];
R = linspace(0,1e2,1e4);
for n = 1:length(X)
    Z = R + 1i *X(n); %Impedancia
    Y = (Z - 1)./ (Z + 1); %Coeficiente de reflexion
    if abs(X(n))~=1
        plot(real(Y), imag(Y), 'b:')
    else
        plot(real(Y),imag(Y),'k--')
    end
    hold on
end
plot(0,0, 'X', 'MarkerSize',12);

%Gráfica de impedancia, admitancia y SWR
%Zl = 25 - 1i*50; %Impedancia de la carga
%Z0 = 75; %Impedancia caracteristica de la línea de transmisión
%er = 2.56; %permitividad relativa de la línea
%fc = 48e6; %Frecuencia de la señal
C = 3e8; %Velocidad de la luz
lambda = C/fc*sqrt(er); %longitud de onda

%Pedir Impedancia de la carga
prompt = 'Ingresa la parte real de la impedancia de la carga Zl: ';
re = input(prompt);
prompt = 'Ingresa la parte imaginaria de la impedancia de la carga Zl: ';
im = input(prompt); 
Zl = re + 1i*im; %Impedancia de la carga

%Pedir Impedancia caracteristica de la línea de transmisión
prompt = 'Ingresa la impedancia caracterisitica de la linea de transmisión Z0: ';
Z0 = input(prompt); %Impedancia caracteristica de la línea de transmisión

%Pedir permitividad relativa
prompt = 'Ingresa la permitividad relativa';
er = input(prompt);

%Pedir la frecuencia
prompt = 'Ingresa la frecuencia';
fc = input(prompt);
disp('<a href="https://es.wikipedia.org/wiki/Hercio#M%C3%BAltiplos_del_hercio">Tabla de múltiplos y submúltiplos del SI</a>');
prompt = 'Ingresa el multiplo de la frecuencia, según la tabla de múltiplos y submúltiplos:';
m = input(prompt);
fc = fc*10^m;

%Impedancia normalizada
Zn = Zl/Z0;
Yn = (Zn - 1)/(Zn + 1);
plot(real(Yn),imag(Yn), 'o', 'MarkerSize',12);

%Circulo de impedancia
rz = abs(Yn);
xc = linspace(-pi,pi,100);
yc = linspace(-pi,pi,100);
cimp = rz*( cos(xc) + 1i*sin(xc) );
plot(real(cimp),imag(cimp))

%Cálculo SWR
cimp = rz*( cos(0) + 1i*sin(0));
SWR = (1+rz)/(1-rz);
plot(rz,0,'dm','MarkerSize',12,'MarkerFaceColor','m');


%Cálculo posición del transformador
z = atan2(imag(Yn),real(Yn));
if z >= 0
    longTrans = z/(4*pi);
    theta2 = 0;
else
    longTrans = abs((pi+z)/(4*pi));
    theta2 = pi;
end
disp('*** La distancia a la que debe colocarse el transformador es igual a: ')
disp(['  ' num2str(longTrans) ' lambdas'])

%Impedancia del transformador
Yt = exp(1i*(theta2) + abs(Yn));
Zt = (1 + Yt)/(1 - Yt);
impTrans = sqrt(Zt * Z0^2);
disp('*** La impedancia del transformador es igual a: ')
disp(['  ' num2str(impTrans) ' lambdas'])

hold off
