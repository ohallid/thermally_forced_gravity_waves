% 3 x 3 panels showing difference between sharp and smooth heating
function [ww] = collect_w_4()

figure(1)

H_bar   = 0.9898;
Ht_bar  = 0.3367;
%t       = 1000;
T       = 1500;

h(1)  =  subplot(3,3,1);
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 500;     % non-dimensional time
sigma    = 1 ;
%t        = t * sigma; % to get corresponds in time between panels
[ xx, zz, psi, ww1 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww1,30);
% axis tight
colorbar
caxis([ -100 100])
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / sigma');
ylabel('z / Ht');


% lid height 3
h(2)  =  subplot(3,3,4) ;
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 1000;
sigma    = 1 ;
%t        = t * sigma;
[ xx, zz, psi, ww2 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww2,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / sigma');
ylabel('z / Ht');

% lid height 1
h(3)  =  subplot(3,3,7); 
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 1500;
sigma    = 1 ;
%t        = t * sigma;
[ xx, zz, psi,ww3 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww3,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / sigma');
ylabel('z / Ht');

% lid height 1
h(4)  =  subplot(3,3,2); 
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 500;
sigma    = 0.25 ;
%t        = t * sigma;
[ xx, zz, psi,ww4 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww4,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / sigma');
ylabel('z / Ht');

% lid height 1
h(5)  =  subplot(3,3,5); 
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 1000;
sigma    = 0.25 ;
%t        = t * sigma;
[ xx, zz, psi,ww5 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww5,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / sigma');
ylabel('z / Ht');

% lid height 1
h(6)  =  subplot(3,3,8); 
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 1500;
sigma    = 0.25 ;
%t        = t * sigma;
[ xx, zz, psi,ww6 ] = series_half_sinusoid_plots_3(HL_bar , HV_bar, t, T, sigma);
contourf(xx,zz,ww6,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title(x);
xlabel('x / sigma');
ylabel('z / Ht');

h(7)  =  subplot(3,3,3); 
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 1500;
sigma    = 0.25 ;
ww7      = ww1 - ww4;
contourf(xx,zz,ww7,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title('difference');
xlabel('x / sigma');
ylabel('z / Ht');

h(8)  =  subplot(3,3,6); 
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 1500;
sigma    = 0.25 ;
ww8      = ww2 - ww5;
contourf(xx,zz,ww8,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
x = sprintf('w structure at t =%6.1f, H=%6.1f*H_t',t,HL_bar);
title('difference');
xlabel('x / sigma');
ylabel('z / Ht');

h(9)  =  subplot(3,3,9); 
HL_bar   = 19.993;
HV_bar   = 20.005;
t        = 1500;
sigma    = 0.25 ;
ww9      = ww3 - ww6;
contourf(xx,zz,ww9,30);
colorbar
caxis([ -100 100])
%axis tight
grid on
axis equal
title('difference');
xlabel('x / sigma');
ylabel('z / Ht');


linkaxes(h)
xlim([0  10])
ylim([0 10])

% figure (2)
% ww7   = ww1 - ww4;
% contour(xx, zz, ww7, 30)
% grid on
% axis equal


return 

