function [ ww, bb, FS, xx, zz ] = series_half_sinusoidp_w_b(HL_bar, HV_bar , t, T)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Transient heating, w and b (PT) response
% s = 0 case
% total heating conserved 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ht_bar  = 1 / HL_bar;    % Ratio, height to top of heating
sigma   = 1;             % FWHM of horixontal heating vatiation
dx      = 0.05;          % x-step
dz      = 0.051;         % z-step
x       = [0:dx:10 ];    % x = 10 equivalent to 10 * \sigma (FWHM, PB F(x) )
z       = [0:dz:HV_bar ];     % z = 1  equivalent to H_t, H >> H_t is lid position
x_0     = 0;             % initial position of heating function, middle of box
s       = 0;             
n       = 1;             % Number of half-sinusoids in interval
N       = 0.01;          % Based on dry lapse rate of 10 deg per km (notes) Units s^{-1}
[xx,zz] = meshgrid( x, z);
mz_max  = 60 * HL_bar;   % Number of modes calculated : depends on HL_bar

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Compute the vertical velocity field w(x,z,t), 
%   ww(1,:) corresponds to x = 0 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mz = 1;
 b1 = 2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );  % half-sinusoid
c  = N * HL_bar / 1 / pi;
ww = M2(b1, mz, c, x, z, t, T, HL_bar, sigma ) ;
bb = M3(b1, mz, c, x, z, t, T, HL_bar, sigma ) ;
FS = b1 * sin ( pi * 1 .* z / HL_bar );
for mz = 2: mz_max
    c  = N * HL_bar / pi / mz;
    bm  = 2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );  % half-sinusoid
    ww = ww + M2(bm, mz, c, x, z, t, T, HL_bar, sigma );
    bb = bb + M3(bm, mz, c, x, z, t, T, HL_bar, sigma );
    FS = FS + bm * sin ( pi * mz .* z / HL_bar );
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Compute the horizontal velocity field u(x,z,t) using continuity equ
%   constant of integration from u = 0 at x = 0 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find the z derivative NOTE definiton of Matlab diff fn.
dwdz = diff ( ww ) / dz;                                                % dwrt z the w component of velocity - looses row.
dwdz( length( ww(:,1) ), : ) = dwdz ( length( dwdz(:,1) ), : );         % replace lost row with dummy data
% Trapezium rule integration for w(x,z,t)
% Symmetry condition u = 0, x = 0 assumed to allow integratation l->r
uu    = dwdz;
x_max = length( uu(1,:));
z_max = length( uu(:,1));
for i=1: z_max
    uu(i,1) = 0.0;
end
for i = 2 : x_max
    for j = 1 : z_max
        uu(j,i) = uu(j,i-1) + dx * ( - dwdz(j,i) - dwdz(j,i-1) );
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Computing rectangular streamfunciton
%   x = 0 surface is streamline with psi \def 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

psi    = uu;
x_max = length( psi(1,:));
z_max = length( psi(:,1));
for i=1: x_max
    psi(1,i) = 0.0;
end
for i = 2 : z_max
    for j = 1 : x_max
        psi(i,j) = psi(i-1,j) + dz * ( uu(i,j) + uu(i-1,j) );
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Plotting velocity field

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%figure ( 1 )
%quiver(xx,zz,uu,ww);
%axis tight
%title('Velocity field in x-z plane');

%figure ( 2 )
%contour(xx,zz,ww)
%axis tight
%grid on
%title('w(x,z,t) field in x-z plane');

%figure ( 3 )
%contour(xx,zz,psi,30);
%axis tight
%grid on
%x = sprintf('Rectangular streamfunction at (Nt/FWHM)=%6.1f, H=%6.1f*H_t',t,1/Ht_bar);
%title(x);
%xlabel('x / FWHM');
%ylabel('z / ( 3 * Ht )');

%figure ( 4 )
%contour(xx,zz,bb,30);
%axis tight
%grid on
%x = sprintf('Potential temperature (Nt/FWHM)=%6.1f, H=%6.1f*H_t',t,1/Ht_bar);
%title(x);
%xlabel('x / FWHM');
%ylabel('z / ( 3 * Ht )');

%figure ( 4 )
%contour(xx,zz,uu)
%axis tight
%grid on
%title('u(x,z,t) field in x-z plane');

%figure ( 5 )
%plot(fs,z);
%xlabel('Q');
%ylabel('z/H')
%axis tight
%grid on
%title('Fourier series of heat forcing function');

return 