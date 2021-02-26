enum movement_states{
	walking,
	running
}

acc_spd = 0.1;
top_walking_spd = 500;
top_running_spd = 1000;
movement_state = movement_states.walking;

jump_height = 500;
jump_buffer = 0;
max_jump_buffer = room_speed;
land_buffer = 0;
max_land_buffer = room_speed*0.05;
is_jumping = false;
jump_time = 0;
max_jump_time = room_speed*0.5;

left = 0;
right = 0;
jump = 0;
sprint = 0;

is_controlled_by_internet = false;

phy_fixed_rotation = true;