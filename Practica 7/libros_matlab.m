%Limpia el Command Window y elimina variables existentes
clear all; close all; clc;
%Mantiene la ventana para seguir graficando
hold on;
%Etiqueta para el titulo de la grafica
title('Clasificación de libros')
%Etiqueta correspondiete a X
xlabel('Peso')
%Etiqueta correspondiente a Y
ylabel('Frecuencia')
%Funcion para visualizar cierto rango en la grafica
axis([0 6 0 12])
%Primer frontera de decisión
plot([0 6],[10 0],'k','LineWidth',2)
%Segunda frontera de decisión
plot([0 4],[-4 12],'b','LineWidth',2)

b = [-1 ; -1]
w1=[-b(1)/6; -b(1)/10]
w2=[-b(2)/1; -b(2)/-4]
W=[w1';w2']
%Datos de prueba para libros ligeros y poco usados
lpux=[0.7 1.5];
lpuy=[3 5];
%Datos de prueba para libros ligeros y muy usados
lmux=[2.0 0.9];
lmuy=[9 11];
%Datos de prueba para libros pesados y poco usados
ppux=[4.2 2.2];
ppuy=[0 1];
%Datos de prueba para libros pesados y muy usados
pmux=[3.6 4.5];
pmuy=[7 6];
%{
plot(lpux,lpuy,'sk','MarkerFaceColor','w')
plot(lmux,lmuy,'sk','MarkerFaceColor','k') 
plot(ppux,ppuy,'^k','MarkerFaceColor','w')
plot(pmux,pmuy,'^k','MarkerFaceColor','k')
g=legend('Frontera 1','Frontera 2','Ligeros y poco usados','Ligeros y muy usados','Pesados y poco usados','Pesados y muy usados' ,'Location','southwest','Orientation','vertical') ;
%}
respuesta=1;

while (respuesta==1)
  p1=input('Introduzca la coordenada en P1(x)');
  p2=input('Introduzca la coordenada en P2(y)');
  P=[p1;p2]
  %Evaluamos la funcion con los datos ingresados
  a=hardlim(W*P+b)
  %La función hardlim nos devuele un vector el cual evaluamos 
    if(a==[1;1])
        %Si corresponde resultado mostramos un msj y graficamos un
        %triangulo de color negro
        disp('Es un libro pesado y muy usado')
        plot(p1,p2,'^k','MarkerFaceColor','k')
    else if(a==[0;1])
        %Si corresponde resultado mostramos un msj y graficamos un
        %triangulo de color blanco
         disp('Es un libro pesado y poco usado')
         plot(p1,p2,'^k','MarkerFaceColor','w')
    else if(a==[0;0])
        %Si corresponde resultado mostramos un msj y graficamos un
        %cuadrado de color blanco
         disp('Es un libro ligero y poco usado')
         plot(p1,p2,'sk','MarkerFaceColor','w')
        else
        %Si corresponde resultado mostramos un msj y graficamos un
        %cuadrado de color blanco
        disp('Es un libro ligero y muy usado')
         plot(p1,p2,'sk','MarkerFaceColor','k')     
    end
    end
    end
%Opción para poder continuar ingresando datos y graficarlos 
respuesta=input('Desea ingresar mas datos?  [1=Sí]    [otro número=No]');    
end
%Finalización de la función para poder graficar
hold off;
