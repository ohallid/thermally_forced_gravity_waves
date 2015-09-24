%function [x1, t1, xx1, tt, ww, w_trop        ]  = Hovmoller()        % surf
function [  w_trop1_diff, w_trop2_diff , w_trop3_diff] = Hovmoller_diff()       % contour

%HL_bar       = 19.992;
HV_bar       = 20.005;
T            = 500;
x1           = [0:0.1:100];
t1           = [0:250:3000];
[xx1, tt]    = meshgrid(x1,  t1);
sigma        = 1;
N            = 0.01;

for j = 1:2
    t = 0;
    for i = 1:1:13
        HL_bar = 149.993 ;
        [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
        w_ext1               = ww(10,:);
        w_trop1(i,:)         = w_ext1(:);
        w_ext2               = ww(20,:);
        w_trop2(i,:)         = w_ext2(:);
        w_ext3               = ww(30,:);
        w_trop3(i,:)         = w_ext3(:);
        t = t + 250;
    end
    t = 0;
    for k = 1:1:13
        HL_bar = HL_bar + 1 ;
        [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
        w_ext1p               = ww(10,:);
        w_trop1p(k,:)         = w_ext1p(:);
        w_ext2p               = ww(20,:);
        w_trop2p(k,:)         = w_ext2p(:);
        w_ext3p               = ww(30,:);
        w_trop3p(k,:)         = w_ext3p(:);
        t = t + 250;
    end
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


%Hovmoller 2
figure(2)
h(1) = subplot(3,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop3p);
colorbar
caxis([ -100 100])
title('w at 15km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

h(2) = subplot(3,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop2p);
colorbar
caxis([ -100 100])
title('w at 10km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

h(3) = subplot(3,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop1p);
colorbar
title('w at 5km')
caxis([ -100 100])
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])
linkaxes(h)

end

% Difference Hovmoller
figure(3)
h(1) = subplot(3,1,1) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop3_diff);
colorbar
caxis([ -100 100])
title('w at 15km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

h(2) = subplot(3,1,2) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop2_diff);
colorbar
caxis([ -100 100])
title('w at 10km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

h(3) = subplot(3,1,3) ;
xx1 = xx1 ;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop1_diff);
colorbar
title('w at 5km')
caxis([ -100 100])
xlabel('w value at the tropopause')
ylabel('time')
xlim([25 75])

% end



return