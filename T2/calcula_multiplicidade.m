function multi = calcula_multiplicidade(r)
    soma = abs(r(1))+  abs(r(2));
    multi = 1;
    
    while soma < 1e-6
        multi += 1;
        soma = soma + abs(r(multi + 1));
    end
end
