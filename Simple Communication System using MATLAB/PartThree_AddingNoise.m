%PartThree: Adding Noise
sigma=input('Enter Sigma: ');
z=sigma.*randn(1, length(Yo));
Y=Yo+z;
sound (Y,Fs)
pause(5) 

t=linspace(0,5,length(Y));
figure(5)
plot(t,Y);
title('Sound in Time Domain After Adding Noise')

Yf=fftshift(fft(Y)); 
Yfmag=abs(Yf);
Yfphase=angle(Yf)*(180/pi);
Fvec=linspace(-Fs/2,Fs/2,length(Y)); 
figure(6);
subplot(1,2,1)
plot(Fvec,Yfmag); 
title('Mag Spectrum in FD (After Noise)')
subplot(1,2,2)
plot(Fvec,Yfphase); 
title('Phase Spectrum in FD (After Noise)')

