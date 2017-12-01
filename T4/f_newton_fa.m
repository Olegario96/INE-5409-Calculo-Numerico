function X=f_newton_fa(n,Xi)
   tol=1e-14;
    criterio=1;contador=0;
    Dx=1e-4*Xi;
    while (criterio>tol && contador<50)
        contador=contador+1;
        %Gerando a jacobiana
        Yi=f_newton(Xi); %Valor inicial
        Xj=Xi;
        for j=1:n %varre as colunas
            Xj(j)=Xi(j)+Dx(j); %incremento somente na coluna j
            Yj=f_newton(Xj); %Valor incrementado
            for i=1:n
                A(i,j)=(Yj(i) - Yi(i))/Dx(j); %Monta colunas a matriz da Jacobiana 
            end
            Xj(j)=Xi(j);% volta ao valor original
        end
        b=-transpose(Yi);
        Dx=A \ b;
        X=Xi+Dx;
        Xi=X;
        criterio=max(abs(Dx));
    end
end                                       
