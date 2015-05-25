% construct_border;
% fprintf('------ Constructing border finished.\n')
% process_border;
% fprintf('------ Border processed.\n')

% max_eft = -1;
% max_eft_set = zeros(2, 1000);
% max_eft_set_num = 0;
% d = zeros(range_z2 - range_z1 + 1, range_x2 - range_x1 + 1);
% -- define the starting range points

% ele_w

min_dis = 999999999999999999;
min_dis_cout = 0;
min_set = zeros(2000, 4);
min_tool_x = 0;
min_tool_z = 0;
min_drill_x = 0;
min_drill_z = 0;

dir_x = [-1, 0, 1, 0];
dir_y = [0, -1, 0, 1];

for i = 1:(be_z+ele_w)
    for j = 1:(2*tool_w)
        if (tool(i, j) == 1)
            continue;
        end
        bud = 0;
        for dd = 1:4
            di = i + dir_x(dd);
            dj = j + dir_y(dd);
            if ((di <= 0) || (dj <= 0) || (dj > 2*tool_w))
                bud = 0;
                break;
            end
            if (tool(di, dj) == 1)
                bud = 1;
                break;
            end
        end
        if (bud == 0)
            continue;
        end
        for di = (i-ele_w):(i+ele_w)
            for dj = (j-ele_w):(j+ele_w)
                ci = be_z - di + 1;
                cj = be_x - tool_w + dj - 1;
                if ((ci <= 0) || (cj <= 0))
                    continue;
                end
                if (drill(ci, cj) == 1)
                    continue;
                end
                tem_dis = (i-di)^2 + (j-dj)^2;
                if (tem_dis < min_dis)
                    min_dis = tem_dis;
                    min_dis_cout = 1;
                    min_set(1, 1) = i;
                    min_set(1, 2) = j;
                    min_set(1, 3) = ci;
                    min_set(1, 4) = cj;
                else if (tem_dis == min_dis)
                    min_dis_cout = min_dis_cout + 1;
                    min_set(min_dis_cout, 1) = i;
                    min_set(min_dis_cout, 2) = j;
                    min_set(min_dis_cout, 3) = ci;
                    min_set(min_dis_cout, 4) = cj;
                    end
                end
            end
        end
    end
end

rand_num = randi(min_dis_cout);
min_tool_x = min_set(rand_num, 2);
min_tool_z = min_set(rand_num, 1);
min_drill_x = min_set(rand_num, 4);
min_drill_z = min_set(rand_num, 3);

% -- End change
if (min_dis <= ele_w^2)
    fprintf('------ Distance less than threshold, legal to remove.\n')
    cut_remove;
else
    fprintf('------ Distance greater than threshold, illegal to remove, skip...\n')
    poss_down = 1;
end
