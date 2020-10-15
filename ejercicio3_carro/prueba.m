%Limpiar todo
clear all; clc;

%Vertices
a=[4,2];
b=[4,4];
c=[6,4];
d=[6,6];
e=[10,6];
f=[10,4];
g=[12,4];
h=[12,2];

%Matriz de puntos
%x = [a(4) b(4) c(6) d(6) e(10) f(10) g(12) h(12) a(4)];
%y = [a(2) b(4) c(4) d(6) e(6) f(4) g(4) h(2) a(2)];

x = [a(4) b(4) c(4) d(6) e(6) f(4) g(12) h(12) a(2)];
y = [a(2) b(4) c(4) d(6) e(6) f(4) g(4) h(2) a(2)];

%Dibujar el triangulo original
trianguloOriginal = line(x,y); %Dibujar triangulo
trianguloOriginal.Color = 'red'; %Color
trianguloOriginal.LineStyle = ':'; %Tipo de linea
trianguloOriginal.LineWidth = 3; %Grosor

%Formato al plano
%grid on %Mostrar cuadricula
%axis square; %Cuadricula cuadrada
%axis([Xmin,Xmax,Ymin,Ymax]); %Tamaño de plano carteciano