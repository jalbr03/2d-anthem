// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function particle_type_creat(col, shape, size, size_change_spd, min_spd, max_spd, dir, rand_dir_min, rand_dir_max, wigle){
	var particle = part_type_create();
	part_type_shape(particle, shape);            //This defines the particles shape
	part_type_size(particle, size/2, size, size_change_spd, 0);                    //This is for the size
	part_type_color1(particle, col);                  //This sets its colour. There are three different codes for this
	part_type_alpha1(particle, 1);                        //This is its alpha. There are three different codes for this
	part_type_speed(particle, min_spd, max_spd, -0.10, 0);            //The particles speed
	part_type_direction(particle, dir+rand_dir_min, dir+rand_dir_max, 0, wigle);            //The direction
	part_type_orientation(particle, 0, 90, 0, 0, true);        //This changes the rotation of the particle
	part_type_blend(particle, 1);                         //This is the blend mode, either additive or normal
	part_type_life(particle, 30, 120);                       //this is its lifespan in steps</pre>
	return particle;
}


function room_switch_fade(room_to_goto){
	static fade = 0;
	fade += 0.01;
	if(fade >= 1){
		room_goto(room_to_goto);
		fade = 0;
	}
	draw_sprite_ext(obj_pixel,0,0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0,0,fade);
}