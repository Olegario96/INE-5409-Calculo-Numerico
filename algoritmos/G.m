function Y=G(X)
    Y(1)=  X(1)*X(1) + X(2)*X(2) + X(3)*X(3) - 1;
    Y(2)=2*X(1)*X(1) + X(2)*X(2)-4*X(3);
    Y(3)=3*X(1)*X(1)-4*X(2)      + X(3)*X(3);
end