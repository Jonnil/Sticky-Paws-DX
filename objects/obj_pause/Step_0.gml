scr_set_menu_font_color();
scr_set_controls_used_to_navigate();

if (menu_delay > 0)
{
	menu_delay -= 1;
}

if (global.narrator >= 0)
{
	menuvoice_1player = noone;
	menuvoice_2player = noone;
	menuvoice_3player = noone;
	menuvoice_4player = noone;
	menuvoice_leveleditor = noone;
	menuvoice_leveleditor_denied = noone;
	voice_options = noone;
}

room_speed = global.max_fps;

scr_menu_navigation_initialization(1);

#region /* Hide menu for clean screenshots */
if (hide_menu_for_clean_screenshots_timer < 60 * 3)
{
	hide_menu_for_clean_screenshots_timer += 1;
}
if (hide_menu_for_clean_screenshots_timer = 60 * 3)
{
	hide_menu_for_clean_screenshots_alpha = lerp(hide_menu_for_clean_screenshots_alpha, 1, 0.01);
}
if (in_settings)
or (menu == "quit_game_yes")
or (menu == "quit_game_no")
{
	hide_menu_for_clean_screenshots_alpha = 0;
	hide_menu_for_clean_screenshots_timer = 0;
}

if (keyboard_check_pressed(ord("Y")))
or (gamepad_button_check_pressed(global.player1_slot, gp_face4))
or (gamepad_button_check_pressed(global.player2_slot, gp_face4))
or (gamepad_button_check_pressed(global.player3_slot, gp_face4))
or (gamepad_button_check_pressed(global.player4_slot, gp_face4))
{
	if (hide_menu_for_clean_screenshots == false)
	and (menu_delay == 0)
	and (in_settings == false)
	and (menu != "quit_game_yes")
	and (menu != "quit_game_no")
	{
		hide_menu_for_clean_screenshots = true;
		menu_delay = 10;
	}
}

if (keyboard_check_pressed(vk_anykey))
or (mouse_check_button_released(mb_middle))
or (mouse_check_button_released(mb_right))
or (gamepad_button_check_pressed(global.player1_slot, gp_face1))
or (gamepad_button_check_pressed(global.player1_slot, gp_face2))
or (gamepad_button_check_pressed(global.player1_slot, gp_face3))
or (gamepad_button_check_pressed(global.player1_slot, gp_face4))
or (gamepad_button_check_pressed(global.player2_slot, gp_face1))
or (gamepad_button_check_pressed(global.player2_slot, gp_face2))
or (gamepad_button_check_pressed(global.player2_slot, gp_face3))
or (gamepad_button_check_pressed(global.player2_slot, gp_face4))
or (gamepad_button_check_pressed(global.player3_slot, gp_face1))
or (gamepad_button_check_pressed(global.player3_slot, gp_face2))
or (gamepad_button_check_pressed(global.player3_slot, gp_face3))
or (gamepad_button_check_pressed(global.player3_slot, gp_face4))
or (gamepad_button_check_pressed(global.player4_slot, gp_face1))
or (gamepad_button_check_pressed(global.player4_slot, gp_face2))
or (gamepad_button_check_pressed(global.player4_slot, gp_face3))
or (gamepad_button_check_pressed(global.player4_slot, gp_face4))
{
	if (hide_menu_for_clean_screenshots)
	and (menu_delay == 0)
	{
		hide_menu_for_clean_screenshots = false;
		menu_delay = 10;
	}
}
#endregion /* Hide menu for clean screenshots END */

gamepad_set_vibration(0, 0, 0);
gamepad_set_vibration(1, 0, 0);
gamepad_set_vibration(2, 0, 0);
gamepad_set_vibration(3, 0, 0);
gamepad_set_vibration(4, 0, 0);

#region /* Set screen size */
camera_set_view_border(view_camera[view_current], 1920, 1080); /* View Border */
camera_set_view_size(view_camera[view_current], 1920, 1080);

if (!instance_exists(obj_leveleditor))
{
	camera_set_view_target(view_camera[view_current], self);
}
scr_set_screen_size();
#endregion /* Set screen size END */

scr_toggle_fullscreen();

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (unpause)
{
	scr_delete_sprite_properly(global.pause_screenshot);
	room = global.pause_room;
}