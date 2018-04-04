/// @desc Take input, use abilities

#region Take input
if(player_controlled) {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	
	for(var i = 0; i < num_abilities; i++) {
		if(keyboard_check_pressed(ability_input_keys[i]) ||
				mouse_check_button_pressed(ability_input_keys[i] * -1)) {
			
			ability_inputs[i] = 1;
		} else if(keyboard_check_released(ability_input_keys[i]) ||
				mouse_check_button_released(ability_input_keys[i] * -1)) {
			
			ability_inputs[i] = 0;
		}
	}
	
	switch(movement_state) {
		case MovementState.FREE:
		{
			input_move_x = key_right - key_left;
			input_move_y = key_down - key_up;
		}
		break;
	}
}
#endregion

#region Use abilities
for(var i = 0; i < num_abilities; i++) {
	switch(current_abilities[i]) {
		#region Create orb
		case Abilities.CREATE_ORB:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i])
				AddOrb(self);
		}
		break;
		#endregion
		#region Launch orb
		case Abilities.LAUNCH_ORB:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i])
				LaunchOrb(self, mouse_x, mouse_y);
		}
		break;
		#endregion
		#region Shoot from orbs
		case Abilities.SHOOT_FROM_ORB:
		{
			ability_timers[i, 0] += delta;
			
			if(ability_inputs[i])
				ShootFromOrbs(self, mouse_x, mouse_y, ability_timers[i, 0], ability_timers[i, 1]);
				
			if(ability_timers[i, 0] >= ability_timers[i, 1]) 
				ability_timers[i, 0] -= ability_timers[i, 1];
		}
		break;
		#endregion
		#region Laser from orbs
		case Abilities.LASER_FROM_ORB:
		{
			ability_timers[i, 0] += delta;
			
			if(ability_inputs[i])
				LaserFromOrbs(self, mouse_x, mouse_y);
				
			if(ability_timers[i, 0] >= ability_timers[i, 1]) 
				ability_timers[i, 0] -= ability_timers[i, 1];
			
			var angle = arctan2(mouse_y - laser_target_y, mouse_x - laser_target_x);
			var distance = sqrt(sqr(mouse_y - laser_target_y) + sqr(mouse_x - laser_target_x));
			laser_target_x += cos(angle) * min(distance, 2.5);
			laser_target_y += sin(angle) * min(distance, 2.5);
		}
		break;
		#endregion
	}
	prev_ability_inputs[i] = ability_inputs[i];
}
#endregion

//Run movement/collision code
event_inherited();