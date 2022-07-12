function [shifted_volume] = shift3d(volume, shift_vector, shift_amount)
    % shift_vector = [1 0 0], [0 1 0], or [0 0 1]. Determines which
    % dimension shift occurs in. shift_amount is the number of pixels to
    % shift. If the shift amount is negative, the shift will be backwards
    if shift_amount < 0
        bool = 1;
    else
        bool = 0;
    end
    
    shift_amount = abs(shift_amount);
    shifted_volume = zeros(size(volume));
    if shift_vector(1)
        if bool
            shifted_volume(shift_amount+1:end, :, :) = volume(1:end-shift_amount, :, :); 
        else
            shifted_volume(1:end-shift_amount, :, :) = volume(shift_amount+1:end, :, :);
        end

    elseif shift_vector(2)
        if bool
            shifted_volume(:, shift_amount+1:end, :) = volume(:, 1:end-shift_amount, :); 
        else
            shifted_volume(:, 1:end-shift_amount, :) = volume(:, shift_amount+1:end, :); 
        end

    else
        if bool
            shifted_volume(:, :, shift_amount+1:end) = volume(:, :, 1:end-shift_amount); 
        else
            shifted_volume(:, :, 1:end-shift_amount) = volume(:, :, shift_amount+1:end); 
        end
    end
end