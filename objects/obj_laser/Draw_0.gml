/// @desc ?

x = source.x;
y = source.y;

var angle = arctan2(controller.laser_target_y - y, controller.laser_target_x - x);
x_dir = cos(angle);
y_dir = sin(angle);
image_angle = angle * (-180 / pi);

image_index = 2;
draw_self();
image_index = 0;
for(var i = 0; i < 40; i++) {
	x += 32 * x_dir;
	y += 32 * y_dir;
	if(IsColliding(collision_tilemap, x + (16 * x_dir), y + (16 * y_dir), false) != 999) {
		while(IsColliding(collision_tilemap, x + (16 * x_dir), y + (16 * y_dir), false) != 999) {
			x -= x_dir;
			y -= y_dir;
		}
		break;
	}
	draw_self();
}
draw_self();
image_index = 2;
x += 8 * x_dir;
y += 8 * y_dir;
draw_self();