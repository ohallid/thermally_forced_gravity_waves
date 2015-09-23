function [mm] = M2(bm, HL_bar, c, A, facp, s, x, x_0, z, t, T, Ht_bar )

%   z is normalized to heating height i.e z = 1 is top of heating
%   range of z defines the interval of visualization
%   Ht_bar = ratio, top of heating to lid height
%   c = SL eigenvalue / H

pi      = 3.141592653589793;
N1      = 0.01;                     % Based on dry lapse rate of 10 deg per km (notes)
N2      = 0.0199;
ratio   = Ht_bar / HL_bar;
H       = 0;                        % Heavyside for switch-off
if t > T
   H = 1;
end

x1           = c * c * F2(x, x_0, s * HL_bar, t  ) / ( c*c - s * s / HL_bar / HL_bar) ;  
x2           = c * c * F2(x, x_0, c * HL_bar, t  ) /  c / ( c - s / HL_bar );
x3           = c * c * F2(x, x_0,-c * HL_bar, t  ) /  c / ( c + s / HL_bar );
x2p          = c * c * F2(x, x_0, c * HL_bar, t-T) /  c / ( c - s / HL_bar );
x3p          = c * c * F2(x, x_0,-c * HL_bar, t-T) /  c / ( c + s / HL_bar );
x_var        = x1 .* ( 1 - H ) - 0.5 .* x2 - 0.5 .* x3 + 0.5 .* x2p * H + 0.5 .* x3p * H;

region1      = z<=Ht_bar;              % Troposphere
region2      = z> Ht_bar;              % Stratosphere
phi(region1) = HL_bar * c * A / N1 .* sin ( N1 / c .* z(region1) / HL_bar          ) * facp;
phi(region2) = HL_bar * c * A / N2 .* sin ( N2 / c .* z(region2) / HL_bar - N2 / c )       ;

% plot(z,phi);
% grid on;
% caption = sprintf('z-variation for b_m = %d',bm);
% title(caption);
% xlim([0 3])
% pause;

z_var        = bm * phi;
z_var        = z_var';
mm           = z_var * x_var;

return 