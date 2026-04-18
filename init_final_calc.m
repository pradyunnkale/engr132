function [y_L, y_H] = init_final_calc(time_vec, speed_vec, ts)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Subfunction Name: init_final_calc
%
%% Model Representation:
% Before and after the acceleration event, the vehicle operates at more or less  % the same constant speeds. These two steady state levels y_L, and y_H will      % define our lower and higher bounds of the first order speed response.
%
%% Subfunction Task:
% Use a window averaging over the pre and post acceleration areas of the speed   % vector to return representative values for y_L and y_H.
%
%% Calculation Logic:
% We will find the index in the time_vec that should corresponded to ts, then we % will make a fixed window of sample ending at that particular index for y_L and % then do the same exact thing but at the tail end of the dataset for y_H. Then  % we'll set y_L equal to the mean of speed values in the pre acceleration window, % and y_H for the post acceleration window.
%
%% Input Arguments:
% [time_vec, speed_vec, ts]
% time_vec: time vector in seconds, nx1, from the data cleaning subfunction
% speed_vec: cleaned speed vector in m/s, nx1, from the data cleaning subfunction
% ts: acceleration start time in seconds, 1x1, from ts_calc
%
%% Output Arguments:
% [y_L, y_H]
% y_L: initial speed in m/s, 1x1, passed to the ts_calc, const_calc vectors
% y_H: final speed in m/s, 1x1, passed to the const_calc and main function
%
%% Example Function Call (from main program):
% [y_L, y_H] = init_final_calc(time_vec, speed_vec, ts)
%
%% Independent Test Case and Function Call:
% 	Test Dataset: data with known initial and final speeds
% 	Command Window Call: [y_L, y_H] = init_final_calc(time_test, speed_test, ts)
% 	Test Criteria: y_L, y_H should match the known speeds of the data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %% Initial speed calculation
    i = 1;
    total_speed = 0;
    
    while i <= length(time_vec) && time_vec(i) <= ts
        total_speed = total_speed + speed_vec(i);
        i = i + 1;
    end
    
    y_L = total_speed / (i - 1);
    
    %% Final speed calculation
    i = 1;
    total_speed = 0;
    reverseSpeed = speed_vec(end:-1:1);
    
    target_speed = reverseSpeed(1);
    
    while i <= length(reverseSpeed) && reverseSpeed(i) >= 0.95 * target_speed && reverseSpeed(i) <= 1.05 * target_speed
        total_speed = total_speed + reverseSpeed(i);
        i = i + 1;
    end
    
    y_H = total_speed / (i - 1);

end