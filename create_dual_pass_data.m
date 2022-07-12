%% This program is made to facilitate the combining of dual-pass AA data

%% define flag
aa_c_scan = 0;   % this is for creating dual-pass data from multiple c-scans which must first be combined

%% load the AA volumes
aa_directory = uigetdir('C:\');
sub_directories = dir(aa_directory);
found_first = 0;
if ~aa_c_scan
    for i = 3:length(sub_directories)
        dir_name = sub_directories(i).name;
        if ~found_first && dir_name(1) == 'A'
            file_path = fullfile(aa_directory, dir_name, 'FusedVolume.mha');
            info = mha_read_header(file_path);
            aa_vol_1 = mha_read_volume(info);
            found_first = 1;
        elseif found_first && dir_name(1) == 'A'
            file_path = fullfile(aa_directory, dir_name, 'FusedVolume.mha');
            info = mha_read_header(file_path);
            aa_vol_2 = mha_read_volume(info);
        end
    end
else
    for i = 3:length(sub_directories)
        dir_name = sub_directories(i).name;
        if dir_name(1) == 'd'
            c_scans_dir = fullfile(aa_directory, dir_name);
            [aa_vol_1, ~] = combine_aa_c_scans(c_scans_dir);
        end
        if dir_name(1) == 's'
            c_scans_dir = fullfile(aa_directory, dir_name);
            [aa_vol_2, ~] = combine_aa_c_scans(c_scans_dir);
        end
    end
end

%% rotate the AA volumes to match PA orientation
aa_vol_1 = imrotate3(aa_vol_1, 90, [0 0 1]);
aa_vol_2 = imrotate3(aa_vol_2, 90, [0 0 1]);

%% show topview of both AA volumes and determine the forward shift
topview_1 = imrotate(squeeze(max(aa_vol_1, [], 1)), 90);
figure, imagesc(topview_1), title('AA Volume 1')
topview_2 = imrotate(squeeze(max(aa_vol_2, [], 1)), 90);
figure, imagesc(topview_2), title('AA Volume 2')

backward_shift = input('Backward Shift: ');

%% show the coronal view and determine the lateral and axial shifts
figure, imagesc(aa_vol_1(:, :, 50));
figure, imagesc(aa_vol_2(:, :, 50 + backward_shift));

left_shift = input('Left Shift: ');
up_shift = input('Up Shift: ');

%% apply the determined shifts
shifted_vol = shift3d(aa_vol_1, [0 0 1], backward_shift);
shifted_vol = shift3d(shifted_vol, [0 1 0], left_shift);
shifted_vol = shift3d(shifted_vol, [1 0 0], up_shift);

% create the combined volume
AA_volume = max(double(aa_vol_2), shifted_vol);

% define the scan parameters
scan_parameters.frames_averaged_per_position = 10;
scan_parameters.scan_length_mm = 20;
scan_parameters.pixel_dimensions_mm = [0.0606, 0.0563, 0.2000];
aa_volume_axes = {'axial', 'lateral', 'scanning'};
scan_step_mm = 0.2000;

% show the topview and coronal view of the resulting volume
topview_final = imrotate(squeeze(max(AA_volume, [], 1)), 90);
figure, imagesc(topview_final), title('Combined AA Volume Topview')

figure, imagesc(AA_volume(:, :, 50)), title('Combined AA Volume Coronal')

decision = input('Is this correct? ');
if ~decision
    return
end

%% save the data
file_name = [aa_directory, '\dual_pass_data'];
save(file_name, 'AA_volume', 'aa_vol_1', 'aa_vol_2', 'scan_parameters')