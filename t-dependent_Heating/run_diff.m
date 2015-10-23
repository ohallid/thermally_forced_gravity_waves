% Produces plots for pre-calculated data generated from run of
% Hovmoller_collect.m.  Configure changes in that script.
% [w_trop1 ,w_trop2 , w_trop3 , w_trop4 ] = Hovmoller_collect();, alter
% names for passout to match up to this script (w_trop1 & w_trop1p).


%function [w_trop1, w_trop2, w_trop3, w_trop4, w_trop1p, w_trop2p, w_trop3p, w_trop4p] = run_diff( )
function [run_diff1, run_diff2, run_diff3, run_diff4] = run_diff( )

x1           = [0:0.1:100];
t1           = [0:250:10000];
[xx1, tt]    = meshgrid(x1,  t1);


HL_bar  = 89.992;
T       = 10000;
sigma   = 5;
[w_trop1 ,w_trop2 , w_trop3 , w_trop4 ] = Hovmoller_collect(HL_bar, T, sigma);
sigma = 1;
[w_trop1p ,w_trop2p , w_trop3p , w_trop4p ] = Hovmoller_collect(HL_bar, T, sigma);

run_diff1   = w_trop1 - w_trop1p ;
run_diff2   = w_trop2 - w_trop2p ;
run_diff3   = w_trop3 - w_trop3p ;
run_diff4   = w_trop4 - w_trop4p ;


figure(2)
h(1) = subplot(4,1,1) ;
contourf(xx1 , tt, run_diff4 );
colorbar
caxis([ -3 3])
title('w at 15km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([0 100])

h(2) = subplot(4,1,2) ;
contourf(xx1 , tt, run_diff3 );
colorbar
caxis([ -3 3])
title('w at 10km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([0 100])

h(3) = subplot(4,1,3) ;
contourf(xx1 , tt, run_diff2 );
colorbar
title('w at 5km')
caxis([ -3 3])
xlabel('w value at the tropopause')
ylabel('time')
xlim([0 100])

h(4) = subplot(4,1,4) ;
contourf(xx1 , tt, run_diff1 );
colorbar
caxis([ -3 3])
title('w at 1km')
xlabel('w value at the tropopause')
ylabel('time')
xlim([0 100])

linkaxes(h)

return