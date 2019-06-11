%�޸�n���������3�ʵ�Ҫ��
n = 8;

H = hilb(n);%hilbert����
x = ones(n, 1);
b = H * x;

%cholesky�ֽ�,�õ������Ǿ���L
%L = Cholesky(H);
L = chol(H);
answer = L \ (L'\b);
%disp(answer);
r = b - H * answer;
delta_x = answer - x;

%r�������
fprintf('�в�r : ')
disp(norm(r, inf));
fprintf('���delta_x : ')
disp(norm(delta_x, inf));

%�Ҷ���ʩ��10^-7�Ŷ�
b1 = b + ones(n, 1) * 1e-7;
answer1 = L \ (L'\b1);
r1 = b1 - H * answer1;
delta_x1 = answer1 - x;
fprintf('�в�r1 : ')
disp(norm(r1, inf));
fprintf('���delta_x1 : ')
disp(norm(delta_x1, inf));