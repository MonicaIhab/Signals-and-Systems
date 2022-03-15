%PartOne: Transmitter
[Y,Fs]=audioread('soundtrack.mp3'); 
Y=Y(1:5*Fs);
mono=Y(:,1);

sound(Y,Fs);
pause (5)

t=linspace(0,5,5*Fs);
figure(1)
plot(t,Y);
title('Sound in Time Domain (Original Sound)')

Yf=fftshift(fft(Y)); 
Yfmag=abs(Yf);
Yfphase=angle(Yf)*(180/pi);
Fvec=linspace(-Fs/2,Fs/2,5*Fs); 
figure(2);
subplot(1,2,1)
plot(Fvec,Yfmag); 
title('Magnitude Spectrum in FD (OS)')
subplot(1,2,2)
plot(Fvec,Yfphase); 
title('Phase Spectrum in FD (OS)')












  
