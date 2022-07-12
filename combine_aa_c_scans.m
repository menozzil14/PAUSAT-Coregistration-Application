function [combined_aa, us_pixel_dims] = combine_aa_c_scans(image_directory)
% takes an input directory with aa c-scan subdirectories and outputs the
% average of all the c-scans
sub_directories = dir(image_directory);
filename = 'FusedVolume.mha';
for i=3:length(sub_directories)
    directory = sub_directories(i).name;
    file_path = fullfile(image_directory, directory, filename);
    info = mha_read_header(file_path);
    aa_c_scan = mha_read_volume(info);
    if i == 3
        combined_aa = zeros(size(aa_c_scan));
        us_pixel_dims = info.PixelDimensions;
    end
%     combined_aa = max(combined_aa, double(aa_c_scan));
    combined_aa = combined_aa + double(aa_c_scan);

%     lateral = linspace(0, size(aa_c_scan, 1) * us_pixel_dims(2), size(aa_c_scan, 1));
%     axial = linspace(0, size(aa_c_scan, 2) * us_pixel_dims(1), size(aa_c_scan, 2));
%     img = imrotate(combined_aa(:, :, round(size(combined_aa, 3) / 2)), 90);
%     figure, imagesc(lateral, axial, img);
%     title(['Combining ', num2str(i-2), ' c-scans']);
%     pause(1)

end
combined_aa = combined_aa ./ (i - 2);
end
