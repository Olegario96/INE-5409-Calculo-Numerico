format long

lim_inferior = -1;
lim_superior = 1;
numero_pontos = 100;
valor_x = -1;

h = (lim_superior - lim_inferior) / numero_pontos;
valores_x_para_analisar = lim_inferior : h : lim_superior;

%---- Interpolador polinomial ----%
"Grau do polinômio interpolador linear"
n = 11

h = (lim_superior - lim_inferior) / n;
valores_x = lim_inferior : h : lim_superior;

y_exato = f_analisada(valores_x, lim_inferior, lim_superior);

"Coeficientes do polinomio interpolador"
coefs_interpolador = f_calcula_coefs_interpolador_pol(n, valores_x, y_exato)

y_exato = f_analisada(valores_x_para_analisar, lim_inferior, lim_superior);
y_aprox_interpolador = f_pn_horner(n, coefs_interpolador, valores_x_para_analisar);

"Erro maximo do interpolador polinomial"
erro_interpolador_polinomial = max(abs(y_aprox_interpolador - y_exato))


"Valor de X onde o erro eh maximo"
for i = 1 : length(valores_x_para_analisar)
  erro = f_pn_horner(n, coefs_interpolador, valores_x_para_analisar(i)) - f_analisada(valores_x_para_analisar(i), lim_inferior, lim_superior);
  if abs(erro) == erro_interpolador_polinomial
  	valor_x = valores_x_para_analisar(i);
  endif
end
valor_x

%---- Serie Maclauren ----%
"Grau do polinômio interpolador MacLauren"
n = 11

"Coeficientes calculados por MacLauren"
coefs_maclauren = f_calcula_integral_maclauren(n);
transpose(coefs_maclauren)

y_exato = f_analisada(valores_x_para_analisar, lim_inferior, lim_superior);
y_aprox_maclauren = f_pn_horner(n, coefs_maclauren, valores_x_para_analisar);

"Erro maximo de MacLauren"
erro_maclauren = max(abs(y_aprox_maclauren - y_exato))

"Valor de X onde o erro eh maximo"
for i = 1 : length(valores_x_para_analisar)
  erro = f_pn_horner(n, coefs_maclauren, valores_x_para_analisar(i)) - f_analisada(valores_x_para_analisar(i), lim_inferior, lim_superior);
  if abs(erro) == erro_maclauren
  	valor_x = valores_x_para_analisar(i);
  endif
end
valor_x

%---- Tchebyshev ----%
"Grau do polinômio interpolador Tchebyshev"
n =11

"Coeficientes calculados por Thcebyshev"
coefs_tchebyshev = f_coef_tchebychev(n, lim_inferior, lim_superior);
transpose(coefs_tchebyshev)

y_exato = f_analisada(valores_x, lim_inferior, lim_superior);
y_aprox_tchebyshev = f_calcula_tchebychev(n, coefs_tchebyshev, valores_x);

"Erro maximo de Tchebyshev"
erro_tchebyshev = max(abs(y_aprox_tchebyshev - y_exato))

"Valor de X onde o erro eh maximo"
for i = 1 : length(valores_x_para_analisar)
  erro = f_pn_horner(n, coefs_tchebyshev, valores_x_para_analisar(i)) - f_analisada(valores_x_para_analisar(i), lim_inferior, lim_superior);
  if abs(erro) == erro_tchebyshev
  	valor_x = valores_x_para_analisar(i);
  endif
end
valor_x

%---- Pade ----%
"Grau do polinômio interpolador de Pade do numerador"
npade = 6

"Grau do polinômio interpolador de Pade do denominador"
mpade = 5

coefs_maclauren = f_calcula_integral_maclauren(npade + mpade);

[numerador_pade denominador_pade] = f_calcula_pade(npade, mpade, coefs_maclauren);

"Coeficientes do numerador"
transpose(numerador_pade)

"Coeficientes do denominador"
transpose(denominador_pade)

y_pade = f_pn_horner(npade, numerador_pade, valores_x) ./ f_pn_horner(mpade, denominador_pade, valores_x);

"Erro maximo de Pade"
erro_pade = max(abs(y_exato - y_pade))

"Valor de X onde o erro eh maximo"
for i = 1 : length(valores_x_para_analisar)
  erro = (f_pn_horner(npade, numerador_pade, valores_x_para_analisar(i)) / f_pn_horner(mpade, denominador_pade, valores_x_para_analisar(i))) - f_analisada(valores_x_para_analisar(i), lim_inferior, lim_superior);
  if abs(erro) == erro_pade
  	valor_x = valores_x_para_analisar(i);
  endif
end
valor_x
