function recalculate_normals
%disp('recalculate_normals')
global object_data


%movable object
for i = 1 : length(object_data.movable)
   set(object_data.movable(i).patch, 'VertexNormals',...
        get_normal(get(object_data.movable(i).patch, 'XData'),...
        get(object_data.movable(i).patch, 'YData')))
end


%enemy object
for i = 1 : length(object_data.enemy)
   set(object_data.enemy(i).patch, 'VertexNormals',...
        get_normal(get(object_data.enemy(i).patch, 'XData'),...
        get(object_data.enemy(i).patch, 'YData')))
end


%player normal
set(object_data.player.patch, 'VertexNormals',...
        get_normal(get(object_data.player.patch, 'XData'),...
        get(object_data.player.patch, 'YData')))