function eq_rebaixada = f_briot_ruffini(eq_original, raiz)
    n = length(eq_original);
    eq_rebaixada(n) = 0;
    eq_rebaixada(1) = eq_original(1);

    for i = 2 : n
        eq_rebaixada(i) = raiz * eq_rebaixada(i - 1) + eq_original(i);
    end
end