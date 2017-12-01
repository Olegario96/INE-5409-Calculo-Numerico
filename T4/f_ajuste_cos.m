function a = f_ajuste_cos(m, x, y)
  A(1,1) = sum(x .* x);;
  A(1,2) = sum(x .* cos(x));
  A(2,1) = A(1,2)
  A(2,2) = sum(cos(x) .* cos(x));
  b = [sum(x .* y); sum(y .* cos(x))];

  a = A\b;
end
