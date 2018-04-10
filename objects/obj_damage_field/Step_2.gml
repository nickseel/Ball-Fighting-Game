/// @desc Move object, tick life timer

x = stick_to_object.x;
y = stick_to_object.y;

spawn_time -= delta;
if(spawn_time <= 0) {
	alive = true;
}

if(alive) {
	image_xscale = size;
	image_yscale = size;
} else {
	image_xscale = 0;
	image_yscale = 0;
}

life_time -= delta;
if(life_time <= 0) {
	instance_destroy();
}

//Objects lower will be shown in front
depth = round(-y * 4);