/// @desc Initialize ability variables and timers

#region Init ability data
num_abilities = array_length_1d(current_abilities);
ability_inputs = array_create(num_abilities, 0);
prev_ability_inputs = array_create(num_abilities, 0);
ability_timers = array_create(num_abilities);

for(var i = 0; i < num_abilities; i++) {
	switch(current_abilities[i]) {
		case Abilities.CREATE_ORB:
		case Abilities.LAUNCH_ORB:
		break;
		case Abilities.SHOOT_FROM_ORB:
		//ability_timers[i] = [0, 0.9];
		ability_timers[i, 0] = 0;
		ability_timers[i, 1] = 0.9;
		//show_debug_message(i);
		//show_debug_message(ability_timers[i, 1]);
		break;
	}
}
#endregion

#region Create hitbox
var width = (sprite_get_bbox_right(spr_player) -
	sprite_get_bbox_left(spr_player)) / 1;
var height = (sprite_get_bbox_bottom(spr_player) -
	sprite_get_bbox_top(spr_player)) / 1;
hitbox = instance_create_layer(x, y, "Instances", obj_sqr_hitbox);
hitbox.hitbox_controller = self;
hitbox.x_size = width*1;
hitbox.y_size = height*1;
#endregion

// Inherit the parent event
event_inherited();