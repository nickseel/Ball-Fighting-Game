/// @desc Increment timer

var prev_timer = timer;
if(alive) {
	timer += delta;
}

if(prev_timer == 0) {
	image_speed = (num_frames / spawn_time) / base_fps;
	image_index = 0;
	active = false;
}

if(timer > spawn_time && prev_timer < spawn_time) {
	active = true;
}

if(timer > life_time && prev_timer < life_time) {
	alive = false;
	timer = 0;
}