%Limpiar todo
clear all; clc;

%Variables de animacion
frames = 100;
pausa = 0.0001;
pausaInicial = 0.001;

%Variables del tamano del plano carteciano
Xmin = -3; %X minima
Xmax = 8;  %X maxima
Ymin = -3;  %Y minima
Ymax = 8; %Y maxima

%Valores de traslacion
tx = 5; 
ty = 2;

%Vertices
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

for i = 1:frames
    %Convercion para avanzar un poco cada ciclo
    div = (i/frames);
    txn = tx*div;
    tyn = ty*div;
    
    MT = [1 0 0; %Matriz de traslacion
          0 1 0;
         txn tyn 1];
 
     aT = [a(1),a(2),1] * MT; %Punto 'a' trasladado
     bT = [b(1),b(2),1] * MT; %Punto 'b' trasladado
     cT = [c(1),c(2),1] * MT; %Punto 'c' trasladado

    %Matriz de puntos
    xT = [aT(1) bT(1) cT(1) aT(1)]; %Valores x trasladados
    yT = [aT(2) bT(2) cT(2) aT(2)]; %Valores y trasladados

    %Dibujar el triangulo trasladado
    trianguloTrasladado = line(xT,yT); %Dibujar triangulo
    trianguloTrasladado.Color = 'red'; %Colot
    trianguloTrasladado.LineStyle = '--'; %Tipo de linea
    trianguloTrasladado.LineWidth = 3; %Grosor
    
    pause(pausa) %pausar
    
    %Condicion para que se pause un poco al inicio
    if(i == 1)
       pause(pausaInicial) 
    end
    
    %Condicion para borrar los triangulos anteriores
    if(i < 100)
        delete(trianguloTrasladado)
    end
end
