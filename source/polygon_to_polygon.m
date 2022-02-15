function bestDistance = polygon_to_polygon(poly_A, poly_B)
%disp('polygon_to_polygon')
global facepoint
global collision_normal

    An = poly_A.patch.VertexNormals(:, [1 2]);
    Bs = get_support_point(-An, poly_B.patch.Vertices);
    
    [bestDistance, index] = max(sum(An.*(Bs - poly_A.patch.Vertices), 2));
    
    facepoint = Bs(index, :);
    collision_normal = An(index,:);
    collision_normal = collision_normal./norm(collision_normal);
    
    %폴리곤 B를 검사 
    %충돌하지 않았을때는 검사하지 않음
    if bestDistance <= 0
        Bn = poly_B.patch.VertexNormals(:, [1 2]);
        As = get_support_point(-Bn, poly_A.patch.Vertices);

        [BbestDistance, index] = max(sum(Bn.*(As - poly_B.patch.Vertices), 2));
        
        if (BbestDistance > bestDistance)
            bestDistance = BbestDistance;
            facepoint = As(index, :);
            collision_normal = -Bn(index, :);   
            collision_normal = collision_normal./norm(collision_normal);
        end
    end
end
