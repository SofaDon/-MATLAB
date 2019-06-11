function b = fzerotx(F, ab, varargin)
a = ab(1);  %检查输入的是否是有根区间
b = ab(2);  %初始化搜索区间的变量 abc
fa = F(a, varargin{:});  %函数求值
fb = F(b, varargin{:});
if sign(fa) == sign(fb)
    error('Funtion must change sign on the interval')
end

c = a;
fc = fa;
d = b-c;
e = d;

while fb ~= 0   %主循环的开始
    if sign(fa) == sign(fb)     %调整a、b的值 使函数f(x)在它们之间改变正负号
        a = c;  fa = fc;
        d = b - c;  e = d;
    end
    
    if abs(fa) < abs(fb)    %交换a、b的值，因为b总是标记最优解
        c = b;  b = a;  a = c;
        fc = fb;  fb = fa;  fa = fc;
    end
    
    m = 0.5 * (a - b);
    tol = 2.0 * eps * max(abs(b), 1.0);
    if (abs(m) <= tol) || (fb == 0.0)   %收敛测试 可能从中退出
        break
    end
    
    if (abs(e) < tol) || (abs(fc) <= abs(fb))   %二分法
        d = m;
        e = m;
    else
        s = fb / fc;
        if (a == c)     %割线法
            p = 2.0 * m * s;
            q = 1.0 - s;
        else    %逆二次插值法
            q = fc / fa;
            r = fb / fa;
            p = s * (2.0 * m * q * (q - r) - (b - c) * (r - 1.0));
            q = (q - 1.0) * (r - 1.0) * (s - 1.0);
        end
        
        if p > 0, q = -q;
        else 
            p = -p;
        end
        
        if(2.0 * p < 3.0 * m * q - abs(tol * q)) && (p < abs(0.5 * e * q))
            e = d;      %判断是否可接受
            d = p / q;
        else
            d = m;
            e = m;
        end
    end
    
    c = b;      %准备下一个迭代步，并计算 F 函数值
    fc = fb;
    if abs(d) > tol
        b = b + d;
    else
        b = b - sign(b - a) * tol;
    end
    fb = F(b, varargin{:});
end

    
    
    
    
    
    