function support_point = get_support_point(An, B_vertices)
%disp('support_point')
    [~, max_index] = max(B_vertices*An');
    support_point = B_vertices(max_index, :);
end



