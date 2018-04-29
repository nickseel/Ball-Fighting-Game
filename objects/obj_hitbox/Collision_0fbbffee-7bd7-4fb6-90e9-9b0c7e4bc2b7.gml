/// @desc Handle any collision with another hitbox

if(other != self) {
	if(ds_list_find_index(objects_collided_with, other) == -1) {
		
		switch(self.hitbox_controller.hitbox_controller_type) {
			#region self type is controller
			case HitboxControllerType.CONTROLLER:
			switch(other.hitbox_controller.hitbox_controller_type) {
				#region controller x controller
				case HitboxControllerType.CONTROLLER:
				if(self < other) {
					
				}
				break;
				#endregion
				#region controller x orb
				case HitboxControllerType.ORB:
				if(self.hitbox_controller != other.hitbox_controller.orb_controller) {
					
					var orb_controller = self.hitbox_controller;
					var orb = other.hitbox_controller;
					
					if(orb.orb_movement_state == OrbMovementState.LAUNCHING) {
						#region Launching
						if(orb.orb_controller != noone && orb.orb_controller != orb_controller) {
							if(ds_list_find_index(objects_collided_with, orb) == -1) {
								ds_list_add(objects_collided_with, orb);
								ds_list_add(same_collision_timers, time_between_same_collision);
								
								#region Knockback
								var angle = arctan2(orb.y - orb_controller.y, orb.x - orb_controller.x);
								var orb_vel = sqrt(sqr(orb.x_vel) + sqr(orb.y_vel));
								orb.orb_movement_state = OrbMovementState.FREE;
								//other.x_vel *= -1;
								orb.x_vel = orb.bounce * orb_vel * cos(angle);
								orb.y_vel = orb.bounce * orb_vel * sin(angle);
								orb_controller.x_vel -= orb.x_vel;
								orb_controller.y_vel -= orb.y_vel;
								#endregion
								#region Damage/kill
								show_debug_message("damage 25%");
								orb_controller.health_pct -= 0.25;
								show_debug_message("health " + string(orb_controller.health_pct));
								
								if(orb_controller.health_pct <= 0) {
									instance_destroy(orb_controller);
								}
								#endregion
							}
						}
						#endregion
					} else if(orb.orb_movement_state == OrbMovementState.ORBITING) {
						#region Saw
						/*if(other.controller != noone && other.controller != self && other.controller.saw_timer > 0.5) {
		
							if(ds_list_find_index(objects_collided_with, other) == -1) {
								ds_list_add(objects_collided_with, other);
								ds_list_add(same_collision_timers, time_between_same_collision);
			
								show_debug_message("damage 5%");
								health_pct -= 0.05;
								show_debug_message("health " + string(health_pct));
								if(health_pct <= 0) {
									event_user(0); //Kill
								}
							}
						}*/
						#endregion
					}
				}
				break;
				#endregion
			}
			break;
			#endregion
			#region self type is orb
			case HitboxControllerType.ORB:
			switch(other.hitbox_controller.hitbox_controller_type) {
				#region orb x controller
				case HitboxControllerType.CONTROLLER:
				{
					
				}
				break;
				#endregion
				#region orb x orb
				case HitboxControllerType.ORB:
				if(self < other) {
					
				}
				break;
				#endregion
			}
			#endregion
		}
	}
}