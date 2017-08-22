n = 50;

% o metodo de gerar as equacoes gera elas em forma de matrix [A b]
equacoes = geraEquacoes(n);
resolucaoDireto = fGauss(equacoes);
residuoDireto = fResiduo(equacoes, resolucaoDireto);
numeroOpDireto = ((4*n^3) + (9*n^2) - n - 6)/6;
"-----Resolucao por metodo direto -----"
"Primeira incognita:"
resolucaoDireto(1)
"Ultima incognita:"
resolucaoDireto(50)
"Residuo maximo:"
residuoDireto
"Numero de operacoes de ponto flutuante:"
numeroOpDireto

for i = 1: n
    sI(i) = 0;
end
criterio = 1e-4;
resultado = avaliaConvergencia(equacoes);
resolucaoIterativa = fGaussSeidel(n, sI, criterio);
resolucaoIterativaMelhorada = fGaussSeidel(n, resolucaoIterativa, realpow(criterio, 2));
residuoIterativa = fResiduo(equacoes, resolucaoIterativa);
k = 12;
numeroOpIterativo = nOpGaussSeidel = k * (5 + (n/2 -2) * 16 + 5 + n);
"-----Resolucao por metodo iterativo -----"
"Sobre a diagonal principal podemos afirmar que"
switch(resultado)
    case(1)
        "Existe ao menos uma linha em que o elemento da diagonal eh dominante e nas demais linhas o elemento da diagonal principal eh pelo menos igual a soma dos vizinhos"
    case(-1)
        "Existe ao menos uma linha em que a soma dos vizinhos eh superior ao elemento da diagonal principal"
    otherwise
        "Em todas as linhas, o elemento da diagonal principal eh igual a soma dos vizinhos"
endswitch
"Fator otimizado de relaxacao:"
1.2
"Primeira incognita:"
resolucaoIterativa(1)
"Segunda incognita:"
resolucaoIterativa(50)
"Residuo:"
residuoIterativa
"Numero de iteracoes"
k
"Numero de operacoes de ponto flutuante:"
numeroOpIterativo
"Erro de truncamento maximo"
max(abs((resolucaoIterativa - resolucaoIterativaMelhorada)/resolucaoIterativaMelhorada))