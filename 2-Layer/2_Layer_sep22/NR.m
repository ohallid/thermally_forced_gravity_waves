
function [Cn] = NR(cn, N1, N2, ratio )

pi      = 3.141592653589793;
x       = 1 ./ cn;
RELAX   = 40;                    % Control to ensure convergence to nearest root

nmax    = 1000;
for n = 1:nmax
    f       = tan ( N1 * ratio .* x ) ./ tan ( N2 * (ratio - 1) .* x ) - N1 / N2;
    dfdx_1  = tan ( N2 * (ratio - 1) .* x ) .* ( 1 + tan( N1 * ratio .* x) .*  tan( N1 * ratio .* x) )        * N1 * ratio      ;
    dfdx_2  = tan ( N1 * ratio .* x ) .* ( 1 + tan( N2 * ( ratio -1 ).* x ) .* tan( N2 * ( ratio -1 ).* x ) ) * N2 * (ratio - 1);
    dfdx    = ( dfdx_1 - dfdx_2 ) ./ tan( N2 * (ratio -1 ) .* x ) ./ tan( N2 * (ratio -1 ) .* x );
    xp      = x - f ./ dfdx / RELAX;
    x       = xp;
end
% for n = 1:nmax
%     f       = tan ( N1 * ratio .* x ) ./ tan ( N2 * (ratio - 1) .* x ) - N1 / N2;
%     dfdx_1  = tan ( N2 * (ratio - 1) .* x ) .* ( 1 + tan( N1 * ratio .* x) .*  tan( N1 * ratio .* x) )        * N1 * ratio      ;
%     dfdx_2  = tan ( N1 * ratio .* x ) .* ( 1 + tan( N2 * ( ratio -1 ).* x ) .* tan( N2 * ( ratio -1 ).* x ) ) * N2 * (ratio - 1);
%     dfdx    = ( dfdx_1 - dfdx_2 ) ./ tan( N2 * (ratio -1 ) .* x ) ./ tan( N2 * (ratio -1 ) .* x );
%     xp      = x - f ./ dfdx;
%     x       = xp;
% end

Cn    = 1 ./ x;

return