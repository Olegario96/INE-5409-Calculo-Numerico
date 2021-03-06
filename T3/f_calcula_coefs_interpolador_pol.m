function coefs = f_calcula_coefs_interpolador_pol(n, valores_x, valores_y)
  for i = 1 : n + 1
  	A(i, 1) = 1;
    for j = 2 : n + 1
      A(i, j) = A(i, j - 1) * valores_x(i);
    end
  end

  b = transpose(valores_y);
  coefs = A \ b;
end
