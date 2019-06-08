%M为二阶导函数值的上限 ee为双浮点数机器精度
M = 1.0;
ee = 1e-16;

%利用longspace函数获取步长
h = logspace(-16, 0, 160);

%差商近似
f1 = (sin(1+h) - sin(1)) ./ h;
%disp(f1);

%实际误差
error1 = abs(f1 - cos(1));
%disp(error1);

%总误差限
error2 =  M * h / 2.0 + (2 * ee) ./ h;
%disp(error2);

%截断误差限
error3 = M * h / 2.0;
%disp(error3);

%舍入误差限
error4 = (2 * ee) ./ h;
%disp(error4);

%双对数刻度图绘图
loglog(h,error1);
hold on;
loglog(h,error2, '--');
hold on;
loglog(h,error3, '--');
hold on;
loglog(h,error4, '--');
hold on;

xlabel('步长h');
ylabel('误差');
axis([1e-16 1 1e-17 10])