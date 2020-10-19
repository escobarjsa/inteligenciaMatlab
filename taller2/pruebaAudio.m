clc, clear all;

Duracion = 1; %tiempo de grabación en segundos
Fs = 44100; %Frecuencia de muestreo

%Crear un objeto de audio
%En este caso es un mircrofono, que se va a muestrear
%con Fs, una resolución de 16 bits y de un canal.
%1 es mono 2 estereo

Entrada = audiorecorder(Fs,16,1);
%Abrir cuadro de dialogo
msgbox('Grabando...','Titulo');
%funcion para capturar el sonido
recordblocking(Entrada,Duracion);
msgbox('Finalizo la grabación','titulo');
%Asignar audio capturado a una variable
x=getaudiodata(Entrada,'int16');
%guardar en un archivo de audio
audiowrite('Sonido.wav',x,Fs);