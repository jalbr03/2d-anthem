global.P_System = part_system_create_layer("Particles", false);

global.particle_player_pack = particle_type_creat(c_gray, pt_shape_disk, 0.3, -0.01, 0.5, 6, -90, -15, 15, 10);
global.particle_player_pack_L = particle_type_creat(c_gray, pt_shape_disk, 0.3, -0.01, 0.5, 6, 0, -15, 15, 10);
global.particle_player_pack_R = particle_type_creat(c_gray, pt_shape_disk, 0.3, -0.01, 0.5, 6, 180, -15, 15, 10);

if(instance_number(obj_room_manager) > 1){
	show_message("WARNING room manager duality! at room:"+string(room));
	instance_destroy(self);
}