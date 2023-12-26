var get_window_width = display_get_gui_width();
var get_window_height = display_get_gui_height();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

black_background_alpha = lerp(black_background_alpha, 0.75, 0.01);
menu_cursor_index += 0.3;

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
else if (skip > 0)
{
    skip--;
}

if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 370, 0, get_window_width, 41)
    && mouse_check_button(mb_left))
{
    menu_delay = 9999;
}

/* Handle Credits and Transitions */
if (image_index >= image_number - 1 && sprite_index == spr_credits)
{
    end_credits = true;
}

if (image_index <= 1 && end_credits && sprite_index == spr_credits)
{
    menu_delay = 9999;
    sprite_index = noone;
}

if (iris_xscale <= 0.01)
{
    if (room == rm_title)
    {
        global.character_select_in_this_menu = "main_game";
        room_restart();
    }
    else if (room == rm_leveleditor && global.character_select_in_this_menu == "level_editor" && global.actually_play_edited_level && global.play_edited_level)
    {
        global.actually_play_edited_level = false;
        global.play_edited_level = false;
        room_goto(rm_title);
    }
    else if (room == rm_leveleditor && global.character_select_in_this_menu == "level_editor" && !global.actually_play_edited_level && global.play_edited_level)
    {
        global.play_edited_level = false;
        room_restart();
    }
    else
    {
        room_goto(rm_world_map);
    }
}

/* Handle Time, Animation, and Input */
var action_accept = global.player_[inp.gp];
if (keyboard_check(vk_space)
    || gamepad_button_check(global.player_slot[1], action_accept[1][1][action.accept])
    || gamepad_button_check(global.player_slot[2], action_accept[2][1][action.accept])
    || gamepad_button_check(global.player_slot[3], action_accept[3][1][action.accept])
    || gamepad_button_check(global.player_slot[4], action_accept[4][1][action.accept]))
{
    time += 10;
    y = lerp(y, yy, 0.75);
    image_alpha = lerp(image_alpha, alpha, 0.75);
}
else
{
    time++;
    y = lerp(y, yy, 0.1);
    image_alpha = lerp(image_alpha, alpha, 0.1);
}

if (time >= room_speed * 1 - 10 && time <= room_speed * 1 + 10)
{
    yy = get_window_height * 0.5;
    alpha = 1;
}
else if (time >= room_speed * 4 - 10 && time <= room_speed * 4 + 10)
{
    yy = 0;
    alpha = 0;
}
else if (time >= room_speed * 5 - 10 && time <= room_speed * 5 + 10)
{
    y = get_window_height;
    yy = get_window_height;
    alpha = 0;
}
if (time >= room_speed * 5)
{
    if (!end_credits)
    {
        time = 0;
    }
    image_index++;
    if (sprite_index == global.title_logo_index)
    {
        sprite_index = spr_credits;
        image_index = 0;
    }
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