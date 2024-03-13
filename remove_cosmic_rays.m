function cleaned_data = remove_cosmic_rays(data, filter_size)
                % Author: Mulusew W. Yaltaye
                % 16/12/2022

    % Create a median filtered data
    filtered_data = medfilt2(data, [filter_size filter_size]);
    
    % Subtract the filtered data from the original
    diff_data = data - filtered_data;

    % Set a threshold (e.g., 3 times the standard deviation of the diff_data)
    threshold = 2 * std(diff_data(:));

    % Create a binary mask where the absolute difference is larger than the threshold
    cosmic_ray_mask = abs(diff_data) > threshold;

    % Replace the peaks corresponding to cosmic rays in the original data 
    % with the values from the filtered data
    cleaned_data = data;
    cleaned_data(cosmic_ray_mask) = filtered_data(cosmic_ray_mask);

end
