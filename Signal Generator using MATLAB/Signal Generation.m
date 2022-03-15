Msg1= 'What is the Sampling frequency? ';
SamplingFrequency=input(Msg1);
Msg2= 'What is the Start Time? ';
StartTime=input(Msg2);
Msg3= 'What is the End Time? ';
EndTime=input(Msg3);
NumOfBreakPts = input('Enter number of Break Points: '); 

BreakPts = [];
BreakPts(1) = StartTime;   %Set start time at index 1
for i = 1:NumOfBreakPts
  BreakPts(i+1) = input(['Enter Position of Break Point ' num2str(i) ' : ']);   
end
BreakPts(NumOfBreakPts+2)= EndTime;   %Set end time at last index


% Signal Creation
tOP = [];
yOP = [];

for i = 1:NumOfBreakPts+1
    fprintf('Signal types: \n')
    fprintf(' 1. DC \n 2. Ramp \n 3. General Order Polynomial \n 4. Exponential \n 5. Sinusoidal \n')
    f = input('Choose Signal type: ');
    x_axis = linspace(BreakPts(i),BreakPts(i+1),(BreakPts(i+1)-BreakPts(i))*SamplingFrequency);
    switch f
        case 1
            Amp = input('The Amplitude of the signal is: ');
            y_axis = Amp * ones(1,length(x_axis));                  %Signal = y_axis values
        case 2
            Intercept = input('The Intercept of the signal is: ');
            Slope = input('The Slope of the signal is: ');
            y_axis = Slope * x_axis + Intercept;
        case 3
            order = input('Enter polynomial order: ');
            p=[];
            for i  = 1 : order+1
                p(i) = input(['Enter coefficient of X^' num2str(order+1-i) ' : ']);
            end
              y_axis = polyval(p,x_axis);
        case 4
            Amp = input('The Amplitude of the signal is: ');
            Exponent = input('The Exponent of the signal is: ');
            y_axis = Amp * exp(Exponent * x_axis);
        case 5
            Amp = input('The Amplitude of the signal is: ');
            Freq = input('The Frequency of the signal is: ');
            Phase = input('The Phase of the signal is: ');
            fprintf('Choose signal type \n 6. Sin \n 7. Cos: \n')
            Signal_Type = input('signal type is: ');
            switch Signal_Type
                case 6
                    y_axis = Amp * sin(Freq * x_axis + Phase);
                case 7
                    y_axis = Amp * cos(Freq * x_axis + Phase);
                otherwise
                    fprintf('TRY AGAIN.')
                return
            end
        otherwise
            fprintf('TRY AGAIN.')
        return 
    end
tOP = [tOP x_axis];
yOP = [yOP y_axis];        
end  

figure(1)
plot(tOP,yOP)
title('Original Signal')
xlabel('Time')
ylabel('Y Axis')
grid on    



