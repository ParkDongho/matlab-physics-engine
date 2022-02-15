function outer_force
%disp('outer_force')
global object_data
global dt;
global force

gravity = [0, -20];
object_data.player.velocity = object_data.player.velocity + (force*object_data.player.invmass + gravity)*dt;

for i = 1 : length(object_data.movable)
    object_data.movable(i).velocity = object_data.movable(i).velocity + gravity*dt;
end

for i = 1 : length(object_data.enemy)
    object_data.enemy(i).velocity = object_data.enemy(i).velocity + gravity*dt;
end
%angularVelocity = angularVelocity + torque * (1.0f / momentOfInertia) * dt
