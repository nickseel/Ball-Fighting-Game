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
			
			ability_inputs[i] = true;
		} else if(keyboard_check_released(ability_input_keys[i]) ||
				mouse_check_button_released(ability_input_keys[i] * -1)) {
			
			ability_inputs[i] = false;
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
	
	cursor_position_x = mouse_x;
	cursor_position_y = mouse_y;
}
#endregion

//Use abilities, run movement/collision code
event_inherited();