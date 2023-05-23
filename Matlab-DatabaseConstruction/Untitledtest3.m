close all
clear all
clc
signalName = 'BEL1_fe96kHz';
[y,Fs] = audioread(strcat('Base de données 30-04-2019/', signalName,'.wav'));
N = size(y,1);
NFFT = 2048;
window = 2048;
overlap = 80;
[S,f,T] = spectrogram(y,window,overlap,NFFT,Fs);

nbOfFiles = 1000;
nbOfTraining = 0.6 * nbOfFiles;
%d = uigetdir(pwd, 'Select a folder');
Files=dir('10 classes/classe5_cetace_clic/classe5_raw_long/*.wav');
Files = Files(randperm(length(Files)));
for k=1:nbOfFiles
   i=Files(k).name;
   [x,Fx] = audioread(i);
   Nx = size(x,1);
   x1 = x;
   y1 = y;
   if (Nx < N)
       z = zeros(floor((N-Nx)/2),1);
       x1 = [x;z];
       z = zeros(N-size(x1,1),1);
       x1 = [z;x1];
   else
       z = zeros(floor((Nx-N)/2),1);
       y1 = [y;z];
       z = zeros(Nx-size(y1,1),1);
       y1 = [z;y1];
   end 
    u =(500.*x1) + y1;
    rsb=10*log10((y1.^2)/(x1.^2))
   [Sb,fb,Tb] = spectrogram(u,window,overlap,NFFT,Fs );
   imagesc(abs(Sb));
   if (k <= nbOfTraining)
       saveas(gcf,strcat('C:/Datasets/PetImages/TRAIN/', signalName, '_', strrep(i, '.wav', ''), '.png'));
   else 
       saveas(gcf,strcat('C:/Datasets/PetImages/TEST/', signalName, '_', strrep(i, '.wav', ''), '.png'));
   end
end