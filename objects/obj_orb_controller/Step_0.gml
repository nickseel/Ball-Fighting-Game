/// @desc Use abilities

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
			if(ability_inputs[i] && !prev_ability_inputs[i])
				LaunchOrb(self, mouse_x, mouse_y);
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
				TeleportOrb(self, mouse_x, mouse_y);
		}
		break;
		#endregion
		#region Damage around
		case Abilities.DAMAGE_AROUND_ORB:
		{
			
		}
		break;
		#endregion
	}
	prev_ability_inputs[i] = ability_inputs[i];
}
#endregion

#region Tick collision timers
for(var i = ds_list_size(objects_collided_with)-1; i >= 0; i--) {
	var new_time = ds_list_find_value(same_collision_timers, i) - delta;
	
	//Check if timer is finished
	if(new_time <= 0) {
		//Delete item off collision blacklist
		ds_list_delete(same_collision_timers, i);
		ds_list_delete(objects_collided_with, i);
	} else {
		//Replace with lower timer
		ds_list_set(same_collision_timers, i, new_time);
	}
}
#endregion

//Rotate orbs
orb_rotation_speed = orb_rotation_speed_max / (num_orbs_orbiting + 1.5);
orb_rotation_angle += orb_rotation_speed * delta;

//Run movement and collision code
event_inherited();