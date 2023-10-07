function output = arithmetic_coder(input, p)
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

        % Convert L and H to strings with a '0.' prefix for ease of comparison
        L_str = num2str(L, '%.15f');
        H_str = num2str(H, '%.15f');

        % Equalize the lengths of the strings by padding the shorter one with zeros
        diff = length(H_str) - length(L_str);
        if diff > 0
            L_str = [L_str, repmat('0', 1, diff)];
        elseif diff < 0
            H_str = [H_str, repmat('0', 1, -diff)];
        end

        % Find max{t} where L and H share t common digits after the decimal point
        t = find(~(L_str == H_str), 1) - 3; % subtract 3 to account for '0.'

        if t > 0
            % Extract common digits and append them to the output
            output = strcat(output, L_str(3:2+t));

            % Renormalize L and H by removing the extracted digits
            L = str2double(strcat('0.', L_str(3+t:end)));
            H = str2double(strcat('0.', H_str(3+t:end)));
        end
    end

    % Compute the midpoint of the final interval
    F = (L + H) / 2;
    F_str = num2str(F, '%.15f');

    % If F starts with '0.', extract and append digits until the first differing digit
    if strncmp(F_str, '0.', 2)
        i = 3;
        while F_str(i) == L_str(i) && i <= length(F_str)
            output = strcat(output, F_str(i));
            i = i + 1;
        end
    else % If F starts with '1.', extract and append digits until the first differing digit
        i = 3;
        while F_str(i) == H_str(i) && i <= length(F_str)
            output = strcat(output, F_str(i));
            i = i + 1;
        end
    end

end
