% Collect matrices, scatter plot.

v1  = [3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25];
v2  = [R3 R4 R5 R6 R7 R8 R9 R10 R11 R12 R13 R14 R15 R16 R17 R18 R19 R20 R21 R22 R23 R24 R25];

figure(1)
scatter(v1, v2, 200 ,'x')
%axis equal
grid on
title('$$\sqrt{Residual}$$ vs. Lid height, $$\bar{t} = 100$$','interpreter','latex' ) ;
xlabel('$$H_L (Ht)$$','interpreter','latex' );
ylabel('$$\sqrt{Residual}$$','interpreter','latex' );