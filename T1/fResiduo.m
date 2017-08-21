function rmax = fResiduo(A, x)
    b = A(:, [length(A)]);
    A(:, [length(A)]) = [];
    n = length(A);
    for i = 1 : n
        r(i) = abs(sum(A(i,:)*x(:)) - b(i));
    end
    rmax = max(r);
end