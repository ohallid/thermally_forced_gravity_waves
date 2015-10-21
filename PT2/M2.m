function [mm] = M2(bm, mz, c, x, x_0, z, t, T, HL_bar, sigma )

root2   = 1.4142;
 
x1      = sigma * F2(x, x_0, 0, t, T, sigma) / (c*c);  
x2      = sigma * F2(x, x_0, c, t, T, sigma) / (c*c);
x3      = sigma * F2(x, x_0,-c, t, T, sigma) / (c*c);
x_var   = x1 - 0.5 .* x2 - 0.5 .* x3 ;

% z_var   = sin( mz * pi .* z / HL_bar ) / mz / mz * bm;
z_var   = sin( mz * pi .* z / HL_bar ) * HL_bar * HL_bar / pi / pi / mz / mz * bm;
z_var   = z_var';

% plot(x,x1,x,0.5*x2,x,0.5*x3);
% title('From M2')
% hold on

mm      = z_var * x_var;

return 