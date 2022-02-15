function main_game
%disp('main_game')

global h;
global object_value;
global object_data;

global ax_size;
global dt;
global key
global force

global jumpable
global game_state

%% 한번만 실행, object drawing
if ~object_value.drawed
    
    reset_value()
    
    %draw map object
   for i = 1 : length(object_data.section(1).map)
      object_data.section(1).map(i).patch = patch(object_data.section(1).map(i).x,...
                                       object_data.section(1).map(i).y,...
                                       object_data.section(1).map(i).color); 
      set(object_data.section(1).map(i).patch, 'VertexNormals',...
        get_normal(get(object_data.section(1).map(i).patch, 'XData'),...
        get(object_data.section(1).map(i).patch, 'YData')))
   end
   
    for i = 1 : length(object_data.section(1).event)
      object_data.section(1).event(i).patch = patch(object_data.section(1).event(i).x,...
                                       object_data.section(1).event(i).y,...
                                       object_data.section(1).event(i).color); 

      set(object_data.section(1).event(i).patch, 'VertexNormals',...
        get_normal(get(object_data.section(1).event(i).patch, 'XData'),...
        get(object_data.section(1).event(i).patch, 'YData')))
   end


   %draw spine object
   for i = 1 : length(object_data.section(1).spine)
      object_data.section(1).spine(i).patch = patch(object_data.section(1).spine(i).x,...\
                                         object_data.section(1).spine(i).y,...
                                         object_data.section(1).spine(i).color); 
      set(object_data.section(1).spine(i).patch, 'VertexNormals',...
        get_normal(get(object_data.section(1).spine(i).patch, 'XData'),...
        get(object_data.section(1).spine(i).patch, 'YData')))
   end
   
   %draw movable object
   for i = 1 : length(object_data.movable)
      object_data.movable(i).patch = patch(object_data.movable(i).x + object_data.movable(i).position(1),...
                                         object_data.movable(i).y + object_data.movable(i).position(2),...
                                         object_data.movable(i).color); 
   end
   
   for i = 1 : length(object_data.enemy)
      object_data.enemy(i).patch = patch(object_data.enemy(i).x + object_data.enemy(i).position(1),...
                                         object_data.enemy(i).y + object_data.enemy(i).position(2),...
                                         object_data.enemy(i).color); 
   end
   
   %draw player object
    object_data.player.patch = patch(object_data.player.x,...
                          object_data.player.y,...
                          object_data.player.color);
                      
    object_value.drawed = true;
end



%% controll
force = [0 0];

if key.Right.Status
    force = [40 0];
elseif key.Left.Status
    force = [-40 0];
end

if key.Jump.Status && key.Jump.Ready && jumpable
    force = [0 10000];
    key.Jump.Ready = false;
    disp('jump');
end

%% Physical Caculation

outer_force()
recalculate_normals()

jumpable = false;

%collision
check_player_vs_map();
check_movable_vs_map();
check_movable_vs_player();
check_movable_vs_movable();
check_player_vs_spine();
check_movable_vs_player();
check_player_vs_enemy()
check_enemy_vs_map();
check_movable_vs_enemy();
check_enemy_vs_enemy();
check_player_vs_event();

%Update
Update();

%% Test Code
%test();

%% Events

%Check point
if object_data.section(1).event(1).Status == true
    object_value.save(1).position = object_data.player.position;
    object_data.section(1).event(1).Status = false;
end
        
%Game Clear!
if object_data.section(1).event(2).Status == true
     game_state = 4;
     object_data.section(1).event(2).Status = false;
end

%% Set Axis
set(h.a, 'xlim',[object_data.player.position(1) - ax_size(3)/2 object_data.player.position(1) + ax_size(3)/2])

