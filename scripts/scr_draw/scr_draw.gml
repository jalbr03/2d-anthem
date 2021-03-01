// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_heat_bar(xx, yy, value){
	draw_sprite(spr_heat_bar, 0, xx, yy);
	var bar_width = 128;
	var bar_height = 32;
	var heat_bar = bar_width*value;
	draw_sprite_part(spr_heat_bar, 1, bar_width-heat_bar, 0, heat_bar*2, bar_height, xx-heat_bar, yy-bar_height/2);
}