function [bb] = collect_pt_panel()

t = 0;
for i = 1:50
%t       = 250;  % secs
T       = 20000000;  % secs
sigma   = 5;     % muliples reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0

figure ( 1 )

% lid height 10
HL_bar   = 99.999;
HV_bar   = 10;
[ ww, bb, fs, xx, zz ] = series_half_sinusoidp_w_b(HL_bar , HV_bar, t, T);
contourf(xx,zz,bb,30);
colorbar
caxis([-150 150])
grid on
axis equal
x = sprintf('Potential Temperature at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / \sigma_0');
ylabel('z / Ht');


xlim([0  10])
ylim([0  10])
pause
t = t + 500;
end

%figure ( 5 )
%plot(FS,z);
%xlabel('Q');
%ylabel('z/H')
%axis tight
%grid on
%title('Fourier series of heat forcing function');



return 

