function bin_str = float2bin(num, precision)
    % Separate the integer part and the fractional part
    int_part = floor(num);
    frac_part = num - int_part;
    
    % Convert the integer part to binary
    bin_str = dec2bin(int_part);
    
    % Convert the fractional part to binary
    if frac_part > 0
        bin_str = [bin_str, '.'];
        i = 1;
        while frac_part > 0 && i <= precision
            frac_part = frac_part * 2;
            if frac_part >= 1
                bin_str = [bin_str, '1'];
                frac_part = frac_part - 1;
            else
                bin_str = [bin_str, '0'];
            end
            i = i + 1;
        end
    end
end