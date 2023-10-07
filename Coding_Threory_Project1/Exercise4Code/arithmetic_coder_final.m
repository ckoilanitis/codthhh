function output = arithmetic_coder_final(x,p)
% Define the function FX and input vector x
% FX = @(x) sum(Px(1:x)); % Px needs to be defined

FX_neg = 0;
FX_0 = 1-p;
FX_1 = 1;

n = length(x);
L = 0;
H = 1;
d_values = [];

for i = 1:n
    D = H - L;
    if x(i) == 0
        H = L + D * FX_0;
        L = L + D * FX_neg;
    else
        H = L + D * FX_1;
        L = L + D * FX_0;
    end

    t = find_max_t(L, H); 

    if t > 0
        % Extract d1, d2, ..., dt
        d = extract_digits(L,t); % extract_digits needs to be defined
        
        % Store the value 
        if ~isempty(d)
            d_values = [d_values d];
        end

        % Calculate the sum for L and H update
        sum_val = sum(d .* 2.^(t - (1:t)));
        
        L = 2^t * L - sum_val;
        H = 2^t * H - sum_val;
        last = i
    end
end

F_delta = (L + H) / 2;
final_output = extract_until(F_delta, L, H);
length(final_output)
output = [d_values final_output];

end