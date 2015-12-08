%Define variables
Tw = 25;                % analysis frame duration (ms) /25
Ts = 10;                % analysis frame shift (ms) /10
alpha = 0.97;           % preemphasis coefficient /0.97
M = 20;                 % number of filterbank channels /20
C = 12;                 % number of cepstral coefficients /12
L = 22;                 % cepstral sine lifter parameter /22
LF = 300;               % lower frequency limit (Hz) /300 //begin in 176 through the end
HF = 3700;              % upper frequency limit (Hz) /3700

speech = audioread('lek.wav');

info = audioinfo('lek.wav');
sampling = info.SampleRate;

%Feature extraction (feature vectors as columns)
[ MFCCs, FBEs, frames ] = ...
    mfcc( speech, sampling,...
    Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );


% Generate data needed for plotting
    [ Nw, NF ] = size( frames );                                 % frame length and number of frames
    time_frames = [0:NF-1]*Ts*0.001+0.5*Nw/[sampling];  % time vector (s) for frames
    time = [ 0:length(speech)-1 ]/[sampling];           % time vector (s) for signal samples
    logFBEs = 20*log10( FBEs );                                  % compute log FBEs for plotting
    logFBEs_floor = max(logFBEs(:))-50;                          % get logFBE floor 50 dB below max
    logFBEs( logFBEs<logFBEs_floor ) = logFBEs_floor;            % limit logFBE dynamic range
    
    % Generate plots
    figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto', ...
        'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' );
    
    subplot( 311 );
    plot( time, speech, 'k' );
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' );
    ylabel( 'Amplitude' );
    title( 'Speech waveform');
    
    subplot( 312 );
    imagesc( time_frames, [1:M], logFBEs );
    axis( 'xy' );
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' );
    ylabel( 'Channel index' );
    title( 'Log (mel) filterbank energies');
    
    subplot( 313 );
    imagesc( time_frames, [1:C], MFCCs(2:end,:) ); % HTK's TARGETKIND: MFCC
    %imagesc( time_frames, [1:C+1], MFCCs );       % HTK's TARGETKIND: MFCC_0
    axis( 'xy' );
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' );
    ylabel( 'Cepstrum index' );
    title( 'Mel frequency cepstrum' );
    
    preX = reshape(MFCCs, [1 , size(MFCCs, 1)*size(MFCCs, 2)]);
    preX(isnan(preX)) = 0;
    
    X = pdist2(preX,line_MFCCs(,:),'euclidean');
    
    
    clear dataset i j l aux info Tw Ts alpha M C L LF MFCCs HF frames FBEs...
    speech time_frames time Nw NF logFBEs_floor logFBEs z