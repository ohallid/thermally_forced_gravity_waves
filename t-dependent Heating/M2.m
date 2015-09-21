function [mm] = M2(bm, mz, c, s, x, x_0, z, t, H_bar , sigma)

pi      = 3.14159265359;

x1      = F2(x, x_0, s, t, sigma) / (c*c - s*s) ;  
x2      = F2(x, x_0, c, t, sigma) / c / (c - s) ;
x3      = F2(x, x_0,-c, t, sigma) / c / (c + s) ;

x_var   = x1 - 0.5 .* x2 - 0.5 .* x3 ;
z_var   = sin( mz * pi .* z .* H_bar ) / mz / mz * bm;
z_var   = z_var';

% plot(x,x1,x,0.5*x2,x,0.5*x3);
% title('From M2')
% hold on

mm      = z_var * x_var;

return 