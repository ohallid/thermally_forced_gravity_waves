function RelativeSpectrum ()

n       = 1;             % Number of half-sinusoids in interval
N       = 0.01;          % Based on dry lapse rate of 10 deg per km (notes) Units s^{-1}

mz_max  = 2000;
m       = [1:1:mz_max];
Ht      = 1;

HL      = 50;
kz1     = 2 * m / HL;
Ht_bar  = Ht / HL;
b1      = 2 * Ht_bar / pi * (-1)^(n+1) .* sin ( m .* pi * Ht_bar ) .* n ./ ( n * n - Ht_bar * Ht_bar .* m .* m ); % half-sinusoid

HL      = 100;
kz2     = 2 * m / HL;
Ht_bar  = Ht / HL;
b2      = 2 * Ht_bar / pi * (-1)^(n+1) .* sin ( m .* pi * Ht_bar ) .* n ./ ( n * n - Ht_bar * Ht_bar .* m .* m ); % half-sinusoid

HL      = 200;
kz3     = 2 * m / HL;
Ht_bar  = Ht / HL;
b3      = 2 * Ht_bar / pi * (-1)^(n+1) .* sin ( m .* pi * Ht_bar ) .* n ./ ( n * n - Ht_bar * Ht_bar .* m .* m ); % half-sinusoid

HL      = 400;
kz4     = 2 * m / HL;
Ht_bar  = Ht / HL;
b4      = 2 * Ht_bar / pi * (-1)^(n+1) .* sin ( m .* pi * Ht_bar ) .* n ./ ( n * n - Ht_bar * Ht_bar .* m .* m ); % half-sinusoid

subplot(3,1,1)
plot(m,b1,m,b2,m,b3,m,b4);
xlabel('m_z')
ylabel('b_m')
title('Fourier spectrum for stated lid heights in m_z (mode-number) space.');
legend ('HL=50','HL=100','HL=200','HL=400');

subplot(3,1,2)
plot(kz1,b1,kz2,b2,kz3,b3,kz4,b4);
xlabel('k_z')
ylabel('b_m')
title('Fourier spectrum for stated lid heights in k_z (vertical wavevector) space.');
legend ('HL=50','HL=100','HL=200','HL=400');

subplot(3,1,3)
plot(kz1,b1,kz2,2*b2,kz3,4*b3,kz4,8*b4);
xlabel('k_z')
ylabel('H_L * b_m')
title('Fourier spectrum scaled by H_Hfor stated lid heights in k_z (vertical wavevector) space.');
legend ('HL=50','HL=100','HL=200','HL=400');
return