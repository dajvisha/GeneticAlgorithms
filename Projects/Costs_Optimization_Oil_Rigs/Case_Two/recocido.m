function r = recocido(p,varargin)

% r = recocido(p)
% r = recocido(p,c0)
% r = recocido(p,c0,semilla)
%
% Implementa recocido simulado. El parámetro p debe ser una estructura con 
% los siguientes campos:
%     cadIntAcep: longitud de cadena en intentos aceptados
%         cadInt: longitud máxima de cadena en intentos
%         maxCad: número máximo de cadena de Markov sin mejora
%        frecImp: frecuencia de impresión de mejor encontrado
%             x0: estado inicial
%         FcnObj: función objetivo
%         FcnVec: función de vecindad
%            Imp: función de impresión de estado
%        variarC: bandera que indica si se varía la temperatura dentro de
%                 las cadenas de Markov (default = 0)
%           alfa: constante para disminuir la temperatura
%           beta: razón de aumento de temperatura en cálculo de temperatura
%                 inicial
%     minRazAcep: mínima razón de aceptación para cálculo de temperatura
%                 inicial
%            min: bandera que indica si se está minimizando (default = 1)
%
% See also: blocal, plotblocal, plotRecocido

%*****************************************************************
%*                                                               *
%*   Recocido: Una implemetación de recocido simulado en MATLAB  *
%*                                                               *
%*   Copyright (c) Derechos Reservados                           *
%*   Manuel Valenzuela Rendón                                    *
%*   valenzuela@itesm.mx                                         *
%*   http://homepages.mty.itesm.mx/valenzuela                    *
%*                                                               *
%*   Tecnológico de Monterrey, Campus Monterrey                  *
%*   Monterrey, N.L., México                                     *
%*                                                               *
%*****************************************************************

global mejor params res intentos c MIN

if isfield(p,'min') && ~isempty(p.min)
   MIN = p.min;
else
   MIN = 1;
end

% Fijar la temperatura inicial si se proporciona
if length(varargin)>=1
   c = varargin{1};
else
   c = 0; % Se usará como bandera para calcular c0
end

% Utilizar la semilla si se proporciona
if length(varargin)>=2
   rand('twister', varargin{2});
end
  
params = p;
intentos = 1;
% Inicializar u con el punto x0, e inicializar mejor
u.x = params.x0;
u.f = params.FcnObj(u.x);
mejor = u;
mejor.intentos = intentos;

% Inicializar res
res.x = u.x';
res.uf = u.f;
res.ux = u.x';
res.f = u.f;
res.c = c;
res.intentos = intentos;

if c==0                 
   % Si no hay temperatura inicial, calcularla con valor inicial 0.1
   c = 0.1;
   res.c = c;
   u = TempInicial(u); 
   fprintf('temperatura inicial calculada =%7.4f\n', c);
end

Recocido(u);
fprintf('Mejor punto encontrado:\n')
params.Imp(mejor)
fprintf('\n')

r = res;

function u = EvaluaPunto(u)
%*******************************************
% Evalua un punto u y guarda su evaluacion *
%*******************************************
global mejor params res intentos c MIN
u.f = params.FcnObj(u.x);
intentos = intentos + 1;
if MIN
   if u.f < mejor.f
      mejor = u;
      mejor.intentos = intentos;
   end
else
   if u.f > mejor.f
      mejor = u;
      mejor.intentos = intentos;
   end
end
if mod(intentos,params.frecImp)==0
   res.x = [res.x; mejor.x'];
   res.f = [res.f; mejor.f];
   res.ux = [res.ux; u.x'];
   res.uf = [res.uf; u.f];
   res.intentos = [res.intentos; intentos]; 
   res.c = [res.c; c];
   params.Imp(mejor,u,intentos,c);
end

function b = AceptaIntento(u, v)
%*******************************************
% Regresa verdadero (1) si se debe aceptar *
% un punto nuevo v dado un punto viejo u   *
%*******************************************
global c MIN
if MIN
   if v.f <= u.f
      b = 1;
   else
      b = rand < exp(-(v.f-u.f)/c);
   end
else
   if v.f >= u.f
      b = 1;
   else
      b = rand < exp((v.f-u.f)/c);
   end   
end

function [uFinal,razonAceptacion] = CadenaMarkov(u)
%*******************************
% Ejecuta una cadena de Markov *
%*******************************
global params c MIN
intentos = 0;
intentosAceptados = 0;
while intentosAceptados<params.cadIntAcep && ...
      intentos<params.cadInt
   v.x = params.FcnVec(u.x);
   v = EvaluaPunto(v);
   intentos = intentos + 1;
   if AceptaIntento(u, v)
      if params.variarC
         % Calcular nueva temeperatura
         if MIN
            c = c*v.f/u.f;
         else
            c = c*u.f/v.f;
         end
      end
      u = v;
      intentosAceptados = intentosAceptados + 1;
   end
end
razonAceptacion = 1.0*intentosAceptados/intentos;
uFinal = u;

function uFinal = Recocido(u)
%**********************************************
% Implementa el algoritmo basico de recocido; *
% regresa el ultimo punto visitado            *
%**********************************************
global params c MIN
cadSinMejora = 0;
anterior = u;
while (cadSinMejora < params.maxCad);
   u = CadenaMarkov(u);
   if MIN&&(u.f>=anterior.f) || ~MIN&&(u.f<=anterior.f)
      cadSinMejora = cadSinMejora + 1;
   else
      cadSinMejora = 0;
   end
   anterior = u;
   c = c*params.alfa;
end
uFinal = u;

function u0 = TempInicial(u)
%************************************
% Calcula la temperatura inicial c0 *
%************************************
global params c 
while 1
   [u,razonAceptacion] = CadenaMarkov(u);
   if razonAceptacion >= params.minRazAcep
      break
   end
   c = c*params.beta;
end
u0 = u;

