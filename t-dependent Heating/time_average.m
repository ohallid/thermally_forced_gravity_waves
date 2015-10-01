% Compute time averaged value for a given run.
function [t_av] = time_average()



HL_bar       = 99.992;
HV_bar       = 20.005;

% x-t mesh
x1           = [0:0.1:100];
t1           = [0:250:10000];
[xx1, tt]    = meshgrid(x1,  t1);
sigma        = 5;
N            = 0.01;

dt  = 100;

% define heating regime
T_0    = 10000;    % cycle period
T      = 5000;     % Time for which heat is applied
scalar = 2;        % Factor to conserve total heat input

% calculate initial, t = 0 response
[ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, 0, T, sigma);
w_total = scalar * ww * dt;
t       = 100;
% accumulate subsequent responses through time
for i = 2:100
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    if (t < T)
        w_total  = scalar * w_total + ww * dt;
    else
        w_total  =          w_total + ww * dt;
    end
    t = t + 100;
end
t_av = w_total / T_0;

% replicate x-z range used in "series_half_sinusoid_plots_3" and display
% time averaged response
dx      = 0.1;
dz      = 0.1;
x       = [0:dx:100 ];
z       = [0:dz:HV_bar ];
contourf(x,z,t_av,20);
caption = sprintf('<w(x,z,t)>_t for time period = %6.1f, heating time = %6.1f, sigma = %6.1f.',T,T_0,sigma);
title(caption);
colorbar;
grid on;


return
