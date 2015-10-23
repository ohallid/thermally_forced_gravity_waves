function[f] = F3(x, c, t, T, sigma)

root2 = 1.4142;

% Heavyside function
H     = 0;
if ( t > T )
    H = 1;
end

f1     = erf( ( x ) / root2 / sigma ) + erf ( ( c *   t      - x ) / root2 / sigma ) /sigma ;
f2     = erf( ( x ) / root2 / sigma ) + erf ( ( c * ( t - T) - x ) / root2 / sigma ) /sigma ;
f      = f1 - H * f2 ;

return