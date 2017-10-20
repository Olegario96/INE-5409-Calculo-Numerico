format long

n = 8;
lim_inferior = 0.1;
lim_superior = 2;

h = (lim_superior - lim_inferior) / n;
valores_x = lim_inferior : h : lim_superior;
media_intervalo = (lim_inferior + lim_superior) / 2;

y_exato = log(valores_x);

%---- Interpolador polinomial ----%
"Coeficientes do polinomio interpolador"
coefs_interpolador = f_calcula_coefs_interpolador_pol(n, valores_x, y_exato)

"Valores de Y calculado por Horner"
y_aprox_interpolador = f_pn_horner(n, coefs_interpolador, valores_x)

"Erro maximo do interpolador polinomial"
erro_interpolador_polinomial = abs(max(y_exato - y_aprox_interpolador))

%---- Serie Maclaurin ----%

%---- Tchebyshev ----%

%---- Padé ----%
