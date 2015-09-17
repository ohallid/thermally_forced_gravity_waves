function [Sz] = M2(bm, HL_bar, c, A, facp, s, x, x_0, z, t, T, Ht_bar )

pi      = 3.1415;
N1      = 0.01;
N2      = 0.02;
ratio   = Ht_bar / HL_bar;

region1      = z<=Ht_bar;              % Troposphere
region2      = z> Ht_bar;              % Stratosphere
phi(region1) = HL_bar * c * A / N1 .* sin ( N1 / c * ratio .* z(region1)          ) * facp;
phi(region2) = HL_bar * c * A / N2 .* sin ( N2 / c * ratio .* z(region2) - N2 / c )       ;

Sz           = bm * phi;

return 