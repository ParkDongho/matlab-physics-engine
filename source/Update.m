function Update
%disp('Update')
global object_data
global dt

%% player Update
%위치 수정
set(object_data.player.patch,'Vertices',get(object_data.player.patch,'Vertices')+object_data.player.velocity*dt);
object_data.player.position = object_data.player.position + object_data.player.velocity*dt;

%각도 수정
radiant = object_data.player.angularVelocity*dt*pi/180;
lineartransform = [cos(radiant) -sin(radiant);sin(radiant) cos(radiant)];
set(object_data.player.patch,'Vertices',(lineartransform*(get(object_data.player.patch,'Vertices')-object_data.player.position)')'+object_data.player.position);

%% movable object Update
for i = 1 : length(object_data.movable)
    %위치 수정
    set(object_data.movable(i).patch,'Vertices',get(object_data.movable(i).patch,'Vertices')+object_data.movable(i).velocity*dt);
    object_data.movable(i).position = object_data.movable(i).position + object_data.movable(i).velocity*dt;

    %각도 수정
    radiant = object_data.movable(i).angularVelocity*dt*pi/180;
    lineartransform = [cos(radiant) -sin(radiant);sin(radiant) cos(radiant)];
    set(object_data.movable(i).patch,'Vertices',(lineartransform*(get(object_data.movable(i).patch,'Vertices')-object_data.movable(i).position)')'+object_data.movable(i).position);
end

%% enemy object Update
for i = 1 : length(object_data.enemy)
    %위치 수정
    set(object_data.enemy(i).patch,'Vertices',get(object_data.enemy(i).patch,'Vertices')+object_data.enemy(i).velocity*dt);
    object_data.enemy(i).position = object_data.enemy(i).position + object_data.enemy(i).velocity*dt;

    %각도 수정
    radiant = object_data.enemy(i).angularVelocity*dt*pi/180;
    lineartransform = [cos(radiant) -sin(radiant);sin(radiant) cos(radiant)];
    set(object_data.enemy(i).patch,'Vertices',(lineartransform*(get(object_data.enemy(i).patch,'Vertices')-object_data.enemy(i).position)')'+object_data.enemy(i).position);
end