function y = PointInLists(lists, point)
%  To define wheather the point is in the lists
%  @input lists: 
%  @input point:

    y = 0;
    if isempty(lists)
        return;
    else
        for i = 1:size(lists, 1)
            if point(1) == lists(i, 1) && point(2) == lists(i, 2)
                y = i;
                return;
            end
        end
    end


end
