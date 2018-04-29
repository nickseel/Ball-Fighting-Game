/// @desc Kill orb controller

show_debug_message("kill");
if(health_pct <= 0) {
	for(var i = 0; i < num_orbs; i++) {
		var orb = ds_list_find_value(orbs, 0);
		ds_list_delete(orbs, 0);
		instance_destroy(orb);
	}
	
	ds_list_destroy(orbs);
	ds_list_destroy(objects_collided_with);
	ds_list_destroy(same_collision_timers);
	
	instance_destroy();
}