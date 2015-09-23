function [ xx, zz, ww ] = series_half_sinusoid_plots_3_copy(HL_bar , HV_bar, Ht_bar, t, T)

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
N1      = 0.01;          % Based on dry lapse rate of 10 deg per km (notes)
N2      = 0.0199;
alpha   = 100.0;         % Exponential decay parameter, units of HL_bar
ratio   = Ht_bar / HL_bar;
i       = complex(0,1);
[xx,zz] = meshgrid( x, z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Compute the vertical velocity field w(x,z,t)
%   ww(1,:) corresponds to x = 0 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mmax    = 400;
m       = [1:1:mmax];
C1      = N1 *   ratio             ./ m              / pi;    
c1      = NR(C1 ,N1, N2, ratio );
C2      = N2 * ( 1 - ratio ) * 2.0 ./ (-1 + 2 .* m )  / pi;     
c2      = NR(C2 , N1, N2, ratio );

facp1   = cos( N2 * (1 - ratio ) ./ c1 ) ./ cos ( N1 * ratio ./ c1 );
A1      = 0.5 .* c1 .* ( facp1 .* facp1 .* sin ( 2 * N1 * ratio ./ c1 ) / N1 + sin ( 2 * N2 * ( 1 - ratio ) ./ c1) / N2 ) + facp1 .* facp1 * ratio + ( 1 - ratio );
A1      = ( 2 ./ A1 ) .^ 0.5;
facp2   = cos( N2 * (1 - ratio ) ./ c2 ) ./ cos ( N1 * ratio ./ c2 );
A2      = 0.5 .* c2 .* ( facp2 .* facp2 .* sin ( 2 * N1 * ratio ./ c2 ) / N1 + sin ( 2 * N2 * ( 1 - ratio ) ./ c2) / N2 ) + facp2 .* facp2 * ratio + ( 1 - ratio );
A2      = ( 2 ./ A2 ) .^ 0.5;

% Half-sinusoid heating 
s1      = A1 .* facp1 / N1 * pi / ratio / HL_bar ./ c1 .* sin ( N1 * ratio ./ c1 ) ./ ( pi * pi / ratio / ratio - N1 * N1 ./ c1 ./ c1 );
s2      = A2 .* facp2 / N1 * pi / ratio / HL_bar ./ c2 .* sin ( N1 * ratio ./ c2 ) ./ ( pi * pi / ratio / ratio - N1 * N1 ./ c2 ./ c2 );

% SDG heating
% k       = i * N1 ./ c2 - alpha;
% kp      =-i * N1 ./ c2 - alpha;
% K       = i * N2 ./ c2 - alpha;
% Kp      =-i * N2 ./ c2 - alpha;
% term1   = 1 / N1 * (integral ( 0    , ratio , k) - integral ( 0    ,ratio , kp)) / i;
% term2   = 1 / N2 * (integral ( ratio, 1     , K) - integral ( ratio,1     , Kp)) / i;
% term3   = 1 / N2 * (integral ( ratio, 1     , K) + integral ( ratio,1, Kp));   
% s2      = 0.5 * HL_bar ./ c2 .* A2 .* ( facp2.*term1 + cos(N2./c2).*term2 - sin(N2./c2).*term3 );

ww = M2(s2(1), HL_bar, c2(1), A2(1), facp2(1), s, x, x_0, z, t, T, Ht_bar );
Sz = S2(s2(1), HL_bar, c2(1), A2(1), facp2(1), s, x, x_0, z, t, T, Ht_bar );
for mz = 2: mmax
    ww = ww + M2(s2(mz), HL_bar, c2(mz), A2(mz), facp2(mz), s, x, x_0, z, t, T, Ht_bar );
    Sz = Sz + S2(s2(mz), HL_bar, c2(mz), A2(mz), facp2(mz), s, x, x_0, z, t, T, Ht_bar );
end 
for mz = 1: mmax
    ww = ww + M2(s1(mz), HL_bar, c1(mz), A2(mz), facp1(mz), s, x, x_0, z, t, T, Ht_bar );
    Sz = Sz + S2(s1(mz), HL_bar, c1(mz), A1(mz), facp1(mz), s, x, x_0, z, t, T, Ht_bar );
end 

% Display spectrum of the heating function and resulting expansion
% Dubugging only : interferes with execution
% figure(1)
% subplot(1,2,1)
% scatter(m, real(s2),'*r');
% hold on
% grid on
% scatter(m, real(s1),'c*');
% xlabel('m');
% title('s_m(c_m^{(1,2)})')
% subplot(1,2,2)
% plot(z,Sz);
% grid on
% xlabel('z/m');
% ylabel('S/Q');
% pause

return 