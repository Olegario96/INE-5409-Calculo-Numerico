function multi = calcula_multiplicidade(polinomio, raiz)
    multi = 0;
    soma_restos = 0.0;
    restos = restos(polinomio, raiz);
    num_restos = length(restos);
    
    for i = 1 : num_restos
       soma_restos += restos(i);
       if (soma_restos <= 1e-10)
            multi += 1;
        else
            break
        endif
    end
end
