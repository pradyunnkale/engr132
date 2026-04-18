function [time_vec, speed_compact, speed_midsize, speed_fullsize] = sub_data(data_file)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Imports the raw CruiseAuto CSV dataset and organizes its contents
% into a time vector and three speed matrices separated by vehicle
% size category: compact, midsize, fullsize.
%
% Function Call
% [time_vec, speed_compact, speed_midsize, speed_fullsize] = sub_data(data_file)
%
% Input Arguments
% data_file: name of the raw CSV data file, 1x1 string, defined in main
%
% Output Arguments
% time_vec: time vector in seconds, Nx1, passed to all subfunctions
% speed_compact: compact vehicle speed data in m/s, Nx15, passed to main
% speed_midsize: midsize vehicle speed data in m/s, Nx15, passed to main
% speed_fullsize: fullsize vehicle speed data in m/s, Nx15, passed to main
%
% Assignment Information
%   Assignment:     Cruise Auto - Data Handling
%   Version:        M4
%   Primary author: Abdulaziz Alghamdi, alghamd9@purdue.edu
%   Team members:   Krish Tripathi, tripat58@purdue.edu
%                   Logan Chung, chung384@purdue.edu 
%                   Pradyunn Kale, kale30@purdue.edu 
%   Team ID:        015-11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

raw_data = readtable(data_file);

%% ____________________
%% CALCULATIONS

% Extract time vector from column 1 (Nx1)
time_vec = raw_data{:, 1};

% Extract compact speed data from columns 2 through 16 (Nx15) under winter, summer, and allseason tires

speed_compact = raw_data{:, 2:16};

% Extract midsize speed data from columns 17 through 31 (Nx15) under winter, summer, and allseason tires

speed_midsize = raw_data{:, 17:31};

% Extract fullsize speed data from columns 32 through 46 (Nx15) under winter, summer, and allseason tires

speed_fullsize = raw_data{:, 32:46};

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

% No displays for this subfunction

%% ____________________
%% RESULTS

% Outputs returned through the function definition: time_vec, speed_compact, speed_midsize, speed_fullsize

end

