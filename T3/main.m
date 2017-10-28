format long

n = 25;
lim_inferior = 0.1;
lim_superior = 2;
numero_pontos = 100;

h = (lim_superior - lim_inferior) / n;
valores_x = lim_inferior : h : lim_superior;

h = (lim_superior - lim_inferior) / numero_pontos;
valores_x_para_analisar = lim_inferior : h : lim_superior;

y_exato = f_analisada(valores_x, lim_inferior, lim_superior);

%---- Interpolador polinomial ----%
"Grau do polinômio interpolador linear"
n

"Coeficientes do polinomio interpolador"
coefs_interpolador = f_calcula_coefs_interpolador_pol(n, valores_x, y_exato)

"Valores de Y calculado por Horner nos coeficientes calculados"
y_exato = f_analisada(valores_x_para_analisar, lim_inferior, lim_superior);
y_aprox_interpolador = f_pn_horner(n, coefs_interpolador, valores_x_para_analisar);
transpose(y_aprox_interpolador)

"Erro maximo do interpolador polinomial"
erro_interpolador_polinomial = max(abs(y_aprox_interpolador - y_exato))

%---- Serie Maclauren ----%
"Grau do polinômio interpolador MacLauren"
n = 110

"Coeficientes calculados por MacLauren"
coefs_maclauren = f_calcula_ln_maclauren(n);
transpose(coefs_maclauren)

"Valores de Y calculado por Horner aplicado nos coeficientes calculados"
% Aqui existe necessidade de recalcular o h e valores_x pois a serie de
% MacLauren utiliza numero de pontos.

% Formula da TL nesse problema
valores_t = (2/1.9) .* valores_x_para_analisar  .-(2.1/1.9);
y_exato = f_analisada(valores_t, lim_inferior, lim_superior);
y_aprox_maclauren = f_pn_horner(n, coefs_maclauren, valores_t);
transpose(y_aprox_maclauren)

"Erro maximo de MacLauren"
erro_maclauren = max(abs(y_aprox_maclauren - y_exato))

%---- Tchebyshev ----%
"Grau do polinômio interpolador Tchebyshev"
n =30

"Coeficientes calculados por Thcebyshev"
coefs_tchebyshev = f_coef_tchebychev(n, lim_inferior, lim_superior);
transpose(coefs_tchebyshev)

"Valores de  Y calculados por Horner aplicado nos coeficientyes calculados"
valores_x = -1 : (1 + 1)/n : 1;
y_exato = f_analisada(valores_x, lim_inferior, lim_superior);
y_aprox_tchebyshev = f_calcula_tchebychev(n, coefs_tchebyshev, valores_x)
transpose(y_aprox_tchebyshev)

"Erro maximo de Tchebyshev"
erro_tchebyshev = max(abs(y_aprox_tchebyshev - y_exato))

%---- Pade ----%
"Grau do polinômio interpolador de Pade do numerador"
npade = 11

"Grau do polinômio interpolador de Pade do denominador"
mpade = 11

coefs_maclauren = f_calcula_ln_maclauren(npade + mpade);

[numerador_pade denominador_pade] = f_calcula_pade(npade, mpade, coefs_maclauren);

"Coeficientes do numerador"
transpose(numerador_pade)

"Coeficientes do denominador"
transpose(denominador_pade)

"Valores de  Y calculados por Horner aplicado nos coeficientes calculados"
y_pade = f_pn_horner(npade, numerador_pade, valores_x) ./ f_pn_horner(mpade, denominador_pade, valores_x);
transpose(y_pade)

"Erro maximo de Pade"
erro_pade = max(abs(y_exato - y_pade))
