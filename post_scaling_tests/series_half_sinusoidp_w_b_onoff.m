function [ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, mz_max )

% Transient heating, w and b (PT) response
% s = 0 case
% total heating conserved 
% ww(1,:) corresponds to x = 0 

Ht_bar  = 1 / HL_bar;    % Ratio, height to top of heating
dx      = 0.1;          % x-step
dz      = 0.1;         % z-step
x       = [0:dx:100 ];    % x = 10 equivalent to 10 * \sigma (FWHM, PB F(x) )
z       = [0:dz:HV_bar ];     % z = 1  equivalent to H_t, H >> H_t is lid position
x_0     = 50;             % initial position of heating function, middle of box
s       = 0;             
n       = 1;             % Number of half-sinusoids in interval
N       = 0.01;          % Based on dry lapse rate of 10 deg per km (notes) Units s^{-1}
[xx,zz] = meshgrid( x, z);
 
m       = [1:1:mz_max];
b       = 2 * Ht_bar / pi * (-1)^(n+1) .* sin ( m .* pi * Ht_bar ) .* n ./ ( n * n - Ht_bar * Ht_bar .* m .* m ); % half-sinusoid
c       = N * HL_bar / pi ./ m;

ww = M2(b(1), 1, c(1), x, x_0, z, t, T, HL_bar, sigma ) ;
bb = M3(b(1), 1, c(1), x, x_0, z, t, T, HL_bar, sigma ) ;
FS = b(1) * sin ( pi * 1 .* z / HL_bar );
for mz = 2: mz_max
    ww = ww + M2(b(mz), mz, c(mz), x, x_0, z, t, T, HL_bar, sigma );
    bb = bb + M3(b(mz), mz, c(mz), x, x_0, z, t, T, HL_bar, sigma );
    FS = FS + b(mz) * sin ( pi * mz .* z / HL_bar );
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




bb   = 280 * bb / 10;
Q    = 0.000375;
ww   = ww * Q;
bb   = bb * Q;

return 