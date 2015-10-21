function [mm] = M3(bm, mz, c, x, x_0, z, t, T, HL_bar, sigma )

root2   = 1.4142;
 
x2      = sigma * sigma / root2 / c * F3(x, x_0, c, t, T, sigma);
x3      = sigma * sigma / root2 / c * F3(x, x_0,-c, t, T, sigma);
x_var   = x2 + x3 ;

% z_var   =  sin( mz * pi .* z / HL_bar )  / mz / mz  * bm;
% z_var   =  sin( mz * pi .* z / HL_bar ) * pi * pi / mz / mz / HL_bar / HL_bar * bm;
z_var   =  sin( mz * pi .* z / HL_bar ) * bm;
z_var   =  z_var';

mm      =  z_var * x_var;

return 