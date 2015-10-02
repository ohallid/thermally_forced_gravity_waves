function[f] = F3(x,x_0,s,t, sigma)

f     = erf( x - x_0 ) .* erf ( s * t - x - x_0 );


return