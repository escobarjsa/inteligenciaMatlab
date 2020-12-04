clc,clear all;
%Variables
x=0;
y=1;
t_max=9;    
[X,Y] = meshgrid(-5:.5:5);
%Función de entrada
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;

mesh(X,Y,Z)
axis tight; hold on;
band=true;
i=1;
contador=0;

interacionFinal=30;
while (band)
    
    for i=1:5
        contador = contador+1;
        if(contador == interacionFinal)
            band = false;
        end
        r = exp(-(i/t_max));
        a = random('unif',0,1);
        rn = random('norm',0,1);
        rn2 = random('norm',0,1);
        x_1 = x - rn;
        y_1 = y - rn2;
    
        if(e_funcion(x_1,y_1) > e_funcion(x,y) || r>a)
            x=x_1;
            y=y_1;
            disp(e_funcion(x,y));
            plot3(x,y,e_funcion(x,y),'.');
        end
        drawnow();
        pause(0.1);
    end
end

function res = e_funcion(x,y)
    r = sqrt(x^2+y^2) + eps;
    res = sin(r)/r;
end