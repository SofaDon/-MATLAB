format long
a1 = single(0);
a2 = single(0);
b1 = single(0);
b2 = single(0);
n = 99999999; %��һ�������ѭ������
accuarcy = 0.5 * 0.6 * 1e-7; %�����Ȼ�������

%���õ����ȸ��������м���
for i = 1 : n
    a1 = a2;
    a2 = a2 + 1 / i;
    if a2 - a1 == 0
        disp(i);
        disp(a2);
        break;
    end
end

%���ö���1.6�������۷����Ľ���
for i = 1 : n
    b1 = b2;
    b2 = b2 + 1 / i;
    if (1 / i) / b2 <= accuarcy
        disp(i);
        disp(b2);
        break;
    end
end 