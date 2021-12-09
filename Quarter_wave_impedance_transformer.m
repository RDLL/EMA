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
C = 3e8; %Velocidad de la luz

%Pedir Impedancia de la carga
prompt = 'Ingresa la parte real de la impedancia de la carga Zl: ';
re = input(prompt);
prompt = 'Ingresa la parte imaginaria de la impedancia de la carga Zl: ';
im = input(prompt); 
Zl = re + 1i*im; %Impedancia de la carga

%Pedir Impedancia caracteristica de la línea de transmisión
prompt = 'Ingresa la impedancia caracterisitica de la linea de transmisión Z0: ';
Z0 = input(prompt); %Impedancia caracteristica de la línea de transmisión

%Pedir Permitividad relativa
prompt = 'Ingresa la permitividad relativa de la linea de transmisión Er: ';
er = input(prompt);

%Pedir frecuencia
fprintf('Instrucciones para la frecuencia:\n');
fprintf('Se pide el valor y el múltiplo de la fecuencia por separado\n');
fprintf('Para 48MHz primero sería 48, después un 6, checar tabla de múltiplos\n')
disp('<a href = "https://es.wikipedia.org/wiki/Hercio#M%C3%BAltiplos_del_hercio">Tabla</a>');

prompt = 'Ingresa el valor de la frecuencia';
f=input(prompt);

prompt = 'Ingresa el multiplo de la frecuencia';
p = input(prompt);

fc = f*10^p;

lambda = C/fc*sqrt(er);
%Impedancia normalizada
Zn = Zl/Z0;
Yn = (Zn - 1)/(Zn + 1);
plot(real(Yn),imag(Yn), 'o', 'MarkerSize',12);



%Circulo de impedancia
rz = abs(Yn);
xc = linspace(-pi,pi,100);
%yc = linspace(-pi,pi,100);
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

if (real(Yn) <= 0 && imag(Yn) <= 0) || (real(Yn) >= 0 && imag(Yn) <= 0)
    longTrans = longTrans + 0.250;
end

disp('*** La distancia a la que debe colocarse el transformador es igual a: ');
disp(['  ' num2str(longTrans) ' lambdas']);
disp('Longitud de onda: 'num2str(lambda));

%Impedancia del transformador
Yt = exp(1i*(theta2) + abs(Yn));
Zt = (1 + Yt)/(1 - Yt);
impTrans = sqrt(Zt * Z0^2);
disp('*** La impedancia del transformador es igual a: ')
disp(['  ' num2str(impTrans)])

hold off
