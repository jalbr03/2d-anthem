// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_walking() {
	phy_linear_velocity_x = lerp(phy_linear_velocity_x, top_walking_spd*moveh, acc_spd);
}

function scr_running() {
	phy_linear_velocity_x = lerp(phy_linear_velocity_x, top_running_spd*moveh, acc_spd/2);
}

function scr_jumping() {
	phy_linear_velocity_x = lerp(phy_linear_velocity_x, phy_linear_velocity_x+top_inair_spd*moveh, acc_spd/10);
		
	if(grounded) {
		jump_buffer = max_jump_buffer
	} else if(jump_buffer > 0) {
		jump_buffer --;
	}
	if(jump > 0 && jump_buffer > 0) {
		phy_linear_velocity_y = -jump_height;
		jump_buffer = 0;
		land_buffer = 0;
	}
}

function scr_flying() {
	grv = flying_grv;
	phy_linear_velocity_y = 0;
	
}

function scr_falling() {

}
