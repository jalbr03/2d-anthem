//controls
if(!is_controlled_by_internet) {
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	jump = keyboard_check_pressed(vk_space);
	sprint = keyboard_check_pressed(vk_shift);
}
grounded = place_meeting(x,y,obj_static);
moveh = right-left;
movev = up-down;

//movement switching
switch(movement_state){
	case movement_states.walking:
		if(sprint) {
			movement_state = movement_states.running;
		} else if(jump) {
			movement_state = movement_states.jumping;
		}
		
		break;
		
	case movement_states.running:
		if(sprint || moveh != last_moveh) {
			movement_state = movement_states.walking;
		} else if(jump) {
			movement_state = movement_states.jumping;
		}
		
		break;
		
	case movement_states.jumping:
		if(grounded) {
			movement_state = movement_states.walking;
		}
		if(sprint) {
			movement_state = movement_states.flying;
		}
		if(phy_linear_velocity_y > 0){
			movement_state = movement_states.falling;
		}
		
		break;
		
	case movement_states.flying:
		if(jump) {
			grv = normal_grv;
			movement_state = movement_states.falling;
		} else if(grounded) {
			grv = normal_grv;
			movement_state = movement_states.walking;
		}
		
		break;
		
	case movement_states.falling:
		if(sprint) {
			movement_state = movement_states.flying;
		} else if(grounded) {
			movement_state = movement_states.walking;
		}
		
		break;
}

//handling movement
script_execute(movement_scripts[movement_state]);


//jumping


//last of all--------------------------------------------
last_moveh = moveh;