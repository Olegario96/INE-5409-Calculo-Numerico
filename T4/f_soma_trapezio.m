function soma_trapezio = f_soma_trapezio(a, b, n)
  h = (b - a)/n;
  
  x = a : h : b;
  y = (2 / sqrt(pi)) .* exp(-x .^ 2);
  soma = 0;
  for i = 2 : n
    soma += y(i);
  end
  soma_trapezio = 0.5 * h * (y(1) + (2 * soma) + y(n+1));
end
