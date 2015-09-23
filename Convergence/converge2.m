function [ww, R] = converge2()

figure ( 1 )

H_bar   = 0.9898;
Ht_bar  = 0.3367;
t       = 100;
T       = 5000;
sigma   = 1;
R       = [1:1:20];

for n = 3:1:22
    x_index  = [3:1:22];
    HL_bar   = n;
    HV_bar   = 3.005;
    [xx, zz, psi, ww] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    R(n) = sqrt(sum(sum( ww .* ww)));
    %R(n) = sqrt(R(n));
    %HL_bar = HL_bar + 1;
    
    figure(1)
    scatter( x_index, R );
   
%     w_ext1               = ww(10,:);
%     w_trop1(i,:)         = w_ext1(:);
%     w_ext2               = ww(20,:);
%     w_trop2(i,:)         = w_ext2(:);
%     w_ext3               = ww(30,:);
%     w_trop3(i,:)         = w_ext3(:);
%     t = t + 250;
%     
%     R   = sum(sum( ww .* ww)); 
%     R   = sqrt(R);
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





% figure (2)
% [ xx, zz, psi, ww ] = series_half_sinusoid_plots(HL_bar , HV_bar, t);
% contour(xx, zz, ww, 20)
% grid on
% % axis equal


return 

