function raiz_aproximada = f_newton(pol, raiz_inicial)
    k = 0;
    criterio = 1e-14;
    dif = 9999;
    derivada = deriva_pol(pol);
    
    while dif > criterio && k < 100
        k += 1;
        raiz_aproximada = raiz_inicial - (aplica_valor_pol(pol, raiz_inicial)/aplica_valor_pol(derivada, raiz_inicial));
        dif = raiz_aproximada - raiz_inicial;
        raiz_inicial = raiz_aproximada;
    end
end
