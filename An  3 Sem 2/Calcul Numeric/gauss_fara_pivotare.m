﻿function [ x ] = gauss_fara_pivotare( A, b )
    n = length(b);
    A = [A b];
    for k = 1:(n-1)
        for p = k:n
            if A(p,k) ~= 0
                break;
            end
        end
        if A(p,k) == 0
            disp('Sistem incomp. sau sist. comp. nedet.');
        end
        if p ~= k
            aux_row = A(p,:) ;
            A(p,:) = A(k,:) ;
            A(k,:) = aux_row ;
        end
        for l = k+1:n
            m = A(l,k)./A(k,k);
            A(l, :) = A(l, :) - (m.*A(k, :));
        end
    end
    if A(n,n) == 0
        disp('Sistem incomp. sau sist. comp. nedet.');
    end
    x = met_sub_desc(A(:,1:end-1), A(:,end));
end
