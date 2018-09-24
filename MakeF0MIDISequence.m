
%% Make (fractal) MIDI melodies sequences from R time series

%Directory of time series
addpath('C:\Users\Parker\Dropbox\1fNoiseSchaffer\FractalClicks\F0_Fractal\');

%Load in time series
load H0.75.mat %load in time series of MIDI note values from R

%Create sequence
seq = [];
for x = 1:length(TS.y_MP)
    note = createnmat(TS.y_MP(x)); 
    note = setvalues(note,'onset',(1*x)); %start onset in beats
    note = setvalues(note,'dur',1); %note duration in beats
%     note = setvalues(note,'onset',(0.5*x),'sec'); %start onset in sec
%     note = setvalues(note,'dur',0.5,'sec'); %note duration in sec
    seq = [seq; note];
    
end

%Write MIDI file
writemidi(seq,'testmelody1.mid',100);


