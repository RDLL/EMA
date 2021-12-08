clc; 

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
    Z = R + 1i *X(n); 
    Y = (Z - 1)./ (Z + 1); 
    if abs(X(n))~=1
        plot(real(Y), imag(Y), 'b:')
    else
        plot(real(Y),imag(Y),'k--')
    end
    hold on
end
plot(0,0, 'X', 'MarkerSize',12);

hold off
