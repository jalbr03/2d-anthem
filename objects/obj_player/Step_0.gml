if(!is_controlled_by_internet) {
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	jump = keyboard_check(vk_space);
	sprint = keyboard_check_pressed(vk_shift);
}

var move = right-left;

switch(movement_state) {
	case movement_states.walking:
		phy_linear_velocity_x = lerp(phy_linear_velocity_x, top_walking_spd*move, acc_spd);
		break;
	case movement_states.running:
		phy_linear_velocity_x = lerp(phy_linear_velocity_x, top_running_spd*move, acc_spd);
		break;
}

if(sprint) {
	switch(movement_state){
		case movement_states.walking:
			movement_state = movement_states.running;
			break;
		case movement_states.running:
			movement_state = movement_states.walking;
			break;
	}
}

if(place_meeting(x,y,obj_static)) {
	jump_buffer = max_jump_buffer
} else if(jump_buffer > 0) {
	jump_buffer --;
}

if(jump) {
	land_buffer = max_land_buffer;
} else {
	is_jumping = false;
	land_buffer --;
}

if(land_buffer > 0 && jump_buffer > 0) {
	is_jumping = true;
	jump_time = max_jump_time;
	jump_buffer = 0;
	land_buffer = 0;
}
show_debug_message(jump_time)
if(is_jumping && jump_time > 0){
	phy_linear_velocity_y = -jump_height+jump_time;
	jump_time --;
}