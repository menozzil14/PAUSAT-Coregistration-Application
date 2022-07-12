function [processed_pa_volume] = process_pa_volumes(pa_volume, sigma, z_score)

processed_pa_volume = zeros(size(pa_volume));
for frame = 1:size(pa_volume, 3)
    pa_image = pa_volume(:, :, frame);
    
    % convert to logscale to increase contrast
%     pa_image = abs(log(double(pa_image)));
%     pa_image(pa_image == Inf) = min(pa_image, [], 'all');
    
    % lowpass filter the logscale image
    pa_image = imgaussfilt(pa_image, sigma);
    
    % remove the background and normalize
    pa_image = remove_background(pa_image, z_score);

    % save image
    processed_pa_volume(:, :, frame) = pa_image;
end

end