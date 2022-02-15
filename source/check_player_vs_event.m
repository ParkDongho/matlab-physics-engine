function check_player_vs_event
%disp('check_player_vs_event');
global object_data

%플레이어와 맵 오브젝트
for event_index = 1 : length(object_data.section(1).event)
    penetration = polygon_to_polygon(object_data.section(1).event(event_index), object_data.player);
    if penetration <= 0 && object_data.section(1).event(event_index).Ready
        object_data.section(1).event(event_index).Status = true;
        object_data.section(1).event(event_index).Ready = false;
        disp('event');
        break
    end
    
end  