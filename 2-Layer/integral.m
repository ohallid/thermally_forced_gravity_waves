function [ int ] = integral ( x_lower, x_upper, k  )

% integral between lower (upper) limit x_lower (x_upper) of x e ^ {-k|z|}
% using parts

evaluated = 1 ./ k      .* ( x_upper.*exp (k*x_upper) - x_lower.*exp (k*x_lower)); 
second    = 1 ./ k ./ k .* ( exp(k*x_upper) - exp (k*x_lower) );
int       = evaluated - second;

return