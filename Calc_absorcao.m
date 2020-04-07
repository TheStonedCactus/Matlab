function [Zs  H  R]= Calc_absorcao(H12I,H12II,x1,k,S,Z0)
%% Par�metros de entrada:
% H1A=H12: H(f) de incid�ncia
% H21:H1B H(f) de reflex�o
% x1: dist�ncia entre o microfone mais afastado e amostra + gap[m]
% k: N� de onda com efeito viscot�rmico do Ar
% s: distancia entre os microfones [m]

%% Par�metros de Sa�da:
% Coeficiente de absor��o do material

%% C�lculo da vari�vel de sa�da
H=(H12I.^0.5./H12II.^0.5);      % fun��o transfer�ncia corrigida: H1A(f)/H1B(f)
Hc=(H12I.*H12II).^0.5;          % fator de calibra��o para n� grande de amostras
Hl=exp(-1i.*k*S);            % fun��o transfer�ncia para as ondas de incid�ncia
HR=exp(1i.*k*S);             % fun��o transfer�ncia para as ondas de reflex�o
Hsub=H./Hc;                  % H(f) subsequente com fator de calibra��o para N� grandes amostras
R=((H-Hl)./(HR-H)).*exp(2*1i*k*x1); % fator de reflex�o
Zs=Z0.*((1+R)./(1-R));           % Imped�ncia ac�stica do material
end