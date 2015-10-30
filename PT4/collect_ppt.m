function [bb] = collect_ppt()

T       = 1000;  % secs
sigma   = 1;    % Scales horizontal variation of F(x). Muliples reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0


for t = drange(100:100:1000)
    figure ( 1 )

    % lid height 40 taken as converged
    h(1)  =  subplot(1,2,1);
    HL_bar   = 29.999;
    HV_bar   = 30;
    [ ww, bb, fs, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar , HV_bar, sigma, t, T, 60*HL_bar );
    % [ ww, bb, fs, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar , HV_bar, t, T, 1000 );
    contourf(xx,zz,log(abs(ww)+ 1.0e-6),30);
    % contourf(xx,zz,ww,30);
    colorbar
    grid on
    axis equal
    x = sprintf('w-response at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
    title(x);
    xlabel('x / \sigma_0');
    ylabel('z / Ht');

    h(2)  =  subplot(1,2,2) ;
    contourf(xx,zz,ww,30);
    colorbar
    grid on
    axis equal
    x = sprintf('w-response at t =%6.1f secs, H=%6.1f*H_t',t,HL_bar);
    % title(x);
    xlabel('x / \sigma_0');
    ylabel('z / Ht');

    linkaxes(h)
    xlim([0  10])
    ylim([0  HV_bar])
    
    pause
end


figure (2)
subplot(2,1,1)
plot(fs,z);
x = sprintf('Fourier series of heating function, H=%6.1f*H_t',HL_bar);
title(x);
ylim([0 5])
xlim([0 1])
xlabel('Q / Q_0');
ylabel('z / Ht');
grid on
subplot(2,1,2)
scatter(m,b);
x = sprintf('Fourier series coefficients, H=%6.1f*H_t',HL_bar);
title(x);
xlabel('m');
ylabel('b_m(H)');
grid on

return 

