#region Input and movement

switch(movement_state) {
	#region Free movement
	case MovementState.FREE:
	{
		//Don't move into a wall, allows for friction
		if(input_move_x != 0 && sign(input_move_x) == collide_horizontal) input_move_x = 0;
		if(input_move_y != 0 && sign(input_move_y) == collide_vertical) input_move_y = 0;
		
		//Calculate directional acceleration
		var frame_accel = delta * accel;
		var n = max(1, sqrt(abs(input_move_x) + abs(input_move_y)));
		var x_accel = frame_accel * input_move_x / n;
		var y_accel = frame_accel * input_move_y / n;
		
		//Calculate movement direction and magnitude
		var prev_angle = arctan2(y_vel, x_vel);
		var prev_total_vel = sqrt(sqr(x_vel) + sqr(y_vel));
		
		//Deccelerate if not moving
		if(has_friction) {
			if(input_move_x == 0 && input_move_y == 0 && prev_total_vel != 0) {
				//Slow down based on slide if not moving
				x_accel += -cos(prev_angle) * min(abs(x_vel), frame_accel / slide);
				y_accel += -sin(prev_angle) * min(abs(y_vel), frame_accel / slide);
			} else if(prev_total_vel > max_speed) {
				//Slow down if above max_speed
				x_accel += -cos(prev_angle) * min(abs(x_vel), frame_accel * 1);
				y_accel += -sin(prev_angle) * min(abs(y_vel), frame_accel * 1);
			}
		}
		
		//Add frame acceleration to velocity
		x_vel += x_accel;
		y_vel += y_accel;
		
		//Calculate new movement direction and magnitude
		var post_angle = arctan2(y_vel, x_vel);
		var post_total_vel = sqrt(sqr(x_vel) + sqr(y_vel));
		
		//Calculate change in angle
		var angle_diff = min(abs(prev_angle - post_angle), min(abs((prev_angle + (2*pi)) - post_angle), abs(prev_angle - (post_angle + (2*pi)))));
		
		//Check if above max speed and above previous speed
		//Basically, don't speed up if above max speed, but don't necessarily slow down
		//Also slows if above max speed and changing direction
		if(post_total_vel > prev_total_vel && post_total_vel > max_speed && has_friction) {
			var factor = (max(prev_total_vel, max_speed) * cos(angle_diff * 4)) / post_total_vel;
			x_vel *= factor;
			y_vel *= factor;
		}
	}
	break;
	#endregion
	#region Rolling
	/*case MovementState.ROLLING:
	{
		var factor = 1 / sqrt(abs(input_move_x) + abs(input_move_y));
		x_vel = input_move_x * max_speed * roll_speed_pct * factor;
		y_vel = input_move_y * max_speed * roll_speed_pct * factor;
	}
	break;*/
	#endregion
}


//Remove fractions from distance travelled
//Change in x and y are integers so position is also an integer
/*dx = dx_fraction + (x_vel * delta);
dy = dy_fraction + (y_vel * delta);

dx_fraction = dx - (floor(abs(dx)) * sign(dx));
dy_fraction = dy - (floor(abs(dy)) * sign(dy));
dx -= dx_fraction;
dy -= dy_fraction;*/
dx = x_vel * delta;
dy = y_vel * delta;


#endregion

#region Collision
var bbox_side;
var check;

//Check collision in multiple steps, if going fast
collide_horizontal = 0;
collide_vertical = 0;
var num_steps = ceil(2 * max(abs(dx), abs(dy)) / 32);
for(var i = 0; i < num_steps; i++) {
	dx_step = round(dx / num_steps);
	dy_step = round(dy / num_steps);
	
	//Horizontal collision
	if (x_vel >= 0) bbox_side = bbox_right + 1; else bbox_side = bbox_left;
	check = min(IsColliding(collision_tilemap, bbox_side + dx_step, bbox_top + 0.1, false),
				IsColliding(collision_tilemap, bbox_side + dx_step, bbox_bottom - 0.1, false));
	if(collide_center) check = min(check, IsColliding(collision_tilemap, bbox_side + dx_step, y, false));

	if(check != 999) {
		x += dx_step + (check * -sign(x_vel));
		//if(x_vel > 0) x++;
		collide_horizontal = sign(x_vel);
		
		dx = 0;
		dx_step = 0;
	}
	x += dx_step;
	
	
	//Vertical collision
	if (y_vel >= 0) bbox_side = bbox_bottom + 1; else bbox_side = bbox_top;
	check = min(IsColliding(collision_tilemap, bbox_left + 0.1, bbox_side + dy_step, true),
				IsColliding(collision_tilemap, bbox_right - 0.1, bbox_side + dy_step, true));
	if(collide_center) check = min(check, IsColliding(collision_tilemap, x, bbox_side + dy_step, true));

	if(check != 999) {
		y += dy_step + (check * -sign(y_vel));
		//if(y_vel < 0) y--;
		collide_vertical = sign(y_vel);
		
		dy = 0;
		dy_step = 0;
	}
	y += dy_step;
}

if(bounce > 0) {
	if(collide_horizontal != 0) {
		x_vel *= bounce * -1;
		y_vel *= bounce;
	}
	if(collide_vertical != 0) {
		x_vel *= bounce;
		y_vel *= bounce * -1;
	}
}


//Re apply fractions to position
/*x += x_fraction;
y += y_fraction;

//Store and remove fractions of position
//Position must be an integer
x_fraction = x - (floor(abs(x)) * sign(x));
y_fraction = y - (floor(abs(y)) * sign(y));
x -= x_fraction;
y -= y_fraction;*/

#endregion