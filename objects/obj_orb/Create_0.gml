/// @desc Initialize variables and enums

enum OrbMovementState {
	FREE,
	ORBITING,
	LAUNCHING,
	RETURNING
}

movement_data = array_create(2);

// Inherit the parent event
event_inherited();

