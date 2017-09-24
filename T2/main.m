#{
    Considerando a estrutura do polinomio original fornecido e tambem a
    a alternativa letra 'a' do trabalho, o polinomio serah rebaixado de grau
    tres vezes consecutivas usando o metodo do Brio Ruffini, uma vez que eh
    claramente visivel que ele possui tres raizes iguai reais que no caso eh o 
    0.
#}

primeira_raiz = 0;
eq_original = [1, 3.4, 2.35, 4.32, 7.1685, 1.56006, 3.287061, 2.480058, 0.531441, 0, 0, 0];
n = length(eq_original);
raizes_calculadas(n - 1) = 0;


%---------- ITEM A ----------%
eq_rebaixada = eq_original;
multi = calcula_multiplicidade(eq_original, primeira_raiz);

for i = 1 : multi
    eq_rebaixada = f_briot_ruffini(eq_rebaixada, primeira_raiz);
    eq_rebaixada = eq_rebaixada(1:n-i);
end

tam_rebaixada = length(eq_rebaixada);
for i = 1: tam_rebaixada - 1
    raiz_inicial = estima_raiz(eq_rebaixada);
    raiz_aproximada = f_newton(eq_rebaixada, raiz_inicial);
    eq_rebaixada = f_briot_ruffini(eq_rebaixada, raiz_aproximada);
    eq_rebaixada = eq_rebaixada(1:tam_rebaixada-i);
    raizes_calculadas(i + 3) = raiz_aproximada;
end

raizes_calculadas

%---------- ITEM C ----------%

"O polinomio fatorado fica na forma: "
"x*x*x*(x+2.79499)*(x+1.40525)*(x+0.337946-0.128633i)*(x+0.337946+0.128633i)*(x-0.314722-1.1195i)*(x-0.314722+1.1195i)(x-0.423344-0.7655i)(x-0.423344+0.7655i)"

%---------- ITEM D ----------%
"A solucao dada aplicando a funcao 'roots' na equacao original eh"
roots(eq_original)

"A solucao dada (tambem usando a equacao original) pelo Wolfram|Alph eh:"
raizes_wolfram = [-2.79499, -1.40525, 0, -0.337946 - 0.128633i, -0.337946 + 0.128633i, 0.314722 - 1.1195i, 0.314722 + 1.1195i, 0.423344 - 0.7655i, 0.423344 + 0.7655i]	 	  	 	   	      	    		   		    	 	
