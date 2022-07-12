function [final_pa, final_us, axial_scale, lateral_scale, elevational_scale] = coregister(pa_path, us_path, scan_step, pulse_per_pos, comp_fact, dual_pass, c_scan)
us_path = us_path{1};
pa_path = pa_path{1};
%% Process and Segment US and PA Images
%% Define Flags
show_full_images = true;
ax_region = [21.5, 23.5];
lat_region = [11, 21.25];
ele_region = [4, 20];

compress_us = true;
compression_factor = comp_fact;

%% Load Data
if ~dual_pass && ~c_scan
    fprintf('Loading US Data... \n')
    info = mha_read_header([us_path, '\FusedVolume.mha']);
    V = mha_read_volume(info);
    us_pixel_dims = info.PixelDimensions;
    us_depth_offset = 7.2;   % base the depth on the PA image
    us_V = V;
    fprintf('US Data Loaded. \n\n')
elseif dual_pass && ~c_scan
    fprintf('Loading US Data... \n')
    info = load(fullfile(us_path, 'dual_pass_data.mat'));
    us_depth_offset = 7.2;
    V = imrotate3(info.AA_volume, -90, [0 0 1]);
    us_V = V;
    us_pixel_dims = info.scan_parameters.pixel_dimensions_mm;
    us_pixel_dims = [us_pixel_dims(2), us_pixel_dims(1), us_pixel_dims(3)];
    fprintf('US Data Loaded. \n\n')
else
    fprintf('Loading US Data... \n')
    [V, us_pixel_dims] = combine_aa_c_scans(us_path);
    us_depth_offset = 7.2;   % base the depth on the PA image
    us_V = V;
    fprintf('US Data Loaded. \n\n')
end

% SonoVol assumes sos = 1535 m/s, we assume sos = 1330 m/s
if compress_us
    us_pixel_dims(1) = compression_factor * us_pixel_dims(1);
end

fprintf('Loading PACT Data... \n')
pa_data = load(pa_path);
pa_3D = pa_data.pa_3D;
pixel_size = 1/pa_data.ResFactor;

% average the bscans and hilbert transform the data
pa_3D = abs(hilbert(average_bscans(pa_3D, pulse_per_pos)));
       
fprintf('PACT Data Loaded. \n\n')

%% Create Common Axes
% create axes
fprintf('Creating Axes... \n')
% PA axes
[pa_axial, pa_lateral, pa_elevational] = size(pa_3D);
pa_axial_mm = pa_data.axial;
pa_lateral_mm = pa_data.lateral - pa_data.lateral(1);
pa_elevational_mm = linspace(0, pa_elevational * scan_step, pa_elevational);

% US axes
[us_lateral, us_axial, us_elevational] = size(us_V);
us_lateral_mm = linspace(0, us_lateral * us_pixel_dims(2), us_lateral);
us_axial_mm = linspace(0, us_axial * us_pixel_dims(1), us_axial) + us_depth_offset;
us_elevational_mm = linspace(0, us_elevational * us_pixel_dims(3), us_elevational);

fprintf('Axes Created. \n\n')

% determine the brain region here

if show_full_images
    axial_region = [pa_axial_mm(1), pa_axial_mm(end)];
    lateral_region = [pa_lateral_mm(1), pa_lateral_mm(end)];
    elevational_region = [pa_elevational_mm(1), pa_elevational_mm(end)];
else
    axial_region = ax_region;
    lateral_region = lat_region;
    elevational_region = ele_region;
end

%% Resize US Image to Have Same Pixel Dims as PA Image
fprintf('Resizing US Images to Fit PACT Image... \n')
% resize B scan image
scale_factor_dep_us = us_pixel_dims(1) / pixel_size;
scale_factor_lat_us = us_pixel_dims(2) / pixel_size;
scale_factor_ele_pa = scan_step / us_pixel_dims(3);   % interpolate PA instead of sampling US
resized_dimensions_us = [scale_factor_lat_us*us_lateral, scale_factor_dep_us*us_axial, us_elevational];
resized_dimensions_pa = [pa_axial, pa_lateral, pa_elevational * scale_factor_ele_pa];
resized_us_volume = imresize3(us_V, resized_dimensions_us);
pa_3D = imresize3(pa_3D, resized_dimensions_pa);

fprintf('Images Resized. \n\n')

%% Crop Both Images to Fit Smaller Image
fprintf('Cropping US Images to Fit PACT... \n')
[cut_pa, cut_us] = crop_images(pa_3D, resized_us_volume);
pa_lateral_mm = linspace(0, us_lateral_mm(end), size(cut_pa, 2)); % resize the pa_lateral_mm since now it won't fit

fprintf('Images Cropped. \n\n')

% resize the US image so it has the exact same dimensions as the PA image, and rotate it
fprintf('Cleaning up Data... \n')
cut_us = imrotate3(cut_us, 90, [0 0 1]);
cut_us = imresize3(cut_us, [size(cut_us, 1), size(cut_pa, 2), size(cut_pa, 3)]);
fprintf('Data Cleaned. \n\n')

%% Cut Relative Lateral/Axial ROIs for Both Images (axes must be aligned first)
fprintf('Creating Common Axes...\n')
% PA axial region
scaling_factor = size(cut_pa, 1) / length(pa_axial_mm);
axial_range = cut_regions(axial_region, pa_axial_mm, scaling_factor);

% PA lateral region
scaling_factor = size(cut_pa, 2) / length(pa_lateral_mm);
lateral_range = cut_regions(lateral_region, pa_lateral_mm, scaling_factor);

% PA elevational region

scaling_factor = size(cut_pa, 3) / length(pa_elevational_mm);
elevational_range = cut_regions(elevational_region, pa_elevational_mm, scaling_factor);

% Final PA volume
final_pa = cut_pa(axial_range, lateral_range, elevational_range);

% US axial region
scaling_factor = size(cut_us, 1) / length(us_axial_mm);
axial_range = cut_regions(axial_region, us_axial_mm, scaling_factor);

% US lateral region
scaling_factor = size(cut_us, 2) / length(us_lateral_mm);
lateral_range = cut_regions(lateral_region, us_lateral_mm, scaling_factor);

% US elevational region
scaling_factor = size(cut_us, 3) / length(us_elevational_mm);
elevational_range = cut_regions(elevational_region, us_elevational_mm, scaling_factor);

% Final US volume
pre_us = cut_us(axial_range, lateral_range, elevational_range);
final_us = imresize3(pre_us, size(final_pa));

[ax, lat, ele] = size(final_us);

%% Define Common Axes
if ~show_full_images
    lateral_scale = linspace(lateral_region(1), lateral_region(end), size(final_pa, 2));
    axial_scale = linspace(axial_region(1), axial_region(2), size(final_pa, 1));
    elevational_scale = linspace(20 - ele_region(2), 20 - ele_region(1), size(final_pa, 3));
    
else
    lateral_scale = linspace(max(pa_lateral_mm(1), us_lateral_mm(1)), min(pa_lateral_mm(end), us_lateral_mm(end)), lat);
    axial_scale = linspace(max(pa_axial_mm(1), us_axial_mm(1)), min(pa_axial_mm(end), us_axial_mm(end)), ax);
    elevational_scale = linspace(max(pa_elevational_mm(1), us_elevational_mm(1)), min(pa_elevational_mm(end), us_elevational_mm(end)), ele);
end

fprintf('Axes Created.\n\n')

%% Clear Non-Relevant Variables
clearvars -except final_pa final_us lateral_scale axial_scale elevational_scale pa_wave_798 pa_wave_756 pa_wave_1064 pa_wave_532 final_pa_log bs_vol_1 bs_vol_2 aa_vol_1 aa_vol_2

%% Create Backgroundless Volumes
% removed_back_pa = remove_background(final_pa, 1);
% removed_back_us = remove_background(final_us, 1);

%% command to open image segmenter
% imageSegmenter

%% Define Functions
function [cut_pa, cut_us] = crop_images(pa_3D, us_image)
    pa_lateral = size(pa_3D, 2);
    pa_elevational = size(pa_3D, 3);
    if(pa_lateral > size(us_image, 1))
        midpoint_pa = round(pa_lateral / 2);
        midpoint_us = round(size(us_image, 1) / 2);
        cut_pa = pa_3D(:, midpoint_pa - midpoint_us:midpoint_pa + midpoint_us, :);
        cut_us = us_image;
    else
        midpoint_pa = round(pa_lateral / 2);
        midpoint_us = round(size(us_image, 1) / 2);
        cut_us = us_image(midpoint_us - midpoint_pa:midpoint_pa + midpoint_us, :, :);
        cut_pa = pa_3D;
    end

    % next along elevational dimension
    if(pa_elevational > size(us_image, 3))
        length_us = size(us_image, 3);
        distance = pa_elevational - length_us;
        cut_pa = cut_pa(:, :, 1:end - distance);
    else
        length_us = size(us_image, 3);
        distance = length_us - pa_elevational;
        cut_us = cut_us(:, :, 1:end - distance);
    end
end

function [final_range] = cut_regions(desired_region, current_axis, scaling_factor)
    start_diff_vec = abs(desired_region(1) - current_axis);
    end_diff_vec = abs(desired_region(2) - current_axis);
    min_start = min(start_diff_vec);
    min_end = min(end_diff_vec);
    region_start = round(scaling_factor * find(min_start == start_diff_vec));
    region_end = round(scaling_factor * find(min_end == end_diff_vec));
    final_range = region_start:1:region_end;
end
end