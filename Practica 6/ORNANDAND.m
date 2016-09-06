clear all;
close all;
clc;
hold on;
xlabel('p1')
ylabel('p2')
axis([0 3 0 3])
%Creamos la primera frontera de decisión
plot([0 .75], [.75 0],'g','LineWidth',2)
%Creamos la segunda frontera de decisión
plot([0 2.1], [2.1 0],'b','LineWidth',2)
    %Se asignan los valores para OR
    b1=-1
    w1=[-b1/.75;-b1/.75]
    %w1=[10/7; 10/7];
    
    %Se asignan los valores para NAND
    b2=1
    w2=[-b2/2.1;-b2/2.1]
    
    %w2=[-2/3; -2/3];
    %b2=1;
    %Se crea W1 que es la matriz de pesos de OR y NAND
    W1=[w1';w2']
    B1=[b1;b2]
    %a1=hardlim(W1*P+B1)
    
    %Para AND
    %w3=[10/17;10/17];
    b3=-1
    w3=[-b3/1.5;-b3/1.5]
    W2=w3'
            %a2=hardlim(W2*a1+B2)
    %Se piden 4 las entradas de x,y
    for j=1:4 
    p1=input('Introduzca la coordenada en p1(x)');
         p2=input('Introduzca la coordenada en p2(y)');
         P=[p1;p2];
         %a1 es un vector columna con las salidas de OR y NAND
         a1=hardlim(W1*P+B1)
         %a2 es un vector cuyo valor es la salida de AND
         a2=hardlim(W2*a1+b3)
            if (a2==0)
                %mostramos un msj que tipo de salida nos da hard limit
                disp('Es un Cero ')
                plot(p1,p2,'ok')               
            else if (a2==1)
                 %mostramos un msj que tipo de salida nos da hard limit
                disp('Es un Uno')
                plot(p1,p2,'ok','MarkerFaceColor','k')
                end
            end
     end
     hold off;