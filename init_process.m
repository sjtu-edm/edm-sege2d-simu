% calculation of tana
    % roots
poss_down = 0;
% global tool;
tool = uint8(zeros(tool_h, 2*tool_w));                     % tool 0-1 matrix with int8
stat_cot = zeros(1, 2*tool_w);                               % Counter of 
tool(1:round(ele_w/2), :) = 1;
% tool(1:tool_h, 1:round(tool_w/5)) = 1;
% global drill;
drill = uint8(zeros(drill_h, drill_l));                     % drill 0-1 matrix with int8
% drill(1:(init_d + init_w), 1:(2 * tool_w + init_w)) = 1;    % initial processing
% drill(1:(init_d + init_w), (tool_w - round(tool_w/5) + init_w):(tool_w + round(tool_w/5) - init_w)) = 0;
% global be_x;
be_x = drill_l/2 + 1;                                               % x-axis beginning location on drill
% global be_z;
be_z = 1;                                          % z-axis beginning location on drill
