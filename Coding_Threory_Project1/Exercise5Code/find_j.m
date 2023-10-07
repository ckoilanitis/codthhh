function j = find_j(FX, L, Lx, Dx)
    value = ((L - Lx) / Dx);
    
    if FX(1) <= value && value < FX(2)
        j = 0;
    elseif FX(2) <= value && value < FX(3)
        j = 1;
    end
end