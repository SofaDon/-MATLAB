format long
a1 = single(0);
a2 = single(0);
b1 = single(0);
b2 = single(0);
n = 99999999; %定一个极大的循环上限
accuarcy = 0.5 * 0.6 * 1e-7; %单精度机器精度

%利用单精度浮点数进行计算
for i = 1 : n
    a1 = a2;
    a2 = a2 + 1 / i;
    if a2 - a1 == 0
        disp(i);
        disp(a2);
        break;
    end
end

%利用定理1.6计算理论分析的结论
for i = 1 : n
    b1 = b2;
    b2 = b2 + 1 / i;
    if (1 / i) / b2 <= accuarcy
        disp(i);
        disp(b2);
        break;
    end
end 