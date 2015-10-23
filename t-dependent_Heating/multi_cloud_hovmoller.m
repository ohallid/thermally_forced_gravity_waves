% Vertical snapshot of multiple clouds
function [ total_w1, total_w2, total_w3, total_w4 ] = double_heat_2(HL_bar, T, T1, sigma, x_0)       

HL_bar       = 99.992;
HV_bar       = 20.005;
% T            = 5000;
% T1           = 8000;
x1           = [0:0.1:100];
t1           = [0:250:10000];
[xx1, tt]    = meshgrid(x1,  t1);
sigma        = 5;
N            = 0.01;
 

% 
% t = 0;
% for i = 1:1:41
%     x_0  = 45;
%     T    = 3600;
%     T1   = 360000000000;
%     T2   = 72000000000;
%    [ xx, zz, psi, ww1 ] = series_half_sinusoid_plots_onoff(HL_bar , HV_bar, t, T, T1,T2, sigma, x_0);
%          % ww1  = ww1 / 2 ;
%         w_ext1               = ww1(2,:);
%         w_trop1(i,:)         = w_ext1(:);
%         w_ext2               = ww1(10,:);
%         w_trop2(i,:)         = w_ext2(:);
%         w_ext3               = ww1(20,:);
%         w_trop3(i,:)         = w_ext3(:);
%         w_ext4               = ww1(30,:);
%         w_trop4(i,:)         = w_ext4(:);
%         t = t + 250;
% end

%t =86400;
t = 0;
x_0  = 1000;
T    = 43200;
T1   = 360000000000;
T2   = 7200000000;

    [ xx, zz, psi, ww1 ] = series_half_sinusoid_plots_onoff(HL_bar , HV_bar, t, T, T1,T2, sigma, x_0);
    total_w = ww1;
for i = 1:1:20
    for j = 1:4
        x_0 = x_0 + 200;
        [ xx, zz, psi, ww1 ] = series_half_sinusoid_plots_onoff(HL_bar , HV_bar, t, T, T1,T2, sigma, x_0);
        total_w = total_w + ww1;
    
        w_ext1               = ww1(2,:);
        w_trop1(i,:)         = w_ext1(:);
        w_ext2               = ww1(10,:);
        w_trop2(i,:)         = w_ext2(:);
        w_ext3               = ww1(20,:);
        w_trop3(i,:)         = w_ext3(:);
        w_ext4               = ww1(30,:);
        w_trop4(i,:)         = w_ext4(:);

    end
t = t + 1000;    
end
% delta_w0          = w_trop0p - w_trop0;
% w_trop0_diff      = delta_w0 .* delta_w0;
% w_trop0_diff      = sqrt(w_trop0_diff);
%     
% delta_w1          = w_trop1p - w_trop1;
% w_trop1_diff      = delta_w1 .* delta_w1;
% w_trop1_diff      = sqrt(w_trop1_diff);
%     
% delta_w2          = w_trop2p - w_trop2;
% w_trop2_diff      = delta_w2 .* delta_w2;
% w_trop2_diff      = sqrt(w_trop2_diff);
%     
% delta_w3          = w_trop3p - w_trop3;
% w_trop3_diff      = delta_w3 .* delta_w3;
% w_trop3_diff      = sqrt(w_trop3_diff);





figure(1)
contourf(xx,zz,total_w,20);
% axis tight
colorbar
grid on
%axis equal
x = sprintf('w structure at (Nt/FWHM)=%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / FWHM');
ylabel('z / Ht');
xlim([800 2000])
ylim([0 3])



% Difference Hovmoller
figure(2)
h(1) = subplot(4,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop1);
colorbar
%caxis([ -3 3])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
% xlim([25 75])
% ylim([0 15000])

h(2) = subplot(4,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop2);
colorbar
%caxis([ -3 3])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
% xlim([25 75])
% ylim([0 15000])

h(3) = subplot(4,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop3 );
colorbar
title('w at 5km')
%caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
% xlim([25 75])
% ylim([0 15000])

h(4) = subplot(4,1,4) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop4);
colorbar
title('w at 1km')
%caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
% xlim([25 75])
% ylim([0 15000])


return
