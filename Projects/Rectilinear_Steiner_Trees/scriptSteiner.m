%% Arboles de Steiner

% Datos
% Coordenadas de los datos originales
C = [0 6; 5 0; 2 5; 4 8; 9 3; 10 6; 2 9; 8 0; 15 4];
% C = [2 2; 11 7; 0 1; 3 0; 5 2; 11 1; 7 9; 6 2; 6 1; 1 8];

% Inicializa Steiner
% Obtiene los datos de todos los nodos y aristas posibles.
[xC, yC, P, ind, A, T] = inicializaSteiner(C);
costoSteiner(A,P,ind)

%% Grafica nodos de Steiner

clf

% Se inicializan datos de grafica
graficaSteiner('i', xC, yC, P, ind, A, T)

% Se grafican solo los nodos originales
graficaSteiner('ng')

pause

% Se grafican los nodos originales y los nodos de Steiner
graficaSteiner('n')
%% Grafica de todas las aristas posibles

clf

% Se grafican todas las aristas
graficaSteiner('a')
%% Algortimo genetico

Targ = size(T);
Targ = Targ(1);
popsize = 600;
resultsGrafica = [];

pop = populationinit(Targ, popsize);

for i = 1:1000
    pop = seleccion(pop);
    pop = cruzaMuta(pop);
    [G, costo] = evaluator(pop);
    resultsGrafica = [resultsGrafica; costo];
end

% Grafica resultado mejor encontrado con AG
[G, costo] = evaluator(pop);
disp(G);

% Se calculan los costos del grafo G
[costoTotal, conectividad] = costoSteiner(G)
% Se grafica el grafo G
graficaSteiner('g',G)
title(sprintf('costoTotal=%f conectividad=%f',costoTotal,conectividad))

%% Costos de un ?rbol de Steiner

% Se inicializan datos para calcular el costo
costoSteiner(A,P,ind)
% Se calculan los costos del grafo G
[costoTotal,conectividad] = costoSteiner(G)

pause

figure(1)
plot(resultsGrafica)
grid

