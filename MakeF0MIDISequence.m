
%% Make (fractal) MIDI melodies sequences from R time series

%Directory of time series
files = dir('D:\R\Fractal Melodies\fractal-melodies\MAT files\*.mat');

% Create sequence
seq = [];

for ii = 1: length(files)
    
    % load in time series
    load(files(ii).name)
    
    for x = 1:length(TS.y_MP)
        note = createnmat(TS.y_MP(x)); 
        note = setvalues(note,'onset',(x-1)); % start onset in beats
        note = setvalues(note,'dur',1); % note duration in beats
    %     note = setvalues(note,'onset',(0.5*x),'sec'); %start onset in sec
    %     note = setvalues(note,'dur',0.5,'sec'); %note duration in sec
        seq = [seq; note];
        
    end
    
    % Write MIDI file
    writemidi(seq,strcat(files(ii).name(1:end-4), '.mid'), 120);
        
    % Reset sequence
    seq = [];

end

