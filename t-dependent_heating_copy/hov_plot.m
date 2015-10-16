% compare two sets of hovmoller data which has been printed to workspace

comp1   = total_w1 - total_w1p;
comp2   = total_w2 - total_w2p;
comp3   = total_w3 - total_w3p;
comp4   = total_w4 - total_w4p;


%HL_bar       = 19.992;
HV_bar       = 20.005;
%T            = 10000;
x1           = [0:0.1:100];
t1           = [0:250:10000];
[xx1, tt]    = meshgrid(x1,  t1);
%sigma        = 5;
N            = 0.01;

figure(7)

h(1) = subplot(4,1,1) ;
contourf(xx1 , tt, comp4);
colorbar
caxis([ -3 3])
title('w at 15km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(2) = subplot(4,1,2) ;
contourf(xx1 , tt, comp3);
colorbar
caxis([ -3 3])
title('w at 10km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(3) = subplot(4,1,3) ; 
contourf(xx1 , tt, comp2);
colorbar
title('w at 5km')
caxis([ -3 3])
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

h(4) = subplot(4,1,4) ;
contourf(xx1 , tt, comp1);
colorbar
caxis([ -3 3])
title('w at 1km')
xlabel('Distance (km)')
ylabel('Time (s)')
xlim([0 100])

linkaxes(h)