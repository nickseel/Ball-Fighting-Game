/// @desc Adds an orb to a chosen orb controller
/// @arg controller

var orb = instance_create_layer(x, y, "Instances", obj_orb)
with(orb) {
	orb_controller = argument0;
	image_index = argument0.color_index;
	orb_index = argument0.num_orbs_orbiting;
	orb_movement_state = OrbMovementState.ORBITING;
}

if(ds_list_size(argument0.orbs) == 0) {
	ds_list_add(argument0.orbs, orb);
} else {
	ds_list_insert(argument0.orbs, irandom_range(0, ds_list_size(argument0.orbs)-1), orb);
}


for(var i = 0; i < ds_list_size(argument0.orbs); i++) {
	show_debug_message(string(i) + " " + string(ds_list_find_value(argument0.orbs, i)));
}

argument0.num_orbs++;
argument0.num_orbs_orbiting++;