function encodedMessage = huffmanEncoder3(messageArray)

huffmanTable = containers.Map({'1', '2', '3', '4', '5'}, {'00', '110', '111', '01', '10'});
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