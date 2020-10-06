clear all
clc


fprintf('Ingrese la matriz A \n\n');

filas = input('Ingrese el número de filas de la matriz \n'); %reglones o filas
columnas = input('Ingrese el número de columnas de la matriz \n'); %columnas

%vector vacio que contendrà los valores de la matriz
x = [];

mena = 'Entrada del campo %d,%d: ';

%llenado matriz n
for i = 1 : columnas
    for j = 1 : filas %llenando matriz m
        fprintf(mena,i,j)
        x(i,j) = input('');
    end
end

disp('su matriz es: ');
x