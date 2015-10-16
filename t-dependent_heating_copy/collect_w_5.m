function [ww] = collect_w_5()

figure(1)

H_bar   = 0.9898;
Ht_bar  = 1;
t       = 6000;
T       = 2222250;
sigma   = 5;

%for t = 0:200:10000
HL_bar   = 99.993;
HV_bar   = 20.03;
[ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww,20);
% axis tight
colorbar
% caxis([-4000 4000])
grid on
axis equal
x = sprintf('w structure at (NHt / pi / sigma)=%6.1f, H=%6.1f*H_t',t,HL_bar);
x2 = title(x);
set(x2, 'FontSize', 20)
y1 = ylabel('z / Ht');
set(y1, 'FontSize', 15)
 x1 = xlabel('x / L');
 set(x1, 'FontSize', 15)
xlim([45 55])
ylim([0 5])
%pause(1)
%end

return 

