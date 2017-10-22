function a = f_calcula_ln_maclauren(n)
  % Usa-se o valor de '2.1/2' pois eh o valor obtido apos fazer a transformacao
  % linear do intervalo fornecido [0.1, 2] para o intervalo de MacLauren, que
  % por sua vez eh [-1, 1]
  a(1) = log((2.1/2));
  for i = 1 : n
  	  % Os valores usados de 2 e 0.1 sao os valores de limite superior e
  	  % inferior, respectivamente
      a(i + 1) = (-1) ^ (i+1) * ((2 - 0.1) / (2 + 0.1)) ^ i / (i);
  end
end