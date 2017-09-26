format long
#{
    Considerando a estrutura do polinomio original fornecido e tambem a
    a alternativa letra 'a' do trabalho, o polinomio serah rebaixado de grau
    tres vezes consecutivas usando o metodo do Brio Ruffini, uma vez que eh
    claramente visivel que ele possui tres raizes iguai reais que no caso eh o 
    0.
#}

primeira_raiz = 0;
<<<<<<< HEAD
eq_original = [1 -3.4 +2.35  4.32 -7.1685 +1.56006 +3.287061 -2.480058 0.531441  0  0  0];
=======
eq_original = [1, -3.4, 2.35, 4.32, -7.1685, 1.56006, 3.287061, -2.480058, 0.531441, 0, 0, 0];
>>>>>>> 302842005fdc188b4e52da751dcd00b87097a385
n = length(eq_original);
raizes_calculadas(n - 1) = 0;


%---------- ITEM A ----------%
eq_rebaixada = eq_original;
r = restos(eq_original, primeira_raiz);
multi = calcula_multiplicidade(r);

for i = 1 : multi
    eq_rebaixada = f_briot_ruffini(eq_rebaixada, primeira_raiz);
    eq_rebaixada = eq_rebaixada(1:n-i);
end

equacao_grau_8 = eq_rebaixada;
tam_rebaixada = length(eq_rebaixada);
for i = 1 : tam_rebaixada - 1
    raiz_inicial = estima_raiz(eq_rebaixada);
    raiz_aproximada = f_newton(eq_rebaixada, raiz_inicial);
    eq_rebaixada = f_briot_ruffini(eq_rebaixada, raiz_aproximada);
    eq_rebaixada = eq_rebaixada(1:tam_rebaixada-i);
    raizes_calculadas(i + 3) = raiz_aproximada;
end

transpose(raizes_calculadas)
raizes_calculadas(n - 1) = 0;
%---------- ITEM B ----------%
eq_rebaixada = equacao_grau_8;
for i = 1 : tam_rebaixada - 1
    raiz_inicial = estima_raiz(eq_rebaixada);
    raiz_aproximada = f_newton_restos(eq_rebaixada, raiz_aproximada);
    eq_rebaixada = f_briot_ruffini(eq_rebaixada, raiz_aproximada);
    eq_rebaixada = eq_rebaixada(1:tam_rebaixada-i);
    raizes_calculadas(i + 3) = raiz_aproximada;
end

transpose(raizes_calculadas)
%---------- ITEM C ----------%

"O polinomio fatorado fica na forma: "
<<<<<<< HEAD
"x*x*x*(x+1)*(x+1)*(x-0.8999)^6"
=======
"x*x*x*(x+1)*(x+1)*(x-0.89822+0.00105i)*(x-0.89822-0.00105i)*(x-0.90002+0.00207i)*(x-0.90002-0.00207i)*(x-0.89998-0.00207i)*(x-0.89998+0.00207i))"
>>>>>>> 302842005fdc188b4e52da751dcd00b87097a385

%---------- ITEM D ----------%
"A solucao dada aplicando a funcao 'roots' na equacao original eh"
transpose(roots(eq_original))

<<<<<<< HEAD
"A solucao dada (tambem usando a equacao original) pelo Wolfram|Alpha eh:"
transpose(raizes_wolfram = [-1, 0, 0.898175-0.00105142i, 0.898175+0.00105142i, 0.899996-0.00210907i, 0.899996+0.00210907i, 0.901828-0.00105766i, 0.901828+0.00105766i])	 	  	 	   	      	    		   		    	 	
=======
"A solucao dada (tambem usando a equacao original) pelo Wolfram|Alph eh:"
raizes_wolfram = [-1, 0, 0.898175-0.00105142i, 0.898175+0.00105142i, 0.899996-0.00210907i, 0.899996+0.00210907i, 0.901828-0.00105766i, 0.901828+0.00105766i]
>>>>>>> 302842005fdc188b4e52da751dcd00b87097a385
