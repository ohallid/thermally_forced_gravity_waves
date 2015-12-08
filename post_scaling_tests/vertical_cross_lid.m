function [bb] = vertical_cross_lid()

T       = 3600;  % secs
sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 128;
t       = 1800;

figure (1)

h(1)  =  subplot(4,2,1);
HL_bar  = 63.999;
HV_bar  = 30.105513;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
x = sprintf('Potential Temperature (units)');
title(x);
ylabel('z / Ht');
legend('H_L = 64 ')


h(2)  =  subplot(4,2,3);
HL_bar  = 9.999;
HV_bar  = 30.105513;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('H_L = 10')

h(3)  =  subplot(4,2,5) ;
HL_bar  = 3.01;
HV_bar  = 3.01;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('H_L = 3')

h(4)  =  subplot(4,2,7); 
HL_bar  = 1.01;
HV_bar  = 1.01;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,bb,10);
colorbar
caxis([-3 3]);
grid on
axis equal
xlabel('x / \sigma_0');
ylabel('z / Ht');
legend('H_L = 1')


h(5)  =  subplot(4,2,2);
HL_bar  = 63.999;
HV_bar  = 30.105513;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
x = sprintf('Vertical Velocity (m/s)');
title(x);
ylabel('z / Ht');
legend('H_L = 64')


h(6)  =  subplot(4,2,4);
HL_bar  = 9.999;
HV_bar  = 30.105513;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('H_L = 10')

h(7)  =  subplot(4,2,6) ;
HV_bar  = 3.01;
HL_bar  = 3.01;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
ylabel('z / Ht');
legend('H_L = 3')

h(8)  =  subplot(4,2,8);
HV_bar  = 1.01;
HL_bar  = 1.020999;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
contourf(xx,zz,ww,10);
colorbar
caxis([-3 3]);
grid on
axis equal
xlabel('x / \sigma_0');
ylabel('z / Ht');
legend('H_L = 1')


linkaxes(h)
xlim([0  10])
ylim([0  6])


return 

