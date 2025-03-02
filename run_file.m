clear
clc
warning off

work_path = 'D:\Work\';
proj_path = [work_path, '/LMTC-code_release/'];
addpath(genpath(proj_path));

alg_name = 'LMTC42';

data_path = [work_path, 'datasets/mData/Fmatrix/'];
data_name = 'ORL';
load([data_path, data_name, '_fea'], 'X', 'Y'); Y = double(Y);
k = length(unique(Y));
V = length(X);
n = size(X{1}, 2);

% randperm
rand_index = randperm(n);
Y = Y(rand_index);
for v=1:V
    X{v} = X{v}(:,rand_index);
end

for v = 1:V
    X{v} = NormalizeData(X{v})';
end

% parameters
lambda = 2^0;
n_iters = 10;

for iter=1:n_iters
    % main algorithm
    tic;
    [H, ~] = LMTC42(X, k, lambda);
    % final H 
    [y] = my_kmeans(H, k);
    tstmp = toc;
    [eval] = my_eval_y(y, Y);
    fprintf('\nlambda: %d, time: %f, acc: %f, nmi: %f, pur: %f', lambda, tstmp, eval(1), eval(2), eval(3)); 
end

rmpath(genpath(proj_path));

