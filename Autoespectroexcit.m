%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                 Autoespectroexcit                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ESTE SCRIPT DEVE SER EXECUTADO ATRAVÉS DA ROTINA "Main_TuboImpedancia.m"




% Este Script cria variáveis para o sinal de excitação nos domínios tempo e
% frequência, bem como calcula o auto-espectro do sinal de excitação;

%Opções: 1-ruidobranco;
        


%Lista de variáveis:
%  x_rb (Sinal de excitação no domínio do tempo)
%  X_rb  (Sinal de excitação no domínio da frequência)
%  nfft (Número de pontos do sinal)
%  Sxx_rb (Auto-espectro do sinal de excitação)
%  F (Vetor de frequências)
%  pref (Pressão de referência [20*10^-6 Pa])
%%
x_rb=ruidobranco.time; %Sinal de excitação no domínio do tempo
X_rb=ruidobranco.freq;%Sinal de excitação no domínio da frequência
%%
[Sxx_rb,F]= cpsd(x_rb,x_rb,hanning(nfft/2),[],nfft,Fs,'twosided'); %(Welch)Auto-espectro do sinal de excitação
pref=20*10^-6; %Pressão de referênciaFs=441
