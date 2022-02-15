function delete_all_object
global object_data
global object_value

%% delete object
for i = 1 : length(object_data.section(1).map)
      delete(object_data.section(1).map(i).patch)
end

for i = 1 : length(object_data.section(1).event)
      delete(object_data.section(1).event(i).patch)
end

for i = 1 : length(object_data.section(1).spine)
      delete(object_data.section(1).spine(i).patch )
end

for i = 1 : length(object_data.movable)
     delete(object_data.movable(i).patch)
end

for i = 1 : length(object_data.enemy)
     delete(object_data.enemy(i).patch)
end

delete(object_data.player.patch)

object_value.drawed = false;