function reset_value
global object_data
global object_value


object_data.player.position = object_value.save(1).position;
object_data.player.velocity = [0 0];
object_data.player.angularVelocity = 0;

object_data.player.x = [-2 2 2 -2] + object_data.player.position(1);
object_data.player.y = [-2 -2 2 2] + object_data.player.position(2);

object_data.movable(1).position = [160 22];
object_data.movable(1).velocity = [0 0];
object_data.movable(1).angularVelocity = 0;

object_data.movable(2).position = [26 32];
object_data.movable(2).velocity = [0 0];
object_data.movable(2).angularVelocity = 0;



object_data.enemy(1).position = [97 22];
object_data.enemy(1).velocity = [0 0];
object_data.enemy(1).angularVelocity = 0;

object_data.enemy(2).position = [90 22];
object_data.enemy(2).velocity = [0 0];
object_data.enemy(2).angularVelocity = 0;

object_data.section(1).event(1).Status = false;
object_data.section(1).event(1).Ready = true;

object_data.section(1).event(2).Status = false;
object_data.section(1).event(2).Ready = true;