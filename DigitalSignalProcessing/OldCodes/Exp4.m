N=input('Enter the number of Points in DFT ');
x = input('Enter the sequence for which DFT is to be calculated ');
n=[0:1:N-1];
k=[0:1:N-1];
WN=exp(-1j*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=x*WNnk;
MagX=abs(Xk); % Magnitude of calculated DFT
PhaseX=angle(Xk)*180/pi; % Phase of the calculated DFT figure(1);
subplot(2,1,1);
plot(k,MagX);
title('Magnitude response');
subplot(2,1,2);
plot(k,PhaseX);
title('Phase Response');
