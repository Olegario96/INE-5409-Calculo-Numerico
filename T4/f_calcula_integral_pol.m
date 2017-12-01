function integral = f_calcula_integral_pol(coefs, a, b)
  n = length(coefs);
  parte_b = 0;
  parte_a = 0;
  for i = 1 : n
  
    parte_b += ((coefs(i) * (b ^ (n - i + 1))) / (n - i + 1));
    parte_a += ((coefs(i) * (a ^ (n - i + 1))) / (n - i + 1));
  end
  integral = parte_b - parte_a;
end
