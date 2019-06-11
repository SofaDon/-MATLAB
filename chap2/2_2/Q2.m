%第二问
x0 = 1.35;
%误差阈值
delta = 1e-6;
%初始值λ0
lamda = 1;
x1 = x0 - lamda * f2(x0) / ff2(x0);

while abs(f2(x0)) > delta || abs(x1 - x0) > delta
    s = f2(x0) / ff2(x0);
    x1 = x0 - s;
    lamda = 1;
    while abs(f2(x1)) >= abs(f2(x0))
        x1 = x0 - lamda * s;
        lamda = lamda / 2;
    end
    x0 = x1;

    fprintf("lamda : ");
    disp(lamda);
    fprintf("x : ");
    disp(x1);
end
fprintf("final x : ");
disp(x1);
return