# audioprint
Introduction to Computer Vision and Pattern Recognition project at Pace University, teached by Dr. S. Cha

This a project for a security system based on the user's voice. The user configures a phrase or a word in a timeframe and this audio is verified with a query audio to authorize the access.

Click [here] (https://docs.google.com/document/d/19VL59InzSMcHKa_NnzqVeg8E_chuJ42QnGANKuoZtzg/edit?usp=sharing) to see the full project description

#How to run it in MATLAB

* Fork the repo and add the folder in MATLAB Path.
* open the inputScript.m and modify the variables puting your own .wav file:
  ```
  speech = audioread('yourfile.wav');
  
  info = audioinfo('yourfile.wav');
  ```
* Run the inputScript.m
* Run the myNeuralNetFunction puting the MFCC generated as a parameter:

  ```
  myNeuralNetFunction(MFCC);
  ```

The neural net output is a number between 0 and 1 and it represents the audio similarity with the preset user's audio.

#How to create a new Neural Net

* Run the our_script.m script and create a new neural net using the [MATLAB's toolbox] (http://www.mathworks.com/help/nnet/getting-started-with-neural-network-toolbox.html)
