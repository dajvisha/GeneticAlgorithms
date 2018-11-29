function graficaSteiner(varargin)

% graficaSteiner('i',xC,yC,P,ind,A,T)
% inicializaci�n
% xC, yC: coordenadas de las marcas (ticks)
%      P: coordenadas de todos los nodos
%    ind: �ndices de los nodos originales
%
% graficaSteiner('n')
% grafica de los nodos 
%
% graficaSteiner('a')
% grafica de todas las aristas 
%
% graficaSteiner('g',G)
% grafica del grafo
%
% see also: inicializaSteiner costoSteiner

% Manuel Valenzuela
% 29 octubre 2014


persistent xticks yticks P ind A T nT xC yC np

if isequal(varargin{1},'i')
   % inicializaci�n
   xC = varargin{2};
   yC = varargin{3};
   xticks = cell(length(xC));
   yticks = cell(length(yC));
   for i=1:length(xC)
      xticks{i} = sprintf('%4.2f',xC(i));
   end
   for i=1:length(yC)
      yticks{i} = sprintf('%4.2f',yC(i));
   end
   P = varargin{4};
   ind = varargin{5};
   %nRen = length(yC);
   %nCol = length(xC);
   A = varargin{6};
   T = varargin{7};
   [nT,~] = size(T);
   [np,~] = size(P);
   
elseif isequal(varargin{1},'n')
   cuadros(xC,yC,xticks,yticks)
   hold on
   plot(P(:,1),P(:,2),'.b',P(ind,1),P(ind,2),'or')
   hold off
   dt = 0.03;
   for i=1:np
      text(P(i,1)+dt,P(i,2)+dt,sprintf('%d',i))
   end

elseif isequal(varargin{1},'ng')
   cuadros(xC,yC,xticks,yticks)
   hold on
   plot(P(ind,1),P(ind,2),'or',P(ind,1),P(ind,2),'.b')
   hold off
   dt = 0.03;
   for i=1:length(ind)
      text(P(ind(i),1)+dt,P(ind(i),2)+dt,sprintf('%d',ind(i)))
   end
   
elseif isequal(varargin{1},'a')
   cuadros(xC,yC,xticks,yticks)
   for i=1:nT
      text(T(i,1),T(i,2),sprintf('%d',i))
   end

elseif isequal(varargin{1},'g')
   G = varargin{2};
   % cuadros(xC,yC,xticks,yticks)
   hold on
   plot(P(:,1),P(:,2),'.b',P(ind,1),P(ind,2),'or')
   for i=1:length(G)
      a = A(G(i),:);
      plot([P(a(1),1) P(a(2),1)],[P(a(1),2) P(a(2),2)],'-b')
      text(T(G(i),1),T(G(i),2),sprintf('%d',G(i)))
   end
   dt = 0.03;
   for i=1:length(ind)
      text(P(ind(i),1)+dt,P(ind(i),2)+dt,sprintf('%d',ind(i)))
   end
   hold off

end


function cuadros(xC,yC,xticks,yticks)
d = 0.4;
xlim([min(xC)-d max(xC)+d])
ylim([min(yC)-d max(yC)+d])  
%xlabel('x')
%ylabel('y')
set(gca,'XTick',xC)
set(gca,'YTick',yC)
set(gca,'XTickLabel',xticks)
set(gca,'YTickLabel',yticks)
grid on