% Tool to calculate Q (to tune heating rate)
% Plots max(max(bb)) against time. Grad of grap will give rate of heating
% per unit time.
function [ww ,bb , b1, b2, delta_b, pp21, pp22, pp31, pp32] = Q_calc();


% t       = 100;   % secs
T       = 10000;  % secs
sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
scalar  = 1;
HL_bar  = 10.0001;
HV_bar  = 1; 

Q = 1;
for j = 1:4   
    t = 100;
    for i = 1:100
        [ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
        bb = Q * bb;
        bb = max(max(bb));
        b1(i) = bb;   % records maximum bb for different times in array
        t = t + 100;
    end
    t = 100;
    for l = 1:20
        [ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
        bb = Q * bb;
        bb = max(max(bb));
        b2(l) = bb;   % records maximum bb for different times in array
        t = t + 100;
    end
    t = 100;
    for l = 1:30
        [ ww, bb, FS, b, m, xx, zz, z ] = series_half_sinusoidp_w_b(HL_bar, HV_bar, sigma, t, T, scalar * HL_bar );
        bb = Q * bb;
        bb = max(max(bb));
        b3(l) = bb;   % records maximum bb for different times in array
        t = t + 100;
    end
    for k = 2:length(b1)
        delta_b(k-1) = b1(k) - b1(k-1);
        delta_t      = 100;
        grad_b_t     = delta_b ./ delta_t;
    end
        
    
    t1 = [100:100:10000];
    t2 = [100:100:2000];
    t3 = [100:100:3000];
     
    figure(1) % Full set
    scatter(t1 , b1, 'x')
    grid on
    hold on
    x = sprintf('Temporal Variation of Maximum Potential Temperature, H = 1* H_t',t,HL_bar);
    title(x);
    xlabel('time (s)');
    ylabel('Max Potential Temperature');
    legend('Q = 0.05','Q = 0.025','Q = 0.0125', 'Q = 0.00625')
    ylim([0 25])
    
    figure(2) % First subset, extracted by eye (when temp is still changing)
    scatter(t2 , b2 , 'x')
    grid on
    hold on
    x = sprintf('Temporal Variation of Maximum Potential Temperature, H = 1* H_t',t,HL_bar);
    title(x);
    xlabel('time (s)');
    ylabel('Max Potential Temperature');
    ylim([0 20])
    p2 = polyfit(t2,b2,1);  % use the raw data to get the intercept and slope
    pp2 = zeros(4);
    pp21(j) = p2(1); % write grad and intercept into array to use in graph legend
    pp22(j) = p2(2);
    x2 = 0:10:2000;
    y2 = p2(1)*x2 + p2(2);
    hold on
    plot(x2,y2) % plot line of best fit
    legend('Q = 1.0', 'b = %p2(1) t + %p2(1)','Q = 0.5','b = %p2(2) t + %p2(2)' ,'Q = 0.25','b = %p2(3) t + %p2(3)' , 'Q = 0.125', 'b = %p2(4) t + %p2(4)')
   
    figure(3) % Test with larger subset to see variation in line of best fit
    scatter(t3 , b3 , 'x') 
    grid on
    x = sprintf('Temporal Variation of Maximum Potential Temperature, H = 1* H_t',t,HL_bar);
    title(x);
    xlabel('time (s)');
    ylabel('Max Potential Temperature');
    ylim([0 20])
    p3 = polyfit(t3,b3,1);  % use the raw data to get the intercept and slope
    pp3 = zeros(4);
    pp31(j) = p3(1); % write grad and intercept into array to use in graph legend
    pp32(j) = p3(2);
    x3 = 0:10:3000;
    y3 = p2(1)*x3 + p2(2);
    hold on
    plot(x3,y3)
    legend('Q = 1.0', 'b = %p3(1) t + %p3(1)','Q = 0.5','b = %p3(2) t + %p3(2)' ,'Q = 0.25','b = %p3(3) t + %p3(3)' , 'Q = 0.125', 'b = %p3(4) t + %p3(4)')
   
    
    Q = Q / 2;
    
end

return