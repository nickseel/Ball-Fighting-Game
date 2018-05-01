/// @desc Use abilities
movement_speed_multiplier = 1;

#region Use abilities
for(var i = 0; i < num_abilities; i++) {
	switch(current_abilities[i]) {
		#region Create orb
		case Abilities.CREATE_ORB:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i])
				AddOrb(self);
		}
		break;
		#endregion
		#region Launch orb
		case Abilities.LAUNCH_ORB:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i]) {
				LaunchOrb(self, cursor_position_x, cursor_position_y);
			}
		}
		break;
		#endregion
		#region Return orb
		case Abilities.RETURN_ORB:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i]) {
				var distance = 200;
				var nearest_orb = noone;
				
				for(var j = 0; j < ds_list_size(orbs); j++) {
					var orb = ds_list_find_value(orbs, j);
					
					var d = sqrt(sqr(orb.x - cursor_position_x) + sqr(orb.y - cursor_position_y));
					if(d < distance && (orb.orb_movement_state == OrbMovementState.FREE ||
							orb.orb_movement_state == OrbMovementState.LAUNCHING)) {
						distance = d;
						nearest_orb = orb;
					}
				}
				
				//Use ability on nearest orb
				if(nearest_orb != noone) {
					ReturnOrb(nearest_orb);
				}
			}
		}
		break;
		#endregion
		#region Shoot from orbs
		case Abilities.SHOOT_FROM_ORB:
		{
			ability_timers[i, 0] += delta;
			
			if(ability_inputs[i])
				ShootFromOrbs(self, mouse_x, mouse_y, ability_timers[i, 0], ability_timers[i, 1]);
				
			if(ability_timers[i, 0] >= ability_timers[i, 1]) 
				ability_timers[i, 0] -= ability_timers[i, 1];
		}
		break;
		#endregion
		#region Laser from orbs
		case Abilities.LASER_FROM_ORB:
		{
			ability_timers[i, 0] += delta;
			
			if(ability_inputs[i])
				LaserFromOrbs(self, mouse_x, mouse_y);
				
			if(ability_timers[i, 0] >= ability_timers[i, 1]) 
				ability_timers[i, 0] -= ability_timers[i, 1];
			
			var angle = arctan2(mouse_y - laser_target_y, mouse_x - laser_target_x);
			var distance = sqrt(sqr(mouse_y - laser_target_y) + sqr(mouse_x - laser_target_x));
			laser_target_x += cos(angle) * min(distance, 2.5);
			laser_target_y += sin(angle) * min(distance, 2.5);
		}
		break;
		#endregion
		#region Teleport orb
		case Abilities.TELEPORT_ORB:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i])
				TeleportOrb(self, cursor_position_x, cursor_position_y);
		}
		break;
		#endregion
		#region Damage around
		case Abilities.DAMAGE_AROUND_ORB:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i]) {
				var distance = 200;
				var nearest_orb = noone;
				
				//show_debug_message(array_length_1d(orbs));
				for(var j = 0; j < ds_list_size(orbs); j++) {
					var orb = ds_list_find_value(orbs, j);
					
					var d = sqrt(sqr(orb.x - mouse_x) + sqr(orb.y - mouse_y));
					if(d < distance && orb.orb_movement_state != OrbMovementState.ORBITING) {
						distance = d;
						
						nearest_orb = orb;
					}
				}
				
				if(nearest_orb != noone) {
					DamageAroundOrb(nearest_orb);
				}
			}
		}
		break;
		#endregion
		#region Saw
		case Abilities.SAW:
		{
			if(ability_inputs[i]) {
				saw_timer = min(1, saw_timer + delta);
			} else {
				saw_timer = max(0, saw_timer - delta);
			}
			if(saw_timer > 0) {
				movement_speed_multiplier *= (1 - (saw_timer * 0.5));
			}
		}
		break;
		#endregion
		#region Dash
		case Abilities.DASH:
		{
			if(ability_inputs[i] && !prev_ability_inputs[i]) {
				var dir = arctan2(y_vel, x_vel);
				x_vel = max_speed * 3 * cos(dir);
				y_vel = max_speed * 3 * sin(dir);
			}
		}
		break;
		#endregion
	}
	prev_ability_inputs[i] = ability_inputs[i];
}
#endregion


//Rotate orbs
orb_rotation_speed = (orb_rotation_speed_max / ((num_orbs_orbiting * 0.8) + 2.5)) * (saw_timer * 5 + 1);
orb_rotation_angle += orb_rotation_speed * delta;

//Apply speed multiplier
max_speed = max_max_speed * movement_speed_multiplier;
accel = max_speed * 8;

//Run movement and collision code
event_inherited();