enum action_states{
	walking,
	running,
	jumping,
	hovering,
	flying,
	falling
}

action_scripts = [
	scr_walking,
	scr_running,
	scr_jumping,
	scr_hovering,
	scr_flying,
	scr_falling
];

sprite_indexes = [spr_test_suit, spr_test_suit_flying];		//will change for different suits

top_fast_fly = 600;			//will change for different suits
top_medium_fly = 300;
top_slow_fly = 50;
top_inair_spd = 50;
flying_spd = 100; //current flying speed

flying_vertical_spd = 200;
rotation_speed = 0.1;

suit_heat = 0;
suit_heatup_spd = 0.0002;			//will change for different suits
suit_cooldown_spd = 0.005;			//will change for different suits

depth = -10;
thruster_xoffset = -15;				//will change for different suits
thruster_yoffset = -15;				//will change for different suits

flying_grv = 0;
last_direction = 1;
acc_spd = 0.3;
top_walking_spd = 200;
top_running_spd = 500;
action_state = action_states.walking;
last_moveh = 0;

max_jumps = 1;			//will change for different suits
current_jumps = max_jumps;
jump_height = 500;			//will change for different suits
jump_buffer = 0;
max_jump_buffer = room_speed*0.2;
land_buffer = 0;
max_land_buffer = room_speed*0.2;

left = 0;
right = 0;
up = 0;
down = 0;
jump = 0;
sprint = 0;
hover = 0;

grounded = 0;
moveh = 0;
movev = 0;

is_controlled_by_internet = false;

phy_fixed_rotation = true;
