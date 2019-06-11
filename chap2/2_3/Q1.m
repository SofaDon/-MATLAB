b = inline('besselj(0,x)');
for n = 1:10
    z(n) = fzerotx(b, [n-1, n] * pi);
end
x = 0 : pi / 50 : 10 * pi;
y = b(x);
plot(z, zeros(1, 10), 'b*', x, y, '-')
line([0,10 * pi], [0,0], 'color', 'black')
axis([0, 10*pi, -0.5, 1.0])
disp(z)