function[f] = F2(x, c, t, T, sigma )
 
% Heavyside function
H     = 0;
if ( t > T )
    H = 1;
end

f1     = exp(- ( x - c * t         ) .* ( x - c * t        ) / 2 / sigma / sigma );
f2     = exp(- ( x - c * ( t - T ) ) .* ( x - c * ( t - T) ) / 2 / sigma / sigma );
f      = f1 - H * f2;

return