%function [x1, t1, xx1, tt, ww, w_trop        ]  = Hovmoller()        % surf
function [w_trop1 ,w_trop2 , w_trop3 , w_trop4 ] = Hovmoller_collect(HL_bar, T, sigma)       % contour

HL_bar       = 99.992;
HV_bar       = 20.005;
T            = 10000;
x1           = [0:0.1:100];
t1           = [0:250:10000];
[xx1, tt]    = meshgrid(x1,  t1);
w_trop       = zeros(13 , 1001);
sigma        = 1;
N            = 0.01;

t = 0;
for i = 1:1:41
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    w_ext1               = ww(2,:);
    w_trop1(i,:)         = w_ext1(:);
    w_ext2               = ww(10,:);
    w_trop2(i,:)         = w_ext2(:);
    w_ext3               = ww(20,:);
    w_trop3(i,:)         = w_ext3(:);
    w_ext4               = ww(30,:);
    w_trop4(i,:)         = w_ext4(:);
    t = t + 250;
end
figure(1)
h(1) = subplot(4,1,1) ;
contourf(xx1 , tt, w_trop4);
colorbar
caxis([ -3 3])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(2) = subplot(4,1,2) ;
contourf(xx1 , tt, w_trop3);
colorbar
caxis([ -3 3])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(3) = subplot(4,1,3) ; 
contourf(xx1 , tt, w_trop2);
colorbar
title('w at 5km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(4) = subplot(4,1,4) ;
contourf(xx1 , tt, w_trop1);
colorbar
caxis([ -3 3])
title('w at 1km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

linkaxes(h)

% surf plot
% 
% [xx1, tt]    = meshgrid(x1,  t1);
% w_trop1      = zeros(24 , 1001);
% t = 0;
% for i = 1:1:24
%     [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
%     w_trop1(i,:)         = ww(10,:);
%     t = t + 250;
% end
% figure(2)
% surfc(w_trop1);
% xlabel('w value at the tropopause')
% ylabel('time')
% zlabel('Velocity magnitude')


return