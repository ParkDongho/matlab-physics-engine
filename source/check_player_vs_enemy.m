function check_player_vs_enemy
%disp('check_player_vs_enemy');
global object_data
global game_state


%플레이어와 맵 오브젝트
for enemy_index = 1 : length(object_data.enemy)
    penetration = polygon_to_polygon(object_data.enemy(enemy_index), object_data.player);
    if penetration <= 0
        game_state = 2;
        break
    end
end  