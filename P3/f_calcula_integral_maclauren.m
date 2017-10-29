function a = f_calcula_integral_maclauren(n)
  for i = 1 : 2 : n + 1
  	a(i) = 0;
  end

  for i = 0 : 1 : fix((n - 1)/2)
  	a(2 * i + 2) = (-1) ^ i / (factorial(i) * (2 * i + 1));
  end
end