function t = find_max_t(L, H)
    % Convert L and H to strings
    L_str = float2bin(L,13);
    H_str = float2bin(H,13);
    
    
    % Find the decimal point
    dec_point = find(L_str == '.', 1);
    
    % Compare the digits after the decimal point
    t = 1;
    
    if H_str == '1'
        H_str = '1.00000000000000';
    end
    if L_str == '0'
        L_str = '0.00000000000000';
    end
    while L_str(dec_point + t) == H_str(dec_point + t)
        t = t + 1;
        if ((dec_point + t) > length(L_str) || (dec_point + t) > length(H_str))
            break;
        end
    end
    
    % Subtract 1 because the loop will increment t one extra time
    t = t - 1;
end