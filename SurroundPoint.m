function points = SurroundPoint(list, h, map)
    %% TODO: adding weather allow diagonal travel
    [rows, cols] = size(map);

    %% left right down up
    row = [ 0 0 -1 1];
    col = [-1 1  0 0];
    points = [];

    for i = 1:length(row)
        if (row(i)+list(1) > 0 &&       ...
            row(i) + list(1) <= rows && ...
            col(i) + list(2) > 0 &&     ...
            col(i) + list(2) <= cols && ...
            h(row(i) + list(1), col(i) + list(2)) > 0)
            value = list(3) + 1 + h(list(1), list(2)) -...
                h(row(i) + list(1), col(i) + list(2));
            points = [points;...
                row(i) + list(1), col(i) + list(2), value, list(1), list(2)];
        end
    end
end
