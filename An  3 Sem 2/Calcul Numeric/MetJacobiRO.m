﻿function [xaprox, N, sig] = MetJacobiRO(A, a, eps)

p = norm(A, Inf);
V = zeros(1,p);
v = Inf;
ss=0;

%pas 1
for s=1:p-1

    sig = 2*s / (norm(A,Inf) * p);
    [~, N] = MetJacobiR(A,a,eps, sig);
    V(s) = N;

    if(N < v)
        ss = s;
        v=N;
    end
end

%pas 2
sig = 2*ss / (norm(A,Inf) * p);

%pas3

[xaprox, N] = MetJacobiR(A,a,eps,sig);
end