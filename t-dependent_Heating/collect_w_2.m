function [ww] = collect_w_2()

figure (6)

H_bar   = 0.9898;
Ht_bar  = 0.3367;
t       = 2000;
T       = 100000;
sigma   = 5;


% lid height 10
h(1)  =  subplot(3,1,1);
HL_bar   = 99.993;
HV_bar   = 10.005;
[ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww,30);
% axis tight
colorbar
grid on
axis equal
x = sprintf('w structure at (Nt/FWHM)=%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / FWHM');
ylabel('z / Ht');


% lid height 3
h(2)  =  subplot(3,1,2) ;
HL_bar   = 20.015;
HV_bar   = 10.005;
[ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww,30);
colorbar
%axis tight
grid on
axis equal
x = sprintf('w structure (Nt/FWHM)=%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / FWHM');
ylabel('z / Ht');

% lid height 1
h(3)  =  subplot(3,1,3); 
HL_bar   = 1.050;
HV_bar   = 1.005;
[ xx, zz, psi,ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww,30);
colorbar
%axis tight
grid on
axis equal
x = sprintf('w structure (N * H * t / pi / sigma)=%6.1f');
title(x);
xlabel('x / FWHM');
ylabel('z / Ht');



linkaxes(h)
xlim([0  20])
ylim([0 10])



% figure (2)
% [ xx, zz, psi, ww ] = series_half_sinusoid_plots(HL_bar , HV_bar, t);
% contour(xx, zz, ww, 20)
% grid on
% % axis equal


return 

