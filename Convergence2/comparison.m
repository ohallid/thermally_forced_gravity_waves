function [bb] = comparison()

t       = 500;   % secs
T       = 10000;  % secs
sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 128;

figure ( 1 )

% lid height 1
h(1)  =  subplot(3,1,1);
HL_bar   = 199.999;
HV_bar   = 3;
% [ ww, bb, fs, xx, zz ] = series_half_sinusoidp_w_b(HL_bar , HV_bar, t, T);
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar )
contourf(xx,zz,ww,30);
colorbar
grid on
axis equal
x = sprintf('w-response at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / \sigma_0');
ylabel('z / Ht');
% lid height 1
h(2)  =  subplot(3,1,2) ;
HL_bar   = 3.05;
HV_bar   = 3;
% [ww, bb, fs, xx, zz ] = series_half_sinusoidp_w_b(HL_bar , HV_bar, t, T);
[ ww1, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar )
contourf(xx,zz,ww1,30);
colorbar
grid on
axis equal
x = sprintf('w-response at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / \sigma_0');
ylabel('z / Ht');
% lid height 3
h(3)  =  subplot(3,1,3); 

contourf(xx,zz,ww-ww1,30);
colorbar
grid on
axis equal
x = sprintf('Difference at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / \sigma_0');
ylabel('z / Ht');

linkaxes(h)
xlim([0  10])
ylim([0  3])

%figure ( 5 )
%plot(FS,z);
%xlabel('Q');
%ylabel('z/H')
%axis tight
%grid on
%title('Fourier series of heat forcing function');



return 

