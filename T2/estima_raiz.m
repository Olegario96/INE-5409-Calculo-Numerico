function raiz_estimada = estima_raiz(pol)
    tamanho_pol = length(pol);
    r_inicial_max = 1 + max(abs(pol(2:tamanho_pol)))/abs(pol(1));
    r_inicial_min = 1/(1+(max(abs(pol(1):tamanho_pol-1)))/abs(pol(tamanho_pol)));
    r_med = (r_inicial_max + r_inicial_min)/2;
    raiz_estimada = complex(0.7 * r_med, 0.7 * r_med);
end
