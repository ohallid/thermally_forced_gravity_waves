% function [ ww] = max_diff()
function [ ww1, ww2, Height , M, Mp, Mpp , delta_w, percent_diff, ref] = max_diff3()

HV_bar       = 20.005;
T            = 500000000;
t            = 1800;
%sigma        = 5;
N            = 0.01;
t            = 10800;
x_0          = 0;
%Height       = [2, 4, 8 , 16, 32, 64, 128];
Height       = [1:1:7];

sigma = 0.5;
%t = 10800;

for j = 1:6
   
    HL_bar   = 0.993;
    HL_barp  = 256.01;
    
    for i = 1:7
        
        HL_bar  =  2 * HL_bar;
        [ ww1, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T,  60*HL_bar )       
        [ ww2, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T,  60*HL_barp )
        ww2     = ww;
        %ww2     = sqrt(ww2 .* ww2);
    
        delta_w     = ww1 - ww2;
        delta_w     = sqrt(delta_w .* delta_w); 
        M           = max(delta_w);
        Mp(i)       = log(max(M));
        %Mp(i)       = max(M);
        
        ref             = sqrt(ww2 .* ww2);
        ref             = max(max(ref));
        %ref             = 200;
        Mpp(i)          = exp(Mp(i)) / ref * 100;   
        percent_diff(i) = Mpp(i);
        
    end
    figure(2)
    a = 140;
    scatter(Height, Mp,a, 'x');
    grid on
    hold on
    lsline
    title('Maximum difference in vertical velocity from true value (H = 100*H_t) vs log_2 of Lid height');
    xlabel('log_2 ( Lid Height / H_t )');
    ylabel('log_e ( max ( \Delta w ) )');
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
plot([3 7],[5 5],'ro')
hline = gline; % Connect circles
set(hline,'Color','r')
%ylim([0 100]) 


return