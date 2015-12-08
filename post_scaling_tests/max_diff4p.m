function [ ww1, ww2, Height, Mp, delta_w ] = max_diff4p()

% For valid comparison, lid height > visualization height

HV_bar       = 2;
T            = 5000;
t            = 1000;
N            = 0.01;
x_0          = 0;
sigma        = 0.5;
scalar       = 128;
HL_barp      = 1024.01;                                                     % reference height 

for j = 1:6
    
    HL_bar       = 1.993;
    [ ww2, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_barp, HV_bar, sigma, t, T, scalar * HL_barp );
    ref_max  = sqrt(max (max ( ww2 .* ww2 )));
    ref_rms  = sqrt(mean(mean( ww2 .* ww2 )));
    
    figure(j)
    for i = 1:8       
        HL_bar  = 2.0 * HL_bar;
        [ ww1, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar  );       
        delta_w     = ( ww1 - ww2 );         
        
        subplot(4,2,i)
        contour(xx,zz,delta_w,30);
        colorbar;
        xlabel('x/\sigma_0')
        ylabel('z/H_t')
        caption = sprintf('H_L = %3.1f, FWHM = %3.1f',HL_bar, sigma);
        title(caption);
        
        delta_rms_abs  = sqrt(mean(mean( delta_w .*   delta_w )));  
        delta_rms_rel  = sqrt(mean(mean( delta_w .* delta_w ./ (ww2 .* ww2 + 0.00001 ))));  
        delta_max_abs  = sqrt(max (max ( delta_w .* delta_w )));         
        delta_max_rel  = sqrt(max (max ( delta_w .* delta_w ./ (ww2 .* ww2 + 0.00001 ))));  
                
        M(i)        = log10( delta_rms_abs );                             % Absolute
        Mp(i)       = log10( delta_max_abs );                             % Absolute
        Mpp(i)      = log10( delta_rms_rel );                             % Relative
        Mppp(i)     = log10( delta_max_rel );                             % Relative
        Mpppp(i)    = log10( delta_rms_abs / ref_rms );                   % DP defn.
        Mppppp(i)   = log10( delta_max_abs / ref_max );                   % DP defn
        Height(i)   = log10( HL_bar ); 
    end
    
    figure(7)
    subplot(1,6,1)
    a = 140;
    hold on
    scatter(Height, M  ,a, 'x');
    line(Height, M);
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( ( \Delta w )_{rms} )');
    title('Absolute')
    subplot(1,6,2)
    a = 140;
    hold on
    scatter(Height, Mp,a, 'x');    
    line(Height, Mp);
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( max( \Delta w^2 )^{1/2} )');
    title('Absolute')
    subplot(1,6,3)
    a = 140;
    hold on
    scatter(Height, Mpp  ,a, 'x');
    line(Height, Mpp);
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( ( \Delta w / w_0 )_{rms} )');
    title('Relative')
    subplot(1,6,4)
    a = 140;
    hold on
    scatter(Height, Mppp,a, 'x');    
    line(Height, Mppp);
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( max( \Delta w^2 / w_0^2)^{1/2} )');    
    title('Relative')
    subplot(1,6,5)
    a = 140;
    hold on
    scatter(Height, Mpppp ,a, 'x');    
    line(Height, Mpppp );
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( \Delta w_{rms} / w_{0 rms}   )');    
    title('D P defn')
    subplot(1,6,6)
    a = 140;
    hold on
    scatter(Height, Mppppp,a, 'x');    
    line(Height, Mppppp);
    xlabel('log_{10} ( Lid Height / H_t )');
    ylabel('log_{10} ( max( \Delta w^2 )^{1/2} / max ( ( w_0^2 ) ^{1/2} )');    
    title('D P defn') 
    
   sigma = 2 * sigma;
   
end
 

return