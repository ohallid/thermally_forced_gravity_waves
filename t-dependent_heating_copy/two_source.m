% two narrow heat sources superposed sub GCM grid scale.
function [total_w1, total_w2, total_w3, total_w4 ] = two_source(HL_bar, T, sigma, x_0)       

HL_bar       = 99.992;
HV_bar       = 20.005;
T            = 10000;
x1           = [0:0.1:100];
t1           = [0:250:10000];
[xx1, tt]    = meshgrid(x1,  t1);
sigma        = 1;
N            = 0.01;

t = 0;
for i = 1:1:41
    x_0  = 45;
    [ xx, zz, psi, ww1 ] = series_half_sinusoid_plots_4(HL_bar , HV_bar, t, T, sigma, x_0);
    ww1  = ww1 / 2 ;
    w_ext1               = ww1(2,:);
    w_trop1(i,:)         = w_ext1(:);
    w_ext2               = ww1(10,:);
    w_trop2(i,:)         = w_ext2(:);
    w_ext3               = ww1(20,:);
    w_trop3(i,:)         = w_ext3(:);
    w_ext4               = ww1(30,:);
    w_trop4(i,:)         = w_ext4(:);
    t = t + 250;
end
for j = 1:1:41
    x_0  = 55;
    [ xx, zz, psi, ww2 ] = series_half_sinusoid_plots_4(HL_bar , HV_bar, t, T, sigma, x_0);
    ww2  = ww2 / 2 ;
    w_ext1p               = ww2(2,:);
    w_trop1p(j,:)         = w_ext1p(:);
    w_ext2p               = ww2(10,:);
    w_trop2p(j,:)         = w_ext2p(:);
    w_ext3p               = ww2(20,:);
    w_trop3p(j,:)         = w_ext3p(:);
    w_ext4p               = ww2(30,:);
    w_trop4p(j,:)         = w_ext4p(:);
    t = t + 250;
end

% Superpose w responses
    total_w1          = w_trop1p + w_trop1;
    total_w2          = w_trop2p + w_trop2;
    total_w3          = w_trop3p + w_trop3;
    total_w4          = w_trop4p + w_trop4;


figure(1)

h(1) = subplot(4,1,1) ;
contourf(xx1 , tt, total_w4);
colorbar
caxis([ -3 3])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(2) = subplot(4,1,2) ;
contourf(xx1 , tt, total_w3);
colorbar
caxis([ -3 3])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(3) = subplot(4,1,3) ; 
contourf(xx1 , tt, total_w2);
colorbar
title('w at 5km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(4) = subplot(4,1,4) ;
contourf(xx1 , tt, total_w1);
colorbar
caxis([ -3 3])
title('w at 1km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

linkaxes(h)

return
