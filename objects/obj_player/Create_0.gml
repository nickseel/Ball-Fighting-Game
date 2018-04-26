/// @desc Init abilities

current_abilities =
		[Abilities.CREATE_ORB,
		Abilities.LAUNCH_ORB,
		Abilities.SAW,
		Abilities.TELEPORT_ORB,
		Abilities.RETURN_ORB,
		Abilities.DASH];

ability_input_keys = 
		[-mb_right,
		-mb_left,
		vk_space,
		ord("Q"),
		ord("E"),
		vk_lshift];
//Mouse keys are negative to not interfere with keyboard


// Inherit the parent event
event_inherited();