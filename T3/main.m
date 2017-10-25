format long

n = 7;
lim_inferior = 0.1;
lim_superior = 2;
numero_pontos = 100;

h = (lim_superior - lim_inferior) / n;
valores_x = lim_inferior : h : lim_superior;

y_exato = f_analisada(valores_x, lim_inferior, lim_superior);;

%---- Interpolador polinomial ----%
"Coeficientes do polinomio interpolador"
coefs_interpolador = f_calcula_coefs_interpolador_pol(n, valores_x, y_exato)

"Valores de Y calculado por Horner nos coeficientes calculados"
y_aprox_interpolador = f_pn_horner(n, coefs_interpolador, valores_x)

"Erro maximo do interpolador polinomial"
erro_interpolador_polinomial = max(abs(y_aprox_interpolador - y_exato))
%---- Serie Maclauren ----%
"Coeficientes calculados por MacLauren"
n = 110;
coefs_maclauren = f_calcula_ln_maclauren(n)

"Valores de Y calculado por Horner aplicado nos coeficientes calculados"
% Aqui existe necessidade de recalcular o h e valores_x pois a serie de
% MacLauren utiliza numero de pontos.
h = (lim_superior - lim_inferior) / numero_pontos;
valores_x = lim_inferior : h : lim_superior;

% Formula da TL nesse problema
valores_t = (2/1.9) .* valores_x  .-(2.1/1.9);
y_exato = f_analisada(valores_t, lim_inferior, lim_superior);
y_aprox_maclauren = f_pn_horner(n, coefs_maclauren, valores_t)

"Erro maximo de MacLauren"
erro_maclauren = max(abs(y_aprox_maclauren - y_exato))

%---- Tchebyshev ----%
"Coeficientes calculados por Thcebyshev"
n =30;
coefs_tchebyshev = f_coef_tchebychev(n, lim_inferior, lim_superior)

"Valores de  Y calculados por Horner aplicado nos coeficientes calculados"
valores_x = -1 : (1 + 1)/n : 1;
y_exato = f_analisada(valores_x, lim_inferior, lim_superior);
y_aprox_tchebyshev = f_calcula_tchebychev(n, coefs_tchebyshev, valores_x)

"Erro maximo de Thcebyshev"
erro_tchebyshev = max(abs(y_aprox_tchebyshev - y_exato))

%---- Padé ----%
