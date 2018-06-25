function inflate_map = InflateMap(map)
    rows = size(map, 1);
    cols = size(map, 2);

    inflate_map = ones(rows * 11 + 1, cols * 11 + 1);

    [row, col] = find(map == 1);
    for i = 1:length(row)
        x = row(i); y = col(i);
        inflate_map((2 + (x - 1) * 11):(x * 11), ...
            (2 + (y - 1) * 11):(y * 11)) = zeros(10, 10);
    end

    %% rows
    inflate_map((1:size(map, 1)) * 11 - 10, :) = ...
        zeros(size(map, 1), size(inflate_map, 2));
    inflate_map(size(inflate_map, 1), :) = zeros(1, size(inflate_map, 2));

    %% cols
    inflate_map(:, (1:size(map, 2))*11 - 10) = ...
        zeros(size(inflate_map, 1), size(map, 2));
    inflate_map(:, size(inflate_map, 2)) = zeros(size(inflate_map, 1), 1);
end
