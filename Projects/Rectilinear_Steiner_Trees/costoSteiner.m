function [costoTotal,conectividad] = costoSteiner(varargin)

% costoSteiner(A,P,ind)
% Inicializa con todas las aristas A, las coordenadas de todos los nodos
% posibles P, y los �ndices de los nodos originales.
%
% [costoTotal,conectividad] = costoSteiner(G)
% Regresa el costoTotal (distancia) y el grado de conectividad de un grafo
% G.
% see also: inicializaSteiner graficaSteiner

% Manuel Valenzuela
% 29 octubre 2014


persistent costo A P nA nP ind

TOOLBOX_BIOINFORMATICA = 1;

if length(varargin)==3
   A = varargin{1};
   P = varargin{2};
   ind = varargin{3};
   [nA,~] = size(A);    
   [nP,~] = size(P);
   costo = zeros(nA,1);
   for i=1:nA
      costo(i,1) = norm(P(A(i,1),:)-P(A(i,2),:));
   end
else
   G = varargin{1};
   unos = zeros(nA,1);
   unos(G) = 1;
   costoTotal = unos'*costo;
   %conectividad = 1;
   
   origen = (A(G,1))';
   destino = (A(G,2))';
   
   if TOOLBOX_BIOINFORMATICA
      g = sparse(origen,destino,1,nP,nP);
      [~,cc] = graphconncomp(g,'WEAK',true);
   else
      g = sparse([origen destino],[destino origen],1,nP,nP);
      cc = scomponents(g);
   end
   
   cci = cc(ind);
   cci = cci-min(cci)+1;
   cciu = unique(cci);
   conteo = zeros(size(cciu));
   for i=1:length(cciu)
      conteo(i) = length(find(cci==cciu(i)));
   end
   conectividad = norm(conteo)/length(ind);
end