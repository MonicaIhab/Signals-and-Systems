%PartFour: Signal Filter
LPF=ones(length(Y),1);
LPF([1:93250 127250:end])=0;
Signal = Yf.*LPF'; 
FinalSignal= real(ifft(ifftshift(Signal)));

sound(FinalSignal,Fs)
pause(5)

t=linspace(0,5,length(Y));
figure(7)
plot(t,FinalSignal);
title('Sound in Time Domain (After LPF)')

 
Yfmag=abs(Signal);
Yfphase=angle(Signal)*(180/pi);
Fvec=linspace(-Fs/2,Fs/2,length(Y)); 
figure(8);
subplot(1,2,1)
plot(Fvec,Yfmag); 
title('Mag Spectrum in FD (After LPF)')
subplot(1,2,2)
plot(Fvec,Yfphase); 
title('Phase Spectrum in FD (After LPF)')
