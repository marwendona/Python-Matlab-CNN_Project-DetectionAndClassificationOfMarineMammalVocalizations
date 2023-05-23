close all
clear all
clc
[y,Fs] = audioread('BEL2_fe96kHZ.wav');
N = size(y,1);
NFFT = 2048;
window = 2048;
overlap = 80;
[S,f,T] = spectrogram(y,window,overlap,NFFT,Fs );
figure (1)
imagesc(abs(S));
saveas(gcf,'Signal_sans_bruit.png');

for i1=0:1
    for i2=0:9
        for i3=0:9
            for i4=0:9
                for i5=0:9
                    if (i1==0 & i2==0 & i3==0 & i4==0 & i5==0)
                        i=strcat('classe10_snapshot_raw_long_00001.wav');
                    else
                        i=strcat('classe10_snapshot_raw_long_',int2str(i1),int2str(i2),int2str(i3),int2str(i4),int2str(i5),'.wav');
                    end
                    [x,Fx] = audioread(i);
                    Nx = size(x,1);
                    z = zeros(floor((N-Nx)/2),1);
                    x1 = [x;z];
                    z = zeros(N-size(x1,1),1);
                    x1 = [z;x1];
                    u =(500.*x1) + y;
                    [Sb,fb,Tb] = spectrogram(u,window,overlap,NFFT,Fs );
                    figure
                    imagesc(abs(Sb));
                    b=strcat('classe10_snapshot_raw_long_',int2str(i1),int2str(i2),int2str(i3),int2str(i4),int2str(i5),'.png');
                    if (i1==0 & i2==0 & i3==0 & i4==0 & i5==0)
                        saveas(gcf,'classe10_snapshot_raw_long_00001.png');
                    else
                        saveas(gcf,b);
                    end
                end
            end
        end
    end
end

% noise = wgn(N,1,1);
% u = y + noise;

% u = awgn(y,1);

% se = norm(y,2)^2/N; %puissance du signal original 
% SNR = input('Entrer la valeur désirée du rapport SNR :'); 
% ec = se/(10^(SNR/10)); 
% brui = 0.2*sqrt(ec)*randn(N,1); 
% ne = norm(brui,2)^2/N; 
% RSB = 10*log10(se/ne); 
% fprintf('Estimated SNR=%f\n',RSB); 
% u = y + brui;