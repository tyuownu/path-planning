function y = Show(start_point, goal_point, paths, map, search_map)
%  To show the result
%  @input start_point: the start point
%  @input goal_point : the goal point
%  @input paths      : the output paths
%  @input map        : the input map
%  @input search_map : the search map

%% the grid map
gr = InflateMap(map, 10);


[rows, cols] = find(search_map == 1);

%% search map point
for i = 1:size(rows, 1)
    gr = Colour(gr, 10, 10, [rows(i), cols(i)], 0.3);
end

%% the path point
for i = 1:size(paths, 1)
    gr = Colour(gr, 10, 10, paths(i, :), 0.5);
end

%% the start and goal point
gr = Colour(gr, 10, 6, start_point, 0.8);
gr = Colour(gr, 10, 6, goal_point, 0.8);

imshow(gr)

end
