function [ww, R] = converge( n )

figure ( 1 )

H_bar   = 0.9898;
Ht_bar  = 0.3367;
t       = 100;
T       = 5000;
sigma   = 1;


for n = 3:1:30
    
    HL_bar   = 25.000545;
    HV_bar   = 3.005;
    [xx, zz, psi, ww(n)] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    
    
    
    %figure(n);
    %contour(xx,zz,ww,30);
    %axis tight
    %colorbar
    %grid on
    % axis equal
    % x = sprintf('w structure at (Nt/FWHM)=%6.1f, H=%6.1f*H_t',t,HL_bar);
    % title(x);
    % xlabel('x / FWHM');
    % ylabel('z / Ht'); 
    % 
    % xlim([0  10])
    % ylim([0 3])
end

R   = sum(sum( ww .* ww)); 
R   = sqrt(R);



% figure (2)
% [ xx, zz, psi, ww ] = series_half_sinusoid_plots(HL_bar , HV_bar, t);
% contour(xx, zz, ww, 20)
% grid on
% % axis equal


return 

