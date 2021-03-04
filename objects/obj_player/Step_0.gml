//controls
if(!is_controlled_by_internet) {
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	jump = keyboard_check_pressed(vk_space);
	sprint = keyboard_check_pressed(vk_shift);
	hover = keyboard_check_pressed(ord("C"));
}
moveh = right - left;
movev = down - up;

grounded = place_meeting(x,y,obj_ground_check);
on_wall = place_meeting(x,y,obj_wall_check);

//action switching
switch(action_state){
	case action_states.walking:
		if(sprint && moveh != 0) {
			action_state = action_states.running;
		
		} else if(land_buffer > 0) {
			action_state = action_states.jumping;
		}
		
		break;
		
	case action_states.running:
		if(sprint || moveh != last_moveh) {
			action_state = action_states.walking;
		
		} else if(land_buffer > 0) {
			action_state = action_states.jumping;
		}
		
		break;
		
	case action_states.jumping:
		if(grounded && phy_linear_velocity_y > 0) {
			action_state = action_states.walking;
		
		} else if(sprint) {
			action_state = action_states.flying;
		
		} else if(hover) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			action_state = action_states.hovering;
		
		} else if(phy_linear_velocity_y > 0){
			action_state = action_states.falling;
		}
		
		break;
		
	case action_states.flying:
		sprite_index = sprite_indexes[1];
		if(land_buffer > 0) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			action_state = action_states.falling;
			current_jumps = 0;
		
		} else if(hover) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			action_state = action_states.hovering;
		
		} else if(grounded) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			action_state = action_states.walking;
		
		} else if(suit_heat >= 1){
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			action_state = action_states.falling;
		
		} else if(on_wall){
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			action_state = action_states.hovering;
		}
		
		break;
		
	case action_states.hovering:
		if(land_buffer > 0) {
			action_state = action_states.falling;
			current_jumps = 0;
		
		} else if(sprint){
			phy_rotation = last_direction ? 170 : 0;
			show_debug_message(phy_rotation);
			action_state = action_states.flying;
		
		} else if(suit_heat >= 1){
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			action_state = action_states.falling;
		}
		break;
		
	case action_states.falling:
		if(sprint) {
			action_state = action_states.flying;
		
		} else if(grounded) {
			action_state = action_states.walking;
			
		} else if(current_jumps > 0 && land_buffer > 0){
			action_state = action_states.jumping;
		}
		
		break;
}

//handling action
script_execute(action_scripts[action_state]);
if(grounded && phy_linear_velocity_y > 0) {
	current_jumps = max_jumps;
	jump_buffer = max_jump_buffer;
} else if(jump_buffer > 0) {
	jump_buffer --;
}

if(jump){
	land_buffer = max_land_buffer;
}else if(land_buffer > 0){
	land_buffer --;
}

//last of all--------------------------------------------
last_moveh = moveh;
if(moveh != 0 && action_state != action_states.flying){
	last_direction = moveh;
}