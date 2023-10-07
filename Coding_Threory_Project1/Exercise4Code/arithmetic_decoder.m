function output = arithmetic_decoder(y,p)
% Define the function FX and input vector y
% FX = @(x) sum(Px(1:x)); % Px needs to be defined
% y = [y1, y2, ..., yn]; % Define your input vector

    FX_Next = 0;
    L = 0;
    H = 1;
    D = 1;
    Lx = 0;
    Hx = 1;
    Dx = 1;
    len = 1;
    FX_neg = 0;
    FX_0 = 1 - p;
    FX_1 = 1;
    FX = [FX_neg FX_0 FX_1];
    
    output = [];
    count = 1;
    for i = 1:length(y)
        if isnan(y(i))
            continue;
        end
        H = L + D * (y(i) + 1) / 2;
        L = L + D * y(i) / 2;
        D = H - L;
        j = find_j(FX, L, Lx, Dx); % find_j needs to be defined
        j;

        if j == 0
            FX_Next = FX_0;
        else
            FX_Next = FX_1;
        end
        while ((H - Lx) / Dx) <= FX_Next
            output = [output, j];
            len = len + 1;
            count = count + 1;
            
            if j == 1
                Hx = Lx + Dx * FX_1;
                Lx = Lx + Dx * FX_0;
                Dx = Hx - Lx;
            else 
                Hx = Lx + Dx * FX_0;
                Lx = Lx + Dx * FX_neg;
                Dx = Hx - Lx;
            end
           
            t = find_max_t(Lx, Hx); % find_max_t needs to be defined
            
            if t > 0
                % Extract d1, d2, ..., dt
                d = extract_digits(Lx, t); % extract_digits needs to be defined
                
                % Calculate the sum for L, Lx, H, and Hx update
                sum_val = sum(d .* 2.^(t - (1:t)));
                
                L = 2^t * L - sum_val;
                Lx = 2^t * Lx - sum_val;
                H = 2^t * H - sum_val;
                Hx = 2^t * Hx - sum_val;
            end
            
            D = H - L;
            Dx = Hx - Lx;
           
            j = find_j(FX, L, Lx, Dx); 

            if j == 0
            FX_Next = FX_0;
            else
            FX_Next = FX_1;
            end

        end
        
    end

end