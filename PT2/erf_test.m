%erf test
x = [-10:0.1:10];
x0 = 2;
y = erf(x - x0);
figure(10)
plot(x, y)
grid on
axis equal