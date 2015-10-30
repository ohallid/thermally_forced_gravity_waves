% function [ ww] = max_diff()
function [ ww1, ww2, Height , M, Mp, Mpp , delta_w] = max_diff()

HV_bar       = 20.005;
T            = 500000000;
t            = 1800;
%sigma        = 5;
N            = 0.01;
t            = 10800;
x_0          = 0;
Height       = [2, 4, 8 , 16, 32, 64, 128, 256];
Height       = [1:1:8];


sigma = 0.5;
%t = 10800;
for j = 1:6
   
HL_bar  = 0.993;

for i = 1:8
    HL_bar  =  2 * HL_bar;
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma, x_0);
    ww1     = ww;
    %ww1     = sqrt(ww1 .* ww1);

    % true value
    HL_barp  = 256.01;
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_barp , HV_bar, t, T, sigma, x_0);
    ww2     = ww;
    %ww2     = sqrt(ww2 .* ww2);
    
    delta_w     = ww1 - ww2;
    delta_w     = sqrt(delta_w .* delta_w); 
    M           = max(delta_w);
    Mp(i)       = log(max(M));
    %Mp(i)       = max(M);

end
figure(2)
a = 140;
scatter(Height, Mp,a, 'x');
grid on
hold on
title('Maximum difference in vertical velocity from true value (H = 100*H_t) vs log_2 of Lid height');
xlabel('log_2 of Lid Height (relative to top of heating)');
ylabel('Maximum difference in Vertical Velocity');
xlim([0 7])
%ylim([])

%t = t + 1800;
sigma = 2 * sigma;
end



return
