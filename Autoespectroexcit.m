%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                 Autoespectroexcit                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ESTE SCRIPT DEVE SER EXECUTADO ATRAV�S DA ROTINA "Main_TuboImpedancia.m"




% Este Script cria vari�veis para o sinal de excita��o nos dom�nios tempo e
% frequ�ncia, bem como calcula o auto-espectro do sinal de excita��o;

%Op��es: 1-ruidobranco;
        


%Lista de vari�veis:
%  x_rb (Sinal de excita��o no dom�nio do tempo)
%  X_rb  (Sinal de excita��o no dom�nio da frequ�ncia)
%  nfft (N�mero de pontos do sinal)
%  Sxx_rb (Auto-espectro do sinal de excita��o)
%  F (Vetor de frequ�ncias)
%  pref (Press�o de refer�ncia [20*10^-6 Pa])
%%
x_rb=ruidobranco.time; %Sinal de excita��o no dom�nio do tempo
X_rb=ruidobranco.freq;%Sinal de excita��o no dom�nio da frequ�ncia
%%
[Sxx_rb,F]= cpsd(x_rb,x_rb,hanning(nfft/2),[],nfft,Fs,'twosided'); %(Welch)Auto-espectro do sinal de excita��o
pref=20*10^-6; %Press�o de refer�nciaFs=441
