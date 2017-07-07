function go(action,method,krange)
% go: Run experiments.
%
% Usage: go(action,method,krange) performs action:
%	'separation'  - Audio separation
%	'report'      - Report results
%
% using method:
%	'ctpcp_sisec' - Complex Tensor PCP on SiSEC
%	'pbpcp_sisec' - Polar n-Bicomplex PCP on SiSEC
%	'pcpcp_sisec' - Polar n-Complex PCP on SiSEC
%	'ctpcp_XX2X'  - Complex Tensor PCP on SMARD
%	'pbpcp_XX2X'  - Polar n-Bicomplex PCP on SMARD
%	'pcpcp_XX2X'  - Polar n-Complex PCP on SMARD
%       'ctpcp_smard' - Complex Tensor PCP on SMARD (report only)
%	'pbpcp_smard' - Polar n-Bicomplex PCP on SMARD (report only)
%	'pcpcp_smard' - Polar n-Complex PCP on SMARD (report only)

%	Tak-Shing Chan, 20160505

addpath tools;
global soprano;

switch method
    case 'ctpcp_sisec'
        label = 'Complex Tensor (SiSEC, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_sisec;
        files = importdata('sisec.txt','\n');
        mixtures = 'Datasets\MSD100\Mixtures\*\mixture.wav';
        sources = 'Datasets\MSD100\Sources\*';
        outDirs = 'TSP2016\SiSEC\ctpcp\#\*';
        outName = 'mixture';
        sisec = true;
    case 'pbpcp_sisec'
        label = 'Polar 2-Bicomplex (SiSEC, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_sisec;
        files = importdata('sisec.txt','\n');
        mixtures = 'Datasets\MSD100\Mixtures\*\mixture.wav';
        sources = 'Datasets\MSD100\Sources\*';
        outDirs = 'TSP2016\SiSEC\pbpcp\#\*';
        outName = 'mixture';
        sisec = true;
    case 'pcpcp_sisec'
        label = 'Polar 4-Complex (SiSEC, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_sisec;
        files = importdata('sisec.txt','\n');
        mixtures = 'Datasets\MSD100\Mixtures\*\mixture.wav';
        sources = 'Datasets\MSD100\Sources\*';
        outDirs = 'TSP2016\SiSEC\pcpcp\#\*';
        outName = 'mixture';
        sisec = true;
    case 'ctpcp_0020'
        label = 'Complex Tensor (0020, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0120_20140127-1103\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0020_20140127-1055\*';
        sources = 'Datasets\smard\0020_20140127-1055\*';
        outDirs = 'TSP2016\0020\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_0020'
        label = 'Polar 6-Bicomplex (0020, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0120_20140127-1103\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0020_20140127-1055\*';
        sources = 'Datasets\smard\0020_20140127-1055\*';
        outDirs = 'TSP2016\0020\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_0020'
        label = 'Polar 12-Complex (0020, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0120_20140127-1103\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0020_20140127-1055\*';
        sources = 'Datasets\smard\0020_20140127-1055\*';
        outDirs = 'TSP2016\0020\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_0021'
        label = 'Complex Tensor (0021, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0121_20140127-1305\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0021_20140127-1311\*';
        sources = 'Datasets\smard\0021_20140127-1311\*';
        outDirs = 'TSP2016\0021\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_0021'
        label = 'Polar 6-Bicomplex (0021, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0121_20140127-1305\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0021_20140127-1311\*';
        sources = 'Datasets\smard\0021_20140127-1311\*';
        outDirs = 'TSP2016\0021\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_0021'
        label = 'Polar 12-Complex (0021, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0121_20140127-1305\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0021_20140127-1311\*';
        sources = 'Datasets\smard\0021_20140127-1311\*';
        outDirs = 'TSP2016\0021\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_0120'
        label = 'Complex Tensor (0120, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0020_20140127-1055\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0120_20140127-1103\*';
        sources = 'Datasets\smard\0120_20140127-1103\*';
        outDirs = 'TSP2016\0120\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_0120'
        label = 'Polar 6-Bicomplex (0120, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0020_20140127-1055\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0120_20140127-1103\*';
        sources = 'Datasets\smard\0120_20140127-1103\*';
        outDirs = 'TSP2016\0120\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_0120'
        label = 'Polar 12-Complex (0120, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0020_20140127-1055\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0120_20140127-1103\*';
        sources = 'Datasets\smard\0120_20140127-1103\*';
        outDirs = 'TSP2016\0120\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_0121'
        label = 'Complex Tensor (0121, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0021_20140127-1311\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0121_20140127-1305\*';
        sources = 'Datasets\smard\0121_20140127-1305\*';
        outDirs = 'TSP2016\0121\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_0121'
        label = 'Polar 6-Bicomplex (0121, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0021_20140127-1311\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0121_20140127-1305\*';
        sources = 'Datasets\smard\0121_20140127-1305\*';
        outDirs = 'TSP2016\0121\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_0121'
        label = 'Polar 12-Complex (0121, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\0021_20140127-1311\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\0121_20140127-1305\*';
        sources = 'Datasets\smard\0121_20140127-1305\*';
        outDirs = 'TSP2016\0121\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_1020'
        label = 'Complex Tensor (1020, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1120_20140127-1122\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1020_20140127-1113\*';
        sources = 'Datasets\smard\1020_20140127-1113\*';
        outDirs = 'TSP2016\1020\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_1020'
        label = 'Polar 6-Bicomplex (1020, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1120_20140127-1122\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1020_20140127-1113\*';
        sources = 'Datasets\smard\1020_20140127-1113\*';
        outDirs = 'TSP2016\1020\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_1020'
        label = 'Polar 12-Complex (1020, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1120_20140127-1122\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1020_20140127-1113\*';
        sources = 'Datasets\smard\1020_20140127-1113\*';
        outDirs = 'TSP2016\1020\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_1021'
        label = 'Complex Tensor (1021, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1121_20140127-1249\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1021_20140127-1256\*';
        sources = 'Datasets\smard\1021_20140127-1256\*';
        outDirs = 'TSP2016\1021\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_1021'
        label = 'Polar 6-Bicomplex (1021, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1121_20140127-1249\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1021_20140127-1256\*';
        sources = 'Datasets\smard\1021_20140127-1256\*';
        outDirs = 'TSP2016\1021\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_1021'
        label = 'Polar 12-Complex (1021, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1121_20140127-1249\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1021_20140127-1256\*';
        sources = 'Datasets\smard\1021_20140127-1256\*';
        outDirs = 'TSP2016\1021\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_1120'
        label = 'Complex Tensor (1120, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1020_20140127-1113\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1120_20140127-1122\*';
        sources = 'Datasets\smard\1120_20140127-1122\*';
        outDirs = 'TSP2016\1120\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_1120'
        label = 'Polar 6-Bicomplex (1120, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1020_20140127-1113\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1120_20140127-1122\*';
        sources = 'Datasets\smard\1120_20140127-1122\*';
        outDirs = 'TSP2016\1120\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_1120'
        label = 'Polar 12-Complex (1120, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1020_20140127-1113\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1120_20140127-1122\*';
        sources = 'Datasets\smard\1120_20140127-1122\*';
        outDirs = 'TSP2016\1120\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_1121'
        label = 'Complex Tensor (1121, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1021_20140127-1256\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1121_20140127-1249\*';
        sources = 'Datasets\smard\1121_20140127-1249\*';
        outDirs = 'TSP2016\1121\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_1121'
        label = 'Polar 6-Bicomplex (1121, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1021_20140127-1256\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1121_20140127-1249\*';
        sources = 'Datasets\smard\1121_20140127-1249\*';
        outDirs = 'TSP2016\1121\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_1121'
        label = 'Polar 12-Complex (1121, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\1021_20140127-1256\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\1121_20140127-1249\*';
        sources = 'Datasets\smard\1121_20140127-1249\*';
        outDirs = 'TSP2016\1121\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_2020'
        label = 'Complex Tensor (2020, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2120_20140127-1211\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2020_20140127-1218\*';
        sources = 'Datasets\smard\2020_20140127-1218\*';
        outDirs = 'TSP2016\2020\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_2020'
        label = 'Polar 6-Bicomplex (2020, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2120_20140127-1211\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2020_20140127-1218\*';
        sources = 'Datasets\smard\2020_20140127-1218\*';
        outDirs = 'TSP2016\2020\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_2020'
        label = 'Polar 12-Complex (2020, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2120_20140127-1211\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2020_20140127-1218\*';
        sources = 'Datasets\smard\2020_20140127-1218\*';
        outDirs = 'TSP2016\2020\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_2021'
        label = 'Complex Tensor (2021, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2121_20140127-1240\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2021_20140127-1233\*';
        sources = 'Datasets\smard\2021_20140127-1233\*';
        outDirs = 'TSP2016\2021\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_2021'
        label = 'Polar 6-Bicomplex (2021, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2121_20140127-1240\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2021_20140127-1233\*';
        sources = 'Datasets\smard\2021_20140127-1233\*';
        outDirs = 'TSP2016\2021\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_2021'
        label = 'Polar 12-Complex (2021, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2121_20140127-1240\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2021_20140127-1233\*';
        sources = 'Datasets\smard\2021_20140127-1233\*';
        outDirs = 'TSP2016\2021\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_2120'
        label = 'Complex Tensor (2120, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2020_20140127-1218\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2120_20140127-1211\*';
        sources = 'Datasets\smard\2120_20140127-1211\*';
        outDirs = 'TSP2016\2120\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_2120'
        label = 'Polar 6-Bicomplex (2120, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2020_20140127-1218\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2120_20140127-1211\*';
        sources = 'Datasets\smard\2120_20140127-1211\*';
        outDirs = 'TSP2016\2120\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_2120'
        label = 'Polar 12-Complex (2120, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2020_20140127-1218\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2120_20140127-1211\*';
        sources = 'Datasets\smard\2120_20140127-1211\*';
        outDirs = 'TSP2016\2120\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_2121'
        label = 'Complex Tensor (2121, k = #)';
        separator = @sep_ctpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2021_20140127-1233\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2121_20140127-1240\*';
        sources = 'Datasets\smard\2121_20140127-1240\*';
        outDirs = 'TSP2016\2121\ctpcp\#';
        outName = '*';
        sisec = false;
    case 'pbpcp_2121'
        label = 'Polar 6-Bicomplex (2121, k = #)';
        separator = @sep_pbpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2021_20140127-1233\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2121_20140127-1240\*';
        sources = 'Datasets\smard\2121_20140127-1240\*';
        outDirs = 'TSP2016\2121\pbpcp\#';
        outName = '*';
        sisec = false;
    case 'pcpcp_2121'
        label = 'Polar 12-Complex (2121, k = #)';
        separator = @sep_pcpcp;
        evaluator = @eval_smard;
        files = importdata('smard.txt','\n');
        soprano = load_audio('Datasets\smard\2021_20140127-1233\44_soprano',false,false,false);
        mixtures = 'Datasets\smard\2121_20140127-1240\*';
        sources = 'Datasets\smard\2121_20140127-1240\*';
        outDirs = 'TSP2016\2121\pcpcp\#';
        outName = '*';
        sisec = false;
    case 'ctpcp_smard'
        label = 'Complex Tensor (SMARD, k = #)';
        datasets = {'0020','0021','0120','0121','1020','1021','1120','1121','2120','2121'};
        smard = importdata('smard.txt','\n');
        outDirs = 'TSP2016';
        outName = '*';
        files = {};
        for n = 1:length(datasets)
            for m = 1:length(smard)
                files = [files;fullfile(num2str(datasets{n}),'ctpcp',num2str(krange),smard{m})];
            end
        end
    case 'pbpcp_smard'
        label = 'Polar 6-Bicomplex (SMARD, k = #)';
        datasets = {'0020','0021','0120','0121','1020','1021','1120','1121','2120','2121'};
        smard = importdata('smard.txt','\n');
        outDirs = 'TSP2016';
        outName = '*';
        files = {};
        for n = 1:length(datasets)
            for m = 1:length(smard)
                files = [files;fullfile(num2str(datasets{n}),'pbpcp',num2str(krange),smard{m})];
            end
        end
    case 'pcpcp_smard'
        label = 'Polar 12-Complex (SMARD, k = #)';
        datasets = {'0020','0021','0120','0121','1020','1021','1120','1121','2120','2121'};
        smard = importdata('smard.txt','\n');
        outDirs = 'TSP2016';
        outName = '*';
        files = {};
        for n = 1:length(datasets)
            for m = 1:length(smard)
                files = [files;fullfile(num2str(datasets{n}),'pcpcp',num2str(krange),smard{m})];
            end
        end
    otherwise
        error('method not implemented');
end

switch action
    case 'separation'
        % Separate all files
        for k = krange
            disp(strrep(label,'#',num2str(k)));
            for m = 1:length(files)
                disp(['Separating ' files{m} '...']);
                mixture = strrep(mixtures,'*',files{m});
                source = strrep(sources,'*',files{m});
                outDir = strrep(strrep(outDirs,'#',num2str(k)),'*',files{m});
                [~,~] = mkdir(outDir);
                separator(mixture,sisec,k,outDir);
                evaluator(source,outDir);
            end
        end
    case 'report'
        % Report GNSDR, GSDR, GISR, GSIR, and GSAR
        NSDRs = zeros(2,length(files));
        SDRs = NSDRs;
        ISRs = NSDRs;
        SIRs = NSDRs;
        SARs = NSDRs;
        for k = krange
            disp(strrep(label,'#',num2str(k)));
            for m = 1:length(files)
                outDir = strrep(strrep(outDirs,'#',num2str(k)),'*',files{m});
                evalName = strrep(outName,'*',files{m});
                load(fullfile(outDir,[evalName '.mat']));
                NSDRs(:,m) = NSDR;
                SDRs(:,m) = SDR;
                ISRs(:,m) = ISR;
                SIRs(:,m) = SIR;
                SARs(:,m) = SAR;
            end
            disp([mean(NSDRs,2) mean(SDRs,2) mean(ISRs,2) mean(SIRs,2) mean(SARs,2)]);
        end
    otherwise
        error('action not implemented');
end
