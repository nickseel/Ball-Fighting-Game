/// @desc Adds an orb to a chosen orb controller
/// @arg controller

var orb = instance_create_layer(x, y, "Instances", obj_orb)
with(orb) {
	controller = argument0;
	image_index = argument0.color_index;
	orb_index = argument0.num_orbs_orbiting;
	orb_movement_state = OrbMovementState.ORBITING;
}
ds_list_add(argument0.orbs, orb);

argument0.num_orbs++;
argument0.num_orbs_orbiting++;