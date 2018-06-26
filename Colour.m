function y = Colour(grid_map, edge_len, block_size, point, value)
%  @input grid_map  : input grid map
%  @input edge_len  : the length of edge
%  @input block_size: the output block size(must be even number)
%  @input point     : the colour point
%  @input value     : the value to set to the grid map

i = point(1); j = point(2);
y = grid_map;

index = ( edge_len - block_size ) / 2 + 1;
y((index:edge_len + 1 - index)+1+(i-1)*(edge_len + 1), ...
    (index:edge_len + 1 - index)+1+(j-1)*(edge_len + 1)) = ...
    ones(block_size, block_size)*value;
end
