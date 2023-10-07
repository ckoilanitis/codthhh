function output = arithmetic_decoder_final(d_values, p)
    % d_values is the input sequence encoded by the arithmetic_coder_final
    % p is the probability of '1'

    FX_neg = 0;
    FX_0 = 1-p;
    FX_1 = 1;

    L = 0;
    H = 1;
    output = [];
    d_index = 1;
    t = length(d_values(d_index));
    sum_val = sum(d_values(d_index) .* 2.^(t - (1:t)));
    L_cur = L + sum_val / (2^t);
    H_cur = H + sum_val / (2^t);

    while d_index <= length(d_values)
        D = H - L;
        if L_cur < (L + D * FX_0)
            output = [output, 0];
            H = L + D * FX_0;
            L = L + D * FX_neg;
        else
            output = [output, 1];
            H = L + D * FX_1;
            L = L + D * FX_0;
        end

        if (H_cur <= H && L_cur >= L)
            if (d_index + 1) <= length(d_values)
                d_index = d_index + 1
                t = length(d_values(d_index));
                sum_val = sum(d_values(d_index) .* 2.^(t - (1:t)));
                L_cur = L + sum_val / (2^t);
                H_cur = H + sum_val / (2^t);
            else
                break;
            end
        end
    end
end