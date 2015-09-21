function [bb] = collect_pt_2()

figure ( 1 )

H_bar   = 0.9898;
Ht_bar  = 0.3367;
t       = 300;
T       = 999991000; 
sigma   = 1;

% lid height 20
HL_bar   = 19.993;
HV_bar   = 20.001;
[ bb, uu, ww, xx, zz ] = series_half_sinusoidp_w_b_2(HL_bar , HV_bar, t,T, sigma);
contourf(xx,zz,bb,30);
colorbar
caxis([-0.5 0.5])
grid on
axis equal
hold on
scale_factor = 0.005;
%quiver(xx,zz, uu*scale_factor,ww*scale_factor,'AutoScale','off')
%
%
x = sprintf('PT structure at (NHt / pi / sigma)=%6.1f, H=%6.1f*H_t',t,HL_bar);
x2 = title(x);
set(x2, 'FontSize', 20)
y1 = ylabel('z / Ht');
set(y1, 'FontSize', 15)
 x1 = xlabel('x / L');
 set(x1, 'FontSize', 15)
 
xlim([0  20])
ylim([0  10])

return 

