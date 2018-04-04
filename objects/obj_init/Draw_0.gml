/// @desc Move past init room

if(room == room_init) {
	#region Init hitboxes for collision tiles
	//Top left x, y, then bottom right x, y
	{
		var s = TILE_SIZE;
		collision_boxes[0] = [];
		collision_boxes[1] = [0, 0, s, s];
		collision_boxes[2] = [0, 0, s, s/2];
		collision_boxes[3] = [0, s/2, s, s];

		collision_boxes[4] = [s/2, s/2, s, s];
		collision_boxes[5] = [0, s/2, s/2, s];
		collision_boxes[6] = [s/2, 0, s, s];
		collision_boxes[7] = [0, 0, s/2, s];

		collision_boxes[8] = [s/2, 0, s, s/2];
		collision_boxes[9] = [0, 0, s/2, s/2];
		collision_boxes[10] = [s/4, 0, s*(3/4), s/2];
		collision_boxes[11] = [s/4, s/2, s*(3/4), s];

		collision_boxes[12] = [s/4, s/4, s*(3/4), s*(3/4)];
		collision_boxes[13] = [0, 0, 0, 0];
		collision_boxes[14] = [0, s/4, s/2, s*(3/4)];
		collision_boxes[15] = [s/2, s/4, s, s*(3/4)];
	}
	#endregion
	
	room_goto_next();
}