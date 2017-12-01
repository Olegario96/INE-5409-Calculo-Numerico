format long

%----- Exercicio 7.1 -----%
x = [0.2 0.4 0.6 0.8 0.9 1.0]; 
y = [0.04 0.14 0.30 0.45 0.61 0.69];

m = length(x);
xp = min(x) : 0.01 : max(x);

%-----    Item A & B     -----%
ai = [1
      1];
n = length(ai);
a = f_newton_fa(n, ai)

%-----    Item C     -----%
desvio_locais = abs((log(a(1) + a(2) .* x .* x) .- y))
R2 = 1 - sum((log(a(1) .+ (a(2) .* x .* x)) .- y).^2) /sum((mean(y).-y).^2)
printf("\n")

%-----    Item D     -----%
yp_newton = log(a(1) .+ a(2) .* xp .* xp);

coefs_interpolador = f_calcula_coefs_interpolador_pol(m - 1, x, y)
yp_interpolador = f_pn_horner(m - 1, coefs_interpolador, xp);

%plot(x, y, '*k', xp, yp_newton, '.b', xp, yp_interpolador, '-r')
printf("\n")

%----- Exercicio 7.6 -----%
x = [13.9 37.0 67.8 79.0 85.5 93.1 99.2];
y = [1.04 1.18 1.29 1.35 1.28 1.21 1.06];

m = length(x);
n = 5;
xp = min(x) : 0.01 : max(x);

%-----    Item A     -----%
coefs_ajuste_1 = f_ajuste_polinomial(m, 1, x, y)
yp_ajuste_1 = f_pn_horner(1, coefs_ajuste_1, xp);

coefs_ajuste_2 = f_ajuste_polinomial(m, 2, x, y)
yp_ajuste_2 = f_pn_horner(2, coefs_ajuste_2, xp);

%-----    Item B     -----%
coefs_interpolador = f_calcula_coefs_interpolador_pol(6, x, y)
yp_interpolador = f_pn_horner(6, coefs_interpolador, xp);

%-----    Item C     -----%
%plot(x, y, '*k', xp, yp_ajuste_1, '-r', xp, yp_ajuste_2, '-b', xp, yp_interpolador,'-g')

%-----    Item D     -----%
R2 = 1 - sum((f_pn_horner(1, coefs_ajuste_1, x) .- y).^2)/sum((mean(y).-y).^2)
R2 = 1 - sum((f_pn_horner(2, coefs_ajuste_2, x) .- y).^2)/sum((mean(y).-y).^2)
R2 = 1 - sum((f_pn_horner(6, coefs_interpolador, x) .- y).^2)/sum((mean(y).-y).^2)

%-----    Item E     -----%
printf("A melhor curva a ser utilizada eh a do ajuste polinomial com n=2. \nPorem")
printf(" o recomendado seria fazer um estudo utilizando mais pontos e reavaliar o \ncomportamento das curvas.\n")
printf("\n")

%----- Exercicio 7.7 -----%
% V(T) = a*T + b*cos(T)
m = 4;
x = [0.00 0.39 0.78 1.18];
y = [0.99 0.92 0.71 0.38];

%-----    Item A     -----%
xp = min(x) : 0.01 : max(x);
coefs = f_ajuste_cos(m, x, y)

%-----    Item B     -----%
desvio_locais = (coefs(1) .* x + coefs(2) .* cos(x)) .- y
valor_medio = mean(desvio_locais)
R2 = 1 - sum(((coefs(1) .* x + coefs(2) .* cos(x)) .- y).^2) /sum((mean(y).-y).^2)
printf("\n")

%-----    Item C     -----%
yp_ajuste = coefs(1) .* xp + coefs(2) .* cos(xp);
%plot(x, y, '*k', xp, yp_ajuste, '.r')
%plot(x, desvio_locais, '*b')

%-----    Item D     -----%
printf("Apesar do baixo numero de pontos utilizados para montar\n")
printf("a curva, o ajuste ficou bom.")
printf("\n")

%----- Exercicio 8.6 -----%
a = 0;
b = 1;
criterio = 1e-6;
erro_exato_trapezio = 1e-8;
y_exato = erf(1);

%-----    Item A     -----%
n = 900;
while erro_exato_trapezio < criterio
  soma_trapezios = f_soma_trapezio(a, b, n);
  erro_exato_trapezio = abs(soma_trapezios - y_exato);
  n -= 1;
end
 
n
soma_trapezios
erro_exato_trapezio
erro_estimado_trapezio = abs(soma_trapezios - f_soma_trapezio(a, b, 2 * n))
printf("\n")

%-----    Item B     -----%
n = 40;
erro_exato_simpson = 1e-8;

while erro_exato_simpson < criterio
  sn = f_soma_simpson(a, b, n);
  erro_exato_simpson = abs(sn - y_exato);
  n -= 1;
end

n
sn
erro_exato_simpson
erro_estimado_simpson = abs(sn - f_soma_simpson(a, b, 2 * n))
printf("\n")

%-----    Item C     -----%
m = 8;
erro_exato_gauss = 1e-8;

while erro_exato_gauss < criterio
  [gm, x, y] = f_soma_gauss1(a, b, m);
  erro_exato_gauss = abs(gm - y_exato);
  m -= 1;
end

m
gm
erro_exato_gauss
[novo_gm, xa, ya] = f_soma_gauss1(a, b, m+1);
erro_estimado_gauss = abs(gm - novo_gm) 	 	
printf("\n")

%-----    Item D     -----%
coefs = f_calcula_coefs_interpolador_pol(m, x, y)
printf("\n")

%-----    Item E     -----%
coefs_invertido(length(coefs)) = 0;
  for i = 1 : length(coefs)
    coefs_invertido(i) = coefs(length(coefs) - i + 1);
  end
integral = f_calcula_integral_pol(coefs_invertido, a, b)
printf("\n")

%-----    Item F     -----%
y_aprox = f_pn_horner(m - 1, coefs,  (b - a)/n);

%----- Exercicio 8.7 -----%
a = -1;
b = 1;
criterio = 1e-7;
y_exato = -pi * log(2);

m = 9;
[gm, x, y] = f_soma_gauss2(a, b, m);
gm
erro_exato_gauss = abs(gm - y_exato)
[novo_gm, xa, ya] = f_soma_gauss2(a, b, m+1);
erro_estimado_gauss = abs(gm - novo_gm) 	 	
printf("\n")

m = 100000;
gtm = f_gauss_tchebyshev(m, "f0")
erro_exato = abs(gtm - y_exato)
printf("\n")
printf("Nao eh possivel chegar no criterio solicitado, devido ao fato\n")
printf("De a funcao ln nao ser trivial para aproximar")
	 	  	 	   	      	    		   		    	 	
