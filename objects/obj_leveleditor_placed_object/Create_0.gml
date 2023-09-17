repeat_length = 0;
easy = 1;
normal = 1;
hard = 1;
object = 0;
menu_joystick_delay = 0;

if (global.actually_play_edited_level == false)
{
	modify_object_menu = false;
	drag_object = false;
	dragged_from_original_place = false;
	placed_for_the_first_time = false;
	drag_xstart = x;
	drag_ystart = y;
	drag_release_timer = 0;
	delay = 0;
	undo_value = 0;
	i = 0;
	default_blend = c_white;
	
	place_object_angle = false;
	draw_rotate_arrow = false;
	draw_item_on_top = noone;
	draw_item_with_spring = false;
	draw_leveleditor_arrow = noone;
	
	second_x = x;
	second_y = y;
	
	draw_xscale = 1;
	draw_yscale = 1;
	draw_angle = 0;
	
	depth = -110;
	mask_index = spr_wall;
	
	image_speed = 0;
	image_index = 0;
	
	alarm[0] = 1;
	global.part_limit ++;
	global.part_limit_text_alpha = 1;
}