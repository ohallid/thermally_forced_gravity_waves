function[f] = F2(x, x_0, c, t, T, sigma )
 
% Heavyside function
H     = 0;
if ( t > T )
    H = 1;
end

f1     = exp(- ( x - x_0 - c * t         ) .* ( x - x_0 - c * t        ) / 2 / sigma / sigma );
f2     = exp(- ( x - x_0 - c * ( t - T ) ) .* ( x - x_0 - c * ( t - T) ) / 2 / sigma / sigma );
f      = f1 - H * f2;

return