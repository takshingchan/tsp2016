function eval_smard(source,outDir)
% eval_smard: SMARD evaluation. Requires soprano which contains the first
% six channels of "44_soprano".

%	Tak-Shing Chan, 20160505

global soprano;

[~,name,ext] = fileparts(source);
s1 = soprano;
s1 = repmat(s1,[1,7-size(s1,2)]);
s2 = load_audio(source,false,true,false);
s2 = repmat(s2,[1,7-size(s2,2)]);
s12 = [reshape(s1,[1 30*22050 6]);reshape(s2,[1 30*22050 6])];
x = s1+s2;
xx = [reshape(x,[1 30*22050 6]);reshape(x,[1 30*22050 6])];

% Load separation results
se1 = audioread(fullfile(outDir,[name ext '_E.wav']));
se1 = repmat(se1,[1,7-size(se1,2)]);
se1 = [se1;zeros(length(s1)-length(se1),6)];
se2 = audioread(fullfile(outDir,[name ext '_A.wav']));
se2 = repmat(se2,[1,7-size(se2,2)]);
se2 = [se2;zeros(length(s2)-length(se2),6)];
se12 = [reshape(se1,[1 30*22050 6]);reshape(se2,[1 30*22050 6])];

% Normalize to prevent artificial boosting
[SDR,ISR,SIR,SAR] = bss_eval_images(se12/norm(mean(sum(se12),3)),s12/norm(mean(sum(s12),3)));
[NSDR,NISR,NSIR,NSAR] = bss_eval_images(xx/norm(mean(sum(xx),3)),s12/norm(mean(sum(s12),3)));
NSDR = SDR-NSDR;
NISR = ISR-NISR;
NSIR = SIR-NSIR;
NSAR = SAR-NSAR;
save(fullfile(outDir,[name ext '.mat']),'SDR','ISR','SIR','SAR','NSDR','NISR','NSIR','NSAR');
