format long

lim_inferior = -1;
lim_superior = 1;
numero_pontos = 100;
valor_x = -1;

h = (lim_superior - lim_inferior) / numero_pontos;
valores_x_para_analisar = lim_inferior : h : lim_superior;

%---- Interpolador polinomial ----%
"Grau do polinômio interpolador linear"
n = 12

h = (lim_superior - lim_inferior) / n;
valores_x = lim_inferior : h : lim_superior;

y_exato = f_analisada(valores_x, lim_inferior, lim_superior);

coefs_interpolador = f_calcula_coefs_interpolador_pol(n, valores_x, y_exato);

y_exato = f_analisada(valores_x_para_analisar, lim_inferior, lim_superior);
y_aprox_interpolador = f_pn_horner(n, coefs_interpolador, valores_x_para_analisar);
erro_interpolador_plot = abs(y_aprox_interpolador - y_exato);

"Erro maximo do interpolador polinomial"
[erro_interpolador_polinomial erro_index] = max(erro_interpolador_plot)

"Valor de X onde o erro eh maximo"
valores_x_para_analisar(erro_index)

%plot(valores_x_para_analisar, erro_interpolador_plot, '-k', 1.1, 0);

%---- Serie Maclauren ----%
"Grau do polinômio interpolador MacLauren"
n = 15

coefs_maclauren = f_calcula_exp_sin_maclauren(n);

y_aprox_maclauren = f_pn_horner(n, coefs_maclauren, valores_x_para_analisar);

erro_maclauren_plot = abs(y_aprox_maclauren - y_exato);

"Erro maximo de MacLauren"
[erro_maclauren erro_index] = max(erro_maclauren_plot)

"Valor de X onde o erro eh maximo"
valores_x_para_analisar(erro_index)

%plot(valores_x_para_analisar, erro_maclauren_plot, '-k', 1.1, 0);

%---- Tchebyshev ----%
"Grau do polinômio interpolador Tchebyshev"
n = 11

coefs_tchebyshev = f_coef_tchebychev(n, lim_inferior, lim_superior);

y_exato = f_analisada(valores_x, lim_inferior, lim_superior);
y_aprox_tchebyshev = f_calcula_tchebychev(n, coefs_tchebyshev, valores_x);

erro_tchebyshev_plot = abs(y_aprox_tchebyshev - y_exato);

"Erro maximo de Tchebyshev"
[erro_tchebyshev erro_index] = max(erro_tchebyshev_plot)

"Valor de X onde o erro eh maximo"
valores_x_para_analisar(erro_index)

%plot(valores_x_para_analisar, erro_tchebyshev_plot, '-k', 1.1, 0);

%---- Pade ----%
"Grau do polinômio interpolador de Pade do numerador"
npade = 6

"Grau do polinômio interpolador de Pade do denominador"
mpade = 5

coefs_maclauren = f_calcula_exp_sin_maclauren(npade + mpade);

[numerador_pade denominador_pade] = f_calcula_pade(npade, mpade, coefs_maclauren);

y_pade = f_pn_horner(npade, numerador_pade, valores_x) ./ f_pn_horner(mpade, denominador_pade, valores_x);

erro_pade_plot = abs(y_exato - y_pade);

"Erro maximo de Pade"
[erro_pade erro_index] = max(erro_pade_plot)

"Valor de X onde o erro eh maximo"
valores_x_para_analisar(erro_index)

%plot(valores_x_para_analisar, erro_tchebyshev_plot, '-k', 1.1, 0);

%---- Spline ----%
lim_inferior = -pi;
lim_superior = pi;

h = (lim_superior - lim_inferior) / numero_pontos;
valores_x = lim_inferior : h : lim_superior;

y_exato = 2 .* sin(abs(valores_x));

plot(valores_x, y_exato, '-k',-2*pi, 2*pi);

