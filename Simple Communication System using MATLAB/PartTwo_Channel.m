%PartTwo: Channel
fprintf('Choose one of the following impulse responses: \n 1.Delta Function \n 2.exp(-2pi*5000t) \n 3.exp(-2pi*1000t) \n 4.2*Delta(t)+0.5*Delta(t-1) \n');
f= input('Type here: ');
switch f
case 1 
    h1 = zeros(5*Fs,1);
    h1(1)= 1;
    Yo=conv(Y,h1);
case 2
    h2=exp(-2*pi*5000*t);
    Yo=conv(Y,h2); 
case 3
    h3=exp(-2*pi*1000*t);
    Yo=conv(Y,h3);
case 4 
    
  h4=zeros(5*Fs,1);
  h4(1)=2;
  h4(5*Fs+1)=0.5;
    
    
    
%     t4=0:0.01:1;
%     delta_1=(t4==0);
%     delta_2=(t4==1);
%     h4=2*delta_1+0.5*delta_2;
    Yo=conv(Y,h4);
 otherwise 
        fprintf('invalid input');
 return

end    

t1=linspace(0,5,length(Yo));
figure(3)
plot(t1,Yo)
title('Convoluted Sound in Time Domain')

Yc=fftshift(fft(Yo)); 
Ycmag=abs(Yc);
Ycphase=angle(Yc)*(180/pi);
Fvec=linspace(-Fs/2,Fs/2,length(Yc)); 
figure(4);
subplot(1,2,1)
plot(Fvec,Ycmag); 
title('Magnitude Spectrum in FD (CS)')
subplot(1,2,2)
plot(Fvec,Ycphase); 
title('Phase Spectrum in FD (CS)')

sound(Yo,Fs);
pause (5)
