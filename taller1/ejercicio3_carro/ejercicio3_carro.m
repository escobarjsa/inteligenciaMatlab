%Limpiar todo
clear all;
clc;

%Variables en el plano cartesiano
x=[0 0 2 2 3 3 5 5 0];
y=[1 2 2 3 3 2 2 1 1];

%Trazar movimiento
for i=0:10
    
    plot(x,y);
    x=1+x;
    axis([0 20 0 10])
    pause(0.01) %pausa del carro
    drawnow()%limita para animar
    
end