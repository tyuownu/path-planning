function [paths, search_map] = Astar(start_point, goal_point, map)
    %% calculate the distance to goal point
    h = zeros(size(map));
    for i = 1:size(map, 1)
        for j = 1:size(map, 2)
            h(i, j) = sqrt((i - goal_point(1)).^2 + (j - goal_point(2)).^2);
            if map(i, j) == 1
                h(i, j) = -1;
            end
        end
    end
    %% open list: start_x, start_y, value, stop_x, stop_y
    open_list = [...
        start_point(1),                    ...
        start_point(2),                    ...
        h(start_point(1), start_point(2)), ...
        0,                                 ...
        0];

    %% close list
    close_list = [];

    [value, index] = min(open_list(:, 3));
    current = open_list(index, :);
    while isempty(open_list) == 0
        surround_points = SurroundPoint(current, h, map)
        open_list = open_list([1:index-1, index+1:end], :);
        for i = 1:size(close_list, 1)
            if (close_list(i, 1) == current(1) && ...
                    close_list(i, 2) == current(2))
                if close_list(i, 3) >= current
                    close_list(i, 3) = current;
                end
            else
                close_list = [close_list; current];
            end
        end

        open_list = [open_list; surround_points];
        [value, index] = min(open_list(:, 3));
        current = open_list(index, :);
        if current(1) == goal_point(1) && current(2) == goal_point(2)
            break;
        end
    end
    paths = [];
    search_map = [];
end
