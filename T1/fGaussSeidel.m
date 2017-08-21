function x = fGaussSeidel(n, sI, criterio)
    x = sI;
    k = 0;
    dif = 9999;
    lambda = 1.12;
    while dif > criterio && k < 1000
        k++;
        x(1) = (1 - lambda) * x(1) + lambda * (1.5 - x(2));
        for i = 2 : n/2
            x(i) = (1 - lambda) * x(i) + lambda * ((1 - x(i - 1) - x(i + 1) - x(i +25))/4);
        end
            
        for i = (n/2) + 1: n - 1
            x(i) = (1 - lambda) * x(i) + lambda * ((2 - x(i - 25) - x(i - 1) - x(i + 1))/5);
        end
        x(n) = 3 - x(n -1);
        dif = max(abs(x - sI));
        sI = x;
    end
    k;
    S = x;
end