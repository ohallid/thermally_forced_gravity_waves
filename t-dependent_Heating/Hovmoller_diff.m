% Calculates and plots 2 Hovmoller for 2 configured Lid Heights, as well as
% a Hovmoller of the difference
% Config list: 2 x HL_bar, t, data height, time step, sigma, T, N. 

%function [x1, t1, xx1, tt, ww, w_trop        ]  = Hovmoller()        % surf
%function [ w_trop0_diff, w_trop1_diff, w_trop2_diff , w_trop3_diff] = Hovmoller_diff()       % contour
function [ w_trop0p ] = Hovmoller_diff()

%HL_bar       = 19.992;
HV_bar       = 20.005;
%T            = 10000;
x_0          = 50;
x1           = [0:0.1:100];
t1           = [0:250:15000];
[xx1, tt]    = meshgrid(x1,  t1);
%sigma        = 5;
N            = 0.01;

for j = 1:1
    t = 0;
    for i = 1:1:61
        HL_bar      = 99.993 ;
        sigma       = 5;
        T           = 15000;
        Q           = 1;
        [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma, x_0);
        w_ext0               = ww(2,:);
        w_trop0(i,:)         = w_ext0(:);
        w_ext1               = ww(10,:);
        w_trop1(i,:)         = w_ext1(:);
        w_ext2               = ww(20,:);
        w_trop2(i,:)         = w_ext2(:);
        w_ext3               = ww(30,:);
        w_trop3(i,:)         = w_ext3(:);
        t = t + 250;
    end
    t = 0;
    for k = 1:1:61
        HL_bar = HL_bar ;
        sigma       = 1;
        T           = 15000;
        Q           = 1;
        [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma, x_0);
        ww          = Q * ww;
        w_ext0p               = ww(2,:);
        w_trop0p(k,:)         = w_ext0p(:);
        w_ext1p               = ww(10,:);
        w_trop1p(k,:)         = w_ext1p(:);
        w_ext2p               = ww(20,:);
        w_trop2p(k,:)         = w_ext2p(:);
        w_ext3p               = ww(30,:);
        w_trop3p(k,:)         = w_ext3p(:);
        t = t + 250;
    end
    delta_w0          = w_trop0p - w_trop0;
    w_trop0_diff      = delta_w0 .* delta_w0;
    w_trop0_diff      = sqrt(w_trop0_diff);
    
    delta_w1          = w_trop1p - w_trop1;
    w_trop1_diff      = delta_w1 .* delta_w1;
    w_trop1_diff      = sqrt(w_trop1_diff);
    
    delta_w2          = w_trop2p - w_trop2;
    w_trop2_diff      = delta_w2 .* delta_w2;
    w_trop2_diff      = sqrt(w_trop2_diff);
    
    delta_w3          = w_trop3p - w_trop3;
    w_trop3_diff      = delta_w3 .* delta_w3;
    w_trop3_diff      = sqrt(w_trop3_diff);

    
% Hovmoller 1    
figure(1)
h(1) = subplot(4,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ;
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop3, v);
colorbar
caxis([ -3 3])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])

h(2) = subplot(4,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop2, v);
colorbar
caxis([ -3 3])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])

h(3) = subplot(4,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop1, v);
colorbar
title('w at 5km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])


h(4) = subplot(4,1,4) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop0, v);
colorbar
title('w at 1km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('time')
xlim([25 75])
linkaxes(h)


%Hovmoller 2
figure(2)
h(1) = subplot(4,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop3p);
colorbar
caxis([ -3 3])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])

h(2) = subplot(4,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop2p);
colorbar
caxis([ -3 3])
title('w at 10km')
xlabel('Distance (km)')
ylabel('time')
xlim([25 75])

h(3) = subplot(4,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop1p);
colorbar
title('w at 5km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('time')
xlim([25 75])


h(4) = subplot(4,1,4) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, w_trop0p);
colorbar
title('w at 1km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('time')
xlim([25 75])
linkaxes(h)

end

% Difference Hovmoller
figure(3)
h(1) = subplot(4,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_w3);
colorbar
caxis([ -3 3])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])
ylim([0 15000])

h(2) = subplot(4,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_w2);
colorbar
caxis([ -3 3])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])
ylim([0 15000])

h(3) = subplot(4,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_w1 );
colorbar
title('w at 5km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])
ylim([0 15000])

h(4) = subplot(4,1,4) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_w0);
colorbar
title('w at 1km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([25 75])
ylim([0 15000])
% end



return