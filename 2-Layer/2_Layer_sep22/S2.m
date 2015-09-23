function [Sz] = M2(bm, HL_bar, c, A, facp, s, x, x_0, z, t, T, Ht_bar )

pi      = 3.141592653589793;
N1      = 0.01;                        % Based on dry lapse rate of 10 deg per km (notes)
N2      = 0.0199;
ratio   = Ht_bar / HL_bar;

region1      = z<=Ht_bar;              % Troposphere
region2      = z> Ht_bar;              % Stratosphere
phi(region1) = HL_bar * c * A / N1 .* sin ( N1 / c  .* z(region1) / HL_bar         ) * facp;
phi(region2) = HL_bar * c * A / N2 .* sin ( N2 / c  .* z(region2) / HL_bar- N2 / c )       ;

phi(region1) = N1 * N1 * phi (region1);
phi(region2) = N2 * N2 * phi (region2);
Sz           = bm * phi;

% Inspect the contribution to the variation
% plot(z,Sz);
% grid on;
% caption = sprintf('z-variation of N^2 phi_m for b_m = %d',bm);
% title(caption);
% xlim([0 10])
% pause;

return 