format long
a1 = 0;
a2 = 0;
ciecle = 2097152; %第1问中的n

for i = 1 : 2097152
    a1 = a2;
    a2 = a2 + 1 / i * 1.0;
    if a2 - a1 == 0
        fprintf("i : %d\n", i);
        break;
    end
end

disp(a2);
