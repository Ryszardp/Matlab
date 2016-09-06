%Entrenamiento de una neurona
clear all;
close all;
clc;
%Entrada para la variable w1
w1=input('Introduzca el valor para w1:\n')
%Entrada para la variable w2
w2=input('Introduzca el valor para w2:\n')
%Entrada para la variable b 
b=input('Introduzca el valor para b:\n')
%ciclo for para introducir los valores de x1 y x2
for j=1:8
x1=input('Introduzca la entrada para x1:\n')
x2=input('Introduzca la entrada para x2:\n')

entrada=[x1 x2]

if entrada(1)==0 && entrada(2)==2
    salida_a=1
    salida_b=1
elseif entrada(1)==-2 && entrada(2)==2
    salida_a=1
    salida_b=1
elseif entrada(1)==-2 && entrada(2)==0
    salida_a=1
    salida_b=1
elseif entrada(1)==-2 && entrada(2)==-2
    salida_a=1
    salida_b=1
elseif entrada(1)==2 && entrada(2)==0
    salida_a=0
    salida_b=-1
elseif entrada(1)==2 && entrada(2)==-2
    salida_a=0
    salida_b=-1
elseif entrada(1)==2 && entrada(2)==2
    salida_a=0
    salida_b=-1
elseif entrada(1)==0 && entrada(2)==-2
    salida_a=0
    salida_b=-1
end

%se calcula el hardlim 
W=[w1 w2];
a=hardlim(W*entrada'-b)

%si la salida es distinta se redefinen los valores
while (a~=salida_a)
        
        W=W+(0.5*salida_b*entrada)
        b=b+(0.5*salida_b*(-1))
        a=hardlim(W*entrada'-b)
        
        end

figure(2)
hold on
grid on
plot([2 -2],[4 -4.5],'b')
axis([-2 4.5 -4.5 4]);
xlabel('x1')
ylabel('x2')

if a==0
    plot(entrada(1),entrada(2),'ok')
else
    plot(entrada(1),entrada(2),'ok','MarkerFaceColor','k')
end
hold off
W
b
end