/// @desc Damage around an orb
/// @arg instance

with(instance_create_layer(argument0.x, argument0.y, "Instances", obj_damage_field)) {
	stick_to_object = argument0;
	controller = argument0.controller;
	spawn_time = 0.05;
	life_time = spawn_time + 0.1;
	size = 2.0;
	damage = 0.25;
}