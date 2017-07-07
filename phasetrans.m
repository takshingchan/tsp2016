function phasetrans
% phasetrans: Phase transition experiments (cf. Candes et al., 2011).
%
% Usage: phasetrans

%       Tak-Shing Chan, 20160630

addpath qtfm spl2016;

% Phase transition experiments
rng('default')
m = 400;
success = zeros(m/8,m/8,3,3);
for i = 1:m/8
    for j = 1:m/8
        for k = 1:10
            % Generate low-rank matrices
            r = 2*i-1;
            L1 = (randn(m,r)+1i*randn(m,r))*(randn(r,m)-1i*randn(r,m))/2/m;
            L2 = (randn(m,r)+1i*randn(m,r))*(randn(r,m)-1i*randn(r,m))/2/m;

            % Generate sparse matrices
            rho = (2*j-1)/m;
            S1 = (rand(m)<rho).*exp(2i*pi*rand(m));
            S2 = (rand(m)<rho).*exp(2i*pi*rand(m));

            % Polar 4-Complex PCP
            L0 = cat(3,real(L1),imag(L1),real(L2),imag(L2));
            S0 = cat(3,real(S1),imag(S1),real(S2),imag(S2));
            [L,S] = ialm_pbpcp(L0+S0,1/sqrt(m),1e-7,1000);
            E = L-L0;
            RE1 = norm(complex(E(:,:,1),E(:,:,2)),'fro')/norm(complex(L0(:,:,1),L0(:,:,2)),'fro');
            RE2 = norm(complex(E(:,:,3),E(:,:,4)),'fro')/norm(complex(L0(:,:,3),L0(:,:,4)),'fro');
            success(j,i,1,1) = success(j,i,1,1)+(RE1<.10)+(RE2<.10);
            success(j,i,2,1) = success(j,i,2,1)+(RE1<.05)+(RE2<.05);
            success(j,i,3,1) = success(j,i,3,1)+(RE1<.01)+(RE2<.01);

            % Polar 2-Bicomplex PCP
            L0 = cat(3,L1,L2);
            S0 = cat(3,S1,S2);
            [L,S] = ialm_pbpcp(L0+S0,1/sqrt(m),1e-7,1000);
            E = L-L0;
            RE1 = norm(E(:,:,1),'fro')/norm(L0(:,:,1),'fro');
            RE2 = norm(E(:,:,2),'fro')/norm(L0(:,:,2),'fro');
            success(j,i,1,2) = success(j,i,1,2)+(RE1<.10)+(RE2<.10);
            success(j,i,2,2) = success(j,i,2,2)+(RE1<.05)+(RE2<.05);
            success(j,i,3,2) = success(j,i,3,2)+(RE1<.01)+(RE2<.01);

            % Quaternionic Robust PCA
            L0 = quaternion(real(L1),imag(L1),real(L2),imag(L2));
            S0 = quaternion(real(S1),imag(S1),real(S2),imag(S2));
            [L,S] = inexact_alm_qrpca(L0+S0,1/sqrt(m),1e-7,1000);
            E = L-L0;
            RE1 = norm(complex(E.w,E.x),'fro')/norm(complex(L0.w,L0.x),'fro');
            RE2 = norm(complex(E.y,E.z),'fro')/norm(complex(L0.y,L0.z),'fro');
            success(j,i,1,3) = success(j,i,1,3)+(RE1<.10)+(RE2<.10);
            success(j,i,2,3) = success(j,i,2,3)+(RE1<.05)+(RE2<.05);
            success(j,i,3,3) = success(j,i,3,3)+(RE1<.01)+(RE2<.01);
        end
    end
end

% Plot and save results
figure
colormap(gray)
for i = 1:3
    for j = 1:3
        subplot(3,3,sub2ind([3 3],i,j))
        imagesc((2*(1:m/8)-1)/m,(2*(1:m/8)-1)/m,success(:,:,j,i),2*[0 10])
        set(gca,'YDir','normal')
        xlabel('r/m')
        ylabel('\rho')
    end
end
save('success.mat','success')
