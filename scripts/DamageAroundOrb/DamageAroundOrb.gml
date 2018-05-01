/// @desc Damage around an orb
/// @arg instance

with(instance_create_layer(argument0.x, argument0.y, "Instances", obj_circ_hitbox)) {
	hitbox_controller = argument0;
	hitbox_type = HitboxType.CIRC_TEMP;
	spawn_time = 0.05;
	lifetime = spawn_time + 0.1;
	x_size = 64 * 2.0;
	y_size = 64 * 2.0;
	damage = 0.25;
}