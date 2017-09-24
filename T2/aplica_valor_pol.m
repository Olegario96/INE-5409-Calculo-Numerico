function y = aplica_valor_pol(pol, valor)
    y = 0;
    tamanho_pol = length(pol);
    for i = 1 : tamanho_pol
        y += (pol(i) * (valor ^ (tamanho_pol - i)));
    end
end
