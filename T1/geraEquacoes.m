function x = geraEquacoes(n)
    x = zeros(n, n+1);
    x(1, 1) = 1;
    x(1, 2) = 1;
    x(1, n + 1) = 1.5;
    for i = 2 : n/2
        x(i, n + 1) = 1;
        x(i, i - 1) = 1;
        x(i, i + 1) = 1;
        x(i, i + 25) = 1;
        x(i, i) = 4;
    end
    
    for i = (n/2) + 1 : n - 1
        x(i, n + 1) = 2;
        x(i, i - 25) = 1;
        x(i, i - 1) = 1;
        x(i, i + 1) = 1;
        x(i, i) = 5;
    end
    x(n, n + 1) = 3;
    x(n, n - 1) = 1;
    x(n, n) = 1;
    x;
end