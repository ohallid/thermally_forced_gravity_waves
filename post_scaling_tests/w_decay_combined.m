function [xx,zz] = w_decay_combined() 

T       = 3600;  % secs
sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 128;
HL_bar  = 63.999;
HV_bar  = 1;
dx      = 0.1;
x1      = [0:dx:100 ];
x2      = [0:dx:100 ];


h(1)  =  subplot(4,1,1);
t     = 1800;;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
ww = mean(ww);
[hAx,hLine1,hLine2] = plotyy(x1,bb,x2,ww);
%grid on
x = sprintf('Average Tropospheric Values of Temperature and Vertical Velocity For Steady Heating');
title(x);
ylabel(hAx(1),'Temperature Difference (units');
ylabel(hAx(2),'Vertical Velocity (m/s)');
legend('t = 1800s')
ylimits1 = [-1 3];
ylimits2 = [-3 3]; 
set(hAx(1),'ylim',ylimits1);   
set(hAx(2),'ylim',ylimits2);


h(2)  =  subplot(4,1,2);
t     = 3600;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
ww = mean(ww);
[hAx,hLine1,hLine2] = plotyy(x1,bb,x2,ww);
%grid on
legend('t = 3600s')
ylimits1 = [-1 3];
ylimits2 = [-3 3]; 
set(hAx(1),'ylim',ylimits1);   
set(hAx(2),'ylim',ylimits2);

h(3)  =  subplot(4,1,3) ;
t     = 5400;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
ww = mean(ww);
[hAx,hLine1,hLine2] = plotyy(x1,bb,x2,ww);
%grid on
legend('t = 5400s')
ylimits1 = [-1 3];
ylimits2 = [-3 3]; 
set(hAx(1),'ylim',ylimits1);   
set(hAx(2),'ylim',ylimits2);

h(4)  =  subplot(4,1,4); 
t     = 7200;
[ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
bb = mean(bb);
ww = mean(ww);
[hAx,hLine1,hLine2] = plotyy(x1,bb,x2,ww);
%grid on
xlabel('x / \sigma_0');
legend('t = 7200s')
ylimits1 = [-1 3];
ylimits2 = [-3 3]; 
set(hAx(1),'ylim',ylimits1);   
set(hAx(2),'ylim',ylimits2);
    
%linkaxes(h)
%xlim([0  1000])
%ylim([-3  3])




return