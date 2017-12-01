function y = f_newton(a)
  y(1) = 0;
  y(2) = 0;
  
  t = [0.2 0.4 0.6 0.8 0.9 1.0]; 
  v = [0.04 0.14 0.30 0.45 0.61 0.69];
  m = length(t);
  
  for k = 1 : m
    y(1) += ((log(a(1) + (a(2) * t(k) * t(k)))) - v(k)) / (a(1) + (a(2) * t(k) * t(k)));
  end
  
  for k = 1 : m
    y(2) += ((log(a(1) + (a(2) * t(k) * t(k)))) - v(k)) * ((t(k) * t(k)) / (a(1) + a(2) * t(k) * t(k)));
  end
end
