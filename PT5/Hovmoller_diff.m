% Calculates and plots 2 Hovmoller for 2 configured Lid Heights, as well as
% a Hovmoller of the difference
% Config list: 2 x HL_bar, t, data height, time step, sigma, T, N. 

%function [x1, t1, xx1, tt, ww, w_trop        ]  = Hovmoller()        % surf
%function [ w_trop0_diff, w_trop1_diff, w_trop2_diff , w_trop3_diff] = Hovmoller_diff()       % contour
function [ xx1,tt, b_trop3  ] = Hovmoller_diff()

%HL_bar       = 19.992;
HV_bar       = 20.005;
%T            = 10000;
x_0          = 0;
x1           = [0:0.1:100];
t1           = [0:250:15000];
[xx1, tt]    = meshgrid(x1,  t1);
%sigma        = 5;
N            = 0.01;
mz_max       = 1000;


for j = 1:1
    t = 0;
    for i = 1:1:61
        HL_bar      = 19.993 ;
        sigma       = 5;
        T           = 15000;
        Q           = 1;
        [ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, mz_max );
        b_ext0               = bb(2,:);
        b_trop0(i,:)         = b_ext0(:);
        b_ext1               = bb(10,:);
        b_trop1(i,:)         = b_ext1(:);
        b_ext2               = bb(20,:);
        b_trop2(i,:)         = b_ext2(:);
        b_ext3               = bb(30,:);
        b_trop3(i,:)         = b_ext3(:);
        t = t + 250;
    end
    t = 0;
    for k = 1:1:61
        HL_bar = HL_bar ;
        sigma       = 1;
        T           = 15000;
        Q           = 1;
        [ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, mz_max );
        bb          = Q * bb;
        b_ext0p               = bb(2,:);
        b_trop0p(k,:)         = b_ext0p(:);
        b_ext1p               = bb(10,:);
        b_trop1p(k,:)         = b_ext1p(:);
        b_ext2p               = bb(20,:);
        b_trop2p(k,:)         = b_ext2p(:);
        b_ext3p               = bb(30,:);
        b_trop3p(k,:)         = b_ext3p(:);
        t = t + 250;
    end
    delta_b0          = b_trop0p - b_trop0;
    b_trop0_diff      = delta_b0 .* delta_b0;
    b_trop0_diff      = sqrt(b_trop0_diff);
    
    delta_b1          = b_trop1p - b_trop1;
    b_trop1_diff      = delta_b1 .* delta_b1;
    b_trop1_diff      = sqrt(b_trop1_diff);
    
    delta_b2          = b_trop2p - b_trop2;
    b_trop2_diff      = delta_b2 .* delta_b2;
    b_trop2_diff      = sqrt(b_trop2_diff);
    
    delta_b3          = b_trop3p - b_trop3;
    b_trop3_diff      = delta_b3 .* delta_b3;
    b_trop3_diff      = sqrt(b_trop3_diff);

    
%Hovmoller 1    
figure(1)
h(1) = subplot(4,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ;
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop3);
colorbar
%caxis([ -200 200])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(2) = subplot(4,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop2);
colorbar
%caxis([ -3 3])
%caxis([ -200 200])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(3) = subplot(4,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop1);
colorbar
title('w at 5km')
%caxis([ -3 3])caxis([ -200 200])
%caxis([ -200 200])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])


h(4) = subplot(4,1,4) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop0);
colorbar
title('w at 1km')
%caxis([ -3 3])
%caxis([ -200 200])
xlabel('Distance (km)')
ylabel('time')
xlim([0 100])
linkaxes(h)


%Hovmoller 2
figure(2)
h(1) = subplot(4,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop3p);
colorbar
%caxis([ -3 3])
%caxis([ -200 200])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(2) = subplot(4,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop2p);
colorbar
%caxis([ -3 3])
%caxis([ -200 200])
title('w at 10km')
xlabel('Distance (km)')
ylabel('time')
xlim([0 100])

h(3) = subplot(4,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop1p);
colorbar
title('w at 5km')
%caxis([ -3 3])
%caxis([ -200 200])
xlabel('Distance (km)')
ylabel('time')
xlim([0 100])


h(4) = subplot(4,1,4) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, b_trop0p);
colorbar
title('w at 1km')
%caxis([ -3 3])
%caxis([ -200 200])
xlabel('Distance (km)')
ylabel('time')
xlim([0 100])
linkaxes(h)

end

% Difference Hovmoller
figure(3)
h(1) = subplot(4,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_b3);
colorbar
%caxis([ -3 3])
%caxis([ -200 200])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])
ylim([0 15000])

h(2) = subplot(4,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_b2);
colorbar
%caxis([ -3 3])
%caxis([ -200 200])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 75])
ylim([0 15000])

h(3) = subplot(4,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_b1 );
colorbar
title('w at 5km')
%caxis([ -3 3])
%caxis([ -200 200])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])
ylim([0 15000])

h(4) = subplot(4,1,4) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
vstep = 0.1;
v = [-3:vstep:3];
contourf(xx1 , tt, delta_b0);
colorbar
title('w at 1km')
%caxis([ -3 3])
%caxis([ -200 200])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])
ylim([0 15000])




 return