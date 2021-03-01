enum movement_states{
	walking,
	running,
	jumping,
	flying,
	falling
}
movement_scripts = [
	scr_walking,
	scr_running,
	scr_jumping,
	scr_flying,
	scr_falling
];

flying_grv = 0;
acc_spd = 0.3;
top_inair_spd = 100;
top_walking_spd = 200;
top_running_spd = 500;
movement_state = movement_states.walking;
last_moveh = 0;

jump_height = 500;
jump_buffer = 0;
max_jump_buffer = room_speed;
land_buffer = 0;

left = 0;
right = 0;
up = 0;
down = 0;
jump = 0;
sprint = 0;

grounded = 0;
moveh = 0;
movev = 0;

is_controlled_by_internet = false;

phy_fixed_rotation = true;