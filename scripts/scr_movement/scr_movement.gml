// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_walking() {
	if(grv != normal_grv) grv = normal_grv;
	if(suit_heat > 0) suit_heat -= suit_cooldown_spd;
	phy_linear_velocity_x = lerp(phy_linear_velocity_x, top_walking_spd*moveh, acc_spd);
}

function scr_running() {
	if(grv != normal_grv) grv = normal_grv;
	if(suit_heat > 0) suit_heat -= suit_cooldown_spd;
	phy_linear_velocity_x = lerp(phy_linear_velocity_x, top_running_spd*moveh, acc_spd/2);
}

function scr_jumping() {
	if(grv != normal_grv) grv = normal_grv;
	
	if(land_buffer > 0 && (jump_buffer > 0 || current_jumps > 0)) {
		phy_linear_velocity_y = -jump_height;
		if(!jump_buffer > 0) {
			phy_linear_velocity_x = abs(phy_linear_velocity_x)*moveh;
			current_jumps --;
		}
	}else{
		phy_linear_velocity_x = lerp(phy_linear_velocity_x, phy_linear_velocity_x+top_inair_spd*moveh, acc_spd/10);
	}
	jump_buffer = 0;
	land_buffer = 0;
}

function scr_hovering() {
	suit_heat += suit_heatup_spd*3;
	grv = flying_grv;
	phy_linear_velocity_y = 0;
	phy_linear_velocity_x = lerp(phy_linear_velocity_x, top_inair_spd*moveh, acc_spd);
	
	part_particles_create(global.P_System, x+thruster_xoffset*last_direction, y+thruster_yoffset, global.particle_player_pack,10);
}

function scr_flying() {
	suit_heat += suit_heatup_spd;
	grv = flying_grv;
	phy_linear_velocity_y = lerp(phy_linear_velocity_y, flying_vertical_spd*movev, acc_spd);
	phy_linear_velocity_x = lerp(phy_linear_velocity_x, flying_spd*last_direction, acc_spd/2);
	
	var target_angle = -point_direction(x,y,x+phy_linear_velocity_x/2,y+phy_linear_velocity_y)+90;
	var angle_diff = angle_difference(phy_rotation, target_angle);
	phy_rotation -= angle_diff * rotation_speed;

	image_xscale = sign(y-(y+lengthdir_y(10,phy_rotation)));
	
	if(image_xscale < 0) {
		part_particles_create(global.P_System, x+thruster_xoffset, y+thruster_yoffset, global.particle_player_pack_L,10);
	} else {
		part_particles_create(global.P_System, x-thruster_xoffset, y+thruster_yoffset, global.particle_player_pack_R,10);
	}
	
	if(moveh == sign(phy_linear_velocity_x)) {
		flying_spd = top_fast_fly;
	} else if(moveh == 0) {
		flying_spd = top_medium_fly;
	}
}

function scr_falling() {
	if(grv != normal_grv) grv = normal_grv;
	
}
