function [] = Gabriel()
    audioRecorder = audiorecorder(12500,8,1);
    
    name = 'jonaras';
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'1.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'2.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'3.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'4.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'5.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'6.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'7.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'8.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'9.wav'),audioData, 12500);
    
    disp('Press enter to record');
    w = waitforbuttonpress;
    recordblocking(audioRecorder,2);
    audioData = getaudiodata(audioRecorder);
    audiowrite(strcat(name,'0.wav'),audioData, 12500);
    
    

end

