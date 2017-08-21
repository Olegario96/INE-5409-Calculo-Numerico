function x = fGauss(A)
    n = length(A) - 1;

    for k = 1 : n-1
        for i = k+1 : n
            aux = A(i,k)/A(k,k);
            for j = k+1 : n+1
                A(i,j) = A(i,j) - aux*A(k,j);
            end
            A(i,k) = 0;
        end
    end

    x(n) = A(n,n+1)/A(n,n);
    for i = n-1 :-1: 1
        soma = 0;
        for j = i+1 : n
            soma += A(i,j)*x(j);
        end
        x(i) = (A(i,n+1) - soma)/A(i,i);
    end
end