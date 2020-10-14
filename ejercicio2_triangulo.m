%Limpiar todo
clear all; 
clc;

%Variables de animacion
frames = 100;
pausa = 0.0001;
pausaInicial = 0.001;

%Variables del tamano del plano carteciano
Xmin = -3; %X minima
Xmax = 8;  %X maxima
Ymin = -3;  %Y minima
Ymax = 8; %Y maxima

%Vertices, corresponden a los puntos tomados del triangulo
a=[0,0];
b=[2,0];
c=[1,2];

%Matriz de puntos
x = [a(1) b(1) c(1) a(1)];
y = [a(2) b(2) c(2) a(2)];

%Dibujar el triangulo original
trianguloOriginal = line(x,y); %Dibujar triangulo
trianguloOriginal.Color = 'blue'; %Colot
trianguloOriginal.LineStyle = ':'; %Tipo de linea
trianguloOriginal.LineWidth = 3; %Grosor

%Formato al plano
grid on %Mostrar cuadricula
axis square; %Cuadricula cuadrada
axis([Xmin,Xmax,Ymin,Ymax]); %Tamaño de plano carteciano
