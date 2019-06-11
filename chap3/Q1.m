%修改n即可满足第3问的要求
n = 8;

H = hilb(n);%hilbert矩阵
x = ones(n, 1);
b = H * x;

%cholesky分解,得到上三角矩阵L
%L = Cholesky(H);
L = chol(H);
answer = L \ (L'\b);
%disp(answer);
r = b - H * answer;
delta_x = answer - x;

%r的无穷范数
fprintf('残差r : ')
disp(norm(r, inf));
fprintf('误差delta_x : ')
disp(norm(delta_x, inf));

%右端项施加10^-7扰动
b1 = b + ones(n, 1) * 1e-7;
answer1 = L \ (L'\b1);
r1 = b1 - H * answer1;
delta_x1 = answer1 - x;
fprintf('残差r1 : ')
disp(norm(r1, inf));
fprintf('误差delta_x1 : ')
disp(norm(delta_x1, inf));