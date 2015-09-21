function [mm] = M3(bm, mz, c, s, x, x_0, z, t, H_bar, sigma )

pi      = 3.1415;
root2   = 1.4142;

x2      = root2 * F3(x, x_0, c, t) / (c - s) ;
x3      = root2 * F3(x, x_0,-c, t) / (c + s) ;

x_var   = - 0.5 .* x2 - 0.5 .* x3 ;
z_var   =  sin( mz * pi .* z .* H_bar ) / mz / mz * bm;
z_var   =  z_var';

mm      =  z_var * x_var;

return 