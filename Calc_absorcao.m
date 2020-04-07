function [Zs  H  R]= Calc_absorcao(H12I,H12II,x1,k,S,Z0)
%% Parâmetros de entrada:
% H1A=H12: H(f) de incidência
% H21:H1B H(f) de reflexão
% x1: distância entre o microfone mais afastado e amostra + gap[m]
% k: N° de onda com efeito viscotérmico do Ar
% s: distancia entre os microfones [m]

%% Parâmetros de Saída:
% Coeficiente de absorção do material

%% Cálculo da variável de saída
H=(H12I.^0.5./H12II.^0.5);      % função transferência corrigida: H1A(f)/H1B(f)
Hc=(H12I.*H12II).^0.5;          % fator de calibração para n° grande de amostras
Hl=exp(-1i.*k*S);            % função transferência para as ondas de incidência
HR=exp(1i.*k*S);             % função transferência para as ondas de reflexão
Hsub=H./Hc;                  % H(f) subsequente com fator de calibração para N° grandes amostras
R=((H-Hl)./(HR-H)).*exp(2*1i*k*x1); % fator de reflexão
Zs=Z0.*((1+R)./(1-R));           % Impedância acústica do material
end