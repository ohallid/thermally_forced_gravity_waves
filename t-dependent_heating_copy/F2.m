function[f] = F2(x,x_0,s,t, sigma)

% sigma = FWHM 

% sigma = 1;

% determine middle of x range

f     = exp(- ( x - x_0 - s * t) .* ( x - x_0 - s * t) / sigma / sigma / 2 ) / sigma; % / sigma to conserve total heating
% plot(x,f);

return