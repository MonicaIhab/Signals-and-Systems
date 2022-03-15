% Signal Modification
    while(1)
     signalOperation = menu('Do you want to make an operation on the signal?', 'Amplitude Scaling', 'Time Reversal',   'Time Shift', 'Expanding the signal', 'Compressing the signal', 'None');
    tOperation = tOP;
    yOperation = yOP;
    
  switch (signalOperation)
    case 1 %'Amplitude Scaling'
      scale = input('Enter scale value: '); 
      yOperation = scale*yOP;
    case 2 %'Time Reversal'
      tOperation = fliplr(-tOP);
      yOperation = fliplr(yOP);
    case 3 %'Time Shift'
      shift = input('Enter shift value: '); 
      tOperation = tOP + shift;
    case 4 %'Expanding the signal'
      c = input('Enter expanding value: ');
      if c > 0
         NewStartTime = StartTime*c;
         NewEndTime = EndTime*c;
         Sample= (EndTime-StartTime)*SamplingFrequency*c;
         tOperation= linspace(NewStartTime,NewEndTime,Sample);
         yOperation=resample(yOP,c,1);  
      else
         fprintf('ENTER A VALID VALUE.')
      end
    case 5 %'Compressing the signal'
      c = input('Enter compressing value: ');
      if c > 0
         NewStartTime = StartTime/c;
         NewEndTime = EndTime/c;
         Sample= (EndTime-StartTime)*SamplingFrequency/c;
         tOperation= linspace(NewStartTime,NewEndTime,Sample);
         yOperation=downsample(yOP,c);
      else
         fprintf('ENTER A VALID VALUE.')
      end
    otherwise break;
  end
  
  figure(2)
  plot(tOperation, yOperation)
  title('Modified Signal')
  xlabel('Time')
  ylabel('Y Axis')
  grid on
  
    end 
