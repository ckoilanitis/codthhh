function encodedMessage = huffmanEncoder(messageArray)

huffmanTable = containers.Map({'1', '2', '3', '4'}, {'0', '10', '110', '111'});
encodedMessage = '';


for i = 1:length(messageArray)

    messageStr = num2str(messageArray(i));

    for j = 1:length(messageStr)
        
        if isKey(huffmanTable, messageStr(j))
            encodedMessage = [encodedMessage, huffmanTable(messageStr(j))];
        end

    end
    
end

end