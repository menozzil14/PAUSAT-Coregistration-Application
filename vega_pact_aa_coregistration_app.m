classdef vega_pact_aa_coregistration_app < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        Home                            matlab.ui.container.Tab
        c_scan_bool                     matlab.ui.control.CheckBox
        flip_all                        matlab.ui.control.CheckBox
        dual_pass                       matlab.ui.control.CheckBox
        comp_fact                       matlab.ui.control.NumericEditField
        ScanStepSizeLabel_2             matlab.ui.control.Label
        scan_step                       matlab.ui.control.NumericEditField
        ScanStepSizeLabel               matlab.ui.control.Label
        fpp                             matlab.ui.control.NumericEditField
        FramesperPositionLabel          matlab.ui.control.Label
        so2_colormap                    matlab.ui.control.EditField
        sO2ColormapEditFieldLabel       matlab.ui.control.Label
        aa_colormap                     matlab.ui.control.EditField
        AAColormapEditFieldLabel        matlab.ui.control.Label
        pa_colormap                     matlab.ui.control.EditField
        PAColormapEditFieldLabel        matlab.ui.control.Label
        home_map_knob                   matlab.ui.control.Knob
        MAPsizeKnobLabel_2              matlab.ui.control.Label
        CoregisterButton                matlab.ui.control.Button
        home_frame                      matlab.ui.control.Slider
        FrameSliderLabel                matlab.ui.control.Label
        home_overlay                    matlab.ui.control.UIAxes
        home_pa_coronal                 matlab.ui.control.UIAxes
        home_aa_coronal                 matlab.ui.control.UIAxes
        home_aa_topview                 matlab.ui.control.UIAxes
        AA                              matlab.ui.container.Tab
        aa_island_size                  matlab.ui.control.NumericEditField
        aa_zscoreLabel_2                matlab.ui.control.Label
        aa_remove_islands               matlab.ui.control.CheckBox
        aa_sigma                        matlab.ui.control.NumericEditField
        BlurFactorEditFieldLabel_3      matlab.ui.control.Label
        aa_zscore                       matlab.ui.control.NumericEditField
        aa_zscoreLabel                  matlab.ui.control.Label
        remove_background               matlab.ui.control.CheckBox
        aa_export_data                  matlab.ui.control.Button
        aa_frame                        matlab.ui.control.Slider
        FrameSlider_3Label_3            matlab.ui.control.Label
        aa_reset                        matlab.ui.control.Button
        aa_dir                          matlab.ui.control.TextArea
        aa_dir_but                      matlab.ui.control.Button
        aa_scan_shift                   matlab.ui.control.Button
        aa_ax_shift                     matlab.ui.control.Button
        aa_lat_shift                    matlab.ui.control.Button
        aa_scanning_shift               matlab.ui.control.Slider
        ScanningShiftmmSlider_2Label    matlab.ui.control.Label
        aa_axial_shift                  matlab.ui.control.Slider
        AxialShiftmmSlider_2Label       matlab.ui.control.Label
        aa_lateral_shift                matlab.ui.control.Slider
        LateralShiftmmSlider_2Label     matlab.ui.control.Label
        aa_map_knob                     matlab.ui.control.Knob
        MAPsizeKnob_2Label_2            matlab.ui.control.Label
        aa_coronal                      matlab.ui.control.UIAxes
        aa_topview                      matlab.ui.control.UIAxes
        PA                              matlab.ui.container.Tab
        LogscaleCheckBox                matlab.ui.control.CheckBox
        pa_reset                        matlab.ui.control.Button
        pa_export_data                  matlab.ui.control.Button
        pa_process                      matlab.ui.control.CheckBox
        pa_sigma                        matlab.ui.control.NumericEditField
        BlurFactorEditFieldLabel        matlab.ui.control.Label
        pa_zscore                       matlab.ui.control.NumericEditField
        BackgroundFactorEditFieldLabel  matlab.ui.control.Label
        pa_scan_shift                   matlab.ui.control.Button
        pa_ax_shift                     matlab.ui.control.Button
        pa_lat_shift                    matlab.ui.control.Button
        pa_scanning_shift               matlab.ui.control.Slider
        ScanningShiftmmSliderLabel      matlab.ui.control.Label
        pa_axial_shift                  matlab.ui.control.Slider
        AxialShiftmmSliderLabel         matlab.ui.control.Label
        pa_lateral_shift                matlab.ui.control.Slider
        LateralShiftmmSliderLabel       matlab.ui.control.Label
        pa_map_knob                     matlab.ui.control.Knob
        MAPsizeKnob_2Label              matlab.ui.control.Label
        pa_dir                          matlab.ui.control.TextArea
        pa_dir_but                      matlab.ui.control.Button
        pa_frame                        matlab.ui.control.Slider
        FrameSlider_3Label              matlab.ui.control.Label
        pa_coronal                      matlab.ui.control.UIAxes
        pa_topview                      matlab.ui.control.UIAxes
        Overlay                         matlab.ui.container.Tab
        overlay_export_data             matlab.ui.control.Button
        overlay_map_knob                matlab.ui.control.Knob
        MAPsizeKnob_2Label_3            matlab.ui.control.Label
        overlay_frame                   matlab.ui.control.Slider
        FrameSlider_3Label_2            matlab.ui.control.Label
        overlay_coronal                 matlab.ui.control.UIAxes
        overlay_topview                 matlab.ui.control.UIAxes
        sO2Tab                          matlab.ui.container.Tab
        ShowColorbarCheckBox            matlab.ui.control.CheckBox
        so2_reset                       matlab.ui.control.Button
        so2_scan_shift                  matlab.ui.control.Button
        so2_ax_shift                    matlab.ui.control.Button
        so2_lat_shift                   matlab.ui.control.Button
        so2_scanning_shift              matlab.ui.control.Slider
        ScanningShiftmmSliderLabel_2    matlab.ui.control.Label
        so2_axial_shift                 matlab.ui.control.Slider
        AxialShiftmmSliderLabel_2       matlab.ui.control.Label
        so2_lateral_shift               matlab.ui.control.Slider
        LateralShiftmmSlider_2Label_2   matlab.ui.control.Label
        CalculatesO2Button              matlab.ui.control.Button
        so2_export_data                 matlab.ui.control.Button
        so2_sigma                       matlab.ui.control.NumericEditField
        BlurFactorEditFieldLabel_2      matlab.ui.control.Label
        so2_zscore                      matlab.ui.control.NumericEditField
        BackgroundFactorEditFieldLabel_2  matlab.ui.control.Label
        so2_map_knob                    matlab.ui.control.Knob
        MAPsizeKnob_2Label_4            matlab.ui.control.Label
        so2_frame                       matlab.ui.control.Slider
        FrameSlider_3Label_4            matlab.ui.control.Label
        pa_wave_2                       matlab.ui.control.NumericEditField
        PAWavelength2nmEditFieldLabel   matlab.ui.control.Label
        pa_wave_1                       matlab.ui.control.NumericEditField
        PAWavelength1nmEditFieldLabel   matlab.ui.control.Label
        pa_dir_2                        matlab.ui.control.TextArea
        pa_dir_but_2                    matlab.ui.control.Button
        so2_coronal                     matlab.ui.control.UIAxes
        so2_aa_coronal                  matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        final_pa = NaN
        pa_vol_1 = NaN
        pa_vol_2 = NaN
        og_pa = NaN
        og_us = NaN
        og_so2 = NaN
        epsilon_matrix = NaN
        final_us = NaN
        overlay = NaN
        overlay_top = NaN
        so2 = NaN
        as = NaN
        ls = NaN
        es = NaN
        topview_aa = NaN
        topview_pa = NaN
        line_x = NaN
        line1_y = NaN
        line2_y = NaN
        line1 = NaN
        line2 = NaN
        line3 = NaN
        line4 = NaN
        line5 = NaN
        line6 = NaN
        line7 = NaN
        line8 = NaN
        parent_directory = pwd;
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: pa_dir_but
        function pa_dir_butPushed(app, event)
            [file, path] = uigetfile('C:\');
            figure(app.UIFigure);
            pa_directory = fullfile(path, file);
            app.pa_dir.Value = pa_directory;
            app.fpp.Value = 1;
            app.scan_step.Value = 0.4;
            app.comp_fact.Value = 0.8664;
        end

        % Button pushed function: aa_dir_but
        function SelectAADirectoryButtonPushed(app, event)
            aa_directory = uigetdir('C:\');
            figure(app.UIFigure);
            app.aa_dir.Value = aa_directory;
        end

        % Button pushed function: CoregisterButton
        function CoregisterButtonPushed(app, event)
            try
                [app.final_pa, app.final_us, app.as, app.ls, app.es] = coregister(app.pa_dir.Value, app.aa_dir.Value, app.scan_step.Value, app.fpp.Value, app.comp_fact.Value, app.dual_pass.Value, app.c_scan_bool.Value);
                if app.flip_all.Value
                    app.final_pa = flip(app.final_pa, 2);
                    app.final_us = flip(app.final_us, 2);
                end
            catch
                fprintf('The frames per position and/or scan step are likely incorrect.\n')
                return
            end
            app.aa_island_size.Value = 10;
            app.og_pa = app.final_pa;
            app.og_us = app.final_us;
            app.aa_map_knob.Limits = [0 20];
            app.pa_map_knob.Limits = [0 20];
            app.home_map_knob.Limits = [0 20];
            app.overlay_map_knob.Limits = [0 20];
            app.so2_map_knob.Limits = [0, 20];
            chunk = app.aa_map_knob.Value;
            app.home_frame.Limits = [1, size(app.final_pa, 3)-chunk];
            app.aa_frame.Limits = [1, size(app.final_us, 3)-chunk];
            app.pa_frame.Limits = [1, size(app.final_pa, 3)-chunk];
            app.overlay_frame.Limits = [1, size(app.final_pa, 3)-chunk];
            app.so2_frame.Limits = [1, size(app.final_pa, 3)-chunk];
            app.pa_sigma.Value = 0;
            app.pa_zscore.Value = 0;
            app.pa_lateral_shift.Limits = [-2, 2];
            app.pa_lateral_shift.Value = 0;
            app.pa_axial_shift.Limits = [-2, 2];
            app.pa_axial_shift.Value = 0;
            app.pa_scanning_shift.Limits = [-2, 2];
            app.pa_scanning_shift.Value = 0;
            app.aa_lateral_shift.Limits = [-2, 2];
            app.aa_lateral_shift.Value = 0;
            app.aa_axial_shift.Limits = [-2, 2];
            app.aa_axial_shift.Value = 0;
            app.aa_scanning_shift.Limits = [-2, 2];
            app.so2_scanning_shift.Value = 0;
            app.so2_lateral_shift.Limits = [-2, 2];
            app.so2_lateral_shift.Value = 0;
            app.so2_axial_shift.Limits = [-2, 2];
            app.so2_axial_shift.Value = 0;
            app.so2_scanning_shift.Limits = [-2, 2];
            app.so2_scanning_shift.Value = 0;
            app.topview_aa = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            app.topview_pa = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
            
            % define colormaps
            app.pa_colormap.Value = 'hot';
            app.aa_colormap.Value = 'gray';
            app.so2_colormap.Value = 'jet';
            
            % define lines
            app.line_x = [app.ls(end), app.ls(1)];
            app.line1_y = [app.es(end), app.es(end)];
            app.line2_y = [app.es(end), app.es(end)];
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            app.line1 = line(app.home_aa_topview, x, y, 'LineWidth', 1);
            app.line2 = line(app.home_aa_topview, x, y_2, 'LineWidth', 1);
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
            app.line7 = line(app.overlay_topview, x, y, 'LineWidth', 1);
            app.line8 = line(app.overlay_topview, x, y_2, 'LineWidth', 1);
            
            % define image axes limits
            % home tab
            app.home_aa_topview.XLim = [app.ls(1), app.ls(end)];
            app.home_aa_topview.YLim = [app.es(1), app.es(end)];
            app.home_aa_coronal.XLim = [app.ls(1), app.ls(end)];
            app.home_aa_coronal.YLim = [app.as(1), app.as(end)];
            app.home_pa_coronal.XLim = [app.ls(1), app.ls(end)];
            app.home_pa_coronal.YLim = [app.as(1), app.as(end)];
            app.home_overlay.XLim = [app.ls(1), app.ls(end)];
            app.home_overlay.YLim = [app.as(1), app.as(end)];

            % AA tab
            app.aa_topview.XLim = [app.ls(1), app.ls(end)];
            app.aa_topview.YLim = [app.es(1), app.es(end)];
            app.aa_coronal.XLim = [app.ls(1), app.ls(end)];
            app.aa_coronal.YLim = [app.as(1), app.as(end)];
            % PA tab
            app.pa_topview.XLim = [app.ls(1), app.ls(end)];
            app.pa_topview.YLim = [app.es(1), app.es(end)];
            app.pa_coronal.XLim = [app.ls(1), app.ls(end)];
            app.pa_coronal.YLim = [app.as(1), app.as(end)];
            % overlay tab
            app.overlay_topview.XLim = [app.ls(1), app.ls(end)];
            app.overlay_topview.YLim = [app.es(1), app.es(end)];
            app.overlay_coronal.XLim = [app.ls(1), app.ls(end)];
            app.overlay_coronal.YLim = [app.as(1), app.as(end)];
            % sO2 tab
            app.so2_aa_coronal.XLim = [app.ls(1), app.ls(end)];
            app.so2_aa_coronal.YLim = [app.as(1), app.as(end)];
            app.so2_coronal.XLim = [app.ls(1), app.ls(end)];
            app.so2_coronal.YLim = [app.as(1), app.as(end)];

            
            % create coronal images
            us_img = squeeze(max(app.final_us(:, :, app.home_frame.Value:app.home_frame.Value+chunk), [], 3));
            pa_img = median(app.final_pa(:, :, app.home_frame.Value:app.home_frame.Value+chunk), 3);
            app.overlay = imfuse(us_img, pa_img);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            
            % show home tab images
            imagesc(app.ls, app.es, app.topview_aa, 'Parent', app.home_aa_topview), app.home_aa_topview.DataAspectRatio = [1 1 1];
            colormap(app.home_aa_topview, 'gray')
            imagesc(app.ls, app.as, us_img, 'Parent', app.home_aa_coronal), app.home_aa_coronal.DataAspectRatio = [1 1 1];
            colormap(app.home_aa_coronal, 'gray')
            imagesc(app.ls, app.as, pa_img, 'Parent', app.home_pa_coronal), app.home_pa_coronal.DataAspectRatio = [1 1 1];
            colormap(app.home_pa_coronal, 'hot')
            imagesc(app.ls, app.as, app.overlay, 'Parent', app.home_overlay), app.home_overlay.DataAspectRatio = [1 1 1];
            colormap(app.home_overlay, 'gray')

            % show aa tab images
            imagesc(app.ls, app.es, app.topview_aa, 'Parent', app.aa_topview), app.aa_topview.DataAspectRatio = [1 1 1];
            colormap(app.aa_topview, 'gray')
            imagesc(app.ls, app.as, us_img, 'Parent', app.aa_coronal), app.aa_coronal.DataAspectRatio = [1 1 1];
            colormap(app.aa_coronal, 'gray')

            % show pa tab images
            imagesc(app.ls, app.es, app.topview_pa, 'Parent', app.pa_topview), app.pa_topview.DataAspectRatio = [1 1 1];
            colormap(app.pa_topview, 'hot')
            imagesc(app.ls, app.as, pa_img, 'Parent', app.pa_coronal), app.pa_coronal.DataAspectRatio = [1 1 1];
            colormap(app.pa_coronal, 'hot')

            % show overlay tabs
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview), app.overlay_topview.DataAspectRatio = [1 1 1];
            colormap(app.overlay_topview, 'gray')
            imagesc(app.ls, app.as, app.overlay, 'Parent', app.overlay_coronal), app.overlay_coronal.DataAspectRatio = [1 1 1];
            colormap(app.overlay_coronal, 'gray')

            % app.home_pa_coronal.ImageSource = mat2gray(final_pa(:, :, 1));
        end

        % Value changing function: home_frame
        function home_frameValueChanging(app, event)
            % update home tab images
            changingValue = event.Value;
            app.home_frame.Value = changingValue;
            chunk = app.home_map_knob.Value;
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(changingValue*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.home_map_knob.Value * (app.es(2) - app.es(1)));
            delete(app.line1)
            delete(app.line2)
            app.line1 = line(app.home_aa_topview, app.line_x, app.line1_y, 'LineWidth', 1);
            app.line2 = line(app.home_aa_topview, app.line_x, app.line2_y, 'LineWidth', 1);
            
            % define coronal images
            us_img = squeeze(max(app.final_us(:, :, round(app.home_frame.Value):round(app.home_frame.Value)+chunk), [], 3));
            pa_img = median(app.final_pa(:, :, round(app.home_frame.Value):round(app.home_frame.Value)+chunk), 3);
            app.overlay = imfuse(us_img, pa_img);
            
            % plot images
            imagesc(app.ls, app.as, us_img, 'Parent', app.home_aa_coronal);
            imagesc(app.ls, app.as, pa_img, 'Parent', app.home_pa_coronal);
            imagesc(app.ls, app.as, app.overlay, 'Parent', app.home_overlay);
        end

        % Value changing function: aa_frame
        function aa_frameValueChanging(app, event)
            % update aa tab images
            changingValue = event.Value;
            app.aa_frame.Value = changingValue;
            chunk = app.aa_map_knob.Value;
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(changingValue*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (chunk * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
            
            % define coronal image
            us_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            
            imagesc(app.ls, app.as, us_img, 'Parent', app.aa_coronal);
        end

        % Value changing function: pa_frame
        function pa_frameValueChanging(app, event)
            changingValue = event.Value;
            app.pa_frame.Value = changingValue;
            chunk = app.pa_map_knob.Value;
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(changingValue*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
            
            % define coronal image
            pa_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
            
            imagesc(app.ls, app.as, pa_img, 'Parent', app.pa_coronal);
        end

        % Value changing function: pa_map_knob
        function pa_map_knobValueChanging(app, event)
            changingValue = event.Value;
            app.pa_map_knob.Value = changingValue;
            app.pa_frame.Limits = [1, size(app.final_pa, 3)-changingValue];
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
        end

        % Callback function
        function pa_resetPushed(app, event)
            app.final_pa = app.og_pa;
            chunk = app.pa_map_knob.Value;
            pa_cor_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
            pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
            imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Button pushed function: pa_lat_shift
        function pa_lat_shiftPushed(app, event)
            value = app.pa_lateral_shift.Value;
            dx = app.ls(2) - app.ls(1);
            app.final_pa = shift3d(app.final_pa, [0 1 0], -round(value / dx));
            chunk = app.pa_map_knob.Value;
            pa_cor_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
            pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
            imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Button pushed function: pa_ax_shift
        function pa_ax_shiftButtonPushed(app, event)
            value = app.pa_axial_shift.Value;
            dx = app.as(2) - app.as(1);
            app.final_pa = shift3d(app.final_pa, [1 0 0], round(value / dx));
            chunk = app.pa_map_knob.Value;
            pa_cor_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
            pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
            imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Button pushed function: pa_scan_shift
        function pa_scan_shiftButtonPushed(app, event)
            value = app.pa_scanning_shift.Value;
            dx = app.es(2) - app.es(1);
            app.final_pa = shift3d(app.final_pa, [0 0 1], -round(value / dx));
            chunk = app.pa_map_knob.Value;
            pa_cor_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
            pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
            imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Button pushed function: aa_lat_shift
        function aa_lat_shiftButtonPushed(app, event)
            value = app.aa_lateral_shift.Value;
            dx = app.ls(2) - app.ls(1);
            app.final_us = shift3d(app.final_us, [0 1 0], -round(value / dx));
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (chunk * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Button pushed function: aa_ax_shift
        function aa_ax_shiftButtonPushed(app, event)
            value = app.aa_axial_shift.Value;
            dx = app.as(2) - app.as(1);
            app.final_us = shift3d(app.final_us, [1 0 0], round(value / dx));
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (chunk * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Button pushed function: aa_scan_shift
        function aa_scan_shiftButtonPushed(app, event)
            value = app.aa_scanning_shift.Value;
            dx = app.es(2) - app.es(1);
            app.final_us = shift3d(app.final_us, [0 0 1], -round(value / dx));
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (chunk * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Button pushed function: aa_reset
        function aa_resetButtonPushed(app, event)
            app.final_us = app.og_us;
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (chunk * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Value changing function: aa_map_knob
        function aa_map_knobValueChanging(app, event)
            changingValue = event.Value;
            app.aa_map_knob.Value = changingValue;
            app.aa_frame.Limits = [1, size(app.final_us, 3)-changingValue];
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.aa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changing function: home_map_knob
        function home_map_knobValueChanging(app, event)
            changingValue = event.Value;
            app.home_map_knob.Value = changingValue;
            app.home_frame.Limits = [1, size(app.final_us, 3)-changingValue];
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.home_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.home_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line1)
            delete(app.line2)
            app.line1 = line(app.home_aa_topview, x, y, 'LineWidth', 1);
            app.line2 = line(app.home_aa_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changing function: overlay_frame
        function overlay_frameValueChanging(app, event)
            changingValue = event.Value;
            app.overlay_frame.Value = changingValue;
            chunk = app.overlay_map_knob.Value;
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(changingValue*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.overlay_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line7)
            delete(app.line8)
            app.line7 = line(app.overlay_topview, x, y, 'LineWidth', 1);
            app.line8 = line(app.overlay_topview, x, y_2, 'LineWidth', 1);
            
            % define coronal image
            pa_img = squeeze(median(app.final_pa(:, :, round(app.overlay_frame.Value):round(app.overlay_frame.Value)+chunk), 3));
            us_img = squeeze(max(app.final_us(:, :, app.overlay_frame.Value:app.overlay_frame.Value+chunk), [], 3));
            overlay_img = imfuse(us_img, pa_img);
            imagesc(app.ls, app.as, overlay_img, 'Parent', app.overlay_coronal);
        end

        % Value changing function: overlay_map_knob
        function overlay_map_knobValueChanging(app, event)
            changingValue = event.Value;
            app.overlay_map_knob.Value = changingValue;
            app.overlay_frame.Limits = [1, size(app.final_us, 3)-changingValue];
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.overlay_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.overlay_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line7)
            delete(app.line8)
            app.line7 = line(app.overlay_topview, x, y, 'LineWidth', 1);
            app.line8 = line(app.overlay_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changed function: pa_process
        function pa_processValueChanged(app, event)
            value = app.pa_process.Value;
            app.final_pa = app.og_pa;
            if app.LogscaleCheckBox.Value == 1
                app.final_pa = abs(log10(app.final_pa));
                app.final_pa(app.final_pa == Inf) = min(app.final_pa, [], 'all');
            end
            
            if value == 1
                if app.pa_sigma.Value > 0
                    app.final_pa = process_pa_volumes(app.final_pa, app.pa_sigma.Value, app.pa_zscore.Value);
                else
                    app.final_pa = process_pa_volumes(app.final_pa, 0.01, app.pa_zscore.Value);
                end
            end
            % update images
            chunk = app.pa_map_knob.Value;
            pa_cor_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
            pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
            imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)

            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);

        end

        % Value changed function: pa_zscore
        function pa_zscoreValueChanged(app, event)
            value = app.pa_zscore.Value;
            if app.pa_process.Value == 1
                % update images
                app.final_pa = app.og_pa;
                if app.LogscaleCheckBox.Value == 1
                    app.final_pa = abs(log10(app.final_pa));
                    app.final_pa(app.final_pa == Inf) = min(app.final_pa, [], 'all');
                end
                if app.pa_sigma.Value > 0
                        app.final_pa = process_pa_volumes(app.final_pa, app.pa_sigma.Value, app.pa_zscore.Value);
                    else
                        app.final_pa = process_pa_volumes(app.final_pa, 0.01, app.pa_zscore.Value);
                end
                chunk = app.pa_map_knob.Value;
                pa_cor_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
                imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
                pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
                imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)
            end
            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changed function: pa_sigma
        function pa_sigmaValueChanged(app, event)
            value = app.pa_sigma.Value;
            if app.pa_process.Value == 1
                % update images
                app.final_pa = app.og_pa;
                if app.LogscaleCheckBox.Value == 1
                    app.final_pa = abs(log10(app.final_pa));
                    app.final_pa(app.final_pa == Inf) = min(app.final_pa, [], 'all');
                end
                if app.pa_sigma.Value > 0
                        app.final_pa = process_pa_volumes(app.final_pa, app.pa_sigma.Value, app.pa_zscore.Value);
                    else
                        app.final_pa = process_pa_volumes(app.final_pa, 0.01, app.pa_zscore.Value);
                end
                chunk = app.pa_map_knob.Value;
                pa_cor_img = squeeze(max(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), [], 3));
                imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
                pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
                imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)
            end
            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
        end

        % Button pushed function: pa_export_data
        function pa_export_dataButtonPushed(app, event)
            pa_directory = uigetdir('C:\', 'Save Directory...');
            figure(app.UIFigure);
            PA_volume = app.final_pa;
            lateral_axis = app.ls;
            axial_axis = app.as;
            elevation_axis = app.es;
            try
                save(fullfile(pa_directory, 'PA_data'), 'PA_volume', 'lateral_axis', 'axial_axis', 'elevation_axis')
            catch
                fprintf('You do not have write permissions in the requested save directory.');
            end
        end

        % Button pushed function: aa_export_data
        function aa_export_dataButtonPushed(app, event)
            aa_directory = uigetdir('C:\', 'Save Directory...');
            figure(app.UIFigure);
            AA_volume = app.final_us;
            lateral_axis = app.ls;
            axial_axis = app.as;
            elevation_axis = app.es;
            try
                save(fullfile(aa_directory, 'AA_data'), 'AA_volume', 'lateral_axis', 'axial_axis', 'elevation_axis')
            catch
                fprintf('You do not have write permissions in the requested save directory.');
            end
        end

        % Button pushed function: pa_dir_but_2
        function pa_dir_but_2ButtonPushed(app, event)
            [file, path] = uigetfile('C:\');
            figure(app.UIFigure);
            pa_directory = fullfile(path, file);
            app.pa_dir_2.Value = pa_directory;
            app.pa_vol_1 = app.og_pa;
            [app.pa_vol_2, ~, ~, ~, ~] = coregister(app.pa_dir_2.Value, app.aa_dir.Value, app.scan_step.Value, app.fpp.Value, app.comp_fact.Value, app.dual_pass.Value, app.c_scan_bool.Value);
            if app.flip_all.Value
                app.pa_vol_2 = flip(app.pa_vol_2, 2);
            end
        end

        % Button pushed function: CalculatesO2Button
        function CalculatesO2ButtonPushed(app, event)
            fprintf('Reading Hemoglobin Data...\n')
            lambda_array = xlsread(fullfile(app.parent_directory, 'Hemoglobin Properties.xlsx'), 'A:A');
            HbO2_array = xlsread(fullfile(app.parent_directory, 'Hemoglobin Properties.xlsx'), 'B:B');
            HbR_array = xlsread(fullfile(app.parent_directory, 'Hemoglobin Properties.xlsx'), 'C:C');
            fprintf('Hemoglobin Data Read.\n\n')
            fprintf('Calculating sO2...\n')
            wave_indx_1 = find(abs(lambda_array - app.pa_wave_1.Value) == min(abs(lambda_array - app.pa_wave_1.Value)));
            wave_indx_2 = find(abs(lambda_array - app.pa_wave_2.Value) == min(abs(lambda_array - app.pa_wave_2.Value)));
            
            app.epsilon_matrix = [HbO2_array(wave_indx_1), HbO2_array(wave_indx_2); HbR_array(wave_indx_1), HbR_array(wave_indx_2)];
            if app.so2_sigma.Value <= 0
                flag = 0;
            else
                flag = 1;
            end
            app.so2 = calculate_so2(app.pa_vol_1, app.pa_vol_2, app.epsilon_matrix, app.so2_zscore.Value, flag, app.so2_sigma.Value);
            app.og_so2 = app.so2;
            chunk = app.so2_map_knob.Value;
            so2_cor_img = squeeze(median(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), 3));
            imagesc(app.ls, app.as, so2_cor_img, 'Parent', app.so2_coronal), app.so2_coronal.DataAspectRatio = [1 1 1];
            colormap(app.so2_coronal, 'jet')
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.es, aa_cor_img, 'Parent', app.so2_aa_coronal), app.so2_aa_coronal.DataAspectRatio = [1 1 1];
            colormap(app.so2_aa_coronal, 'gray')
            fprintf('sO2 Calculated. \n\n')
        end

        % Value changing function: so2_frame
        function so2_frameValueChanging(app, event)
            changingValue = event.Value;
            app.so2_frame.Value = changingValue;
            chunk = app.so2_map_knob.Value;
           
            % define coronal image
            so2_img = squeeze(median(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), 3));
            us_img = squeeze(max(app.final_us(:, :, app.so2_frame.Value:app.so2_frame.Value+chunk), [], 3));
            imagesc(app.ls, app.as, so2_img, 'Parent', app.so2_coronal);
            imagesc(app.ls, app.as, us_img, 'Parent', app.so2_aa_coronal);
        end

        % Button pushed function: so2_export_data
        function so2_export_dataButtonPushed(app, event)
            so2_directory = uigetdir('C:\', 'Save Directory...');
            figure(app.UIFigure);
            SO2_volume = app.so2;
            lateral_axis = app.ls;
            axial_axis = app.as;
            elevation_axis = app.es;
            try
                save(fullfile(so2_directory, 'SO2_data'), 'SO2_volume', 'lateral_axis', 'axial_axis', 'elevation_axis')
            catch
                fprintf('You do not have write permissions in the requested save directory.');
            end
        end

        % Button pushed function: so2_lat_shift
        function so2_lat_shiftButtonPushed(app, event)
            value = app.so2_lateral_shift.Value;
            dx = app.ls(2) - app.ls(1);
            app.so2 = shift3d(app.so2, [0 1 0], -round(value / dx));
            chunk = app.so2_map_knob.Value;
            so2_cor_img = squeeze(max(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, so2_cor_img, 'Parent', app.so2_coronal)
        end

        % Button pushed function: so2_ax_shift
        function so2_ax_shiftButtonPushed(app, event)
            value = app.so2_axial_shift.Value;
            dx = app.as(2) - app.as(1);
            app.so2 = shift3d(app.so2, [1 0 0], -round(value / dx));
            chunk = app.so2_map_knob.Value;
            so2_cor_img = squeeze(max(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, so2_cor_img, 'Parent', app.so2_coronal)
        end

        % Button pushed function: so2_scan_shift
        function so2_scan_shiftButtonPushed(app, event)
            value = app.so2_scanning_shift.Value;
            dx = app.es(2) - app.es(1);
            app.so2 = shift3d(app.so2, [0 0 1], -round(value / dx));
            chunk = app.so2_map_knob.Value;
            so2_cor_img = squeeze(max(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, so2_cor_img, 'Parent', app.so2_coronal)
        end

        % Button pushed function: so2_reset
        function so2_resetButtonPushed(app, event)
            app.so2 = app.og_so2;
            chunk = app.so2_map_knob.Value;
            so2_cor_img = squeeze(max(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, so2_cor_img, 'Parent', app.so2_coronal)
        end

        % Value changed function: so2_zscore
        function so2_zscoreValueChanged(app, event)
            value = app.so2_zscore.Value;
            % update images
            fprintf('Recalculating sO2...\n')
            app.so2 = app.og_so2;
            if app.so2_sigma.Value > 0
                    app.so2 = calculate_so2(app.pa_vol_1, app.pa_vol_2, app.epsilon_matrix, value, 1, app.so2_sigma.Value);
                else
                    app.so2 = calculate_so2(app.pa_vol_1, app.pa_vol_2, app.epsilon_matrix, value, 0, app.so2_sigma.Value);
            end
            chunk = app.so2_map_knob.Value;
            so2_cor_img = squeeze(median(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), 3));
            imagesc(app.ls, app.as, so2_cor_img, 'Parent', app.so2_coronal)
            fprintf('sO2 Recalculated.\n\n')
        end

        % Value changed function: so2_sigma
        function so2_sigmaValueChanged(app, event)
            value = app.so2_sigma.Value;
            fprintf('Recalculating sO2...\n')
            % update images
            app.so2 = app.og_so2;
            if app.so2_sigma.Value > 0
                    app.so2 = calculate_so2(app.pa_vol_1, app.pa_vol_2, app.epsilon_matrix, app.so2_zscore.Value, 1, value);
                else
                    app.so2 = calculate_so2(app.pa_vol_1, app.pa_vol_2, app.epsilon_matrix, app.so2_zscore.Value, 0, 0.01);
            end
            chunk = app.so2_map_knob.Value;
            so2_cor_img = squeeze(median(app.so2(:, :, round(app.so2_frame.Value):round(app.so2_frame.Value)+chunk), 3));
            imagesc(app.ls, app.as, so2_cor_img, 'Parent', app.so2_coronal)
            fprintf('sO2 Recalculated.\n\n')
        end

        % Value changed function: pa_colormap
        function pa_colormapValueChanged(app, event)
            value = app.pa_colormap.Value;
            try
                colormap(app.home_pa_coronal, value);
                colormap(app.pa_coronal, value);
                colormap(app.pa_topview, value);
            catch
                fprintf('Not a valid colormap.\n')
            end
        end

        % Value changed function: aa_colormap
        function aa_colormapValueChanged(app, event)
            value = app.aa_colormap.Value;
            try
                colormap(app.home_aa_coronal, value);
                colormap(app.home_aa_topview, value);
                colormap(app.aa_coronal, value);
                colormap(app.aa_topview, value);
                colormap(app.so2_aa_coronal, value);
            catch
                fprintf('Not a valid colormap.\n')
            end
        end

        % Value changed function: so2_colormap
        function so2_colormapValueChanged(app, event)
            value = app.so2_colormap.Value;
            try
                colormap(app.so2_coronal, value);
            catch
                fprintf('Not a valid colormap.\n')
            end
        end

        % Value changed function: ShowColorbarCheckBox
        function ShowColorbarCheckBoxValueChanged(app, event)
            value = app.ShowColorbarCheckBox.Value;
            if value
                colorbar(app.so2_coronal)
            else
                colorbar(app.so2_coronal, 'off')
            end
        end

        % Value changing function: so2_map_knob
        function so2_map_knobValueChanging(app, event)
            changingValue = event.Value;
            app.overlay_map_knob.Value = changingValue;
            app.so2_frame.Limits = [1, size(app.so2, 3)-changingValue];
        end

        % Value changed function: LogscaleCheckBox
        function LogscaleCheckBoxValueChanged(app, event)
            value = app.LogscaleCheckBox.Value;
            if value == 1
                app.final_pa = abs(log10(app.final_pa));
            else
                app.final_pa = app.og_pa;
            end
            app.final_pa(app.final_pa == Inf) = min(app.final_pa, [], 'all');
            % update images
            chunk = app.pa_map_knob.Value;
            pa_cor_img = squeeze(median(app.final_pa(:, :, round(app.pa_frame.Value):round(app.pa_frame.Value)+chunk), 3));
            imagesc(app.ls, app.as, pa_cor_img, 'Parent', app.pa_coronal)
            pa_tran_img = imrotate(squeeze(max(app.final_pa, [], 1)), 90);
            imagesc(app.ls, app.es, pa_tran_img, 'Parent', app.pa_topview)
            
            % define and plot changing lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.pa_frame.Value*(length(app.es)/size(app.final_pa, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.pa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line5)
            delete(app.line6)
            app.line5 = line(app.pa_topview, x, y, 'LineWidth', 1);
            app.line6 = line(app.pa_topview, x, y_2, 'LineWidth', 1);
            app.overlay_top = imfuse(squeeze(max(app.final_us, [], 1)), squeeze(median(app.final_pa, 1)));
            app.overlay_top = imrotate(app.overlay_top, 90);
            imagesc(app.ls, app.es, app.overlay_top, 'Parent', app.overlay_topview)
        end

        % Value changed function: remove_background
        function remove_backgroundValueChanged(app, event)
            value = app.remove_background.Value;
            app.final_us = app.og_us;
            if value == 1
                if app.aa_sigma.Value > 0
                    app.final_us = process_pa_volumes(app.final_us, app.aa_sigma.Value, app.aa_zscore.Value);
                else
                    app.final_us = process_pa_volumes(app.final_us, 0.01, app.aa_zscore.Value);
                end
            end
            % update images
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)

            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.aa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changed function: aa_zscore
        function aa_zscoreValueChanged(app, event)
            value = app.aa_zscore.Value;
            app.final_us = app.og_us;
            if app.aa_sigma.Value > 0
                app.final_us = process_pa_volumes(app.final_us, app.aa_sigma.Value, app.aa_zscore.Value);
            else
                app.final_us = process_pa_volumes(app.final_us, 0.01, app.aa_zscore.Value);
            end
            % update images
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)

            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.aa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changed function: aa_sigma
        function aa_sigmaValueChanged(app, event)
            value = app.aa_sigma.Value;
            app.final_us = app.og_us;
            if app.aa_sigma.Value > 0
                app.final_us = process_pa_volumes(app.final_us, app.aa_sigma.Value, app.aa_zscore.Value);
            else
                app.final_us = process_pa_volumes(app.final_us, 0.01, app.aa_zscore.Value);
            end
            % update images
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)

            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.aa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changed function: aa_remove_islands
        function aa_remove_islandsValueChanged(app, event)
            value = app.aa_remove_islands.Value;
            app.final_us = app.og_us;
            remove_backgroundValueChanged(app, event)
            if value == 1
                fprintf('Removing Islands...\n')
                for frame = 1:size(app.final_us, 3)
                    newframe = bwareaopen(app.final_us(:, :, frame) > 0, app.aa_island_size.Value);
                    newframe = newframe .* app.final_us(:, :, frame);
                    app.final_us(:, :, frame) = newframe;
                end
                fprintf('Islands Removed.\n\n')
            end
            % update images
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)

            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.aa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
        end

        % Value changed function: aa_island_size
        function aa_island_sizeValueChanged(app, event)
            value = app.aa_island_size.Value;
            app.final_us = app.og_us;
            remove_backgroundValueChanged(app, event)
            fprintf('Removing Islands...\n')
            for frame = 1:size(app.final_us, 3)
                newframe = bwareaopen(app.final_us(:, :, frame) > 0, value);
                newframe = newframe .* app.final_us(:, :, frame);
                app.final_us(:, :, frame) = newframe;
            end
            fprintf('Islands Removed.\n\n')
            % update images
            chunk = app.aa_map_knob.Value;
            aa_cor_img = squeeze(max(app.final_us(:, :, round(app.aa_frame.Value):round(app.aa_frame.Value)+chunk), [], 3));
            imagesc(app.ls, app.as, aa_cor_img, 'Parent', app.aa_coronal)
            aa_tran_img = imrotate(squeeze(max(app.final_us, [], 1)), 90);
            imagesc(app.ls, app.es, aa_tran_img, 'Parent', app.aa_topview)

            % define and plot lines
            app.line_x = [app.ls(end), app.ls(1)];
            y_val = app.es(end-min(round(app.aa_frame.Value*(length(app.es)/size(app.final_us, 3))), length(app.es)-1));
            app.line1_y = [y_val, y_val];
            app.line2_y = app.line1_y - (app.aa_map_knob.Value * (app.es(2) - app.es(1)));
            x = app.line_x;
            y = app.line1_y;
            y_2 = app.line2_y;
            delete(app.line3)
            delete(app.line4)
            app.line3 = line(app.aa_topview, x, y, 'LineWidth', 1);
            app.line4 = line(app.aa_topview, x, y_2, 'LineWidth', 1);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1116 723];
            app.UIFigure.Name = 'Duke University Photoacoustic Imaging Lab: Vega PACT/AA Coregistration Application';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 1116 723];

            % Create Home
            app.Home = uitab(app.TabGroup);
            app.Home.Title = 'Home';

            % Create home_aa_topview
            app.home_aa_topview = uiaxes(app.Home);
            xlabel(app.home_aa_topview, 'Lateral [mm]')
            ylabel(app.home_aa_topview, 'Scanning [mm]')
            zlabel(app.home_aa_topview, 'Z')
            app.home_aa_topview.Position = [305 388 393 303];

            % Create home_aa_coronal
            app.home_aa_coronal = uiaxes(app.Home);
            xlabel(app.home_aa_coronal, 'Lateral [mm]')
            ylabel(app.home_aa_coronal, 'Axial [mm]')
            zlabel(app.home_aa_coronal, 'Z')
            app.home_aa_coronal.Position = [711 388 393 303];

            % Create home_pa_coronal
            app.home_pa_coronal = uiaxes(app.Home);
            xlabel(app.home_pa_coronal, 'Lateral [mm]')
            ylabel(app.home_pa_coronal, 'Axial [mm]')
            zlabel(app.home_pa_coronal, 'Z')
            app.home_pa_coronal.Position = [305 68 393 303];

            % Create home_overlay
            app.home_overlay = uiaxes(app.Home);
            xlabel(app.home_overlay, 'Lateral [mm]')
            ylabel(app.home_overlay, 'Axial [mm]')
            zlabel(app.home_overlay, 'Z')
            app.home_overlay.Position = [711 68 393 303];

            % Create FrameSliderLabel
            app.FrameSliderLabel = uilabel(app.Home);
            app.FrameSliderLabel.HorizontalAlignment = 'right';
            app.FrameSliderLabel.Position = [475 35 40 22];
            app.FrameSliderLabel.Text = 'Frame';

            % Create home_frame
            app.home_frame = uislider(app.Home);
            app.home_frame.ValueChangingFcn = createCallbackFcn(app, @home_frameValueChanging, true);
            app.home_frame.Position = [524 43 391 7];

            % Create CoregisterButton
            app.CoregisterButton = uibutton(app.Home, 'push');
            app.CoregisterButton.ButtonPushedFcn = createCallbackFcn(app, @CoregisterButtonPushed, true);
            app.CoregisterButton.Position = [103 296 87 33];
            app.CoregisterButton.Text = 'Coregister';

            % Create MAPsizeKnobLabel_2
            app.MAPsizeKnobLabel_2 = uilabel(app.Home);
            app.MAPsizeKnobLabel_2.HorizontalAlignment = 'center';
            app.MAPsizeKnobLabel_2.Position = [100 638 56 22];
            app.MAPsizeKnobLabel_2.Text = 'MAP size';

            % Create home_map_knob
            app.home_map_knob = uiknob(app.Home, 'continuous');
            app.home_map_knob.ValueChangingFcn = createCallbackFcn(app, @home_map_knobValueChanging, true);
            app.home_map_knob.Position = [114 598 27 27];

            % Create PAColormapEditFieldLabel
            app.PAColormapEditFieldLabel = uilabel(app.Home);
            app.PAColormapEditFieldLabel.HorizontalAlignment = 'right';
            app.PAColormapEditFieldLabel.Position = [25 245 75 22];
            app.PAColormapEditFieldLabel.Text = 'PA Colormap';

            % Create pa_colormap
            app.pa_colormap = uieditfield(app.Home, 'text');
            app.pa_colormap.ValueChangedFcn = createCallbackFcn(app, @pa_colormapValueChanged, true);
            app.pa_colormap.Position = [115 242 126 27];

            % Create AAColormapEditFieldLabel
            app.AAColormapEditFieldLabel = uilabel(app.Home);
            app.AAColormapEditFieldLabel.HorizontalAlignment = 'right';
            app.AAColormapEditFieldLabel.Position = [24 199 76 22];
            app.AAColormapEditFieldLabel.Text = 'AA Colormap';

            % Create aa_colormap
            app.aa_colormap = uieditfield(app.Home, 'text');
            app.aa_colormap.ValueChangedFcn = createCallbackFcn(app, @aa_colormapValueChanged, true);
            app.aa_colormap.Position = [115 196 126 27];

            % Create sO2ColormapEditFieldLabel
            app.sO2ColormapEditFieldLabel = uilabel(app.Home);
            app.sO2ColormapEditFieldLabel.HorizontalAlignment = 'right';
            app.sO2ColormapEditFieldLabel.Position = [17 148 83 22];
            app.sO2ColormapEditFieldLabel.Text = 'sO2 Colormap';

            % Create so2_colormap
            app.so2_colormap = uieditfield(app.Home, 'text');
            app.so2_colormap.ValueChangedFcn = createCallbackFcn(app, @so2_colormapValueChanged, true);
            app.so2_colormap.Position = [115 145 126 27];

            % Create FramesperPositionLabel
            app.FramesperPositionLabel = uilabel(app.Home);
            app.FramesperPositionLabel.HorizontalAlignment = 'right';
            app.FramesperPositionLabel.Position = [13 545 131 22];
            app.FramesperPositionLabel.Text = 'PA Frames per Position';

            % Create fpp
            app.fpp = uieditfield(app.Home, 'numeric');
            app.fpp.Position = [151 545 37 19];

            % Create ScanStepSizeLabel
            app.ScanStepSizeLabel = uilabel(app.Home);
            app.ScanStepSizeLabel.HorizontalAlignment = 'right';
            app.ScanStepSizeLabel.Position = [39 509 105 22];
            app.ScanStepSizeLabel.Text = 'PA Scan Step Size';

            % Create scan_step
            app.scan_step = uieditfield(app.Home, 'numeric');
            app.scan_step.Position = [151 509 37 19];

            % Create ScanStepSizeLabel_2
            app.ScanStepSizeLabel_2 = uilabel(app.Home);
            app.ScanStepSizeLabel_2.HorizontalAlignment = 'right';
            app.ScanStepSizeLabel_2.Position = [30 468 114 22];
            app.ScanStepSizeLabel_2.Text = 'Compression Factor';

            % Create comp_fact
            app.comp_fact = uieditfield(app.Home, 'numeric');
            app.comp_fact.Position = [151 468 37 19];

            % Create dual_pass
            app.dual_pass = uicheckbox(app.Home);
            app.dual_pass.Text = 'Dual-Pass AA Data';
            app.dual_pass.Position = [66 427 130 22];

            % Create flip_all
            app.flip_all = uicheckbox(app.Home);
            app.flip_all.Text = 'Flip All Horizontally';
            app.flip_all.Position = [66 396 130 22];

            % Create c_scan_bool
            app.c_scan_bool = uicheckbox(app.Home);
            app.c_scan_bool.Text = 'Combine AA C-Scans';
            app.c_scan_bool.Position = [66 366 137 22];

            % Create AA
            app.AA = uitab(app.TabGroup);
            app.AA.Title = 'AA';

            % Create aa_topview
            app.aa_topview = uiaxes(app.AA);
            xlabel(app.aa_topview, 'Lateral [mm]')
            ylabel(app.aa_topview, 'Scanning [mm]')
            zlabel(app.aa_topview, 'Z')
            app.aa_topview.Position = [42 117 493 394];

            % Create aa_coronal
            app.aa_coronal = uiaxes(app.AA);
            xlabel(app.aa_coronal, 'Lateral [mm]')
            ylabel(app.aa_coronal, 'Axial [mm]')
            zlabel(app.aa_coronal, 'Z')
            app.aa_coronal.Position = [558 117 493 394];

            % Create MAPsizeKnob_2Label_2
            app.MAPsizeKnob_2Label_2 = uilabel(app.AA);
            app.MAPsizeKnob_2Label_2.HorizontalAlignment = 'center';
            app.MAPsizeKnob_2Label_2.Position = [35 637 56 22];
            app.MAPsizeKnob_2Label_2.Text = 'MAP size';

            % Create aa_map_knob
            app.aa_map_knob = uiknob(app.AA, 'continuous');
            app.aa_map_knob.ValueChangingFcn = createCallbackFcn(app, @aa_map_knobValueChanging, true);
            app.aa_map_knob.Position = [50 598 27 27];

            % Create LateralShiftmmSlider_2Label
            app.LateralShiftmmSlider_2Label = uilabel(app.AA);
            app.LateralShiftmmSlider_2Label.HorizontalAlignment = 'right';
            app.LateralShiftmmSlider_2Label.Position = [119 648 100 22];
            app.LateralShiftmmSlider_2Label.Text = 'Lateral Shift [mm]';

            % Create aa_lateral_shift
            app.aa_lateral_shift = uislider(app.AA);
            app.aa_lateral_shift.Position = [240 657 248 7];

            % Create AxialShiftmmSlider_2Label
            app.AxialShiftmmSlider_2Label = uilabel(app.AA);
            app.AxialShiftmmSlider_2Label.HorizontalAlignment = 'right';
            app.AxialShiftmmSlider_2Label.Position = [130 599 89 22];
            app.AxialShiftmmSlider_2Label.Text = 'Axial Shift [mm]';

            % Create aa_axial_shift
            app.aa_axial_shift = uislider(app.AA);
            app.aa_axial_shift.Position = [240 608 248 7];

            % Create ScanningShiftmmSlider_2Label
            app.ScanningShiftmmSlider_2Label = uilabel(app.AA);
            app.ScanningShiftmmSlider_2Label.HorizontalAlignment = 'right';
            app.ScanningShiftmmSlider_2Label.Position = [106 551 113 22];
            app.ScanningShiftmmSlider_2Label.Text = 'Scanning Shift [mm]';

            % Create aa_scanning_shift
            app.aa_scanning_shift = uislider(app.AA);
            app.aa_scanning_shift.Position = [240 560 248 7];

            % Create aa_lat_shift
            app.aa_lat_shift = uibutton(app.AA, 'push');
            app.aa_lat_shift.ButtonPushedFcn = createCallbackFcn(app, @aa_lat_shiftButtonPushed, true);
            app.aa_lat_shift.Position = [535 648 63 22];
            app.aa_lat_shift.Text = 'Shift';

            % Create aa_ax_shift
            app.aa_ax_shift = uibutton(app.AA, 'push');
            app.aa_ax_shift.ButtonPushedFcn = createCallbackFcn(app, @aa_ax_shiftButtonPushed, true);
            app.aa_ax_shift.Position = [534 599 63 22];
            app.aa_ax_shift.Text = 'Shift';

            % Create aa_scan_shift
            app.aa_scan_shift = uibutton(app.AA, 'push');
            app.aa_scan_shift.ButtonPushedFcn = createCallbackFcn(app, @aa_scan_shiftButtonPushed, true);
            app.aa_scan_shift.Position = [535 552 63 22];
            app.aa_scan_shift.Text = 'Shift';

            % Create aa_dir_but
            app.aa_dir_but = uibutton(app.AA, 'push');
            app.aa_dir_but.ButtonPushedFcn = createCallbackFcn(app, @SelectAADirectoryButtonPushed, true);
            app.aa_dir_but.Position = [756 653 125 32];
            app.aa_dir_but.Text = 'Select AA Directory';

            % Create aa_dir
            app.aa_dir = uitextarea(app.AA);
            app.aa_dir.Position = [678 619 294 21];

            % Create aa_reset
            app.aa_reset = uibutton(app.AA, 'push');
            app.aa_reset.ButtonPushedFcn = createCallbackFcn(app, @aa_resetButtonPushed, true);
            app.aa_reset.Position = [749 561 135 37];
            app.aa_reset.Text = 'Reset AA Image';

            % Create FrameSlider_3Label_3
            app.FrameSlider_3Label_3 = uilabel(app.AA);
            app.FrameSlider_3Label_3.HorizontalAlignment = 'right';
            app.FrameSlider_3Label_3.Position = [305 71 40 22];
            app.FrameSlider_3Label_3.Text = 'Frame';

            % Create aa_frame
            app.aa_frame = uislider(app.AA);
            app.aa_frame.ValueChangingFcn = createCallbackFcn(app, @aa_frameValueChanging, true);
            app.aa_frame.Position = [366 80 391 7];

            % Create aa_export_data
            app.aa_export_data = uibutton(app.AA, 'push');
            app.aa_export_data.ButtonPushedFcn = createCallbackFcn(app, @aa_export_dataButtonPushed, true);
            app.aa_export_data.Position = [958 56 125 31];
            app.aa_export_data.Text = 'Export Data';

            % Create remove_background
            app.remove_background = uicheckbox(app.AA);
            app.remove_background.ValueChangedFcn = createCallbackFcn(app, @remove_backgroundValueChanged, true);
            app.remove_background.Text = 'Remove Background';
            app.remove_background.Position = [618 535 134 22];

            % Create aa_zscoreLabel
            app.aa_zscoreLabel = uilabel(app.AA);
            app.aa_zscoreLabel.HorizontalAlignment = 'right';
            app.aa_zscoreLabel.Position = [752 535 107 22];
            app.aa_zscoreLabel.Text = 'Background Factor';

            % Create aa_zscore
            app.aa_zscore = uieditfield(app.AA, 'numeric');
            app.aa_zscore.ValueChangedFcn = createCallbackFcn(app, @aa_zscoreValueChanged, true);
            app.aa_zscore.Position = [866 535 37 19];

            % Create BlurFactorEditFieldLabel_3
            app.BlurFactorEditFieldLabel_3 = uilabel(app.AA);
            app.BlurFactorEditFieldLabel_3.HorizontalAlignment = 'right';
            app.BlurFactorEditFieldLabel_3.Position = [918 535 64 22];
            app.BlurFactorEditFieldLabel_3.Text = 'Blur Factor';

            % Create aa_sigma
            app.aa_sigma = uieditfield(app.AA, 'numeric');
            app.aa_sigma.ValueChangedFcn = createCallbackFcn(app, @aa_sigmaValueChanged, true);
            app.aa_sigma.Position = [989 535 35 19];

            % Create aa_remove_islands
            app.aa_remove_islands = uicheckbox(app.AA);
            app.aa_remove_islands.ValueChangedFcn = createCallbackFcn(app, @aa_remove_islandsValueChanged, true);
            app.aa_remove_islands.Text = 'Remove Islands';
            app.aa_remove_islands.Position = [618 510 108 22];

            % Create aa_zscoreLabel_2
            app.aa_zscoreLabel_2 = uilabel(app.AA);
            app.aa_zscoreLabel_2.HorizontalAlignment = 'right';
            app.aa_zscoreLabel_2.Position = [795 510 64 22];
            app.aa_zscoreLabel_2.Text = 'Island Size';

            % Create aa_island_size
            app.aa_island_size = uieditfield(app.AA, 'numeric');
            app.aa_island_size.ValueChangedFcn = createCallbackFcn(app, @aa_island_sizeValueChanged, true);
            app.aa_island_size.Position = [866 510 37 19];

            % Create PA
            app.PA = uitab(app.TabGroup);
            app.PA.Title = 'PA';

            % Create pa_topview
            app.pa_topview = uiaxes(app.PA);
            xlabel(app.pa_topview, 'Lateral [mm]')
            ylabel(app.pa_topview, 'Scanning [mm]')
            zlabel(app.pa_topview, 'Z')
            app.pa_topview.Position = [42 117 493 394];

            % Create pa_coronal
            app.pa_coronal = uiaxes(app.PA);
            xlabel(app.pa_coronal, 'Lateral [mm]')
            ylabel(app.pa_coronal, 'Axial [mm]')
            zlabel(app.pa_coronal, 'Z')
            app.pa_coronal.Position = [558 117 493 394];

            % Create FrameSlider_3Label
            app.FrameSlider_3Label = uilabel(app.PA);
            app.FrameSlider_3Label.HorizontalAlignment = 'right';
            app.FrameSlider_3Label.Position = [305 71 40 22];
            app.FrameSlider_3Label.Text = 'Frame';

            % Create pa_frame
            app.pa_frame = uislider(app.PA);
            app.pa_frame.ValueChangingFcn = createCallbackFcn(app, @pa_frameValueChanging, true);
            app.pa_frame.Position = [366 80 391 7];

            % Create pa_dir_but
            app.pa_dir_but = uibutton(app.PA, 'push');
            app.pa_dir_but.ButtonPushedFcn = createCallbackFcn(app, @pa_dir_butPushed, true);
            app.pa_dir_but.Position = [756 653 125 32];
            app.pa_dir_but.Text = 'Select PA File';

            % Create pa_dir
            app.pa_dir = uitextarea(app.PA);
            app.pa_dir.Position = [678 619 294 21];

            % Create MAPsizeKnob_2Label
            app.MAPsizeKnob_2Label = uilabel(app.PA);
            app.MAPsizeKnob_2Label.HorizontalAlignment = 'center';
            app.MAPsizeKnob_2Label.Position = [35 637 56 22];
            app.MAPsizeKnob_2Label.Text = 'MAP size';

            % Create pa_map_knob
            app.pa_map_knob = uiknob(app.PA, 'continuous');
            app.pa_map_knob.ValueChangingFcn = createCallbackFcn(app, @pa_map_knobValueChanging, true);
            app.pa_map_knob.Position = [50 598 27 27];

            % Create LateralShiftmmSliderLabel
            app.LateralShiftmmSliderLabel = uilabel(app.PA);
            app.LateralShiftmmSliderLabel.HorizontalAlignment = 'right';
            app.LateralShiftmmSliderLabel.Position = [119 648 100 22];
            app.LateralShiftmmSliderLabel.Text = 'Lateral Shift [mm]';

            % Create pa_lateral_shift
            app.pa_lateral_shift = uislider(app.PA);
            app.pa_lateral_shift.Position = [240 657 248 7];

            % Create AxialShiftmmSliderLabel
            app.AxialShiftmmSliderLabel = uilabel(app.PA);
            app.AxialShiftmmSliderLabel.HorizontalAlignment = 'right';
            app.AxialShiftmmSliderLabel.Position = [130 599 89 22];
            app.AxialShiftmmSliderLabel.Text = 'Axial Shift [mm]';

            % Create pa_axial_shift
            app.pa_axial_shift = uislider(app.PA);
            app.pa_axial_shift.Position = [240 608 248 7];

            % Create ScanningShiftmmSliderLabel
            app.ScanningShiftmmSliderLabel = uilabel(app.PA);
            app.ScanningShiftmmSliderLabel.HorizontalAlignment = 'right';
            app.ScanningShiftmmSliderLabel.Position = [106 551 113 22];
            app.ScanningShiftmmSliderLabel.Text = 'Scanning Shift [mm]';

            % Create pa_scanning_shift
            app.pa_scanning_shift = uislider(app.PA);
            app.pa_scanning_shift.Position = [240 560 248 7];

            % Create pa_lat_shift
            app.pa_lat_shift = uibutton(app.PA, 'push');
            app.pa_lat_shift.ButtonPushedFcn = createCallbackFcn(app, @pa_lat_shiftPushed, true);
            app.pa_lat_shift.Position = [535 648 63 22];
            app.pa_lat_shift.Text = 'Shift';

            % Create pa_ax_shift
            app.pa_ax_shift = uibutton(app.PA, 'push');
            app.pa_ax_shift.ButtonPushedFcn = createCallbackFcn(app, @pa_ax_shiftButtonPushed, true);
            app.pa_ax_shift.Position = [534 599 63 22];
            app.pa_ax_shift.Text = 'Shift';

            % Create pa_scan_shift
            app.pa_scan_shift = uibutton(app.PA, 'push');
            app.pa_scan_shift.ButtonPushedFcn = createCallbackFcn(app, @pa_scan_shiftButtonPushed, true);
            app.pa_scan_shift.Position = [535 552 63 22];
            app.pa_scan_shift.Text = 'Shift';

            % Create BackgroundFactorEditFieldLabel
            app.BackgroundFactorEditFieldLabel = uilabel(app.PA);
            app.BackgroundFactorEditFieldLabel.HorizontalAlignment = 'right';
            app.BackgroundFactorEditFieldLabel.Position = [756 572 107 22];
            app.BackgroundFactorEditFieldLabel.Text = 'Background Factor';

            % Create pa_zscore
            app.pa_zscore = uieditfield(app.PA, 'numeric');
            app.pa_zscore.ValueChangedFcn = createCallbackFcn(app, @pa_zscoreValueChanged, true);
            app.pa_zscore.Position = [870 572 37 19];

            % Create BlurFactorEditFieldLabel
            app.BlurFactorEditFieldLabel = uilabel(app.PA);
            app.BlurFactorEditFieldLabel.HorizontalAlignment = 'right';
            app.BlurFactorEditFieldLabel.Position = [927 570 64 22];
            app.BlurFactorEditFieldLabel.Text = 'Blur Factor';

            % Create pa_sigma
            app.pa_sigma = uieditfield(app.PA, 'numeric');
            app.pa_sigma.ValueChangedFcn = createCallbackFcn(app, @pa_sigmaValueChanged, true);
            app.pa_sigma.Position = [998 570 35 19];

            % Create pa_process
            app.pa_process = uicheckbox(app.PA);
            app.pa_process.ValueChangedFcn = createCallbackFcn(app, @pa_processValueChanged, true);
            app.pa_process.Text = 'Process Images';
            app.pa_process.Position = [629 572 117 22];

            % Create pa_export_data
            app.pa_export_data = uibutton(app.PA, 'push');
            app.pa_export_data.ButtonPushedFcn = createCallbackFcn(app, @pa_export_dataButtonPushed, true);
            app.pa_export_data.Position = [958 56 125 31];
            app.pa_export_data.Text = 'Export Data';

            % Create pa_reset
            app.pa_reset = uibutton(app.PA, 'push');
            app.pa_reset.Position = [94 56 135 37];
            app.pa_reset.Text = 'Reset PA Image';

            % Create LogscaleCheckBox
            app.LogscaleCheckBox = uicheckbox(app.PA);
            app.LogscaleCheckBox.ValueChangedFcn = createCallbackFcn(app, @LogscaleCheckBoxValueChanged, true);
            app.LogscaleCheckBox.Text = 'Logscale';
            app.LogscaleCheckBox.Position = [630 540 106 22];

            % Create Overlay
            app.Overlay = uitab(app.TabGroup);
            app.Overlay.Title = 'Overlay';

            % Create overlay_topview
            app.overlay_topview = uiaxes(app.Overlay);
            xlabel(app.overlay_topview, 'Lateral [mm]')
            ylabel(app.overlay_topview, 'Scanning [mm]')
            zlabel(app.overlay_topview, 'Z')
            app.overlay_topview.Position = [43 117 493 394];

            % Create overlay_coronal
            app.overlay_coronal = uiaxes(app.Overlay);
            xlabel(app.overlay_coronal, 'Lateral [mm]')
            ylabel(app.overlay_coronal, 'Axial[mm]')
            zlabel(app.overlay_coronal, 'Z')
            app.overlay_coronal.Position = [558 117 493 394];

            % Create FrameSlider_3Label_2
            app.FrameSlider_3Label_2 = uilabel(app.Overlay);
            app.FrameSlider_3Label_2.HorizontalAlignment = 'right';
            app.FrameSlider_3Label_2.Position = [305 71 40 22];
            app.FrameSlider_3Label_2.Text = 'Frame';

            % Create overlay_frame
            app.overlay_frame = uislider(app.Overlay);
            app.overlay_frame.ValueChangingFcn = createCallbackFcn(app, @overlay_frameValueChanging, true);
            app.overlay_frame.Position = [366 80 391 7];

            % Create MAPsizeKnob_2Label_3
            app.MAPsizeKnob_2Label_3 = uilabel(app.Overlay);
            app.MAPsizeKnob_2Label_3.HorizontalAlignment = 'center';
            app.MAPsizeKnob_2Label_3.Position = [35 637 56 22];
            app.MAPsizeKnob_2Label_3.Text = 'MAP size';

            % Create overlay_map_knob
            app.overlay_map_knob = uiknob(app.Overlay, 'continuous');
            app.overlay_map_knob.ValueChangingFcn = createCallbackFcn(app, @overlay_map_knobValueChanging, true);
            app.overlay_map_knob.Position = [50 598 27 27];

            % Create overlay_export_data
            app.overlay_export_data = uibutton(app.Overlay, 'push');
            app.overlay_export_data.Position = [958 56 125 31];
            app.overlay_export_data.Text = 'Export Data';

            % Create sO2Tab
            app.sO2Tab = uitab(app.TabGroup);
            app.sO2Tab.Title = 'sO2';

            % Create so2_aa_coronal
            app.so2_aa_coronal = uiaxes(app.sO2Tab);
            xlabel(app.so2_aa_coronal, 'Lateral [mm]')
            ylabel(app.so2_aa_coronal, 'Axial [mm]')
            zlabel(app.so2_aa_coronal, 'Z')
            app.so2_aa_coronal.Position = [42 117 493 394];

            % Create so2_coronal
            app.so2_coronal = uiaxes(app.sO2Tab);
            xlabel(app.so2_coronal, 'Lateral [mm]')
            ylabel(app.so2_coronal, 'Axial [mm]')
            zlabel(app.so2_coronal, 'Z')
            app.so2_coronal.Position = [558 117 493 394];

            % Create pa_dir_but_2
            app.pa_dir_but_2 = uibutton(app.sO2Tab, 'push');
            app.pa_dir_but_2.ButtonPushedFcn = createCallbackFcn(app, @pa_dir_but_2ButtonPushed, true);
            app.pa_dir_but_2.Position = [724 653 190 32];
            app.pa_dir_but_2.Text = 'Select Other PA Wavelength File';

            % Create pa_dir_2
            app.pa_dir_2 = uitextarea(app.sO2Tab);
            app.pa_dir_2.Position = [678 619 294 21];

            % Create PAWavelength1nmEditFieldLabel
            app.PAWavelength1nmEditFieldLabel = uilabel(app.sO2Tab);
            app.PAWavelength1nmEditFieldLabel.HorizontalAlignment = 'right';
            app.PAWavelength1nmEditFieldLabel.Position = [629 583 124 22];
            app.PAWavelength1nmEditFieldLabel.Text = 'PA Wavelength 1 (nm)';

            % Create pa_wave_1
            app.pa_wave_1 = uieditfield(app.sO2Tab, 'numeric');
            app.pa_wave_1.Position = [768 583 32 17];

            % Create PAWavelength2nmEditFieldLabel
            app.PAWavelength2nmEditFieldLabel = uilabel(app.sO2Tab);
            app.PAWavelength2nmEditFieldLabel.HorizontalAlignment = 'right';
            app.PAWavelength2nmEditFieldLabel.Position = [815 583 124 22];
            app.PAWavelength2nmEditFieldLabel.Text = 'PA Wavelength 2 (nm)';

            % Create pa_wave_2
            app.pa_wave_2 = uieditfield(app.sO2Tab, 'numeric');
            app.pa_wave_2.Position = [954 583 32 17];

            % Create FrameSlider_3Label_4
            app.FrameSlider_3Label_4 = uilabel(app.sO2Tab);
            app.FrameSlider_3Label_4.HorizontalAlignment = 'right';
            app.FrameSlider_3Label_4.Position = [305 71 40 22];
            app.FrameSlider_3Label_4.Text = 'Frame';

            % Create so2_frame
            app.so2_frame = uislider(app.sO2Tab);
            app.so2_frame.ValueChangingFcn = createCallbackFcn(app, @so2_frameValueChanging, true);
            app.so2_frame.Position = [366 80 391 7];

            % Create MAPsizeKnob_2Label_4
            app.MAPsizeKnob_2Label_4 = uilabel(app.sO2Tab);
            app.MAPsizeKnob_2Label_4.HorizontalAlignment = 'center';
            app.MAPsizeKnob_2Label_4.Position = [35 637 56 22];
            app.MAPsizeKnob_2Label_4.Text = 'MAP size';

            % Create so2_map_knob
            app.so2_map_knob = uiknob(app.sO2Tab, 'continuous');
            app.so2_map_knob.ValueChangingFcn = createCallbackFcn(app, @so2_map_knobValueChanging, true);
            app.so2_map_knob.Position = [50 598 27 27];

            % Create BackgroundFactorEditFieldLabel_2
            app.BackgroundFactorEditFieldLabel_2 = uilabel(app.sO2Tab);
            app.BackgroundFactorEditFieldLabel_2.HorizontalAlignment = 'right';
            app.BackgroundFactorEditFieldLabel_2.Position = [605 540 107 22];
            app.BackgroundFactorEditFieldLabel_2.Text = 'Background Factor';

            % Create so2_zscore
            app.so2_zscore = uieditfield(app.sO2Tab, 'numeric');
            app.so2_zscore.ValueChangedFcn = createCallbackFcn(app, @so2_zscoreValueChanged, true);
            app.so2_zscore.Position = [719 540 38 19];

            % Create BlurFactorEditFieldLabel_2
            app.BlurFactorEditFieldLabel_2 = uilabel(app.sO2Tab);
            app.BlurFactorEditFieldLabel_2.HorizontalAlignment = 'right';
            app.BlurFactorEditFieldLabel_2.Position = [769 540 64 22];
            app.BlurFactorEditFieldLabel_2.Text = 'Blur Factor';

            % Create so2_sigma
            app.so2_sigma = uieditfield(app.sO2Tab, 'numeric');
            app.so2_sigma.ValueChangedFcn = createCallbackFcn(app, @so2_sigmaValueChanged, true);
            app.so2_sigma.Position = [840 540 39 19];

            % Create so2_export_data
            app.so2_export_data = uibutton(app.sO2Tab, 'push');
            app.so2_export_data.ButtonPushedFcn = createCallbackFcn(app, @so2_export_dataButtonPushed, true);
            app.so2_export_data.Position = [958 56 125 31];
            app.so2_export_data.Text = 'Export Data';

            % Create CalculatesO2Button
            app.CalculatesO2Button = uibutton(app.sO2Tab, 'push');
            app.CalculatesO2Button.ButtonPushedFcn = createCallbackFcn(app, @CalculatesO2ButtonPushed, true);
            app.CalculatesO2Button.Position = [895 535 156 28];
            app.CalculatesO2Button.Text = 'Calculate sO2';

            % Create LateralShiftmmSlider_2Label_2
            app.LateralShiftmmSlider_2Label_2 = uilabel(app.sO2Tab);
            app.LateralShiftmmSlider_2Label_2.HorizontalAlignment = 'right';
            app.LateralShiftmmSlider_2Label_2.Position = [119 648 100 22];
            app.LateralShiftmmSlider_2Label_2.Text = 'Lateral Shift [mm]';

            % Create so2_lateral_shift
            app.so2_lateral_shift = uislider(app.sO2Tab);
            app.so2_lateral_shift.Position = [240 657 248 7];

            % Create AxialShiftmmSliderLabel_2
            app.AxialShiftmmSliderLabel_2 = uilabel(app.sO2Tab);
            app.AxialShiftmmSliderLabel_2.HorizontalAlignment = 'right';
            app.AxialShiftmmSliderLabel_2.Position = [130 599 89 22];
            app.AxialShiftmmSliderLabel_2.Text = 'Axial Shift [mm]';

            % Create so2_axial_shift
            app.so2_axial_shift = uislider(app.sO2Tab);
            app.so2_axial_shift.Position = [240 608 248 7];

            % Create ScanningShiftmmSliderLabel_2
            app.ScanningShiftmmSliderLabel_2 = uilabel(app.sO2Tab);
            app.ScanningShiftmmSliderLabel_2.HorizontalAlignment = 'right';
            app.ScanningShiftmmSliderLabel_2.Position = [106 551 113 22];
            app.ScanningShiftmmSliderLabel_2.Text = 'Scanning Shift [mm]';

            % Create so2_scanning_shift
            app.so2_scanning_shift = uislider(app.sO2Tab);
            app.so2_scanning_shift.Position = [240 560 248 7];

            % Create so2_lat_shift
            app.so2_lat_shift = uibutton(app.sO2Tab, 'push');
            app.so2_lat_shift.ButtonPushedFcn = createCallbackFcn(app, @so2_lat_shiftButtonPushed, true);
            app.so2_lat_shift.Position = [535 648 63 22];
            app.so2_lat_shift.Text = 'Shift';

            % Create so2_ax_shift
            app.so2_ax_shift = uibutton(app.sO2Tab, 'push');
            app.so2_ax_shift.ButtonPushedFcn = createCallbackFcn(app, @so2_ax_shiftButtonPushed, true);
            app.so2_ax_shift.Position = [534 599 63 22];
            app.so2_ax_shift.Text = 'Shift';

            % Create so2_scan_shift
            app.so2_scan_shift = uibutton(app.sO2Tab, 'push');
            app.so2_scan_shift.ButtonPushedFcn = createCallbackFcn(app, @so2_scan_shiftButtonPushed, true);
            app.so2_scan_shift.Position = [535 552 63 22];
            app.so2_scan_shift.Text = 'Shift';

            % Create so2_reset
            app.so2_reset = uibutton(app.sO2Tab, 'push');
            app.so2_reset.ButtonPushedFcn = createCallbackFcn(app, @so2_resetButtonPushed, true);
            app.so2_reset.Position = [94 56 135 37];
            app.so2_reset.Text = 'Reset sO2 Image';

            % Create ShowColorbarCheckBox
            app.ShowColorbarCheckBox = uicheckbox(app.sO2Tab);
            app.ShowColorbarCheckBox.ValueChangedFcn = createCallbackFcn(app, @ShowColorbarCheckBoxValueChanged, true);
            app.ShowColorbarCheckBox.Text = 'Show Colorbar';
            app.ShowColorbarCheckBox.Position = [605 510 138 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = vega_pact_aa_coregistration_app
            warning('off', 'all')

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end