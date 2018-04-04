/// @desc Launch an orb
/// @arg controller
/// @arg target x
/// @arg target y

with(argument0) {
	if(num_orbs_orbiting > 0) {
		for(var i = ds_list_size(orbs) - 1; i >= 0; i--) {
			var orb = ds_list_find_value(orbs, i);
			if(orb.orb_movement_state == OrbMovementState.ORBITING) {
				with(orb) {
					orb_movement_state = OrbMovementState.LAUNCHING;
					
					orbiting_angle = ((orbiting_angle + pi) mod (2*pi)) - pi;
					//var angle = arctan2(mouse_y - y, mouse_x - x);
					//orbiting_angle = (orbiting_angle + angle) / 2;
					
					movement_data[0] = 0; //curve timer
					movement_data[1] = 0.3; //curve timer max
					movement_data[2] = 0; //acceleration timer
					movement_data[3] = 0.4; //acceleration timer max
					movement_data[4] = 2000; //max speed
					movement_data[5] = argument1; //target x
					movement_data[6] = argument2; //target y
					movement_data[7] = arctan2(argument2 - y, argument1 - x); //start angle
				}
				num_orbs_orbiting--;
				break;
			}
		}
	}
}