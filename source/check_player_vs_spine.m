function check_player_vs_spine
%disp('check_player_vs_spine');
global object_data
global game_state


%플레이어와 맵 오브젝트
for spine_index = 1 : length(object_data.section(1).spine)
    penetration = polygon_to_polygon(object_data.section(1).spine(spine_index), object_data.player);
    if penetration <= 0
        game_state = 2;
        break
    end
end  