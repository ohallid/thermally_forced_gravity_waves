%function [x1, t1, xx1, tt, ww, w_trop        ]  = Hovmoller()        % surf
function [x1, t1, xx1, tt, ww, w_trop, w_ext] = Hovmoller_PT()       % contour

HL_bar       = 19.992;
HV_bar       = 20.005;
T            = 500;
x1           = [0:0.1:100];
t1           = [0:250:12000];           % set up time array. 
[xx1, tt]    = meshgrid(x1,  t1);
w_trop       = zeros(13 , 1001);
sigma        = 1;
N            = 0.01;

t = 0;
for i = 1:1:49
    [ bb, uu, ww, xx, zz ] = series_half_sinusoidp_w_b_2(HL_bar, HV_bar , t, T, sigma);
    b_ext1               = bb(10,:);
    b_trop1(i,:)         = b_ext1(:);
    b_ext2               = bb(20,:);
    b_trop2(i,:)         = b_ext2(:);
    b_ext3               = bb(30,:);
    b_trop3(i,:)         = b_ext3(:);
    t = t + 250;
end
figure(1)
h(1) = subplot(3,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, b_trop3);
colorbar
%caxis([ -100 100])
title('w at 15km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([0 50])

h(2) = subplot(3,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, b_trop2);
colorbar
%caxis([ -100 100])
title('w at 10km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([0 50])

h(3) = subplot(3,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, b_trop1);
colorbar
title('w at 5km')
%caxis([ -100 100])
xlabel('w value at the tropopause')
ylabel('time')
xlim([0 50])

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