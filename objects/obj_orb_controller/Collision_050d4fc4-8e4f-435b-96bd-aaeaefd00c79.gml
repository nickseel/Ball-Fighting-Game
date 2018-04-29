/// @desc Collide
/*
	if(other.controller != noone && other.controller != self) {
		
		if(ds_list_find_index(objects_collided_with, other) == -1) {
			ds_list_add(objects_collided_with, other);
			ds_list_add(same_collision_timers, time_between_same_collision);
			
			show_debug_message("damage " + string(round(other.damage * 100)) + "%");
			health_pct -= other.damage;
			show_debug_message("health " + string(health_pct));
			if(health_pct <= 0) {
				event_user(0); //Kill
			}
		}
	}
*/