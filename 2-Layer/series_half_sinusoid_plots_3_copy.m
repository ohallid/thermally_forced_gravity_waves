function [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3_copy(HL_bar , HV_bar, Ht_bar, t, T)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   z is normalized to top of heating i.e. z = 1 correponds to top of heating

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

pi      = 3.141592653589793;
dx      = 0.015;         % x-step
dz      = 0.015;         % z-step
x       = [0:dx:20 ];    % x = 10 equivalent to 10 * \sigma (FWHM, PB F(x) )
z       = [0:dz:HV_bar ];
x_0     = 0;             % initial position of heating function, middle of box
s       = 0;             
n       = 1;             % Number of half-sinusoids of hrsting in interval
N1      = 0.01;          % Based on dry lapse rate of 10 deg per km (notes)
N2      = 0.02;
alpha   = 100.0;          % Exponential decay parameter, units of HL_bar
ratio   = Ht_bar / HL_bar;
i       = complex(0,1);
[xx,zz] = meshgrid( x, z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Compute the vertical velocity field w(x,z,t)
%   ww(1,:) corresponds to x = 0 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mmax    = 1600;
m       = [1:1:mmax];
C2      = N2 * ( 1 - ratio ) * 2.0 ./ (-1 + 2 .* m )  / pi;     
c2      = NR(C2 , N1, N2, ratio );

facp2   = cos( N2 * (1 - ratio ) ./ c2 ) ./ cos ( N1 * ratio ./ c2 );
A2      = 0.5 .* c2 .* ( facp2 .* facp2 .* sin ( 2 * N1 * ratio ./ c2 ) / N1 + sin ( 2 * N2 * ( 1 - ratio ) ./ c2) / N2 ) + facp2 .* facp2 .* ratio + ( 1 - ratio );
A2      = ( 2 ./ A2 ) .^ 0.5;

% Half-sinusoid heating 
% s2      = A2 ./ 2 ./ HL_bar .* N1 ./ c2 .* facp2 .* ( sin( N1 .* ratio ./ c2 ) ./ ( pi / ratio - N1 ./ c2 ) + sin( N1 .* ratio ./ c2 ) ./ ( pi / ratio + N1 ./ c2   ) );
% s2      = A2 .* facp2 * N1 * pi / ratio / HL_bar ./ c2 .* sin ( N1 * ratio ./ c2 ) ./ ( pi * pi / ratio / ratio - N1 * N1 ./ c2 ./ c2 );

% SDG heating
k       = i * N1 ./ c2 - alpha;
kp      =-i * N1 ./ c2 - alpha;
K       = i * N2 ./ c2 - alpha;
Kp      =-i * N2 ./ c2 - alpha;
term1   = N1 * (integral ( 0    , ratio , k) - integral ( 0    ,ratio , kp)) / i;
term2   = N2 * (integral ( ratio, 1     , K) - integral ( ratio,1     , Kp)) / i;
term3   = N2 * (integral ( ratio, 1     , K) + integral ( ratio,1     , Kp));  
s2      = 0.5 * HL_bar ./ c2 .* A2 .* ( facp2.*term1 + cos(N2./c2).*term2 - sin(N2./c2).*term3 );

% Display spectrum of the heating function
% figure(1)
% plot(m, real(s2) );
% grid on;
% pause;

ww = M2(s2(1), HL_bar, c2(1), A2(1), facp2(1), s, x, x_0, z, t, T, Ht_bar );
Sz = S2(s2(1), HL_bar, c2(1), A2(1), facp2(1), s, x, x_0, z, t, T, Ht_bar );
for mz = 2: mmax
   ww = ww + M2(s2(mz), HL_bar, c2(mz), A2(mz), facp2(mz), s, x, x_0, z, t, T, Ht_bar );
   Sz = Sz + S2(s2(mz), HL_bar, c2(mz), A2(mz), facp2(mz), s, x, x_0, z, t, T, Ht_bar );
end 

% Display the effective heating profile
% figure(2)
% plot(z,Sz);
% grid on
% xlabel('z/m');
% ylabel('S/Q');
% pause

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