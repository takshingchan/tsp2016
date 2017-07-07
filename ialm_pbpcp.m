function [L,S,iter] = ialm_pbpcp(X,lambda,tol,maxiter)
%% ialm_pbpcp.m
% Polar n-Bicomplex Principal Component Pursuit
%   solve min_L,S |L|_*+lambda|S|_1 s.t. X = L+S
%   using the inexact augmented Lagrangian method (IALM)
% ----------------------------------
% Tak-Shing Chan 22-Apr-2016
% takshingchan@gmail.com
% Copyright: Music and Audio Computing Lab, Academia Sinica, Taiwan
%%

[l,m,n] = size(X);
o = min(l,m);
X = fft(X,n,3);     % move to the frequency domain

% initialization
U = zeros(l,o,n);
sigma = zeros(o,1,n);
V = zeros(m,o,n);
L = zeros(l,m,n);
S = zeros(l,m,n);
for i = 1:n
    sigma(1,1,i) = svds(X(:,:,i),1,'L');
end
X_2 = tabs(sigma(1,1,:));
X_inf = max(max(tabs(X)));
X_fro = norm(X(:)); % scaled by sqrt(n) for speed

% parameters from Lin et al. (2009; can be tuned)
mu = 1.25/X_2;
Y = X/max(X_2,X_inf/lambda);
rho = 1.5;

for iter = 1:maxiter
    %% update L
    Z = X-S+Y/mu;
    for i = 1:n
        [U(:,:,i),Sigma,V(:,:,i)] = svd(Z(:,:,i),'econ');
        sigma(:,1,i) = diag(Sigma);
    end
    sigma = prox(sigma,1/mu);
    for i = 1:n
        L(:,:,i) = U(:,:,i)*spdiags(sigma(:,1,i),0,o,o)*V(:,:,i)';
    end

    %% update S
    S = prox(X-L+Y/mu,lambda/mu);

    R = X-L-S;

    Y = Y+mu*R;
    mu = rho*mu;
        
    %% check for convergence
    if norm(R(:))/X_fro<tol
        L = ifft(L,n,3);    % back to the time domain
        S = ifft(S,n,3);
        return
    end
end
error('Maximum iterations exceeded');
