function map = GenerateMap(rows, cols, obstacle_num)
%  Generate a random map, rows*cols with obstacle_num obstacles
%  @input rows        :
%  @input cols        :
%  @input obstacle_num:

    map = zeros(rows, cols);
    obstacle = zeros(obstacle_num, 2);
    for i = 1:obstacle_num
        p = GeneratePoint(map, obstacle);
        obstacle(i, :) = p;
        map(p(1), p(2)) = 1;
    end

end
