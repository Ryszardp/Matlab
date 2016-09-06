%Hecho por Ricardo Pascual Pascual
clear all;
close all;
clc;
%Entrenamiento de una neurona perceptron de peso vs estatura
pesoy=[60 55 80 63.5 78 53 85 65 76.7 67 83 72];
estaturax=[1.60 1.70 1.75 1.55 1.80 1.55 1.60 1.75 1.85 1.55 1.93 1.95];
%Reordenamiento de valores
%menorx=[1.55 1.75 1.55 1.60 1.70 1.55];
%menory=[67 65 63.5 60 55 53];
%mayorx=[160 1.93 1.75 1.80 1.85 1.95];
%mayory=[85 83 80 78 76.7 72];
hold on;
%Se grafica de forma general para poder calcular la frontera de decisi�n
plot(estaturax,pesoy,'og','MarkerFaceColor','b');
%Datos adicionales a los ejes de la gr�fica
ylabel('peso');
xlabel('altura');
%Se activan las reglas dentro de la gr�fica
grid on;
plot([8,0],[0,90]);
%Se pone la frontera de decisi�n a la gr�fica
%plot([6,0],[0,100]);
%Se ajustan los valores dentro de la gr�fica para visualizarlo de mejor
%manera
%graficamos con los nuevos valores
%plot(menorx,menory,'og','MarkerFaceColor','g');
%plot(mayorx,mayory,'og','MarkerFaceColor','b');
axis([0 4 45 90]);
%Finalizamos la funci�n hold
hold off;
%creamos la variable b hace referencia a los pesos menores de 68
b=1;
%asignaci�n de valores a la ec. corespondiente a frontera
w1=[-b/8;-b/90];
w=[w1'];
Pmenores=[estaturax;pesoy];
n=w*Pmenores+b;

a=hardlim(n)
