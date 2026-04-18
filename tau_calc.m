function [time_const] = tau_calc(time_vec, speed_vec, y_L, y_H, ts)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Subfunction Name: tau_calc
%
%% Model Representation:
% Model will consider initial and final steady-state speeds and the acceleration
% start time. For each point after the acceleration start time, find the time
% at which the speed is one time constant through the acceleration.
%
%% Subfunction Task:
% Use an iterating loop for each value in the data with an iterating variable
% to determine at which time the speed is 63.2% of the way to the max speed.
%
%% Calculation Logic:
% Calculate the 63.2% threshold speed using: 
% y_threshold = y_L + 0.632 * (y_H – y_L). Use a for loop to go through the      % cleaned speed vector data after ts and find the first index where speed meets  % or exceeds y_threshold. Finally, tau is returned as time at first index minus  % ts. 
%
%% Input Arguments:
% [time_vec, speed_vec, y_L, y_H, ts]
% time_vec: the time vector in seconds, nx1, from data subfunction
% speed_vec: cleaned speed vector in m/s, nx1, from data cleaning subfunctions
% y_L: Initial speed in m/s, 1x1, from sub_speed
% y_H: final speed in m/s, 1x1, from sub_speed
% ts: acceleration start time in seconds, 1x1, from ts_calc
%
%% Output Arguments:
% [time_const] // estimated time constant in seconds, 1x1, passed to the main
%
%% Example Function Call (from main program):
% time_const = tau_calc(time_vec, speed_vec, y_L, y_H, ts)
%
%% Independent Test Case and Function Call:
% 	Test Dataset: data with the time constant known
% 	Command Window Call: time_const = tau_calc(time_test, speed_test, y_L, y_H, ts)
% 	Test Criteria: The time_const should match the known time constant of data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION


%% ____________________
%% CALCULATIONS

% After acceleration, 63.2% of the difference between maximum and minimum speed is
% one time constant of time after start of accleration.
y_threshold = y_L + 0.632 * (y_H - y_L);

% This gets the first time at which the speed is greater than 63.2%
% This does not factor in the time it takes to start accelerating
% Each index corresponds to 0.01 seconds.
idx = find(speed_vec > y_threshold, 1);
time_tau = time_vec(idx);

% Take the difference between the accerlation start time
% and the time at which the speed is greater than 63.2%
% to get the time constant duration.
time_const = time_tau - ts;


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS


%% ____________________
%% RESULTS

time_const

end