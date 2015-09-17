function [ww1, ww2] = collect_w_difference()


H_bar   = 0.9898;
Ht_bar  = 0.3367;


for t = 1:250:1
figure(1)
T  = 1000;
%t  = 690;
HL_bar   = 2.05;
HV_bar   = 20.01;
sigma    = 1.00002;
[ xx, zz, psi, ww1 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx, zz, ww1, 20)
caxis([-2000 2000 ])
colorbar
axis equal
xlim([0 100])
ylim([0 20])


figure(2)
T = 1000;
%t = 690;
HL_bar   = 2.05;
HV_bar   = 20.01;
sigma    = 0.100001;
[ xx, zz, psi, ww2 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx, zz, ww2, 20)
caxis([-2000 2000 ])
colorbar
axis equal
xlim([0  100])
ylim([0 20])


figure(3)
diff = ww1 - ww2;
contourf(xx, zz, diff, 20)
caxis([-2000 2000 ])
colorbar
grid on
axis equal
x1 = title('Difference in w-field response between constant and time-dependent heating, $t \approx 180mins$','interpreter','latex' ) ;
set(x1, 'FontSize', 25)
x = xlabel('x / FWHM','interpreter','latex' );
y = ylabel('z / Ht','interpreter','latex' );
set(x, 'FontSize', 20)
set(y, 'FontSize', 20)
legend('t \approx 180mins')
xlim([0  100])
ylim([0 20])
 
pause(1)

end



return 

