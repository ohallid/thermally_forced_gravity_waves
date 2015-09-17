%function [x1, t1, xx1, tt, ww, w_trop        ]  = Hovmoller()        % surf
function [x1, t1, xx1, tt, ww, w_trop, w_ext] = Hovmoller()       % contour

HL_bar       = 1.02;
HV_bar       = 20.005;
T            = 1000000500;
x1           = [0:1:1000];
t1           = [0:50:4800];
[xx1, tt]    = meshgrid(x1,  t1);
w_trop       = zeros(49 , 1001);
sigma        = 1;
N            = 0.01;

t = 0;
for i = 1:1:97
    [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
    w_ext               = ww(10,:);
    w_trop(i,:)         = w_ext(:);
    t = t + 50;
end
figure(1)
xx1 = xx1 - 500;
%tt  = tt * pi * sigma / N / HL_bar ; 
contourf(xx1 , tt, w_trop);
caxis([ -2000 2000])
xlabel('w value at the tropopause')
ylabel('time')
xlim([-100 100])


% surf plot
% 
% [xx1, tt]    = meshgrid(x1,  t1);
% w_trop      = zeros(24 , 1001);
% t = 0;
% for i = 1:1:24
%     [ xx, zz, psi, ww ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
%     w_trop(i,:)         = ww(10,:);
%     t = t + 250;
% end
% figure(2)
% surfc(w_trop);
% xlabel('w value at the tropopause')
% ylabel('time')
% zlabel('Velocity magnitude')


return