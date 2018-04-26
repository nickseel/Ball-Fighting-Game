/// @desc Init global variables

#macro TILE_SIZE 32;

globalvar collision_boxes;
globalvar collision_tilemap;

globalvar delta;
delta = 0;

enum Abilities {
	CREATE_ORB,
	LAUNCH_ORB,
	RETURN_ORB,
	SHOOT_FROM_ORB,
	LASER_FROM_ORB,
	TELEPORT_ORB,
	DAMAGE_AROUND_ORB,
	SAW,
	DASH
}