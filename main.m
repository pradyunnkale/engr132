function main(filename)
    
    [time_vec, speed_compact, speed_midsize, speed_fullsize, smooth_compact, smooth_midsize, smooth_fullsize] = sub_data(filename);
    
    % Concatenate all smooth trials into one matrix (each column = one trial)
    % Order: compact (1-15), midsize (16-30), fullsize (31-45)
    all_smooth = [smooth_compact, smooth_midsize, smooth_fullsize];
    all_raw = [speed_compact,  speed_midsize,  speed_fullsize];
    
    vehicle_labels = [repmat("Compact",  1, 15), ...
                      repmat("Midsize",  1, 15), ...
                      repmat("Fullsize", 1, 15)];
    
    % 4 x 45 parameter array
    % Row 1: ts | Row 2: y_L | Row 3: y_H | Row 4: time_const
    params = zeros(4, 45);
    for i = 1:45
        speed_vec = all_smooth(:, i);
        raw_vec = all_raw(:, i);
    
        ts = ts_calc(time_vec, speed_vec);
        [y_L, y_H] = init_final_calc(time_vec, speed_vec, ts);
        time_const = tau_calc(time_vec, speed_vec, y_L, y_H, ts);
    
        params(1, i) = ts;
        params(2, i) = y_L;
        params(3, i) = y_H;
        params(4, i) = time_const;
    
        % Print parameters
        fprintf('Trial %d (%s) - ts: %.3f | y_L: %.3f | y_H: %.3f | tau: %.3f\n', i, vehicle_labels(i), ts, y_L, y_H, time_const);
    
        % Compute model
        model = zeros(size(time_vec));
        model(time_vec < ts) = y_L;
        model(time_vec >= ts) = y_L + (y_H - y_L) .* (1 - exp(-(time_vec(time_vec >= ts) - ts) / time_const));
    
        Plot
        figure;
        hold on;
        plot(time_vec, raw_vec);
        plot(time_vec, speed_vec);
        plot(time_vec, model);
        hold off;
        title(sprintf('Trial %d (%s)', i, vehicle_labels(i)));
        legend('Raw', 'Smoothed', 'Model');
        xlabel('Time (s)');
        ylabel('Speed (m/s)');
    end
    
    writematrix(params, "params.csv");
end