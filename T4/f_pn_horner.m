function y = f_pn_horner(n, a, xp)
  %Pn(xi)=a(1)+a(2)*x+a(3)*x^2+...+a(n)*x^(n-1)+a(n+1)*x^n
  %Pn(xi)=a(1)+x*(a(2)+x*(a(3)+...+x*(a(n)+x*a(n+1))...))% HORNER  (ordem crescente de grau)
  
  for ip=1:length(xp) %calcula y p/ cada elemento de x
    aux = a(n+1);
    for i=n:-1:1
      aux = a(i) + aux*xp(ip);
    end
    y(ip) = aux;
  end
end
