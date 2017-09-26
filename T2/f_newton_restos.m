function raiz_estimada = f_newton_restos(pol, raiz_inicial)
    k = 0;
    dif = 9999;
    criterio = 1e-14;
    while dif > criterio && k < 100
        k += 1;
        r = restos(pol, raiz_inicial);
        m = calcula_multiplicidade(r);
        raiz_estimada = raiz_inicial - (r(m)/(m*r(m+1)));
        dif = raiz_estimada - raiz_inicial;
        raiz_inicial = raiz_estimada;
    end
end
