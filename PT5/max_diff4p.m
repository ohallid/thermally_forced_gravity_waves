function [ ww1, ww2, Height, Mp, delta_w ] = max_diff4p()

% For valid comparison, lid height > visualization height

HV_bar       = 2;
T            = 5000;
t            = 300;
N            = 0.01;
x_0          = 0;
sigma        = 0.5;
scalar       = 128;
HL_barp      = 1024.01;                                                     % reference height 

for j = 1:6
    
    HL_bar       = 1.993;
    [ ww2, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_barp, HV_bar, sigma, t, T, scalar * HL_barp );
    
    figure(j)
    for i = 1:8       
        HL_bar  = 2.0 * HL_bar;
        [ ww1, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar  );       
        delta_w     = ( ww1 - ww2 );         
        % delta_w     = ( ww1 - ww2 ) ./ (ww2 + 1.0e-6);                      % Relative change Zero-divide protected.
        
        subplot(4,2,i)
        contour(xx,zz,delta_w,30);
        colorbar;
        xlabel('x/\sigma_0')
        ylabel('z/H_t')
        caption = sprintf('H_L = %3.1f, FWHM = %3.1f',HL_bar, sigma);
        title(caption);
        
        rms         = sqrt(mean(mean( delta_w .* delta_w )));  
        delta_max   = sqrt(max (max ( delta_w .* delta_w )));         
        M(i)        = log10( rms );
        Mp(i)       = log10( delta_max ); 
        Mpp(i)      = rms * 100;
        Height(i)   = log10( HL_bar ); 
    end
    
    figure(7)
    subplot(1,2,1)
    a = 140;
    hold on
    scatter(Height, M  ,a, 'x');
    line(Height, M);
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( ( \Delta w / w_0 )_{rms} )');
    
    subplot(1,2,2)
    a = 140;
    hold on
    scatter(Height, Mp,a, 'x');    
    line(Height, Mp);
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( max( \Delta w^2 / w_0 )^{1/2} )');
    
%     subplot(1,3,3)
%     a = 140;
%     hold on
%     scatter(Height, Mpp,a, 'x');    
%     line(Height,Mpp)
%     xlabel('log_{10} ( Lid Height / H_t )');
%     ylabel(' \Delta w_{rms} / w per-cent. ');
    
   sigma = 2 * sigma;

end
 

return