function [mm] = M3(bm, mz, c, x, z, t, T, HL_bar, sigma )

root2   = sqrt(2.0);
 
x2      = sigma * sigma * sqrt(pi) / 2 / root2 / c * F3(x, c, t, T, sigma);
x3      = sigma * sigma * sqrt(pi) / 2 / root2 / c * F3(x,-c, t, T, sigma);
x_var   = x2 - x3 ;

z_var   =  sin( mz * pi .* z / HL_bar ) * bm;
z_var   =  z_var';

mm      =  z_var * x_var;

return 