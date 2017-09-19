function r = restos(eq_original, raiz)
    grau = length(eq_original) - 1;
    r(grau) = 0;
    eq_rebaixada = f_briot_ruffini(eq_original, raiz);
    r(1) = eq_rebaixada(length(eq_rebaixada));

    for i = 2 : grau
        eq_rebaixada = f_briot_ruffini(eq_rebaixada, raiz);
        r(i) = eq_rebaixada(length(eq_rebaixada) - i + 1);
    end
end