/// @desc Takes an enemy, moves and attacks with it.
/// @arg enemy

with(argument0) {
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
}