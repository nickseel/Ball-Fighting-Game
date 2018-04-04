/// @desc Checks if a point is in a wall, returns distance inside wall
/// @arg tilemap
/// @arg x_pos
/// @arg y_pos
/// @arg vertical

var tile = tilemap_get_at_pixel(argument0, argument1, argument2);

if(tile > 0) {
	var collision_box = collision_boxes[tile];
	
	var tile_x = argument1 mod TILE_SIZE;
	var tile_y = argument2 mod TILE_SIZE;
	
	//show_debug_message(string(tile_x) + " " + string(tile_y) + "   " +
	//		string(collision_box[0]) + " " + string(collision_box[1]));
	
	if(tile_x >= collision_box[0] && tile_y >= collision_box[1] &&
			tile_x <= collision_box[2] && tile_y <= collision_box[3]) {
				
		if(argument3) {
			//vertical
			return min(tile_y - collision_box[1], collision_box[3] - tile_y);
		} else {
			//horizontal
			return min(tile_x - collision_box[0], collision_box[2] - tile_x);
		}
	}
	
	return 999;
} else {
	return 999;
}
