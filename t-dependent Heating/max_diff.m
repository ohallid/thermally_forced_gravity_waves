%function [ w1_row, w2_row, delta_w, delta_diff] = max_diff()
function [ Height , delta_diff ] = max_diff()

HV_bar       = 20.005;
T            = 500000000;
sigma        = 0.05;
N            = 0.01;
t            = 1800;
Height       = [1:1:100];

delta_diff   = [1:1:100];
% HL_bar  = 21.992;
% [ xx, zz, psi, ww ] = series_half_sinusoid_plots_4(HL_bar , HV_bar, t, T, sigma);
% w1_row              = ww(30,:);
for i = 1:100
    HL_bar  = 19.992 + i;
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_4(HL_bar , HV_bar, t, T, sigma);
    w1_row              = ww(30,:);

    HL_bar  = HL_bar + 1;
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_4(HL_bar , HV_bar, t, T, sigma);
    w2_row               = ww(30,:);

    delta_w          = w1_row - w2_row;
    delta_w          = delta_w .* delta_w;
    delta_diff(i)    = sqrt(max(delta_w));

end
figure(2)
scatter(Height, delta_diff, 'x');
grid on
hold on
title('Maximum difference in vertical velocity vs Lid height');
xlabel('Lid Height (relative to top of heating)');
ylabel('Maximum difference in Vertical Velocity');



return
