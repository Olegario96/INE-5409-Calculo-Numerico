function a = f_calcula_exp_sin_maclauren(n)
  for i = 0 : n + 1
    a(2 * i + 1) = (-1) ^ i / (factorial(2 * i));
  end

  for i = 2 : 2 : fix((n - 1)/2)
  	a(i) = 0;
  end
end