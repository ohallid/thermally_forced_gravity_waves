% 2 panels showing w and b for different lidded regimes

function [ww, bb ] = w_pt_combined();

t       = 2000;   % secs
T       = 10000;  % secs
sigma   = 5;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 1;
HL_bar  = 1.01001;
HV_bar  = 1; 
Q       = 0.25;

figure(4)
h(1)  =  subplot(2,1,1);
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
ww = ww * Q;
contourf(xx,zz,ww,30);
colorbar
%caxis([ -20 20])
grid on
%axis equal
x = sprintf('Vertical Velocity at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / \sigma_0');
ylabel('z / Ht');


h(2)  =  subplot(2,1,2) ;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = bb * Q; 
contourf(xx,zz,bb,30);
colorbar
%caxis([ -20 20])
grid on
%axis equal
x = sprintf('Potential Temperature at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / \sigma_0');
ylabel('z / Ht');


linkaxes(h)
xlim([0  20])
ylim([0  1])


end
