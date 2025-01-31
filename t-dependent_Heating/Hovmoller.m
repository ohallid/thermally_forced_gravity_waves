%function [x1, t1, xx1, tt, ww, w_trop        ]  = Hovmoller()        % surf
function [w_trop1 ,w_trop2 , w_trop3 ] = Hovmoller()       % contour

HL_bar       = 20.992;
HV_bar       = 20.005;
T            = 500;
x1           = [0:0.1:100];
t1           = [0:250:3000];
[xx1, tt]    = meshgrid(x1,  t1);
w_trop       = zeros(13 , 1001);
sigma        = 5;
N            = 0.01;

t = 0;
for i = 1:1:13
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    w_ext1               = ww(10,:);
    w_trop1(i,:)         = w_ext1(:);
    w_ext2               = ww(20,:);
    w_trop2(i,:)         = w_ext2(:);
    w_ext3               = ww(30,:);
    w_trop3(i,:)         = w_ext3(:);
    t = t + 250;
end
figure(10)
h(1) = subplot(3,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop3);
colorbar
caxis([ -100 100])
title('w at 15km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

h(2) = subplot(3,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop2);
colorbar
caxis([ -100 100])
title('w at 10km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

h(3) = subplot(3,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop1);
colorbar
title('w at 5km')
caxis([ -100 100])
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

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