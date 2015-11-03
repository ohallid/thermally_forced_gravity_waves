% function [ ww] = max_diff()
function [ ref, M, ww1, ww2, w_check] = max_diff2()

HV_bar       = 20.005;
T            = 500000000;
t            = 3600;
%sigma        = 5;
N            = 0.01;
%t            = 10800;
x_0          = 0;
%Height       = [2, 4, 8 , 16, 32, 64, 128];
Height       = [1:1:7];

sigma = 0.5;
%t = 10800;

HL_bar = 5.01;
[ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma, x_0);
w_check     = ww;


for j = 1:6
   
    HL_bar  = 0.993;

    for i = 1:7
        
        HL_bar  =  2 * HL_bar;
        [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma, x_0);
        ww1     = ww;
        %ww1     = [
        %ww1     = sqrt(ww1 .* ww1);

        % true value
        HL_barp  = 256.01;
        [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_barp , HV_bar, t, T, sigma, x_0);
        ww2     = ww;
        %ww2     = sqrt(ww2 .* ww2);
    
        delta_w     = ww1 - ww2;
        delta_w     = sqrt(delta_w .* delta_w); 
        M           = max(delta_w);
        Mp(i)       = log10(max(M));
        %Mp(i)       = max(M);
        
        
        ref             = max(max(ww2));
        ref             = sqrt(ref * ref);
        percent_diff(i) = (max(max(ww1)) - ref) / ref * 100;
        
        
%         ref             = sqrt(ww2 .* ww2);
%         ref             = max(max(ref));
%         %ref             = 200;
%         Mpp(i)          = exp(Mp(i)) ./ ref * 100;   
%         percent_diff(i) = Mpp(i);
        
    end
    figure(2)
    a = 140;
    h1 = scatter(Height, Mp,a, 'x');
    grid on
    hold on
    legend(h1,'sigma=0.5','sigma=1','sigma=2','sigma=4', 'sigma=8', 'sigma=16' )
    lsline
    title('Maximum difference in vertical velocity from true value (H = 100*H_t) vs log_2 of Lid height');
    xlabel('log_2 ( Lid Height / H_t )');
    ylabel('log_10 ( max ( \Delta w ) )');
    xlim([0 7])
    %ylim([])
    %t = t + 1800;
    
%     plot([0 8],[1 1],'ro')
%     hline = gline; % Connect circles
%     set(hline,'Color','r')

   sigma = 2 * sigma;
end
% 
figure(3)
scatter(Height, percent_diff, a, 'x')
grid on
title('Percentage difference in vertical velocity from true value (H = 256*H_t) vs log_2 of Lid height');
xlabel('log_2 ( Lid Height / H_t )');
ylabel('percentage difference');
hold on
% plot([3 7],[5 5],'ro')
% hline = gline; % Connect circles
% set(hline,'Color','r')
% %ylim([0 100]) 
xlim([3 7])

return