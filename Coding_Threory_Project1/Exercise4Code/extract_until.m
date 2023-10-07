function output = extract_until(F_delta, L, H)
    % Convert F_delta, L, and H to strings
    F_delta_str = float2bin(F_delta,20);
    L_str = float2bin(L,20);
    H_str = float2bin(H,20);

    % Find the decimal point
    dec_point = find(F_delta_str == '.', 1);

    % Initialize the output array
    output = [];

    % Extract the digits after the decimal point until di != di(l) or di != di(h)
    i = 1;
    if H_str == '1'
        H_str = '1.000000000';
    end
    if F_delta_str(dec_point + 1) == '0'
        while F_delta_str(dec_point + i) == L_str(dec_point + i)
        output = [output, str2double(F_delta_str(dec_point + i))];

        i = i + 1;
        end
    else 
        while F_delta_str(dec_point + i) == H_str(dec_point + i)
        output = [output, str2double(F_delta_str(dec_point + i))];
        i = i + 1;
        end
    end
    
  
   
end