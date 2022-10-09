//instance_deactivate_all(true);
instance_activate_object(obj_pause);

if (global.background_brightness_menu > -0.001)
{
	c_menu_outline = c_white;
	c_menu_fill = c_black;
}
else
{
	c_menu_outline = c_black;
	c_menu_fill = c_white;
}

scr_set_controls_used_to_navigate();

with (all)
{
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
	image_speed = 0;
	speed = 0;
	x = xprevious;
	y = yprevious;
}

if (menu_delay > 0)
{
	menu_delay -= 1;
}
image_speed = 0;

///Narrator Voice variable handeling

///No Narrator
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

#region /* Keyboard Controls */

#region /* Player 1 */
if (global.pause_player == 0)
{
	key_up = (keyboard_check_pressed(vk_up)) and (!keyboard_check_pressed(vk_down)) or (keyboard_check_pressed(ord("W"))) and (!keyboard_check_pressed(ord("S"))) or (gamepad_button_check_pressed(0, gp_padu)) and (!gamepad_button_check_pressed(0, gp_padd)) or (gamepad_axis_value(0, gp_axislv) < 0);
	key_left = (keyboard_check_pressed(vk_left)) and (!keyboard_check_pressed(vk_right)) or (keyboard_check_pressed(ord("A"))) and (!keyboard_check_pressed(ord("D"))) or (gamepad_button_check_pressed(0, gp_padl)) and (!gamepad_button_check_pressed(0, gp_padr)) or (gamepad_axis_value(0, gp_axislh) < 0);
	key_right = (keyboard_check_pressed(vk_right)) and (!keyboard_check_pressed(vk_left)) or (keyboard_check_pressed(ord("D"))) and (!keyboard_check_pressed(ord("A"))) or (gamepad_button_check_pressed(0, gp_padr)) and (!gamepad_button_check_pressed(0, gp_padl)) or (gamepad_axis_value(0, gp_axislh) > 0);
	key_down = (keyboard_check_pressed(vk_down)) and (!keyboard_check_pressed(vk_up)) or (keyboard_check_pressed(ord("S"))) and (!keyboard_check_pressed(ord("W"))) or (gamepad_button_check_pressed(0, gp_padd)) and (!gamepad_button_check_pressed(0, gp_padu)) or (gamepad_axis_value(0, gp_axislv) > 0);
	key_a_pressed = (gamepad_button_check_pressed(0, gp_face1)) or (keyboard_check_pressed(ord("Z"))) or (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(vk_space));
	key_b_pressed = (gamepad_button_check_pressed(0, gp_face2)) or (keyboard_check_pressed(ord("X"))) or (keyboard_check_pressed(vk_escape)) or (keyboard_check_pressed(vk_backspace)) or (mouse_check_button_pressed(mb_right)) or (mouse_check_button_pressed(mb_side1));
}
#endregion /* Player 1 END */

#region /* Player 2 */
if (global.pause_player == 1)
{
	key_up = (keyboard_check_pressed(global.player2_key_up)) and (!keyboard_check_pressed(global.player2_key_down)) or (gamepad_button_check_pressed(1, gp_padu)) and (!gamepad_button_check_pressed(1, gp_padd)) or (gamepad_axis_value(1, gp_axislv) < 0);
	key_left = (keyboard_check_pressed(global.player2_key_left)) and (!keyboard_check_pressed(global.player2_key_right)) or (gamepad_button_check_pressed(1, gp_padl)) and (!gamepad_button_check_pressed(1, gp_padr)) or (gamepad_axis_value(1, gp_axislh) < 0);
	key_right = (keyboard_check_pressed(global.player2_key_right)) and (!keyboard_check_pressed(global.player2_key_left)) or (gamepad_button_check_pressed(1, gp_padr)) and (!gamepad_button_check_pressed(1, gp_padl)) or (gamepad_axis_value(1, gp_axislh) > 0);
	key_down = (keyboard_check_pressed(global.player2_key_down)) and (!keyboard_check_pressed(global.player2_key_up)) or (gamepad_button_check_pressed(1, gp_padd)) and (!gamepad_button_check_pressed(1, gp_padu)) or (gamepad_axis_value(1, gp_axislv) > 0);
	key_a_pressed = (gamepad_button_check_pressed(1, gp_face1)) or (keyboard_check_pressed(global.player2_key_jump));
	key_b_pressed = (gamepad_button_check_pressed(1, gp_face2)) or (keyboard_check_pressed(global.player2_key_sprint)) or (mouse_check_button_pressed(mb_right)) or (mouse_check_button_pressed(mb_side1));
}
#endregion /* Player 2 END */

#region /* Player 3 */
if (global.pause_player = 2)
{
	key_up = (keyboard_check_pressed(global.player3_key_up)) and (!keyboard_check_pressed(global.player3_key_down)) or (gamepad_button_check_pressed(2, gp_padu)) and (!gamepad_button_check_pressed(2, gp_padd)) or (gamepad_axis_value(2, gp_axislv) < 0);
	key_left = (keyboard_check_pressed(global.player3_key_left)) and (!keyboard_check_pressed(global.player3_key_right)) or (gamepad_button_check_pressed(2, gp_padl)) and (!gamepad_button_check_pressed(2, gp_padr)) or (gamepad_axis_value(2, gp_axislh) < 0);
	key_right = (keyboard_check_pressed(global.player3_key_right)) and (!keyboard_check_pressed(global.player3_key_left)) or (gamepad_button_check_pressed(2, gp_padr)) and (!gamepad_button_check_pressed(2, gp_padl)) or (gamepad_axis_value(2, gp_axislh) > 0);
	key_down = (keyboard_check_pressed(global.player3_key_down)) and (!keyboard_check_pressed(global.player3_key_up)) or (gamepad_button_check_pressed(2, gp_padd)) and (!gamepad_button_check_pressed(2, gp_padu)) or (gamepad_axis_value(2, gp_axislv) > 0);
	key_a_pressed = (gamepad_button_check_pressed(2, gp_face1)) or (keyboard_check_pressed(global.player3_key_jump));
	key_b_pressed = (gamepad_button_check_pressed(2, gp_face2)) or (keyboard_check_pressed(global.player3_key_sprint)) or (mouse_check_button_pressed(mb_right)) or (mouse_check_button_pressed(mb_side1));
}
#endregion /* Player 3 END */

#region /* Player 4 */
if (global.pause_player = 3)
{
	key_up = (keyboard_check_pressed(global.player4_key_up)) and (!keyboard_check_pressed(global.player4_key_down)) or (gamepad_button_check_pressed(3, gp_padu)) and (!gamepad_button_check_pressed(3, gp_padd)) or (gamepad_axis_value(3, gp_axislv) < 0);
	key_left = (keyboard_check_pressed(global.player4_key_left)) and (!keyboard_check_pressed(global.player4_key_right)) or (gamepad_button_check_pressed(3, gp_padl)) and (!gamepad_button_check_pressed(3, gp_padr)) or (gamepad_axis_value(3, gp_axislh) < 0);
	key_right = (keyboard_check_pressed(global.player4_key_right)) and (!keyboard_check_pressed(global.player4_key_left)) or (gamepad_button_check_pressed(3, gp_padr)) and (!gamepad_button_check_pressed(3, gp_padl)) or (gamepad_axis_value(3, gp_axislh) > 0);
	key_down = (keyboard_check_pressed(global.player4_key_down)) and (!keyboard_check_pressed(global.player4_key_up)) or (gamepad_button_check_pressed(3, gp_padd)) and (!gamepad_button_check_pressed(3, gp_padu)) or (gamepad_axis_value(3, gp_axislv) > 0);
	key_a_pressed = (gamepad_button_check_pressed(3, gp_face1)) or (keyboard_check_pressed(global.player4_key_jump));
	key_b_pressed = (gamepad_button_check_pressed(3, gp_face2)) or (keyboard_check_pressed(global.player4_key_sprint)) or (mouse_check_button_pressed(mb_right)) or (mouse_check_button_pressed(mb_side1));
}
#endregion /* Player 4 END */

#endregion /* Keyboard Controls END */

scr_quit_to_desktop_menu("quit_to_desktop");

#region /* Which player is controling the pause menu? */
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

#region /* Hide menu for clean screenshots text */
if (hide_menu_for_clean_screenshots_timer < 60 * 3)
{
	hide_menu_for_clean_screenshots_timer += 1;
}
if (hide_menu_for_clean_screenshots_timer = 60 * 3)
{
	hide_menu_for_clean_screenshots_alpha = lerp(hide_menu_for_clean_screenshots_alpha, 1, 0.01);
}
if (in_settings == true)
or (menu == "quit_game_yes")
or (menu == "quit_game_no")
{
	hide_menu_for_clean_screenshots_alpha = 0;
	hide_menu_for_clean_screenshots_timer = 0;
}

if (hide_menu_for_clean_screenshots = false)
and (in_settings = false)
and (os_type != os_ios)
and (os_type != os_android)
{
	if (global.controls_used_for_menu_navigation = "keyboard")
	or (global.controls_used_for_menu_navigation = "mouse")
	{
		draw_sprite_ext(spr_keyboard_keys, ord("Y"), 32, window_get_height() - 32, 0.75, 0.75, 0, c_white, hide_menu_for_clean_screenshots_alpha);
	}
	else
	{
		scr_draw_gamepad_buttons(gp_face4, 32, window_get_height() - 32, 0.75, c_white, hide_menu_for_clean_screenshots_alpha);
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, window_get_height() - 32, ": " + l10n_text("Hide menu for clean screenshots"), global.default_text_size, c_black, c_white, hide_menu_for_clean_screenshots_alpha);
}

if (keyboard_check_pressed(ord("Y")))
or (gamepad_button_check_pressed(0, gp_face4))
or (gamepad_button_check_pressed(1, gp_face4))
or (gamepad_button_check_pressed(2, gp_face4))
or (gamepad_button_check_pressed(3, gp_face4))
{
	if (hide_menu_for_clean_screenshots = false)
	and (menu_delay == 0)
	and (in_settings = false)
	and (menu != "quit_game_yes")
	and (menu != "quit_game_no")
	{
		hide_menu_for_clean_screenshots = true;
		menu_delay = 10;
	}
}

if (keyboard_check_pressed(vk_anykey))
or (mouse_check_button_pressed(mb_middle))
or (mouse_check_button_pressed(mb_right))
or (gamepad_button_check_pressed(0, gp_face1))
or (gamepad_button_check_pressed(0, gp_face2))
or (gamepad_button_check_pressed(0, gp_face3))
or (gamepad_button_check_pressed(0, gp_face4))
or (gamepad_button_check_pressed(1, gp_face1))
or (gamepad_button_check_pressed(1, gp_face2))
or (gamepad_button_check_pressed(1, gp_face3))
or (gamepad_button_check_pressed(1, gp_face4))
or (gamepad_button_check_pressed(2, gp_face1))
or (gamepad_button_check_pressed(2, gp_face2))
or (gamepad_button_check_pressed(2, gp_face3))
or (gamepad_button_check_pressed(2, gp_face4))
or (gamepad_button_check_pressed(3, gp_face1))
or (gamepad_button_check_pressed(3, gp_face2))
or (gamepad_button_check_pressed(3, gp_face3))
or (gamepad_button_check_pressed(3, gp_face4))
{
	if (hide_menu_for_clean_screenshots == true)
	and (menu_delay == 0)
	{
		hide_menu_for_clean_screenshots = false;
		menu_delay = 10;
	}
}
#endregion /* Hide menu for clean screenshots text END */

if (hide_menu_for_clean_screenshots = false)
{

if (in_settings = false)
and (menu != "remap_key_up")
and (menu != "remap_key_down")
and (menu != "remap_key_left")
and (menu != "remap_key_right")
and (menu != "remap_key_sprint")
and (menu != "remap_key_jump")
and (menu != "remap_reset")
and (menu != "remap_save")
{
	if (global.playergame >= 1)
	and (global.pause_player == 0)
	{
		scr_draw_text_outlined(window_get_width() / 2, 100, "PLAYER 1 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_aqua, 1);
	}
	else
	if (global.pause_player == 1)
	{
		scr_draw_text_outlined(window_get_width() / 2, 100, "PLAYER 2 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_red, 1);
	}
	else
	if (global.pause_player = 2)
	{
		scr_draw_text_outlined(window_get_width() / 2, 100, "PLAYER 3 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_lime, 1);
	}
	else
	if (global.pause_player = 3)
	{
		scr_draw_text_outlined(window_get_width() / 2, 100, "PLAYER 4 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_yellow, 1);
	}
}
#endregion /* Which player is controling the pause menu? END */

#region /* Games Logo in top left corner */

if (current_month = 12)
and (global.resource_pack_sprite_title_logo_christmas >= 0)
{
	draw_sprite_ext(global.resource_pack_sprite_title_logo_christmas, 0, 160, scr_wave(100, 140, 4.5, 0), (402 / sprite_get_height(global.title_logo_index)) * 0.3, (402 / sprite_get_height(global.title_logo_index)) * 0.3, 0, c_white, 1);
}
else
if (global.title_logo_index >= 0)
{
	draw_sprite_ext(global.title_logo_index, 0, 160, scr_wave(100, 140, 4.5, 0), (402 / sprite_get_height(global.title_logo_index)) * 0.3, (402 / sprite_get_height(global.title_logo_index)) * 0.3, 0, c_white, 1);
}
#endregion /* Games Logo in top left corner END */

#region /* Pause Text blink effect */
if (pause_text_lerp <= 0)
{
	pause_text_alpha = lerp(pause_text_alpha, 1, 0.1);
	if (pause_text_alpha >= 1)
	{
		pause_text_lerp = 1;
	}
}
else
if (pause_text_lerp >= 1)
{
	pause_text_alpha = lerp(pause_text_alpha, 0, 0.2);
	if (pause_text_alpha <= 0)
	{
		pause_text_lerp = 0;
	}
}
#endregion /* Pause Text blink effect END */

#region /* Pause Text */
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (in_settings = false)
and (menu != "quit_game_no")
and (menu != "quit_game_yes")
{
	if (asset_get_type("spr_pause_text") == asset_sprite)
	{
		draw_sprite_ext(spr_pause_text, image_index, window_get_width() / 2, 200, 1, 1, 0, c_white, scr_wave(0, 1, 4.5, 0));
	}
	else
	{
		draw_text_transformed_color(window_get_width() / 2, 200, "PAUSE", global.default_text_size * 2, global.default_text_size * 2, 0, c_white, c_white, c_white, c_white, pause_text_alpha);
	}
}
#endregion /* Pause Text END */

/* PAUSE LEVEL SELECT / LEVEL EDITOR MENU */
if (asset_get_type("room_world_map") == asset_room)
and (room == room_world_map)
and (show_loading_icon = false)
or (asset_get_type("room_leveleditor") == asset_room)
and (room == room_leveleditor)
and (show_loading_icon = false)
or (asset_get_type("room_world_map") == asset_room)
and (global.pause_room = room_world_map)
and (show_loading_icon = false)
or (asset_get_type("room_leveleditor") == asset_room)
and (global.pause_room = room_leveleditor)
and (show_loading_icon = false)
{
	if (menu == "continue")
	or (menu == "options")
	or (menu == "restart")
	or (menu == "quit")
	{
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2, l10n_text("Continue"), "continue", "continue");
		draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 21, 1, 1, 0, c_white, 1);
		
		if(asset_get_type("room_leveleditor") == asset_room)
		and (room == room_leveleditor)
		or (asset_get_type("room_leveleditor") == asset_room)
		and (global.pause_room = room_leveleditor)
		{
			if (global.convention_mode = false)
			{
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Options"), "options", "options");
				draw_sprite_ext(spr_icons_cogwheel, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Restart"), "restart", "restart");
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42 + 42, l10n_text("Quit"), "quit", "quit_to_map");
			}
			else
			{
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Restart"), "restart", "restart");
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Quit"), "quit", "quit_to_map");
			}
		}
		else
		{
			if (global.convention_mode = false)
			{
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Options"), "options", "options");
				draw_sprite_ext(spr_icons_cogwheel, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Quit"), "quit", "quit");
			}
			else
			{
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Quit"), "quit", "quit");
			}
		}
	}
	else
	if (menu == "reset_from_checkpoint")
	or (menu == "reset_from_start")
	or (menu == "restart_nevermind")
	{
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2, l10n_text("Reset from Checkpoint"), "reset_from_checkpoint", "reset_from_checkpoint");
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Reset from Start"), "reset_from_start", "reset_from_start");
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Nevermind"), "restart_nevermind", "restart_nevermind");
		draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
	}
	else
	if (global.pause_room = room_leveleditor)
	and (global.character_select_in_this_menu == "main_game")
	and (menu == "quit_to_map")
	or (global.pause_room = room_leveleditor)
	and (global.character_select_in_this_menu == "main_game")
	and (menu == "quit_to_title")
	or (global.pause_room = room_leveleditor)
	and (global.character_select_in_this_menu == "main_game")
	and (menu == "quit_to_desktop")
	or (global.pause_room = room_leveleditor)
	and (global.character_select_in_this_menu == "main_game")
	and (menu == "quit_nevermind")
	{
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2, l10n_text("Quit to Map"), "quit_to_map", "quit_to_map");
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Quit to Title"), "quit_to_title", "quit_to_title");
		if (global.convention_mode = false)
		{
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop");
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
		}
	}
	else
	if (global.pause_room = room_leveleditor)
	and (global.character_select_in_this_menu == "level_editor")
	and (menu == "quit_to_title")
	or (global.pause_room = room_leveleditor)
	and (global.character_select_in_this_menu == "level_editor")
	and (menu == "quit_to_desktop")
	or (global.pause_room = room_leveleditor)
	and (global.character_select_in_this_menu == "level_editor")
	and (menu == "quit_nevermind")
	{
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2, l10n_text("Quit to Title"), "quit_to_title", "quit_to_title");
		if (global.convention_mode = false)
		{
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop");
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 21, 1, 1, 0, c_white, 1);
		}
	}
	else
	if (global.pause_room = room_world_map)
	and (menu == "quit_to_title")
	or (global.pause_room = room_world_map)
	and (menu == "quit_to_desktop")
	or (global.pause_room = room_world_map)
	and (menu == "quit_nevermind")
	{
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2, l10n_text("Quit to Title"), "quit_to_title", "quit_to_title");
		if (global.convention_mode = false)
		{
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop");
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 21, 1, 1, 0, c_white, 1);
		}
	}
	
	#region /* Continue */
	if (menu == "continue")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2, window_get_width() / 2 + 185, window_get_height() / 2 + 41))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			
			#region /* Return to game */
			audio_resume_all();
			audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
			audio_sound_gain(global.music_underwater, 0, 0);
			audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
			audio_sound_gain(global.ambience_underwater, 0, 0);
			global.pause = false;
			instance_activate_region(camera_get_view_x(view_camera[view_current]) - 32, camera_get_view_y(view_camera[view_current]) - 32, window_get_width() + 32, window_get_height() + 32, true);
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			else
			{
				instance_destroy();
			}
			#endregion /* Return to game END */
			
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit";
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.convention_mode = false)
			{
				menu = "options";
			}
			else
			{
				if (global.pause_room = room_leveleditor)
				{
					menu = "restart";
				}
				else
				{
					menu = "quit";
				}
			}
		}
	}
	#endregion /* Continue END */
	
	else
	
	#region /* Options */
	if (menu == "options")
	{
		
		#region /* Select Options */
		if (key_a_pressed)
		and (menu_delay == 0)
		and (global.convention_mode = false)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (global.convention_mode = false)
		{
			menu_delay = 3;
			scr_audio_play(voice_options, volume_source.voice);
			menu = noone;
			can_navigate_settings_sidebar = true;
			in_settings = true;
		}
		#endregion /* Select Options END */

		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "continue";
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			if (global.pause_room = room_leveleditor)
			{
				menu_delay = 3;
				menu = "restart";
			}
			else
			{
				menu_delay = 3;
				menu = "quit";
			}
		}
	}
	#endregion /* Options END */
	
	else
	
	#region /* Restart */
	if (menu == "restart")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode = false)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode == true)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			if (global.checkpoint_x == 0)
			and (global.checkpoint_y == 0)
			{
				
				#region /* Restart Level */
				show_loading_icon = true;
				#endregion /* Restart Level END */
				
			}
			else
			{
				menu_delay = 3;
				menu = "reset_from_checkpoint";
			}
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.convention_mode = false)
			{
				menu = "options";
			}
			else
			{
				menu = "continue";
			}
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit";
		}
	}
	#endregion /* Restart END */
	
	else
	
	#region /* Reset from Checkpoint */
	if (menu == "reset_from_checkpoint")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2, window_get_width() / 2 + 185, window_get_height() / 2 + 41))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			
			#region /* Restart Level */
			show_loading_icon = true;
			#endregion /* Restart Level END */
			
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "restart_nevermind";
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_start";
		}
	}
	#endregion /* Restart to Checkpoint END */
	
	else
	
	#region /* Reset from Start */
	if (menu == "reset_from_start")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			
			#region /* Restart Level */
			show_loading_icon = true;
			#endregion /* Restart Level END */
			
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_checkpoint";
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "restart_nevermind";
		}
	}
	#endregion /* Reset from Start END */
	
	else
	
	#region /* Restart Nevermind */
	if (menu == "restart_nevermind")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "restart";
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_start";
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_checkpoint";
		}
	}
	#endregion /* Restart Nevermind END */
	
	else
	
	#region /* Quit */
	if (menu == "quit")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (global.pause_room = room_world_map)
		and (global.convention_mode = false)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode = false)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_world_map)
		and (global.convention_mode == true)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode == true)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			menu_delay = 3;
			if (global.pause_room = room_leveleditor)
			and (global.character_select_in_this_menu == "main_game")
			{
				menu_delay = 3;
				menu = "quit_to_map";
			}
			else
			{
				menu_delay = 3;
				menu = "quit_to_title";
			}
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			if (global.pause_room = room_leveleditor)
			{
				menu_delay = 3;
				menu = "restart";
			}
			else
			{
				menu_delay = 3;
				if (global.convention_mode = false)
				{
					menu = "options";
				}
				else
				{
					menu = "continue";
				}
			}
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "continue";
		}
	}
	#endregion /* Quit END */
	
	else
	
	#region /* Quit to Map */
	if (menu == "quit_to_map")
	and (global.pause_room = room_leveleditor)
	{
		if (global.character_select_in_this_menu == "level_editor")
		{
			menu = "quit_to_title";
		}
		if (key_a_pressed)
		and (menu_delay == 0)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2, window_get_width() / 2 + 185, window_get_height() / 2 + 41))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			
			#region /* Return to Map */
			
			#region /* Reset timer back to zero */
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /* Reset timer back to zero END */
			
			global.quit_level = true;
			global.quit_to_map = true;
			audio_stop_all();
			global.pause = false;
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			#endregion /* Return to Map END */
			
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_nevermind";
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_to_title";
		}
	}
	#endregion /* Quit to Map END */
	
	else
	
	#region /* Quit to Title */
	if (menu == "quit_to_title")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_world_map)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2, window_get_width() / 2 + 185, window_get_height() / 2 + 41))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.character_select_in_this_menu == "level_editor")
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2, window_get_width() / 2 + 185, window_get_height() / 2 + 41))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			
			#region /* Return to Title */
			
			#region /* Reset timer back to zero */
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /* Reset timer back to zero END */
			
			global.quit_level = true;
			global.quit_to_title = true;
			audio_stop_all();
			global.pause = false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			window_get_width() + 32,
			window_get_height() + 32,
			true);
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			else
			{
				instance_destroy();
			}
			#endregion /* Return to Title END */
			
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.pause_room = room_leveleditor)
			and (global.character_select_in_this_menu == "main_game")
			{
				menu = "quit_to_map";
			}
			else
			{
				menu = "quit_nevermind";
			}
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.convention_mode = false)
			{
				menu = "quit_to_desktop";
			}
			else
			{
				menu = "quit_nevermind";
			}
		}
	}
	#endregion /* Quit to Title END */
	
	else
	
	#region /* Quit to Desktop */
	if (menu == "quit_to_desktop")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode = false)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_world_map)
		and (global.convention_mode = false)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode = false)
		and (global.character_select_in_this_menu == "level_editor")
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "quit_game_no";
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_to_title";
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_nevermind";
		}
	}
	#endregion /* Quit to Desktop END */
	
	else
	
	#region /* Quit Nevermind */
	if (menu == "quit_nevermind")
	{
		if (key_a_pressed)
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode = false)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_world_map)
		and (global.convention_mode = false)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode = false)
		and (global.character_select_in_this_menu == "level_editor")
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode == true)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_world_map)
		and (global.convention_mode == true)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (global.pause_room = room_leveleditor)
		and (global.convention_mode == true)
		and (global.character_select_in_this_menu == "level_editor")
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 2 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 41 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "quit";
		}
		if (key_up)
		and (!key_down)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.convention_mode = false)
			{
				menu = "quit_to_desktop";
			}
			else
			{
				menu = "quit_to_title";
			}
		}
		else
		if (key_down)
		and (!key_up)
		and (menu_delay <= 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.pause_room = room_leveleditor)
			and (global.character_select_in_this_menu == "main_game")
			{
				menu = "quit_to_map";
			}
			else
			{
				menu = "quit_to_title";
			}
			
		}
	}
	#endregion /* Quit Nevermind END */
	
	#region /* Return to game by pressing the back key */
	if (key_b_pressed)
	and (menu_delay == 0)
	{
		if (menu == "continue")
		or (menu == "options")
		or (menu == "restart")
		or (menu == "quit")
		{
			scr_config_save(); /* Save Config */
			audio_resume_all();
			audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
			audio_sound_gain(global.music_underwater, 0, 0);
			audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
			audio_sound_gain(global.ambience_underwater, 0, 0);
			global.pause = false;
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room; /* Return to game END */
			}
		}
		else
	
		#region /* Return to first menu */
		if (menu == "reset_from_checkpoint")
		or (menu == "reset_from_start")
		or (menu == "restart_nevermind")
		{
			menu_delay = 3;
			menu = "restart";
		}
		else
		if (menu == "quit_to_map")
		or (menu == "quit_to_title")
		or (menu == "quit_to_desktop")
		or (menu == "quit_nevermind")
		{
			menu_delay = 3;
			menu = "quit";
		}
		#endregion /* Return to first menu END */
		
	}
	#endregion /* Return to game by pressing the back key END */
	
}
/* PAUSE LEVEL EDITOR MENU */

#region /* Show loading icon and reset level */
if (show_loading_icon == true)
{
	loading_spinning_angle -= 10;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite_ext(spr_loading, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, 1, 1, loading_spinning_angle, c_white, 1);
	scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2 + 42, l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
		
	if (menu == "reset_from_checkpoint")
	and (loading_spinning_angle < -20)
	{
		
		#region /* Restart Level */
		global.restart_level = true;
		audio_stop_all();
		global.pause = false;
		instance_activate_region(
		camera_get_view_x(view_camera[view_current]) - 32,
		camera_get_view_y(view_camera[view_current]) - 32,
		window_get_width() + 32,
		window_get_height() + 32,
		true);
		if (instance_exists(obj_player))
		{
			with(obj_player)
			{
				hspeed = pause_hspeed;
				vspeed = pause_vspeed;
			}
		}
		if (asset_get_type("room_pause") == asset_room)
		{
			room = global.pause_room;
		}
		else
		{
			instance_destroy();
		}
		#endregion /* Restart Level END */
		
	}
		
	if (menu == "reset_from_start")
	and (loading_spinning_angle < -20)
	or (menu == "restart")
	and (loading_spinning_angle < -20)
	{
		
		#region /* Restart Level */
		
		#region /* Reset timer back to zero */
		global.timeattack_realmillisecond = 0;
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute = 0;
		#endregion /* Reset timer back to zero END */
		
		if (global.character_select_in_this_menu == "main_game")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
				
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "checkpoint_x", 0);
			ini_write_real(level_name, "checkpoint_y", 0);
			ini_close();
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
				
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(level_name, "checkpoint_x", 0);
			ini_write_real(level_name, "checkpoint_y", 0);
			ini_close();
		}
		
		global.checkpoint_x = 0;
		global.checkpoint_y = 0;
		
		global.restart_level = true;
		audio_stop_all();
		global.pause = false;
		instance_activate_region(
		camera_get_view_x(view_camera[view_current]) - 32,
		camera_get_view_y(view_camera[view_current]) - 32,
		window_get_width() + 32,
		window_get_height() + 32,
		true);
		if (instance_exists(obj_player))
		{
			with(obj_player)
			{
				hspeed = pause_hspeed;
				vspeed = pause_vspeed;
			}
		}
		if (asset_get_type("room_pause") == asset_room)
		{
			room = global.pause_room;
		}
		else
		{
			instance_destroy();
		}
		#endregion /* Restart Level END */
		
	}
}
#endregion /* Show loading icon and reset level END */

#region /* Return to game */
if (keyboard_check_pressed(vk_escape))
or (gamepad_button_check_pressed(0, gp_start))
or (gamepad_button_check_pressed(1, gp_start))
or (gamepad_button_check_pressed(2, gp_start))
or (gamepad_button_check_pressed(3, gp_start))
or (gamepad_button_check_pressed(0, gp_select))
or (gamepad_button_check_pressed(1, gp_select))
or (gamepad_button_check_pressed(2, gp_select))
or (gamepad_button_check_pressed(3, gp_select))
{
	if (can_remap_key = false)
	and (input_key == false)
	and (menu_delay == 0)
	{
		scr_config_save(); /* Save Config */
		audio_resume_all();
		audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
		audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
		audio_sound_gain(global.ambience_underwater, 0, 0);
		global.pause = false;
		if (instance_exists(obj_player))
		{
			with(obj_player)
			{
				hspeed = pause_hspeed;
				vspeed = pause_vspeed;
			}
		}
		if (asset_get_type("room_pause") == asset_room)
		{
			room = global.pause_room;
		}
		else
		{
			instance_destroy();
		}
	}
}
#endregion /* Return to game END */

scr_options_menu(); /* Options */

scr_menu_navigation_with_joystick_delay();

}

scr_draw_darken_screen_when_window_is_unfocused();

scr_draw_mouse_cursor();