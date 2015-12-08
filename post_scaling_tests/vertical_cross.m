function [bb] = vertical_cross()

T       = 3600;  % secs
sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 128;
HL_bar   = 63.999;
HV_bar   = 6;

figure (1)

h(1)  =  subplot(4,2,1);
t     = 900;;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
x = sprintf('Potential Temperature (units)');
title(x);
ylabel('z / Ht');
legend('t = 900s')


h(2)  =  subplot(4,2,3);
t     = 1800;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('t = 1800s')

h(3)  =  subplot(4,2,5) ;
t     = 2700;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('t = 2700s')

h(4)  =  subplot(4,2,7); 
t     = 3600;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
xlabel('x / \sigma_0');
ylabel('z / Ht');
legend('t = 3600s')


h(5)  =  subplot(4,2,2);
t     = 900;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
x = sprintf('Vertical Velocity (m/s)');
title(x);
ylabel('z / Ht');
legend('t = 900s')


h(6)  =  subplot(4,2,4);
t     = 1800;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('t = 1800s')

h(7)  =  subplot(4,2,6) ;
t     = 2700;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('t = 2700s')

h(8)  =  subplot(4,2,8);
t     = 3600;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
xlabel('x / \sigma_0');
ylabel('z / Ht');
legend('t = 3600s')


linkaxes(h)
xlim([0  10])
ylim([0  6])


return 

