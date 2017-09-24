function polinomio_derivado = deriva_pol(pol)
   tamanho_pol = length(pol);
   polinomio_derivado(tamanho_pol) = 0;
   for i = 1 : tamanho_pol
        polinomio_derivado(i) = pol(i) * (tamanho_pol - i);
   end
   polinomio_derivado = polinomio_derivado(1:tamanho_pol-1);
end