function [startTime, startIndex, intialSpeed] = accelerationStart(data, speedMargin, points, baseline)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Program Description
% This function determines the start time when true acceleration of the
% vehicle begins, determined by the ACC speed test data. This function uses
% a threshold method to determine between true acceleration or changes in
% speed due to sensor noise by constantly checking if the speed is
% consistently above the baseline speed.
%
% Function Call
% [startTime, startIndex, intialSpeed] = accelerationStart(data,
% speedMargin, points, baseline)
%
%
% Input Arguments
% matrix - vehicle data from ACC speed test
% speedMargin - represents the minimum increase above the baseline speed to
% be determined as real acceleration
% points - the number of points needed to be above baseline to count as
% acceleration
% baseline - number of initial data points to calculate baseline speed
%
% Output Arguments
% startTime - time in seconds when acceleration begins
% startIndex - index in the data vector/matrix when acceleration begins
% initialSpeed - intial speed before acceleration begins (yL)
% Assignment Information
% Assignment: Cruise Auto - accelerationStart
% Version: M#4
% Primary author: Name, chung384@purdue.edu
% Team members: Name, login@purdue.edu [repeat for each person]
% Name, login@purdue.edu [repeat for each person]
% Name, login@purdue.edu [repeat for each person]
% Team ID: 015-11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ____________________
%% INITIALIZATION
time = matrix(:, 1);
speed = matrix(:, 2);
%% ____________________
%% CALCULATIONS
% this is used to define the intiial speed with a defined number of
% baseline points
intialSpeed = median(speed(1:baseline))
% Calculate threshold to define when acceleration is counted vs data noise
threshold = intialSpeed + speedMargin;
startTime;
startIndex;
% Scan a portion of the data matrix against time to find acceleration by
% looping through and finding the index and time that the next points are
% counted as acceleration.
for i = 1:length(time) - points + 1
if all(speed(i:i+points-1) > threshold)
startIndex = i;
startTime = time(i);
return
end
end
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%% ____________________
%% RESULTS