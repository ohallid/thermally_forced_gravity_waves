% Compute time averaged value for a given run.
function [t_av] = time_average_pp()



HL_bar       = 99.992;
HV_bar       = 20.005;

% x-t mesh
x1           = [0:0.1:100];
t1           = [0:250:10000];
[xx1, tt]    = meshgrid(x1,  t1);
sigma        = 5;
N            = 0.01;
dt           = 100;

% x-z mesh
dx           = 0.1;
dz           = 0.1;
x            = [0:dx:100 ];
z            = [0:dz:HV_bar ];



% heating regime 1
T_0    = 10000;    % cycle period
T      = 10000;    % Time for which heat is applied
scalar = 1;        % Factor to conserve total heat input
[ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, 0, T, sigma);
w_total = scalar * ww * dt;
t       = 100;
for i = 2:100
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    if (t < T)
        w_total  =  w_total + scalar * ww * dt;
    else
        w_total  =  w_total +          ww * dt;
    end
    t = t + 100
end
t_av1 = w_total / T_0;
subplot(1,3,1)
contour(x,z,t_av1,20);
caption = sprintf('<w_1(x,z,t)>_t .');
colorbar;
title(caption);



% heating regime 2
T_0    = 10000;    % cycle period
T      =  5000;    % Time for which heat is applied
scalar = 2.0;      % Factor to conserve total heat input
[ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, 0, T, sigma);
w_total = scalar * ww * dt;
t       = 100;
for i = 2:100
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    w_total  = w_total + scalar * ww * dt;
    t = t + 100
end
t_av2 = w_total / T_0;
subplot(1,3,2)
contour(x,z,t_av2,20);
caption = sprintf('<w_2(x,z,t)>_t .');
colorbar;
title(caption);




subplot(1,3,3)
t_av = t_av1 - t_av2;
contour(x,z,t_av,20);
caption = sprintf('< w_1 - w_2 >_t .');
title(caption);
colorbar;
grid on;


return
