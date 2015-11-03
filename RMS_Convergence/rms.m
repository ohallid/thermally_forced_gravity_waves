function [ ww1, ww2, Height, Mp, delta_w ] = rms()

% HV_bar       = 20.005;
HV_bar       = 2;
T            = 500000000;
%t            = 1800;
N            = 0.01;
t            = 3600;
x_0          = 0;
sigma        = 0.5;

for j = 1:6
    HL_bar   = 1.993;
    HL_barp  = 256.01;
    scalar   = 128;      % 60
    [ ww2, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_barp );
    for i = 1:6       
        HL_bar  = 2  * HL_bar;
%         [ ww1, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T,  60*HL_bar  );       
        [ ww1, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar  );       
        delta_w     = ( ww1 - ww2 );
        delta_mean  = mean(mean(delta_w));
        rms         = ( delta_w - delta_mean ) .* (delta_w - delta_mean );
        Mp(i)       = log10( sqrt( mean ( mean( rms ))));
        Height(i)   = log10( HL_bar);
     end
    
    figure(2)
    a = 140;
    scatter(Height, Mp,a, 'x');    
%     lsline
    hold on
    title('RMS of maximum difference between true and lidded solution against lid height')
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( \Delta w_{rms}  ) )');
    xlim([0.5 2.5])
    ylim([1 3.5])
    legend('sigma = 0.5','sigma = 1','sigma = 2','sigma = 4','sigma = 8','sigma = 16')
    
   sigma = 2 * sigma;
end
 

return