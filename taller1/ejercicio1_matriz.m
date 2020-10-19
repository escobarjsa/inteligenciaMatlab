clear all;
clc;

fprintf('Ingrese la matriz A \n\n');
filasA = input('Ingrese el número de filas de la matriz \n'); %reglones o filas
columnasB = input('Ingrese el número de columnas de la matriz \n'); %columnas

%vector vacio que contendrà los valores de la matriz
A = [];

capturaDatos = 'Entrada del campo %d,%d: ';

%llenado matriz n
for i = 1 : filasA
    for j = 1 : columnasB %llenando matriz m
        fprintf(capturaDatos,i,j)
        A(i,j) = input('');
    end
end

disp('su matriz A es:');
A
auxA=[A];


%%ingresando la matriz B

fprintf('Ingrese la matriz B \n\n');
filasB = input('Ingrese el número de filas de la matriz \n'); %reglones o filas
columnasB = input('Ingrese el número de columnas de la matriz \n'); %columnas

%vector vacio que contendrà los valores de la matriz
B = [];

capturaDatosB = 'Entrada del campo %d,%d: ';

%llenado matriz n
for i = 1 : filasB
    for j = 1 : columnasB %llenando matriz m
        fprintf(capturaDatosB,i,j)
        B(i,j) = input('');
    end
end

disp('su matriz B es:');
B
auxB = [B];

%convirtiendo A en B
disp('La nueva matriz A con los valores de B es:');
A=auxB

disp('La nueva matriz B con los valores de A es:');
%convirtiendo B en A
B=auxA