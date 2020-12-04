clc,clear all;
x=0;
y=0;  
%Cordenadas en la cuadricula
[X,Y] = meshgrid(-5:.5:5);
%Función de entrada
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
%limites
mesh(X,Y,Z)
axis tight; hold on;

for i=1:20
    rn = random('norm',0,1);
    rn2 = random('norm',0,1);
    x_1 = x - rn;
    y_1 = y - rn2;
    
    if(e_funcion(x_1,y_1) < e_funcion(x,y))
        x=x_1;
        y=y_1;
        disp(e_funcion(x,y));
        plot3(x,y,e_funcion(x,y),'.');
    end
    drawnow();
    pause(0.001);
end

function res = e_funcion(x,y)
    r = sqrt(x^2+y^2) + eps;
    res = sin(r)/r;
end