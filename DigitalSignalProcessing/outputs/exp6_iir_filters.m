% c=1: low-pass (fp<fst); c=2: high-pass (fp>fst).
c = input('1=LPF, 2=HPF: ');
Rp = input('Rp (dB) = ');
Rs = input('Rs (dB) = ');
fp = input('fp (Hz) = ');
fst = input('fst (Hz) = ');
fs = input('fs (Hz) = ');
[N,Wn] = buttord(2*fp/fs,2*fst/fs,Rp,Rs);
type = {'low','high'};
[b,a] = butter(N,Wn,type{c});
[H,f] = freqz(b,a,1024,fs);
N
cutoff = Wn*fs/2
G = 20*log10(abs(freqz(b,a,[fp fst],fs)))
t = 0:1/fs:0.05;
x = sin(2*pi*(fs/16)*t)+sin(2*pi*(0.45*fs)*t);
y = filter(b,a,x);
figure;
subplot(3,1,1); plot(f,20*log10(abs(H)+eps));
subplot(3,1,2); plot(t,x);
subplot(3,1,3); plot(t,y);
