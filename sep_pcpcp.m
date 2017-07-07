function sep_pcpcp(mixture,sisec,k,outDir)
% sep_pcpcp: Separation using Polar n-Complex PCP. For SMARD, requires
% soprano which contains the first six channels of "44_soprano".

%	Tak-Shing Chan, 20160505

global soprano;

if sisec
    % 2-channel SiSEC
    [~,name] = fileparts(mixture);
    x = load_audio(mixture,sisec,false,false);

    % Perform short-time Fourier transforms
    X1 = stft1411(x(:,1)');
    X2 = stft1411(x(:,2)');
    X = cat(3,real(X1),imag(X1),real(X2),imag(X2));

    % Polar 4-Complex PCP
    [A,E] = ialm_pbpcp(X,k/sqrt(length(X)),1e-7,1000);
    a = [istft1411(complex(A(:,:,1),A(:,:,2)))' istft1411(complex(A(:,:,3),A(:,:,4)))'];
    audiowrite(fullfile(outDir,[name '_A.wav']),wavnormalize(a),22050);
    e = [istft1411(complex(E(:,:,1),E(:,:,2)))' istft1411(complex(E(:,:,3),E(:,:,4)))'];
    audiowrite(fullfile(outDir,[name '_E.wav']),wavnormalize(e),22050);
else
    % 6-channel SMARD
    [~,name,ext] = fileparts(mixture);
    x = load_audio(mixture,sisec,true,false)+soprano;

    % Perform short-time Fourier transforms
    X1 = stft1411(x(:,1)');
    X2 = stft1411(x(:,2)');
    X3 = stft1411(x(:,3)');
    X4 = stft1411(x(:,4)');
    X5 = stft1411(x(:,5)');
    X6 = stft1411(x(:,6)');
    X = cat(3,real(X1),imag(X1),real(X2),imag(X2),real(X3),imag(X3),real(X4),imag(X4),real(X5),imag(X5),real(X6),imag(X6));

    % Polar 12-Complex PCP
    [A,E] = ialm_pbpcp(X,k/sqrt(length(X)),1e-7,1000);
    a = [istft1411(complex(A(:,:,1),A(:,:,2)))' istft1411(complex(A(:,:,3),A(:,:,4)))' istft1411(complex(A(:,:,5),A(:,:,6)))' istft1411(complex(A(:,:,7),A(:,:,8)))' istft1411(complex(A(:,:,9),A(:,:,10)))' istft1411(complex(A(:,:,11),A(:,:,12)))'];
    audiowrite(fullfile(outDir,[name ext '_A.wav']),wavnormalize(a),22050);
    e = [istft1411(complex(E(:,:,1),E(:,:,2)))' istft1411(complex(E(:,:,3),E(:,:,4)))' istft1411(complex(E(:,:,5),E(:,:,6)))' istft1411(complex(E(:,:,7),E(:,:,8)))' istft1411(complex(E(:,:,9),E(:,:,10)))' istft1411(complex(E(:,:,11),E(:,:,12)))'];
    audiowrite(fullfile(outDir,[name ext '_E.wav']),wavnormalize(e),22050);
end
