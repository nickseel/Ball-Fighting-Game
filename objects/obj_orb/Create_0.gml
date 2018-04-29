/// @desc Initialize variables and enums

movement_data = array_create(2);
health_pct = max_health_pct;

#region Create hitbox
var width = (sprite_get_bbox_right(spr_orb) -
	sprite_get_bbox_left(spr_orb)) / 1;
var height = (sprite_get_bbox_bottom(spr_orb) -
	sprite_get_bbox_top(spr_orb)) / 1;
hitbox = instance_create_layer(x, y, "Instances", obj_circ_hitbox);
hitbox.hitbox_controller = self;
hitbox.x_size = width*1;
hitbox.y_size = height*1;
#endregion

// Inherit the parent event
event_inherited();

