function sep_pbpcp(mixture,sisec,k,outDir)
% sep_pbpcp: Separation using Polar n-Bicomplex PCP. For SMARD, requires
% soprano which contains the first six channels of "44_soprano".

%	Tak-Shing Chan, 20160505

global soprano;

if sisec
    % 2-channel SiSEC
    [~,name] = fileparts(mixture);
    x = load_audio(mixture,sisec,false,false);

    % Perform short-time Fourier transforms
    X = cat(3,stft1411(x(:,1)'),stft1411(x(:,2)'));

    % Polar 2-Bicomplex PCP
    [A,E] = ialm_pbpcp(X,k/sqrt(length(X)),1e-7,1000);
    a = [istft1411(A(:,:,1))' istft1411(A(:,:,2))'];
    audiowrite(fullfile(outDir,[name '_A.wav']),wavnormalize(a),22050);
    e = [istft1411(E(:,:,1))' istft1411(E(:,:,2))'];
    audiowrite(fullfile(outDir,[name '_E.wav']),wavnormalize(e),22050);
else
    % 6-channel SMARD
    [~,name,ext] = fileparts(mixture);
    x = load_audio(mixture,sisec,true,false)+soprano;

    % Perform short-time Fourier transforms
    X = cat(3,stft1411(x(:,1)'),stft1411(x(:,2)'),stft1411(x(:,3)'),stft1411(x(:,4)'),stft1411(x(:,5)'),stft1411(x(:,6)'));

    % Polar 6-Bicomplex PCP
    [A,E] = ialm_pbpcp(X,k/sqrt(length(X)),1e-7,1000);
    a = [istft1411(A(:,:,1))' istft1411(A(:,:,2))' istft1411(A(:,:,3))' istft1411(A(:,:,4))' istft1411(A(:,:,5))' istft1411(A(:,:,6))'];
    audiowrite(fullfile(outDir,[name ext '_A.wav']),wavnormalize(a),22050);
    e = [istft1411(E(:,:,1))' istft1411(E(:,:,2))' istft1411(E(:,:,3))' istft1411(E(:,:,4))' istft1411(E(:,:,5))' istft1411(E(:,:,6))'];
    audiowrite(fullfile(outDir,[name ext '_E.wav']),wavnormalize(e),22050);
end
