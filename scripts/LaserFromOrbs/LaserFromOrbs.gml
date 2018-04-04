/// @desc Shoot bullets from each orb
/// @arg controller
/// @arg target x
/// @arg target y

with(argument0) {
	shoot_timer += delta;
	if(true) {
		//All at once
		if(shoot_timer >= shoot_timer_max) {
			shoot_timer -= shoot_timer_max;
			for(var i = 0; i < ds_list_size(orbs); i++) {
				//show_debug_message(bullet);
				var orb = ds_list_find_value(orbs, i)
				var laser = instance_create_layer(orb.x, orb.y, "Instances", obj_laser);
				var angle = arctan2(argument2 - orb.y, argument1 - orb.x);
				laser_target_x = argument1;
				laser_target_y = argument2;
				laser.controller = self;
				laser.source = orb;
			}
		}
	}
}