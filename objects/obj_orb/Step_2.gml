/// @desc Orbit around player

switch(orb_movement_state) {
	#region Orbiting
	case OrbMovementState.ORBITING:
	{
		orbiting_angle = orb_controller.orb_rotation_angle + ((orb_index / orb_controller.num_orbs_orbiting) * 2 * pi);
		var target_x = orb_controller.orb_rotation_distance * cos(orbiting_angle);
		var target_y = orb_controller.orb_rotation_distance * sin(orbiting_angle) * orb_controller.orb_rotation_distance_aspect_ratio;
		movement_data[0] += (target_x - movement_data[0]) / 4; //X relative to player
		movement_data[1] += (target_y - movement_data[1]) / 4; //Y relative to player
		x = orb_controller.x + movement_data[0];
		y = orb_controller.y + movement_data[1];
	}
	break;
	#endregion
}

event_inherited();