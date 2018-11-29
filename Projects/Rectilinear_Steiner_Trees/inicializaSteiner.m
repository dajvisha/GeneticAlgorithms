function [xC,yC,P,ind,A,T] = inicializaSteiner(C)

% [xC,yC,P,ind,A,T] = inicializaSteiner(C)
%
% Dadas una coordenadas, se generan los datos necesarios para usar las
% funciones graficaSteiner y costoSteiner.
%
% see also: graficaSteiner costoSteiner

% Manuel Valenzuela
% 29 octubre 2014


% Coordenadas x y y �nicas
xC = unique(sort(C(:,1)));
yC = unique(sort(C(:,2)));

% N�mero de renglones y columnas en la gr�fica
nRen = length(yC);
nCol = length(xC);

% Coordenadas de todos los nodos posibles (originales y posibles Steiner)
P = [];
for i=1:length(xC)
   for j=1:length(yC)
      P = [P;xC(i) yC(j)];
   end
end

% �ndices de los nodos originales
[nc,~] = size(C);
[np,~] = size(P);
ind = [];
k = 1;
for i=1:nc
   for j=1:np
      if sum(C(i,:)==P(j,:))==2
         ind = [ind j];
         k = k + 1;
      end
   end
end
ind = sort(ind);

% Todas las aristas posibles y las coordenadas de su centro para graficar
A = [];  % Aristas posibles
T = [];  % Coordenadas del centro de la arista
for i=1:nRen:nRen*(nCol-1)
   for j=0:nRen-1
      A = [A; [i+j i+j+nRen]];
      T = [T;[(P(i+j,1)+P(i+j+nRen,1))/2 (P(i+j,2)+P(i+j+nRen,2))/2]];
   end
end

for i=1:nRen:nRen*nCol
   for j=0:nRen-2
      A = [A; [i+j i+j+1]];
      T = [T;[(P(i+j,1)+P(i+j+1,1))/2 (P(i+j,2)+P(i+j+1,2))/2]]; 
   end
end

