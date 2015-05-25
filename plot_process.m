% imwrite(flipud(tool)*255, ['figure/tool_', num2str(Hw), '_', num2str(st), '.bmp'], 'bmp')
% imwrite(drill(1:drill_h, 1:drill_l)*255, ['figure/drill_', num2str(Hw), '_', num2str(st), '.bmp'], 'bmp')

temp_a = uint8(ones(drill_h + tool_h / 2, drill_l));
temp_a(((tool_h/2)+1):(drill_h + tool_h/2), :) = drill;
flptl1 = flipud(tool(1:tool_h/2, 1:(2*tool_w)));
temp_a((be_z+1):(be_z+tool_h/2), (be_x - tool_w):(be_x+tool_w-1)) = flptl1 & temp_a((be_z+1):(be_z+tool_h/2), (be_x-tool_w):(be_x+tool_w-1));
% figure(st)
% imshow(temp_a*255)
imwrite(temp_a*255, ['figure/Tool_wear/', num2str(be_x), '_', num2str(be_z), '_', num2str(st), '.bmp'], 'bmp')
% hold off;
% figure(2*st)
% Save imagesc w/ popping out window, not a virus
% hold off;

% imwrite(temp_a*255, ['figure/', num2str(be_x), '_', num2str(be_z), '.bmp'], 'bmp')
