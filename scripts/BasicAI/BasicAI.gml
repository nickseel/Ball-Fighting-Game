/// @desc Takes an enemy, moves and attacks with it.
/// @arg enemy

/*

	AI Variables:
 0	 change direction timer
 1   change direction timer max
 2   current direction
 3   launch orb timer
 4   return orb timer

	AI Abilities:
 0	 launch orb
 1	 return orb

*/

with(argument0) {
	ability_inputs[0] = false;
	ability_inputs[1] = false;
	
	var player = obj_player;
	var distance_to_player = sqrt(sqr(player.x - x) + sqr(player.y - y));
	var angle_to_player = arctan2(y - player.y, x - player.x);
	
	#region Movement
	AI_variables[0] += delta;
	if(AI_variables[0] > AI_variables[1]) {
		AI_variables[0] = 0;
		AI_variables[1] = WeightedRandom(0.3, 1.5, 3);
		AI_variables[2] = choose(-1, -1, 0, 1, 1);
	}
	input_move_x = abs(AI_variables[2]) * cos(angle_to_player + ((pi/2) * AI_variables[2]));
	input_move_y = abs(AI_variables[2]) * sin(angle_to_player + ((pi/2) * AI_variables[2]));
	
	if(distance_to_player < 300) {
		input_move_x += 2 * cos(angle_to_player);
		input_move_y += 2 * sin(angle_to_player);
	} else if(distance_to_player < 400) {
		
	} else {
		input_move_x += -1 * cos(angle_to_player);
		input_move_y += -1 * sin(angle_to_player);
	}
	
	#endregion
	#region Attack
	
	AI_variables[3] -= delta;
	AI_variables[4] -= delta;
	
	if(AI_variables[3] <= 0) {
		AI_variables[3] = random_range(0.8, 2.0);
		
		ability_inputs[0] = true;
		cursor_position_x = player.x;
		cursor_position_y = player.y;
	}
	if(AI_variables[4] <= 0) {
		AI_variables[4] = random_range(1.0, 2.5);
		
		var done = false;
		for(var i = 0; i < ds_list_size(orbs); i++) {
			var orb = ds_list_find_value(orbs, i);
			if(orb.orb_movement_state == OrbMovementState.FREE) {
				done = true;
				
				ability_inputs[1] = true;
				cursor_position_x = orb.x;
				cursor_position_y = orb.y;
			}
		}
	}
	
	#endregion
}