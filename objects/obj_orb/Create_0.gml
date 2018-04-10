/// @desc Initialize variables and enums

enum OrbMovementState {
	FREE,
	ORBITING,
	LAUNCHING,
	RETURNING,
	TELEPORTING
}

movement_data = array_create(2);
health_pct = max_health_pct;

// Inherit the parent event
event_inherited();

