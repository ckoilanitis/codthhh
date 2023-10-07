function d = extract_digits(num, t)
    % Convert num to binary string
    num_bin = float2bin(num,t+1);
    dec_point = find(num_bin == '.', 1);
    % Extract the digits up to the tth digit
    d = num_bin(dec_point+1:t+dec_point);
    
    % Convert the string to a binary array
    d = arrayfun(@(x) str2double(x), d);
end