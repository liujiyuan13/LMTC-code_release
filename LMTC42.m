function [H, obj] = LMTC42(X, c, lambda)

% shapes
V = length(X); 
N = size(X{1}, 1);
sX = [N, c, V];

% init 
H = cell(V, 1); G = cell(V, 1); W = cell(V, 1);
[uu, ~, ~] = svds(cell2mat(X'), c);
for v = 1:V
    H{v} = uu;
%     H{v} = orth(rand(N, c));
    G{v} = zeros(N, c);
    W{v} = zeros(N, c);
end

rho = 1e-4; max_rho = 1e10; eta_rho = 2;
epson = 1e-7; max_iter = 200;

Isconverg = 0; t = 1; obj = 0;
while(Isconverg == 0)
    
    % 1. update H
    for v = 1:V
        M{v} = X{v}*(X{v}'*H{v}) + (rho*G{v} + W{v});
        [uu, ~, vv] = svds(M{v}, c);
        H{v} = uu*vv';
    end
    
    % 2. update G
    H_tensor = cat(3, H{:});
    W_tensor = cat(3, W{:});
    h = H_tensor(:);
    w = W_tensor(:);
    [g, obj2] = wshrinkObj(h - 1/rho*w, lambda/rho, sX, 0, 2);
    for v = 1:V
        G_tensor = reshape(g, sX);
        G{v} = G_tensor(:,:,v);
    end
    
     % 3. update Langrange parameters
    for v = 1:V 
        W{v} = W{v} + rho*(G{v} - H{v});
    end
    rho = min(rho*eta_rho, max_rho);
    
    % compute objective value
    obj1 = 0;
    for v = 1:V
        obj1 = obj1 - trace((H{v}'*X{v})*(X{v}'*H{v}));
    end
    obj(t) = obj1 + lambda*obj2;
    
    % if convergent
    if t>1 && (abs((obj(t-1)-obj(t))/obj(t))<1e-5 || t>max_iter)
        Isconverg = 1;
    end
%     Isconverg = 1;
    for v=1:V 
        norm_Z_H = norm(G{v}-H{v}, inf);
        if norm_Z_H > epson
            Isconverg = 0;
        end
    end

    if t > max_iter
        Isconverg  = 1;
        fprintf('iter 200');
    end
    
    t = t + 1;
    
end

H = cell2mat(H');
% H = sum(cat(3, H{:}), 3);

H = H ./ repmat(sqrt(sum(H .^ 2, 2)), 1, size(H, 2));

end

