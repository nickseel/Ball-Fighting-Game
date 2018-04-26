/// @desc Collide

if(other.orb_movement_state == OrbMovementState.LAUNCHING) {
	#region Launching
	if(other.controller != noone && other.controller != self) {
		if(ds_list_find_index(objects_collided_with, other) == -1) {
			ds_list_add(objects_collided_with, other);
			ds_list_add(same_collision_timers, time_between_same_collision);
			
			show_debug_message("damage 25%");
			health_pct -= 0.25;
			show_debug_message("health " + string(health_pct));
			if(health_pct <= 0) {
				event_user(0); //Kill
			}
			
			var angle = arctan2(other.y - y, other.x - x);
			var orb_vel = sqrt(sqr(other.x_vel) + sqr(other.y_vel));
			other.orb_movement_state = OrbMovementState.FREE;
			//other.x_vel *= -1;
			other.x_vel = other.bounce * orb_vel * cos(angle);
			other.y_vel = other.bounce * orb_vel * sin(angle);
			x_vel -= other.x_vel;
			y_vel -= other.y_vel;
		}
	}
	#endregion
} else if(other.orb_movement_state == OrbMovementState.ORBITING) {
	#region Saw
	if(other.controller != noone && other.controller != self && other.controller.saw_timer > 0.5) {
		
		if(ds_list_find_index(objects_collided_with, other) == -1) {
			ds_list_add(objects_collided_with, other);
			ds_list_add(same_collision_timers, time_between_same_collision);
			
			show_debug_message("damage 5%");
			health_pct -= 0.05;
			show_debug_message("health " + string(health_pct));
			if(health_pct <= 0) {
				event_user(0); //Kill
			}
			
			/*
			var angle = arctan2(other.y - y, other.x - x);
			var orb_vel = sqrt(sqr(other.x_vel) + sqr(other.y_vel));
			other.orb_movement_state = OrbMovementState.FREE;
			//other.x_vel *= -1;
			other.x_vel = other.bounce * orb_vel * cos(angle);
			other.y_vel = other.bounce * orb_vel * sin(angle);
			x_vel -= other.x_vel;
			y_vel -= other.y_vel;
			*/
		}
	}
	#endregion
}