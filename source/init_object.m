function init_object
global h
global object;
global object_data
global object_value;
global key
global force

%% KeyBoard input
global LeftKeyName;
global RightKeyName;
global UpKeyName;
global DownKeyName;

global LeftKeyStatus
global RightKeyStatus
global UpKeyStatus
global DownKeyStatus


%% map object reset 
object_data.section(1).map(1).x = [0 60 30 0];
object_data.section(1).map(1).y = [20 20 30 30];
object_data.section(1).map(1).color = [0 0 0];
object_data.section(1).map(1).restitution = 0;
object_data.section(1).map(1).invmass = 0;
object_data.section(1).map(1).position = [110 5];
object_data.section(1).map(1).velocity = [0 0];
object_data.section(1).map(1).angularVelocity = 0;
object_data.section(1).map(1).invInertia = 0;
object_data.section(1).map(1).static_friction = 0.1;
object_data.section(1).map(1).dynamic_friction = 0.05;

object_data.section(1).map(2).x = [0 100 100 0];
object_data.section(1).map(2).y = [10 10 20 20];
object_data.section(1).map(2).color = [0 0 0];
object_data.section(1).map(2).restitution = 0;
object_data.section(1).map(2).invmass = 0;
object_data.section(1).map(2).position = [110 5];
object_data.section(1).map(2).velocity = [0 0];
object_data.section(1).map(2).angularVelocity = 0;
object_data.section(1).map(2).invInertia = 0;
object_data.section(1).map(2).static_friction = 0.1;
object_data.section(1).map(2).dynamic_friction = 0.05;

object_data.section(1).map(3).x = [150 200 200 150];
object_data.section(1).map(3).y = [10 10 20 20];
object_data.section(1).map(3).color = [0 0 0];
object_data.section(1).map(3).restitution = 0;
object_data.section(1).map(3).invmass = 0;
object_data.section(1).map(3).position = [110 5];
object_data.section(1).map(3).velocity = [0 0];
object_data.section(1).map(3).angularVelocity = 0;
object_data.section(1).map(3).invInertia = 0;
object_data.section(1).map(3).static_friction = 0.1;
object_data.section(1).map(3).dynamic_friction = 0.05;

object_data.section(1).map(4).x = [220 300 300 240 220];
object_data.section(1).map(4).y = [10 10 20 20 15];
object_data.section(1).map(4).color = [0 0 0];
object_data.section(1).map(4).restitution = 0;
object_data.section(1).map(4).invmass = 0;
object_data.section(1).map(4).position = [110 5];
object_data.section(1).map(4).velocity = [0 0];
object_data.section(1).map(4).angularVelocity = 0;
object_data.section(1).map(4).invInertia = 0;
object_data.section(1).map(4).static_friction = 0.1;
object_data.section(1).map(4).dynamic_friction = 0.05;

object_data.section(1).map(5).x = [0 300 300 0];
object_data.section(1).map(5).y = [0 0 10 10];
object_data.section(1).map(5).color = [0 0 0];
object_data.section(1).map(5).restitution = 0;
object_data.section(1).map(5).invmass = 0;
object_data.section(1).map(5).position = [110 5];
object_data.section(1).map(5).velocity = [0 0];
object_data.section(1).map(5).angularVelocity = 0;
object_data.section(1).map(5).invInertia = 0;
object_data.section(1).map(5).static_friction = 0.1;
object_data.section(1).map(5).dynamic_friction = 0.05;

object_data.section(1).map(6).x = [110 130 130 110];
object_data.section(1).map(6).y = [30 30 35 35];
object_data.section(1).map(6).color = [0 0 0];
object_data.section(1).map(6).restitution = 0;
object_data.section(1).map(6).invmass = 0;
object_data.section(1).map(6).position = [110 5];
object_data.section(1).map(6).velocity = [0 0];
object_data.section(1).map(6).angularVelocity = 0;
object_data.section(1).map(6).invInertia = 0;
object_data.section(1).map(6).static_friction = 0.1;
object_data.section(1).map(6).dynamic_friction = 0.05;

object_data.section(1).map(7).x = [160 200 200 160];
object_data.section(1).map(7).y = [50 50 55 55];
object_data.section(1).map(7).color = [0 0 0];
object_data.section(1).map(7).restitution = 0;
object_data.section(1).map(7).invmass = 0;
object_data.section(1).map(7).position = [110 5];
object_data.section(1).map(7).velocity = [0 0];
object_data.section(1).map(7).angularVelocity = 0;
object_data.section(1).map(7).invInertia = 0;
object_data.section(1).map(7).static_friction = 0.1;
object_data.section(1).map(7).dynamic_friction = 0.05;

object_data.section(1).map(8).x = [180 240 240 180];
object_data.section(1).map(8).y = [0 0 10 10];
object_data.section(1).map(8).color = [0 0 0];
object_data.section(1).map(8).restitution = 0;
object_data.section(1).map(8).invmass = 0;
object_data.section(1).map(8).position = [110 5];
object_data.section(1).map(8).velocity = [0 0];
object_data.section(1).map(8).angularVelocity = 0;
object_data.section(1).map(8).invInertia = 0;
object_data.section(1).map(8).static_friction = 0.1;
object_data.section(1).map(8).dynamic_friction = 0.05;




%movable object reset
object_data.movable(1).x = [-2 2 4 2 -2 -3];
object_data.movable(1).y = [-2 -2 0 4 4 1];
object_data.movable(1).color = [0.5 0.5 0.5];
object_data.movable(1).restitution = 0;
object_data.movable(1).invmass = 0;
object_data.movable(1).position = [160 22];
object_data.movable(1).velocity = [0 0];
object_data.movable(1).angularVelocity = 0;
object_data.movable(1).invInertia = 0.1;
object_data.movable(1).invmass = 0.1;
object_data.movable(1).static_friction = 0.1;
object_data.movable(1).dynamic_friction = 0.05;



object_data.movable(2).x = [-2 2 4 2 -2 -3];
object_data.movable(2).y = [-2 -2 0 4 4 1];
object_data.movable(2).color = [0.5 0.5 0.5];
object_data.movable(2).restitution = 0;
object_data.movable(2).invmass = 0;
object_data.movable(2).position = [26 32];
object_data.movable(2).velocity = [0 0];
object_data.movable(2).angularVelocity = 0;
object_data.movable(2).invInertia = 0.1;
object_data.movable(2).invmass = 0.1;
object_data.movable(2).static_friction = 0.1;
object_data.movable(2).dynamic_friction = 0.05;

%movable object reset
object_data.movable(3).x = [-2 2 4 2 -2 -3];
object_data.movable(3).y = [-2 -2 0 4 4 1];
object_data.movable(3).color = [0.5 0.5 0.5];
object_data.movable(3).restitution = 0;
object_data.movable(3).invmass = 0;
object_data.movable(3).position = [165 22];
object_data.movable(3).velocity = [0 0];
object_data.movable(3).angularVelocity = 0;
object_data.movable(3).invInertia = 0.1;
object_data.movable(3).invmass = 0.1;
object_data.movable(3).static_friction = 0.1;
object_data.movable(3).dynamic_friction = 0.05;

%movable object reset
object_data.movable(4).x = [-2 2 4 2 -2 -3];
object_data.movable(4).y = [-2 -2 0 4 4 1];
object_data.movable(4).color = [0.5 0.5 0.5];
object_data.movable(4).restitution = 0;
object_data.movable(4).invmass = 0;
object_data.movable(4).position = [170 22];
object_data.movable(4).velocity = [0 0];
object_data.movable(4).angularVelocity = 0;
object_data.movable(4).invInertia = 0.1;
object_data.movable(4).invmass = 0.1;
object_data.movable(4).static_friction = 0.1;
object_data.movable(4).dynamic_friction = 0.05;

%movable object reset
object_data.movable(5).x = [-2 2 4 2 -2 -3];
object_data.movable(5).y = [-2 -2 0 4 4 1];
object_data.movable(5).color = [0.5 0.5 0.5];
object_data.movable(5).restitution = 0;
object_data.movable(5).invmass = 0;
object_data.movable(5).position = [175 22];
object_data.movable(5).velocity = [0 0];
object_data.movable(5).angularVelocity = 0;
object_data.movable(5).invInertia = 0.1;
object_data.movable(5).invmass = 0.1;
object_data.movable(5).static_friction = 0.1;
object_data.movable(5).dynamic_friction = 0.05;


%% map 가시 reset

%map 가시 reset
object_data.section(1).spine(1).x = [100 150 150 100];
object_data.section(1).spine(1).y = [10 10 15 15];
object_data.section(1).spine(1).color = [1 0 0];


object_data.section(1).spine(2).x = [200 220 220 200];
object_data.section(1).spine(2).y = [10 10 14 14];
object_data.section(1).spine(2).color = [1 0 0];

object_data.section(1).spine(3).x = [200 300 300 200];
object_data.section(1).spine(3).y = [55 55 60 60];
object_data.section(1).spine(3).color = [1 0 0];

object_data.section(1).spine(4).x = [210 300 300 210];
object_data.section(1).spine(4).y = [0 0 5 5];
object_data.section(1).spine(4).color = [1 0 0];


%map 가시 event
object_data.section(1).event(1).x = [150 155 155 150];
object_data.section(1).event(1).y = [20 20 25 25];
object_data.section(1).event(1).color = [1 1 0];
object_data.section(1).event(1).Status = false;
object_data.section(1).event(1).Ready = true;

object_data.section(1).event(2).x = [295 300 300 295];
object_data.section(1).event(2).y = [20 20 25 25];
object_data.section(1).event(2).color = [1 1 0];
object_data.section(1).event(2).Status = false;
object_data.section(1).event(2).Ready = true;


%% player_object_reset
object_data.player.x = [-2 2 2 -2];
object_data.player.y = [-2 -2 2 2];
object_data.player.color = [0 1 0];

object_data.player.position = [10 32];
object_data.player.velocity = [0 0];
object_data.player.angularVelocity = 0;
object_data.player.invmass = 0.1;
object_data.player.invInertia = 0.001;
object_data.player.restitution = 0;
object_data.player.static_friction = 0.1;
object_data.player.dynamic_friction = 0.05;



object_value.save(1).position = [10 32];


%enemy object reset
object_data.enemy(1).x = [-2 2 2 -2];
object_data.enemy(1).y = [-2 -2 2 2];
object_data.enemy(1).color = [0 0 1];
object_data.enemy(1).restitution = 0;
object_data.enemy(1).invmass = 0;
object_data.enemy(1).position = [97 22];
object_data.enemy(1).velocity = [0 0];
object_data.enemy(1).angularVelocity = 0;
object_data.enemy(1).invInertia = 0.001;
object_data.enemy(1).invmass = 0.1;
object_data.enemy(1).static_friction = 0.1;
object_data.enemy(1).dynamic_friction = 0.05;



object_data.enemy(2).x = [-2 2 2 -2];
object_data.enemy(2).y = [-2 -2 2 2];
object_data.enemy(2).color = [0 0 1];
object_data.enemy(2).restitution = 0;
object_data.enemy(2).invmass = 0;
object_data.enemy(2).position = [90 22];
object_data.enemy(2).velocity = [0 0];
object_data.enemy(2).angularVelocity = 0;
object_data.enemy(2).invInertia = 0.001;
object_data.enemy(2).invmass = 0.1;
object_data.enemy(2).static_friction = 0.1;
object_data.enemy(2).dynamic_friction = 0.05;



object_value.drawed = false;
force = [0 0];


