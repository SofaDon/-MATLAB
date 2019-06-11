function u = Cholesky(A)
if A ~= A'
    error('Invalid input.')
end
[m,n] = size(A);
u = zeros(n,n);
for i  = 1 : n
    u(i,i) = A(i,i);
    for k = 1 : i - 1
        u(i,i) = u(i,i) - u(k,i) ^2;
    end
    u(i,i) = sqrt(u(i,i));
    for j = i + 1 : n
        u(i,j) = A(i,j);
        for k = 1 : i - 1
            u(i,j) = u(i,j) - u(k,i) * u(k,j);
        end
        u(i,j) = u(i,j)/u(i,i);
    end
end
