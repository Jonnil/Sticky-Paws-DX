var get_window_width = display_get_gui_width();
var get_window_height = display_get_gui_height();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

black_background_alpha = lerp(black_background_alpha, 0.75, 0.01);
menu_cursor_index += 0.3;
credits_y -= 3;

if (global.controls_used_for_navigation == "mouse")
{
	menu = "";
}

/* Update Skip and Menu Delay */
var skip_increment = (keyboard_check(vk_escape)
	|| gamepad_button_check(global.player_slot[1], gp_start)
	|| gamepad_button_check(global.player_slot[2], gp_start)
	|| gamepad_button_check(global.player_slot[3], gp_start)
	|| gamepad_button_check(global.player_slot[4], gp_start)
	|| (os_type == os_ios || os_type == os_android) && mouse_check_button(mb_left)) ? 1 : 0;

if (skip_increment > 0)
{
	skip += skip_increment;
	
	if (skip > 64)
	{
		menu_delay = 9999;
	}
}
else
if (skip > 0)
{
	skip--;
}

if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 370, 0, get_window_width, 41)
&& mouse_check_button(mb_left))
{
	menu_delay = 9999;
}

/* Handle Credits and Transitions */
var credits_start_y = credits_y + 1000; /* matches draw offset */
var credits_line_height = string_height("A") * global.default_text_size;
var credits_line_count = max(1, array_length(credits_lines)); /* always advance even if empty */
var credits_last_line_bottom = credits_start_y + (credits_line_count * credits_line_height);

if (!end_credits
&& credits_last_line_bottom < 0)
{
	end_credits = true;
	menu_delay = 9999;
}

if (iris_xscale <= 0.01)
{
	if (room == rm_title)
	{
		global.character_select_in_this_menu = "main_game";
		room_restart();
	}
	else
	if (room == rm_leveleditor
	&& global.character_select_in_this_menu == "level_editor"
	&& global.actually_play_edited_level
	&& global.play_edited_level)
	{
		global.level_clear_rate = "clear";
		scr_save_level();
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		room_goto(rm_title);
	}
	else
	if (room == rm_leveleditor
	&& global.character_select_in_this_menu == "level_editor"
	&& !global.actually_play_edited_level
	&& global.play_edited_level)
	{
		global.level_clear_rate = "clear";
		scr_save_level();
		global.play_edited_level = false;
		room_restart();
	}
	else
	{
		global.level_clear_rate = "clear";
		scr_save_level();
		room_goto(rm_world);
	}
}

/* Handle Time, Animation, and Input */
var action_accept = global.player_[inp.gp];
var gamepad_skip_hold = false;

for(var i = 1; i <= global.max_players; i += 1)
{
	if (gamepad_button_check(global.player_slot[i], action_accept[i][1][action.accept]))
	|| (gamepad_button_check(global.player_slot[i], action_accept[i][2][action.accept]))
	{
		gamepad_skip_hold = true;
		break; /* exit the loop if a button is pressed */
	}
}

if (keyboard_check(vk_space)
|| gamepad_skip_hold)
{
	credits_y -= 10;
}

#region /* Zoom In */
if (end_credits)
|| (menu_delay > 999)
{
	if (iris_zoom == 1)
	{
		iris_xscale = lerp(iris_xscale, 1, 0.15);
		iris_yscale = lerp(iris_yscale, 1, 0.15);
		
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
	else
	{
		iris_xscale = lerp(iris_xscale, 0, 0.15);
		iris_yscale = lerp(iris_yscale, 0, 0.15);
		
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
}
#endregion /* Zoom In END */
