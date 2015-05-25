% cur_tool
fprintf('--------- Cutting tool...\n')
cur_t_x = min_tool_z;
cur_t_y = min_tool_x;
stat_cot(cur_t_y) = stat_cot(cur_t_y) + 1;
for i = max((cur_t_x - ele_range_t), 1):min((cur_t_x + ele_range_t), tool_h)
    ele_range_t_y = round(sqrt(ele_range_t^2 - (i - cur_t_x)^2));
    for j = max((cur_t_y - ele_range_t_y), 1):min((cur_t_y + ele_range_t_y), 2*tool_w);
        tool(i, j) = 1;
    end
end

% cut_drill
fprintf('--------- Cutting drill...\n')
cur_d_x = min_drill_z;
cur_d_y = min_drill_x;

for i = max((cur_d_x - ele_range_d), 1):min((cur_d_x + ele_range_d), drill_h)
    ele_range_d_y = round(sqrt(ele_range_d^2 - (i - cur_d_x)^2));
    for j = max((cur_d_y - ele_range_d_y), 1):min((cur_d_y + ele_range_d_y), drill_l);
        drill(i, j) = 1;
    end
end

