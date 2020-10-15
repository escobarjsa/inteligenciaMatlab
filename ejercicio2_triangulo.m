%Limpiar todo
clear all;
clc;

%Variables de animacion
frames = 100;
pausa = 0.01;
pausaInicial = 0.0001;

%Variables del tamano del plano carteciano
Xmin = -3; %X minima
Xmax = 8;  %X maxima
Ymin = -3;  %Y minima
Ymax = 8; %Y maxima

%Valor de Rotacion
theta = -3600;

%Vertices, corresponden a los puntos tomados del triangulo
a=[0,0];
b=[2,0];
c=[1,2];

%Matriz de puntos
x = [a(1) b(1) c(1) a(1)];
y = [a(2) b(2) c(2) a(2)];

%Dibujar el triangulo original
%trianguloOriginal = line(x,y); %Dibujar triangulo
%trianguloOriginal.Color = 'blue'; %Colot
%trianguloOriginal.LineStyle = '-'; %Tipo de linea
%trianguloOriginal.LineWidth = 3; %Grosor

%Formato al plano
grid on %Mostrar cuadricula
axis square; %Cuadricula cuadrada
axis([Xmin,Xmax,Ymin,Ymax]); %Tamaño de plano carteciano

for i = 1:frames
    %Convercion para avanzar un poco cada ciclo
    div = (i/frames);
    thetan = theta*div;
    
    MR = [cosd(thetan) sind(thetan)  0; %Matriz de rotacion
        -sind(thetan) cosd(thetan) 0;
        0            0      1];
    
    aR = [a(1),a(2),1] * MR; %Punto 'a' rotado
    bR = [b(1),b(2),1] * MR; %Punto 'b' rotado
    cR = [c(1),c(2),1] * MR; %Punto 'c' rotado
    
    %Matriz de puntos
    xR = [aR(1) bR(1) cR(1) aR(1)]; %Valores x rotados
    yR = [aR(2) bR(2) cR(2) aR(2)]; %Valores y rotados
    
    %Dibujar el triangulo rotado
    trianguloRotado = line(xR,yR); %Dibujar triangulo
    trianguloRotado.Color = 'red'; %Colot
    trianguloRotado.LineStyle = '-'; %Tipo de linea
    trianguloRotado.LineWidth = 3; %Grosor
    
    pause(pausa) %pausar
    
    %Condicion para que se pause un poco al inicio
    if(i == 1)
        pause(pausaInicial)
    end
    
    %Condicion para borrar los triangulos anteriores
    if(i < 100)
        delete(trianguloRotado)
    end
end