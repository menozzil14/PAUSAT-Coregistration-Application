function [cleaned_volume] = remove_background(data_volume, z_score)
%% Remove the background from an image volume
% Assume [axial lateral elevational] data volume. Loop through the
% elevational direction and remove background from each image
data_volume = double(data_volume);
cleaned_volume = zeros(size(data_volume));
for i = 1:1:size(data_volume, 3)
    img = data_volume(:, :, i);
    sigma = std(img, 0, 'all');
    mu = mean(img);
    mask = img > (mu + z_score * sigma);
    cleaned_img = img .* mask;
    minimum = mask .* min(nonzeros(cleaned_img), [], 'all');
    normalized_img = (cleaned_img - minimum) / max(cleaned_img - minimum, [], 'all');
    cleaned_volume(:, :, i) = normalized_img;
end
end