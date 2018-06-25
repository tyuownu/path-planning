function point = GeneratePoint(map, lists)
    rows = size(map, 1);
    cols = size(map, 2);
    while true
        x = randi(rows, 1, 1);
        y = randi(cols, 1, 1);
        dup = false;

        for i = 1:size(lists, 1)
            if ( lists(i, 1) == x && lists(i, 2) == y )
                dup = true;
                break;
            end
        end

        if dup == false
            break;
        end
    end
    point = [x, y];
end
