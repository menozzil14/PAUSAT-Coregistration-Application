function [registered_volume] = register_shifted_volumes(fixed_vol, moving_vol)
registered_volume = zeros(size(fixed_vol));
for frame = 1:1:size(fixed_vol, 3)
    fprintf(['registering frame ' num2str(frame) ' of ' num2str(size(fixed_vol, 3)) '...\n'])
    fixed_image = fixed_vol(:, :, frame);
    moving_image = moving_vol(:, :, frame);
    [optimizer, metric] = imregconfig('multimodal');
    % can tune the parameters to your specification
    % optimizer.InitialRadius = 0.009;
    % optimizer.Epsilon = 1.5e-4;
    % optimizer.GrowthFactor = 1.01;
    % optimizer.MaximumIterations = 300;
    tform = imregtform(moving_image, fixed_image, 'affine', optimizer, metric);
    registered_image = imwarp(moving_image, tform,'OutputView',imref2d(size(fixed_image)));
    registered_volume(:, :, frame) = registered_image;
    fprintf(['frame ' num2str(frame) ' registered.\n\n'])
end