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
grounded = collision_line(x-sprite_width/2,y+sprite_height/2+10,x+sprite_width/2,y+sprite_height/2+10,obj_static,0,1)// place_meeting(x,y,obj_static);
on_wall = collision_line(x+sprite_width/2*moveh+10*moveh,y+sprite_height/3,x+sprite_width/2*moveh+10*moveh,y-sprite_height/3,obj_static,0,1)

//movement switching
switch(movement_state){
	case movement_states.walking:
		if(sprint && moveh != 0) {
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
		if(grounded && phy_linear_velocity_y > 0) {
			movement_state = movement_states.walking;
		
		} else if(sprint) {
			movement_state = movement_states.flying;
		
		} else if(hover) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			movement_state = movement_states.hovering;
		
		} else if(phy_linear_velocity_y > 0){
			movement_state = movement_states.falling;
		}
		
		break;
		
	case movement_states.flying:
		sprite_index = sprite_indexes[1];
		if(jump) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			movement_state = movement_states.falling;
		
		} else if(hover) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			movement_state = movement_states.hovering;
		
		} else if(grounded) {
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			movement_state = movement_states.walking;
		
		} else if(suit_heat >= 1){
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			movement_state = movement_states.falling;
		
		} else if(on_wall){
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			movement_state = movement_states.hovering;
		}
		show_debug_message(movement_state);
		
		break;
		
	case movement_states.hovering:
		if(jump) {
			movement_state = movement_states.falling;
		
		} else if(sprint){
			movement_state = movement_states.flying;
		
		} else if(suit_heat >= 1){
			sprite_index = sprite_indexes[0];
			phy_rotation = 0;
			movement_state = movement_states.falling;
		}
		show_debug_message(movement_state);
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

//last of all--------------------------------------------
last_moveh = moveh;
if(moveh != 0){
	last_direction = moveh;
}