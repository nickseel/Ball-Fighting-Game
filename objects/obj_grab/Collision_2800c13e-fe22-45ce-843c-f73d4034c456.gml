/// @desc Set orb control to player

if(alive) {
	if(active) {
		if(other.orb_movement_state == OrbMovementState.FREE ||
				other.orb_movement_state == OrbMovementState.LAUNCHING) {
			other.controller = controller;
			other.orb_movement_state = OrbMovementState.RETURNING;
		}
	} else {
		alive = false;
		timer = 0;
	}
}