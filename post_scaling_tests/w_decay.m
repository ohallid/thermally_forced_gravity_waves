function [] = w_decay() 

T       = 3600;  % secs
sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 128;
HL_bar  = 63.999;
HV_bar  = 1;
dx      = 0.1;
x       = [0:dx:20 ];



h(1)  =  subplot(4,2,1);
t     = 1800;;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
plot(bb);
grid on
%axis equal
x = sprintf('Potential Temperature (units)');
title(x);
ylabel('z / Ht');
legend('t = 1800s')


h(2)  =  subplot(4,2,3);
t     = 3600;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
plot(bb);
grid on
%axis equal
ylabel('z / Ht');
legend('t = 3600s')

h(3)  =  subplot(4,2,5) ;
t     = 5400;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
plot(bb);
grid on
%axis equal
ylabel('z / Ht');
legend('t = 5400s')

h(4)  =  subplot(4,2,7); 
t     = 7200;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
plot(bb);
grid on
%axis equal
xlabel('x / \sigma_0');
ylabel('z / Ht');
legend('t = 7200s')


h(5)  =  subplot(4,2,2);
t     = 1800;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
ww = mean(ww);
plot(ww);
grid on
%axis equal
x = sprintf('Vertical Velocity (m/s)');
title(x);
ylabel('z / Ht');
legend('t = 1800s')


h(6)  =  subplot(4,2,4);
t     = 3600;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
ww = mean(ww);
plot(ww);
grid on
%axis equal
ylabel('z / Ht');
legend('t = 3600s')

h(7)  =  subplot(4,2,6) ;
t     = 5400;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
ww = mean(ww);
plot(ww);
grid on
%axis equal
ylabel('z / Ht');
legend('t = 5400s')

h(8)  =  subplot(4,2,8);
t     = 7200;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
ww = mean(ww);
plot(ww);
grid on
%axis equal
xlabel('x / \sigma_0');
ylabel('z / Ht');
legend('t = 7200s')


linkaxes(h)
xlim([0  1000])
ylim([-3  3])




return