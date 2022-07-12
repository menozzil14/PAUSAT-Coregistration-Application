function [averaged_volume] = average_bscans(input_volume, frames_per_pos)
%% define all mod vectors
[ax, lat, ele] = size(input_volume);
averaged_volume = zeros(ax, lat, ele / frames_per_pos);
for i=1:frames_per_pos:ele - frames_per_pos + 1
    indx = (i + frames_per_pos - 1)/frames_per_pos;
    averaged_volume(:, :, indx) = mean(input_volume(:, :, i:i + frames_per_pos - 1), 3);
end