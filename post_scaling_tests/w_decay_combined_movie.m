function [] = w_decay_combined_movie() 

T       = 3600;  % secs
sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 128;
HL_bar  = 63.999;
HV_bar  = 1;
dx      = 0.1;
x1      = [0:dx:100 ];
x2      = [0:dx:100 ];


t = 4000;
%for i =1:100
    % Generate data
    [ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
    ww1 = ww;
    bb = mean(bb);
    ww = mean(ww);
    
    % Plot
    figure(1)
    [hAx,hLine1,hLine2] = plotyy(x1,bb,x2,ww);
    
    %grid(hAx(2),'on')
    x = sprintf('Average Tropospheric Values of Temperature and Vertical Velocity For Steady Heating');
    title(x);
    %
    ylimits1 = [-1 3];
    ylimits2 = [-3 3];
    ylabel(hAx(1),'Temperature Difference (K)');
    ylabel(hAx(2),'Vertical Velocity (m/s)');
    
       
    set(hAx(1),'ylim',ylimits1);
    set(hAx(2),'ylim',ylimits2); 
    
    
    
    figure(2)
    plot(x1,bb)
    caxis([-3 3])
    grid on
    hold on 
    plot(x1, ww)
    
    
    figure(3)
    contourf(xx,zz,ww1)
    hold on
    plot(x1,bb)
    ylim([0 1])
    
    t = t + 50;
    pause;
    
    
    
    
%end



return