function r = restos(eq_original, raiz)
    n = length(eq_original);
    eq_rebaixada = f_briot_ruffini(eq_original, raiz);
    r(1) = eq_rebaixada(n);
    eq_rebaixada = eq_rebaixada(1:n-1);
    for i = 2 : n - 1
        eq_rebaixada = f_briot_ruffini(eq_rebaixada, raiz);
        r(i) = eq_rebaixada(n - i + 1);
        eq_rebaixada = eq_rebaixada(1:n-i);
    end
    r(n) = raiz;
end
