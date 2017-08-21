function resultado = avaliaConvergencia(A)
    resultado = 0;
    somaVizinhos = 0;
    A(:, [length(A)]) = [];
    n = length(A);
    for i = 1 : n
        for j = 1 : n
            if (i == j)
                elementoDiagonalPrincipal = A(i, j);
            else
                somaVizinhos += A(i, j);
            endif
        end

        if (elementoDiagonalPrincipal < somaVizinhos)
            resultado = -1;
            break
        elseif (elementoDiagonalPrincipal > somaVizinhos)
            resultado = 1;
        endif
        somaVizinhos = 0;
    end
end