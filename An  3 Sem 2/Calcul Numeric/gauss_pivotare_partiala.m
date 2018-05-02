function [ x ] = gauss_pivotare_partiala( A, b )
    n = length(b);
    A = [A b];
    for k = 1:(n-1)
        p = k;
        for pi = k:n
            if abs(A(pi,k)) > abs(A(p,k))
                p = pi;
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