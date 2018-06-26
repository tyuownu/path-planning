function inflate_map = InflateMap(map, edge_len)
%  inflate the map to grid map
%  @input map     : the input map
%  @input edge_len: inflate square size

    rows = size(map, 1);
    cols = size(map, 2);

    inflate_map = ones(rows * (edge_len + 1) + 1, cols * (edge_len + 1) + 1);

    [row, col] = find(map == 1);
    for i = 1:length(row)
        x = row(i); y = col(i);
        inflate_map((1:edge_len)+(x-1)*(edge_len + 1) + 1, ...
            (1:edge_len) + (y-1)*(edge_len + 1) + 1) = zeros(edge_len, edge_len);
        %{
         {inflate_map((2 + (x - 1) * 11):(x * 11), ...
         {    (2 + (y - 1) * 11):(y * 11)) = zeros(10, 10);
         %}
    end

    %% rows
    inflate_map((1:size(map, 1)) * (edge_len + 1) - edge_len, :) = ...
        zeros(size(map, 1), size(inflate_map, 2));
    inflate_map(size(inflate_map, 1), :) = zeros(1, size(inflate_map, 2));

    %% cols
    inflate_map(:, (1:size(map, 2))*(edge_len + 1) - edge_len) = ...
        zeros(size(inflate_map, 1), size(map, 2));
    inflate_map(:, size(inflate_map, 2)) = zeros(size(inflate_map, 1), 1);
end
