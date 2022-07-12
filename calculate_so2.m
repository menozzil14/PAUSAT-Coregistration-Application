function [so2_mat_3D] = calculate_so2(input_volume_wav1, input_volume_wav2, epsilon_mat, threshold_zscore, gauss_blur_flag, blur_sigma)
%% define molar absorption matrix

molar_absorption_matrix = epsilon_mat;
so2_mat_3D = zeros(size(input_volume_wav1));

%% loop through frames and calculate so2 via matrix multiplication
for i = 1:1:size(input_volume_wav1, 3)
    mu1 = input_volume_wav1(:, :, i);
    mu2 = input_volume_wav2(:, :, i);
    if gauss_blur_flag
        mu1 = imgaussfilt(mu1, blur_sigma);
        mu2 = imgaussfilt(mu2, blur_sigma);
    end
    threshold_mu1 = mean(mu1, 'all') + (threshold_zscore * std(mu1, 0, 'all'));
    threshold_mu2 = mean(mu2, 'all') + (threshold_zscore * std(mu2, 0, 'all'));
    
    mu1_log = abs(log(mu1));
    mu2_log = abs(log(mu2));
    threshold_mu1_log = mean(mu1_log, 'all') + (threshold_zscore * std(mu1_log, 0, 'all'));
    threshold_mu2_log = mean(mu2_log, 'all') + (threshold_zscore * std(mu2_log, 0, 'all'));
    
    % do matrix multiplication for fastest result. This is equivalent to
    % solving a matrix equation of the form...
    % [n x 2] = [n x 2]*[2 x 2]
    % where n is the total number of pixels in each image.
    mu_vector = [reshape(mu1, [numel(mu1), 1]), reshape(mu2, [numel(mu1), 1])];
    concentrations = mu_vector / molar_absorption_matrix;
    Cox = concentrations(:, 1);
    Cdeox = concentrations(:, 2);
    so2 = (Cox ./ (Cox + Cdeox)) * 100;
    so2_mat_2D = reshape(so2, size(mu1));
    
    % threshold and mask the result
    so2_mat_2D = (so2_mat_2D >= -20) .* (so2_mat_2D <= 150) .* so2_mat_2D;
    mask = (mu1 > threshold_mu1) & (mu2 > threshold_mu2);
    so2_mat_2D = so2_mat_2D .* mask;
    so2_mat_2D = 100 * rescale(so2_mat_2D);
    so2_mat_3D(:, :, i) = so2_mat_2D;
end