function [ xx, zz, psi, ww] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma, x_0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   HL_bar ratio,  lid height as a multiple of heating height
%   HV_bar ratio,  visualisation height as a multiple of heating height

%   Returns velocity field component u(x_bar,z_bar,t) in uu, units of Q_0,
%   Returns velocity field component w(x_bar,z_bar,t) in ww, units of Q_0.
%   non-dimensionalization in vertical uses H, tropopause height
%   non-dimensionalization in horizontal uses \sigma, FWHM of PB F(x) fn.

%   must have s = x_0 = 0 => u = 0, x = 0 as boundary condition on
%   integration for u, using the continuity equation

%   Implicit is the assumption that the heating profile below ground is
%   such that the profile on [-H,H] is anti-symmetric. 

%   Plots fields over z-range of heating NOT whole domain

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pi      = 3.14159265359;
Ht_bar  = 1 / HL_bar;
H_bar   = 1 / HL_bar;
dx      = 0.1;         % x-step
dz      = 0.1;         % z-step
x       = [0:dx:100 ];    % x = 10 equivalent to 10 * \sigma (FWHM, PB F(x) )
z       = [0:dz:HV_bar ];
x_0     = 50;             % initial position of heating function, middle of box
s       = 0.00;             
%s       = 0.006;
n       = 1;             % Number of half-sinusoids in interval
N       = 0.01;          % Based on dry lapse rate of 10 deg per km (notes)
[xx,zz] = meshgrid( x, z);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Compute the vertical velocity field w(x,z,t)
%   ww(1,:) corresponds to x = 0 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% H(t) terms
mz = 1;
b1 = 2 / mz / pi * ( 1.0 - cos( mz * pi * Ht_bar ) );                       % square step
b1  =  2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );
c  = N * HL_bar / pi / 1;
ww = M2(b1, mz, c, s, x, x_0, z, t, H_bar, sigma ) ;
FS = b1 * sin ( pi * 1 .* z * H_bar );
mode_number = 20 * round(HL_bar); % conserve number of modes spatially 
for mz = 2:mode_number
    c  = N * HL_bar / pi / mz;
    bm = 2 / mz / pi * ( 1.0 - cos( mz * pi * Ht_bar ) ) ;                  % square step
    bm  =  2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );
    ww = ww + M2(bm, mz, c, s, x, x_0, z, t, H_bar, sigma );
    FS = FS + bm * sin ( pi * mz .* z .* H_bar );
end 
% H(t - T) terms if needed
if (t > T)
        mz  = 1;
        b1  = 2 / mz / pi * ( 1.0 - cos( mz * pi * Ht_bar ) );                       % square step
        b1  = 2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );
        c   = N * HL_bar / pi / 1;
        wwp = M2(b1, mz, c, s, x, x_0, z, t-T , H_bar , sigma) ;
        FS  = b1 * sin ( pi * 1 .* z * H_bar );
        for mz = 2:mode_number
                 c  = N * HL_bar / pi / mz;
                bm  = 2 / mz / pi * ( 1.0 - cos( mz * pi * Ht_bar ) ) ;                  % square step
                bm  = 2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );
                wwp = wwp + M2(bm, mz, c, s, x, x_0, z, t-T , H_bar , sigma);
        end 
        ww   = ww - wwp;
end

% Y = round(X)

Q   = 1;        % Scale factor on total vertical velocity
ww  = Q * ww; 

% Adding in second mode
% Minus signs come in on b1, bm in order to get correct phase (low-level
% cooling).
% n = 2;
% for mz = 2:200
%     c  = N * HL_bar / pi / mz;
%     bm = 2 / mz / pi * ( 1.0 - cos( mz * pi * Ht_bar ) ) ;                  % square step
%     bm  = - 2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );
%     ww = ww + M2(bm, mz, c, s, x, x_0, z, t, H_bar, sigma );
%     FS = FS + bm * sin ( pi * mz .* z .* H_bar );
% end 
% % H(t - T) terms if needed
% if (t > T)
%         mz  = 1;
%         b1  = 2 / mz / pi * ( 1.0 - cos( mz * pi * Ht_bar ) );                       % square step
%         b1  = -2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );
%         c   = N * HL_bar / pi / 1;
%         wwp = M2(b1, mz, c, s, x, x_0, z, t-T , H_bar , sigma) ;
%         FS  = b1 * sin ( pi * 1 .* z * H_bar );
%         for mz = 2:100
%                  c  = N * HL_bar / pi / mz;
%                 bm  = 2 / mz / pi * ( 1.0 - cos( mz * pi * Ht_bar ) ) ;                  % square step
%                 bm  = - 2 * Ht_bar / pi * (-1)^(n+1) * sin ( mz * pi * Ht_bar ) * n / ( n * n - Ht_bar * Ht_bar * mz * mz );
%                 wwp = wwp + M2(bm, mz, c, s, x, x_0, z, t-T , H_bar , sigma);
%         end 
%         ww   = ww - wwp;
% end





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


return 