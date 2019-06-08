%MΪ���׵�����ֵ������ eeΪ˫��������������
M = 1.0;
ee = 1e-16;

%����longspace������ȡ����
h = logspace(-16, 0, 160);

%���̽���
f1 = (sin(1+h) - sin(1)) ./ h;
%disp(f1);

%ʵ�����
error1 = abs(f1 - cos(1));
%disp(error1);

%�������
error2 =  M * h / 2.0 + (2 * ee) ./ h;
%disp(error2);

%�ض������
error3 = M * h / 2.0;
%disp(error3);

%���������
error4 = (2 * ee) ./ h;
%disp(error4);

%˫�����̶�ͼ��ͼ
loglog(h,error1);
hold on;
loglog(h,error2, '--');
hold on;
loglog(h,error3, '--');
hold on;
loglog(h,error4, '--');
hold on;

xlabel('����h');
ylabel('���');
axis([1e-16 1 1e-17 10])