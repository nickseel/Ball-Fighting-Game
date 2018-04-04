/// @desc Shoot bullets from each orb
/// @arg controller
/// @arg target x
/// @arg target y
/// @arg timer
/// @arg timer max

var shoot_timer = argument3;
var shoot_timer_max = argument4;
	
if(true) {
	//Staggered
	var prev_shoot_timer = shoot_timer - delta;
		
	for(var i = 0; i < ds_list_size(argument0.orbs); i++) {
		
		var orb = ds_list_find_value(argument0.orbs, i)
		var n = ((orb.orb_index+0.5) / argument0.num_orbs) * shoot_timer_max;
		
		show_debug_message(string(n) + "  " + string(argument3));
		if(shoot_timer >= n && prev_shoot_timer < n) {
			var bullet = instance_create_layer(orb.x, orb.y, "Instances", obj_bullet);
			var angle = arctan2(argument2 - orb.y, argument1 - orb.x);
			bullet.x_dir = cos(angle);
			bullet.y_dir = sin(angle);
			bullet.image_angle = angle * (-180 / pi);
			bullet.controller = argument0;
		}
	}
		
} else {
	//All at once
	if(shoot_timer >= shoot_timer_max) {
		shoot_timer -= shoot_timer_max;
		for(var i = 0; i < ds_list_size(argument0.orbs); i++) {
			//show_debug_message(bullet);
			var orb = ds_list_find_value(argument0.orbs, i)
			var bullet = instance_create_layer(orb.x, orb.y, "Instances", obj_bullet);
			var angle = arctan2(argument2 - orb.y, argument1 - orb.x);
			bullet.target_x = argument1;
			bullet.target_y = argument2;
			bullet.x_dir = cos(angle);
			bullet.y_dir = sin(angle);
			bullet.image_angle = angle * (-180 / pi);
			bullet.controller = argument0;
		}
	}
}