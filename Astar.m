function [paths, search_map] = Astar(start_point, goal_point, map)
%ASTAR    [paths, search_map] = Astar(start_point, goal_point, map) 
%         @input start_point: the start point
%         @input goal_point : the goal point
%         @input map        : the relative map
%
%         @output paths     : the output paths
%         @output search_map: the map already searched.

    %% calculate the distance to goal point
    h = zeros(size(map));
    paths = [];
    search_map = zeros(size(map));
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

    %% set current point as a searched point
    search_map(current(1), current(2)) = 1;
    while isempty(open_list) == 0
        %% find the surround_points point
        surround_points = SurroundPoint(current, h, map);
        open_list = open_list([1:index-1, index+1:end], :);

        %% adding surround_points to open_list
        for i = 1:size(surround_points, 1)
            n = PointInLists(open_list(:, 1:2), surround_points(i, 1:2));
            %% the point already been searched.
            if search_map(surround_points(i, 1), surround_points(i, 2)) ~= 0
                continue;
            end
            
            if n
                if open_list(n, 3) > surround_points(i, 3)
                    open_list(n, :) = surround_points(i, :);
                end
            else
                open_list = [open_list; surround_points(i, :)];
            end

            %% build search map
            if search_map(surround_points(i,1), surround_points(i, 2)) == 0
                search_map(surround_points(i,1), surround_points(i, 2)) = 1;
            end
        end

        n = PointInLists(close_list, current(1:2));
        if n
            if close_list(n, 3) > current(3)
                close_list(n, :) = current;
            end
        else
            close_list = [close_list; current];
        end

        if isempty(open_list) == 1
            break;
        end
        [value, index] = min(open_list(:, 3));
        current = open_list(index, :);
        if current(1) == goal_point(1) && current(2) == goal_point(2)
            break;
        end
    end
    if current(1) ~= goal_point(1) || current(2) ~= goal_point(2)
        fprintf('there is no valid path found\n');
        return;
    end
    paths = [current(1:2); paths];
    p = current(4:5);
    while p(1) ~= 0 && p(2) ~= 0
        for i = 1:size(close_list, 1)
            if p(1) == close_list(i, 1) && p(2) == close_list(i, 2)
                paths = [p; paths];
                p = close_list(i, 4:5);
                close_list = close_list([1:i-1, i+1:end], :);
                break;
            end
        end
    end
end
