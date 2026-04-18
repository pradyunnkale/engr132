function ts = ts_calc(time_vec, speed_vec)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Subfunction Name: ts_calc
%
%% Model Representation:
% Function will determine the first time value at which the measured speed of
% each vehicle exceeds a certain difference from its initial measured speed to
% account for sensor noise present in raw data.
%
%% Subfunction Task:
% Run an iterating loop for each value of the measured data to calculate the
% number of the iteration of which the measured speed changes from the initial 
% beyond the pre-set threshold.
%
%% Calculation Logic:
% Make a while loop to check each element of array containing measured data, 
% taking the difference between the measured data and the initial speed.
% This number is then compared to the pre-set threshold to account for sensor 
% noise and the loop ends when the difference exceeds the threshold. Finally, ts % is returned as the time value at that index.
%
%% Input Arguments:
% [time_vec, speed_vec]
% time_vec: time vector in seconds, Nx1, from the data cleaning subfunction
% speed_vec: cleaned speed vector in m/s, Nx1, from data cleaning subfunction
%
%% Output Arguments:
% ts // Time that acceleration begins in seconds, 1x1, passed to const_calc and % main
%
%% Example Function Call (from main program):
% ts = ts_calc(time_vec, speed_vec)
%
%% Independent Test Case and Function Call:
% 	Test Dataset: data with an acceleration start time
% 	Command Window Call: ts = ts_calc(time_test, speed_test)
% 	Test Criteria: the output of ts should match the known acceleration start   % 	time of the data, ignoring noise
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

% Since our filter underestimates the start time, instead we empircally
% looked at what y-value of the curve the noisy data starts to accelerate,
% we found this to consistently be around 5m/s.
y_threshold = 2.5;


%% ____________________
%% CALCULATIONS
ts = time_vec(find(speed_vec >= y_threshold, 1));

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS



%% ____________________
%% RESULTS


end