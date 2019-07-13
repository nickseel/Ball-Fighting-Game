/// @desc Handle any collision with another hitbox

//show_debug_message(string(self.hitbox_controller) + " " + string(other.hitbox_controller));
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
				
				var orb_controller = self.hitbox_controller;
				var orb = other.hitbox_controller;
				
				if(other.hitbox_type == HitboxType.CIRC_TEMP) {
					#region Temp hitbox around orb
					if(orb.orb_controller != orb_controller) {
						ds_list_add(objects_collided_with, other);
						ds_list_add(same_collision_timers, time_between_same_collision);
						
						#region Knockback
						var angle = arctan2(orb.y - orb_controller.y, orb.x - orb_controller.x);
						orb_controller.x_vel += self.knockback * cos(angle);
						orb_controller.y_vel += self.knockback * sin(angle);
								
						#endregion
						#region Damage/kill
						show_debug_message("damage " + string(other.damage * 100) + "%");
						orb_controller.health_pct -= other.damage;
						show_debug_message("health " + string(orb_controller.health_pct));
								
						if(orb_controller.health_pct <= 0) {
							instance_destroy(orb_controller);
						}
						#endregion
					}
					#endregion
				} else {
					if(orb.orb_movement_state == OrbMovementState.FREE) {
						#region Free
						//Collision Version 1
						/*var angle = arctan2(orb.y - orb_controller.y, orb.x - orb_controller.x);
					
						var vel = (orb_controller.x_vel * cos(angle)) + (orb_controller.y_vel * sin(angle));
						vel = max(0, vel);
					
						var x_distance = (orb_controller.x - orb.x) * 1 / self.x_size;
						var y_distance = (orb_controller.y - orb.y) * 1 / self.y_size;
						var distance = max(0.1, sqrt(sqr(x_distance) + sqr(y_distance)));
						vel /= distance;
					
						orb.x_vel = vel * cos(angle);
						orb.y_vel = vel * sin(angle);*/
					
					
					
						//Version 2
						var x_distance = (orb.x - orb_controller.x) * 2 / self.x_size;
						var y_distance = (orb.y - orb_controller.y) * 2 / self.y_size;
						//(string(x_distance) + " " + string(y_distance));
					
					
						if(abs(x_distance) > 1 && abs(y_distance) > 1) {
							//corner
							var angle = arctan2(orb.y - orb_controller.y, orb.x - orb_controller.x);
							var vel = (orb_controller.x_vel * cos(angle)) + (orb_controller.y_vel * sin(angle));
							vel = max(0, vel);
							var x_vel = vel * cos(angle);
							var y_vel = vel * sin(angle);
						
							if(abs(x_vel) > orb.x_vel) orb.x_vel = x_vel;
							if(abs(y_vel) > orb.y_vel) orb.y_vel = y_vel;
						} else {
							if(abs(x_distance) > abs(y_distance)) {
								//left or right
								var vel = max(0, orb_controller.x_vel / (x_distance * 0.5)) * sign(x_distance);
								if(abs(vel) > abs(orb.x_vel))
									orb.x_vel =  vel;
							} else {
								//up or down
								var vel = max(0, orb_controller.y_vel / (y_distance * 0.5)) * sign(y_distance);
								if(abs(vel) > abs(orb.y_vel))
									orb.y_vel =  vel;
							}
						}
						#endregion
						
					} else if(orb_controller != orb.orb_controller) {
						
						if(orb.orb_movement_state == OrbMovementState.LAUNCHING) {
							#region Launching
							if(orb.orb_controller != noone && orb.orb_controller != orb_controller) {
								if(ds_list_find_index(objects_collided_with, orb) == -1) {
									ds_list_add(objects_collided_with, orb);
									ds_list_add(same_collision_timers, time_between_same_collision);
								
									#region Knockback
									//var angle = arctan2(orb.y - orb_controller.y, orb.x - orb_controller.x);
									//var orb_vel = sqrt(sqr(orb.x_vel) + sqr(orb.y_vel));
									//var orb_controller_vel = sqrt(sqr(orb_controller.x_vel) + sqr(orb_controller.y_vel));
									orb.orb_movement_state = OrbMovementState.FREE;
								
								
								
									//Collisioni Version 1
									/*orb.x_vel = orb.bounce * orb_vel * cos(angle);
									orb.y_vel = orb.bounce * orb_vel * sin(angle);
									orb_controller.x_vel -= orb.x_vel / orb_controller.hitbox.weight;
									orb_controller.y_vel -= orb.y_vel / orb_controller.hitbox.weight;*/
								
								
								
									//Version 2
									var bounce = orb.bounce;
									var total_weight = self.weight + other.weight;
								
									var controller_mx = (orb_controller.x_vel * self.weight) / total_weight;
									var controller_my = (orb_controller.y_vel * self.weight) / total_weight;
									var orb_mx = (orb.x_vel * other.weight) / total_weight;
									var orb_my = (orb.y_vel * other.weight) / total_weight;
								
									orb_controller.x_vel += orb_mx * (1 + bounce);
									orb_controller.y_vel += orb_my * (1 + bounce);
									orb.x_vel = -bounce * orb.x_vel;
									orb.y_vel = -bounce * orb.y_vel;
								
								
								
									//Version 3
									/*var bounce = orb.bounce;
									var total_weight = self.weight + other.weight;
									var diff_weight = self.weight - other.weight;
								
									//orb.x_vel *= bounce;
									//orb.y_vel *= bounce;
								
									orb_controller.x_vel = ((diff_weight * orb_controller.x_vel) + (2 * other.weight * orb.x_vel)) / total_weight;
									orb_controller.y_vel = ((diff_weight * orb_controller.y_vel) + (2 * other.weight * orb.y_vel)) / total_weight;
									orb.x_vel = ((-diff_weight * orb.x_vel) + (2 * self.weight * orb_controller.x_vel)) / total_weight;
									orb.y_vel = ((-diff_weight * orb.y_vel) + (2 * self.weight * orb_controller.y_vel)) / total_weight;*/
								
								
									#endregion
									#region Damage/kill
									show_debug_message("damage " + string(other.damage * 100) + "%");
									orb_controller.health_pct -= other.damage;
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
				}
				break;
				#endregion
			}
			break;
			#endregion
			#region self type is orb
			case HitboxControllerType.ORB:
			switch(other.hitbox_controller.hitbox_controller_type) {
				#region orb x orb
				case HitboxControllerType.ORB:
				if(self.hitbox_controller < other.hitbox_controller) {
					var orb1 = self.hitbox_controller;
					var orb2 = other.hitbox_controller;
					
					
					if(orb1.orb_movement_state != OrbMovementState.ORBITING && orb2.orb_movement_state != OrbMovementState.ORBITING &&
							orb1.orb_movement_state != OrbMovementState.RETURNING && orb2.orb_movement_state != OrbMovementState.RETURNING) {
						if(orb1.orb_controller == orb2.orb_controller) {
							#region same controller
							/*if(orb1.orb_movement_state == OrbMovementState.FREE || orb2.orb_movement_state == OrbMovementState.FREE) {
								if(orb1.orb_movement_state == OrbMovementState.LAUNCHING) orb1.orb_movement_state = OrbMovementState.FREE;
								if(orb2.orb_movement_state == OrbMovementState.LAUNCHING) orb2.orb_movement_state = OrbMovementState.FREE;
						
								var bounce = 0.5;
								var dampen = 0.5;
						
								orb1.x_vel *= dampen;
								orb1.y_vel *= dampen;
								orb2.x_vel *= dampen;
								orb2.y_vel *= dampen;
						
								var total_x_vel = orb1.x_vel + orb2.x_vel;
								var total_y_vel = orb1.y_vel + orb2.y_vel;
						
								//var angle = arctan2(orb2.y - orb1.y, orb2.x - orb1.x);
								//var temp_vel_1 = 
						
								var temp_x_vel_1 = orb2.x_vel;
								var temp_y_vel_1 = orb2.y_vel;
								var temp_x_vel_2 = orb1.x_vel;
								var temp_y_vel_2 = orb1.y_vel;
						
								orb1.x_vel = (temp_x_vel_1 * bounce) + (total_x_vel * (1-bounce));
								orb1.y_vel = (temp_y_vel_1 * bounce) + (total_y_vel * (1-bounce));
								orb2.x_vel = (temp_x_vel_2 * bounce) + (total_x_vel * (1-bounce));
								orb2.y_vel = (temp_y_vel_2 * bounce) + (total_y_vel * (1-bounce));
						
								ds_list_add(objects_collided_with, other);
								ds_list_add(same_collision_timers, time_between_same_collision);
							} else {
							
							}*/
							#endregion
						} else {
							#region different controllers
							if(orb1.orb_movement_state == OrbMovementState.LAUNCHING) orb1.orb_movement_state = OrbMovementState.FREE;
							if(orb2.orb_movement_state == OrbMovementState.LAUNCHING) orb2.orb_movement_state = OrbMovementState.FREE;
						
							var bounce = 0.5;
							var dampen = 0.5;
						
							orb1.x_vel *= dampen;
							orb1.y_vel *= dampen;
							orb2.x_vel *= dampen;
							orb2.y_vel *= dampen;
						
							var total_x_vel = orb1.x_vel + orb2.x_vel;
							var total_y_vel = orb1.y_vel + orb2.y_vel;
						
							//var angle = arctan2(orb2.y - orb1.y, orb2.x - orb1.x);
							//var temp_vel_1 = 
						
							var temp_x_vel_1 = orb2.x_vel;
							var temp_y_vel_1 = orb2.y_vel;
							var temp_x_vel_2 = orb1.x_vel;
							var temp_y_vel_2 = orb1.y_vel;
						
							orb1.x_vel = (temp_x_vel_1 * bounce) + (total_x_vel * (1-bounce));
							orb1.y_vel = (temp_y_vel_1 * bounce) + (total_y_vel * (1-bounce));
							orb2.x_vel = (temp_x_vel_2 * bounce) + (total_x_vel * (1-bounce));
							orb2.y_vel = (temp_y_vel_2 * bounce) + (total_y_vel * (1-bounce));
						
							ds_list_add(objects_collided_with, other);
							ds_list_add(same_collision_timers, time_between_same_collision);
							#endregion
						}
					} else {
						/*if(orb1.orb_controller == orb2.orb_controller) {
							if(orb1.orb_movement_state == OrbMovementState.FREE && orb2.orb_movement_state == OrbMovementState.ORBITING) {
								orb1.orb_movement_state = OrbMovementState.ORBITING;
								orb1.orb_controller.num_orbs_orbiting++;
							} else if(orb2.orb_movement_state == OrbMovementState.FREE && orb1.orb_movement_state == OrbMovementState.ORBITING) {
								orb2.orb_movement_state = OrbMovementState.ORBITING;
								orb2.orb_controller.num_orbs_orbiting++;
							}
						}*/
					}
				}
				break;
				#endregion
			}
			break;
			#endregion
		}
	}
}