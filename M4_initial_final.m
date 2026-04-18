function [y_L, y_H] = M4_initial_final(time_vec, speed_vec, ts)

% Input arguments:
% time_vec  - vector of measurement times
% speed_vec - vector of smoothed speed data
% ts        - time of acceleration start

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