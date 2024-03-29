function vsd_spec_plotter_tsm(data,dataFiltered,dataDenoised,ROIs)

    % parametrizes number of cell plots (as rows) to be created per page
    %   of tiled plots
    cpp = 5;
    
    % initializes first tiled plot
    figure;
    tiledlayout(cpp,3,'TileSpacing','tight','Padding','compact');
    
    % iteratively generates 3 plots (raw data, filtered data, and
    %   denoised data) for each cell, and only plots cpp cells per
    %   tiled plot
    for k = 1:length(ROIs)
    
        % generates random color for each ROI, with lighter colors
        %   restricted
        PlotColor = randi([0,60],1,3)/100;
        
        % plots 3 graphs for each cell, and removes first "trim" frames
        nexttile
        plot(data(1000:(end-100),ROIs(k)),'Color',PlotColor)
        title(['ROI ',num2str(ROIs(k)),' raw'])
        f = nexttile;
        plot(dataFiltered(1000:(end-100),ROIs(k)),'Color',PlotColor)
        title(['ROI ',num2str(ROIs(k)),' filtered'])
        d = nexttile;
        plot(dataDenoised(1000:(end-100),ROIs(k)),'Color',PlotColor)
        title(['ROI ',num2str(ROIs(k)),' denoised'])
        linkaxes([f,d],'y')
        
        % checks if 5 plots have been generated, if so, makes new tiled
        %   plot
        if mod(k,cpp)==0
            figure;
            tiledlayout(cpp,3,'TileSpacing','tight','Padding',...
                'compact');
        end
    
    end

end