% Window columns: rectangular, triangular, Hann, Hamming, Blackman.
fs = 1000; fp = 200; fst = 300; M = 60;
Wn = (fp+fst)/fs;
w = [rectwin(M+1) triang(M+1) hann(M+1) hamming(M+1) blackman(M+1)];
for i = 1:5
    [HL(:,i),f] = freqz(fir1(M,Wn,'low',w(:,i)),1,512,fs);
    HH(:,i) = freqz(fir1(M,Wn,'high',w(:,i)),1,512,fs);
end
GL = 20*log10(abs(HL)+eps);
GH = 20*log10(abs(HH)+eps);
ripple = max(abs(GL(f<=fp,:)))
atten = -max(GL(f>=fst,:))
figure;
subplot(2,1,1); plot(f,GL);
subplot(2,1,2); plot(f,GH);
