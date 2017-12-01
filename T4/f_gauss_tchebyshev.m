function gtm = f_gauss_tchebyshev(m, func)
  ci = pi/m;
  
  for k = 1 : m
    t(k) = cos( ((2*k - 1) * pi) / (2*m) );
  end

  soma = 0;
  for k = 1:m
    soma += feval(func, t(k));
  end
  
  gtm = ci * soma;
end