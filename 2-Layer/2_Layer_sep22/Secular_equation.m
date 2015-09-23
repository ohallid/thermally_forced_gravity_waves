
function [ xx ] = Secular_equation (HL_bar , Ht_bar )

pi      = 3.141592653589793;
N1      = 0.01;
N2      = 0.0199;
% N2      = 0.0190;
ratio   = Ht_bar / HL_bar;
dx1     = pi / N1 / ratio / 10000000;

% Approximate eigenvalues used as seeds for NR
m       = [1:1:2000];
C1      = N1 *   ratio             ./ m              / pi;    
C1p     = N1 *   ratio       * 2.0 ./ ( 1 + 2 .* m ) / pi;  
C2      = N2 * ( 1 - ratio ) * 2.0 ./ (-1 + 2 .* m ) / pi;    
% C2p     = N2 * ( 1 - ratio )       ./ m              / pi;
C2p     = C1;

x1      = 1 ./ C1;       % x1 ~ 1.0e+06 * 0.0031 = 3100
x1p     = 1 ./ C1p;
x2      = 1 ./ C2;
x2p     = 1 ./ C2p;

l       = length(x1);
y1      = zeros(l);
l       = length(x1p);
y1p     = zeros(l);
l       = length(x2);
y2      = zeros(l);
l       = length(x2p);
y2p     = zeros(l);


xmax  = 30000000;
x     = [0:1:xmax];
xx    = x * dx1;
plot(xx, tan( N1 .* ratio .* xx ) ./ tan( N2 .* ( ratio-1 ) .* xx ) - N1 / N2 );
xlabel('x=1/cn');
ylabel('Value of secular determinant');
title('Variation of secular determinant with xn = 1/cn for 2-layer problem.')
grid on
hold on
plot(x2 ,y2 ,'c*');
plot(x2p,y2p,'c*');

% plot(x2p,y2p,'c*');
% plot(x1 ,y1 ,'c*');
% plot(x1 ,y1p,'c*');

% NR solver step for c_{n}^{(1)}
% for n=1:20
%    f       = tan ( N1 * ratio .* x1 ) ./ tan ( N2 * (ratio - 1) .* x1 ) - N1 / N2;
%    dfdx_1  = tan ( N2 * (ratio - 1) .* x1 ) .* ( 1 + tan( N1 * ratio .* x1) .* tan( N1 * ratio .* x1) )        * N1 * ratio      ;
%    dfdx_2  = tan ( N1 * ratio .* x1 ) .* ( 1 + tan( N2 * ( ratio -1 ).* x1) .* tan( N2 * ( ratio -1 ).* x1 ) ) * N2 * (ratio - 1);
%    dfdx    = ( dfdx_1 - dfdx_2 ) ./ tan( N2 * (ratio -1 ) .* x1 ) ./ tan( N2 * (ratio -1 ) .* x1 );
%    xp      = x1 - f ./ dfdx / 5;
%    x1      = xp;
% end
% plot(x1,y1,'c*')
% x1(2)
% C1(2)
% ( x1(2) - ( 1 / C1(2)) ) / x1(2)

% NR solver step for c_{n}^{(2)}
for n=1:1000
    f       = tan ( N1 * ratio .* x2 ) ./ tan ( N2 * (ratio - 1) .* x2 ) - N1 / N2;
    dfdx_1  = tan ( N2 * (ratio - 1) .* x2 ) .* ( 1 + tan( N1 * ratio .* x2) .* tan( N1 * ratio .* x2) )        * N1 * ratio      ;
    dfdx_2  = tan ( N1 * ratio .* x2 ) .* ( 1 + tan( N2 * ( ratio -1 ).* x2) .* tan( N2 * ( ratio -1 ).* x2 ) ) * N2 * (ratio - 1);
    dfdx    = ( dfdx_1 - dfdx_2 ) ./ tan( N2 * (ratio -1 ) .* x2 ) ./ tan( N2 * (ratio -1 ) .* x2 );
    xp      = x2 - f ./ dfdx / 40;
    x2      = xp;
end
for n=1:1000
    f       = tan ( N1 * ratio .* x2p ) ./ tan ( N2 * (ratio - 1) .* x2p ) - N1 / N2;
    dfdx_1  = tan ( N2 * (ratio - 1) .* x2p ) .* ( 1 + tan( N1 * ratio .* x2p) .* tan( N1 * ratio .* x2p) )        * N1 * ratio      ;
    dfdx_2  = tan ( N1 * ratio .* x2p ) .* ( 1 + tan( N2 * ( ratio -1 ).* x2p) .* tan( N2 * ( ratio -1 ).* x2p ) ) * N2 * (ratio - 1);
    dfdx    = ( dfdx_1 - dfdx_2 ) ./ tan( N2 * (ratio -1 ) .* x2p ) ./ tan( N2 * (ratio -1 ) .* x2p );
    xp      = x2p - f ./ dfdx / 40;
    x2p     = xp;
end

plot(x2 ,y2 ,'r*');
plot(x2p,y2p,'r*');
% xlim([0  max(xx)]);
xlim([ 0    2000* pi]);
% xlim([3165 3175]);    % to observe c_n(1)
ylim([-30 30]);

% insert = @(a, x, n)cat(2,  x(1:n), a, x(n+1:end));
% insert(3, [1,2,4,5], 2)
% ans = 1     2     3     4     5



xx = x2 / pi * 0.01;

return
