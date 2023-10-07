function output = binary_arithmetic_encoder(input, p)
    % input is a binary array, e.g., [1, 0, 1, 1, 1, 0, 1, 1]
    % p is the probability of '1'

    L = 0;
    H = 1;
    output = '';

    for i = 1:length(input)
        delta = H - L;
        if input(i) == 0
            H = L + delta * (1-p);
        else % if input(i) == 1
            L = L + delta * (1-p);
        end

        while ((L >= 0.5 && H > 0.5) || (L < 0.5 && H <= 0.5))
            if (L >= 0.5 && H > 0.5)
                % Shift out 1 and shift in 0 at the end
                L = 2 * (L - 0.5);
                H = 2 * (H - 0.5);
                output = strcat(output, '1');
            else
            % Shift out 0 and shift in 0 at the end
                L = 2 * L;
                H = 2 * H;
                output = strcat(output, '0');
            end
        end
    end

    % Append one more bit to disambiguate the last symbol
    if L >= 0.25 && H <= 0.75
        output = strcat(output, '01');  % '01' is in the middle of '00' and '11'
    else
        output = strcat(output, '10');  % '10' is in the middle of '00' and '11'
    end

end