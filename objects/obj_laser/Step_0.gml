/// @desc ?

timer += delta;

if(timer > active_time && !active) {
	active = true;
}

if(timer > life_time) {
	alive = false;
}