/// @desc ?
x += x_dir * vel * delta;
y += y_dir * vel * delta;

if(IsColliding(collision_tilemap, x, y, false != 999)) {
	//show_debug_message("hi");
	//instance_destroy();
}