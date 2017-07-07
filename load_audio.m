function x = load_audio(inFile,sisec,repet,downmix)
% load_audio: Load a 30-sec segment.

%	Tak-Shing Chan, 20160505

if sisec
    % 1'45" to 2'15" (SiSEC)
    x = audioread(inFile,[105 135]*44100);
    if downmix
        x = downsample(mean(x,2),2);
    else
        x = downsample(x,2);
    end
else
    % 0 to 30 s, Ch. 01 to 06 (SMARD)
    [pathstr,name,ext] = fileparts(inFile);
    smarData = loadSmarData(pathstr,[name ext]);
    m = min(length(smarData.dataMatrix),30*48000);
    if repet
        % loop music for 30 s
        x = smarData.dataMatrix(rem(0:30*48000-1,m)+1,1:6);
    else
        % zero pad to 30 s
        x = zeros(30*48000,6);
        x(1:m,1:6) = smarData.dataMatrix(1:m,1:6);
    end
    if downmix
        x = resample(mean(x,2),22050,48000);
    else
        x = resample(x,22050,48000);
    end
end
