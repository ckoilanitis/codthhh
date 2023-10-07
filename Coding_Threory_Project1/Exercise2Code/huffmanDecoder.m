function message = huffmanDecoder(encodedMessage)

% Define the Huffman table.
huffmanTable = containers.Map({'0', '10', '110', '111'}, {'1', '2', '3', '4'});

% Initialize a string to hold the decoded message.
message = '';

% Initialize a string to hold the current Huffman-encoded symbol.
currentSymbol = '';
% Loop over the characters in the encoded message.
for i = 1:length(encodedMessage)
    % Add the current character to the current symbol.
    currentSymbol = [currentSymbol, encodedMessage(i)];

    % If the current symbol is in the Huffman table, add the corresponding
    % decoded character to the message and reset the current symbol.
    if isKey(huffmanTable, currentSymbol)
        message = [message, huffmanTable(currentSymbol)];
        currentSymbol = '';
    end
end

% If there are any remaining characters in the current symbol after
% processing the entire encoded message, this is an error because all
% Huffman-encoded symbols should have been recognized.
if ~isempty(currentSymbol)
    error('Invalid Huffman-encoded message.');
end

end