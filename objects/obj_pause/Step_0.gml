var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

scr_set_menu_font_color();
scr_set_controls_used_to_navigate();
scr_menu_navigation_initialization(0);

for(var p = 1; p <= global.max_players; p += 1)
{
	if (global.player_can_play[p])
	{
		player_show_controls_alpha[p] = 1;
	}
	else
	{
		player_show_controls_alpha[p] = 0;
	}
}

set_pause_button_y_positions();
scr_set_show_controls_y(22, true);

fade_in_pause_alpha = lerp(fade_in_pause_alpha, 1, 0.1);

if (menu_delay > 0)
{
	menu_delay --;
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

#region /* Hide menu for clean screenshots */
if (keyboard_check_pressed(ord("Y")))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face4))
{
	if (menu == "continue") /* Can only hide menu when on these buttons specifically */
	|| (menu == "change_character")
	|| (menu == "edit_level")
	|| (menu == "options")
	|| (menu == "restart")
	|| (menu == "quit")
	|| (menu == "report")
	{
		if (!hide_menu_for_clean_screenshots)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		&& (menu != "quit_game_yes")
		&& (menu != "quit_game_no")
		{
			hide_menu_for_clean_screenshots = true;
			menu_delay = 3;
		}
	}
}

if (keyboard_check_pressed(vk_anykey))
|| (mouse_check_button_released(mb_middle))
|| (mouse_check_button_released(mb_right))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face4))
{
	if (hide_menu_for_clean_screenshots)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		hide_menu_for_clean_screenshots = false;
		menu_delay = 3;
	}
}
#endregion /* Hide menu for clean screenshots END */

for(var i = 1; i <= global.max_players + 1; i += 1)
{
	gamepad_set_vibration(i - 1, 0, 0);
}

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

#region /* Show loading icon and reset level */
if (show_loading_icon)
|| (gamepad_button_check(global.pause_player, gp_shoulderlb))
&& (gamepad_button_check(global.pause_player, gp_shoulderrb))
&& (gamepad_button_check_pressed(global.pause_player, gp_select))
{
	show_loading_icon = true;
	global.loading_spinning_angle -= 10;
	
	if (menu == "reset_from_checkpoint" && global.loading_spinning_angle < -20)
	{
		
		#region /* Restart Level from Checkpoint */
		global.restart_level = true;
		audio_stop_all();
		global.pause = false;
		#endregion /* Restart Level from Checkpoint END */
		
	}
	else
	if (menu == "reset_from_start")
	&& (global.loading_spinning_angle < -20)
	|| (menu == "restart")
	&& (global.loading_spinning_angle < -20)
	|| (gamepad_button_check(global.pause_player, gp_shoulderlb))
	&& (gamepad_button_check(global.pause_player, gp_shoulderrb))
	&& (gamepad_button_check_pressed(global.pause_player, gp_select))
	{
		
		#region /* Restart Level from Start */
		
		/* Reset the "big collectible already collected" variables when restarting from start */
		for(var i = 1; i <= global.max_big_collectible; i += 1)
		{
			global.big_collectible_already_collected[i] = false;
		}
		for(var i = 1; i <= global.max_key_fragment; i += 1)
		{
			global.key_fragment_already_collected[i] = false;
		}
		global.how_many_big_collectible_collected = 0;
		
		#region /* Reset timer back to zero */
		global.timeattack_realmillisecond = 0;
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute = 0;
		#endregion /* Reset timer back to zero END */
		
		if (global.character_select_in_this_menu == "main_game")
		{
			ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		}
		else
		{
			ini_open(game_save_id + "save_file/custom_level_save.ini");
		}
		ini_key_delete(global.level_name, "checkpoint_x");
		ini_key_delete(global.level_name, "checkpoint_y");
		ini_key_delete(global.level_name, "checkpoint_direction");
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		global.checkpoint_x = 0;
		global.checkpoint_y = 0;
		global.lives_until_assist = 0; /* Reset the lives until assist counter if you manually restart a level. This is so you can do a zero defeats */
		
		global.restart_level = true;
		audio_stop_all();
		global.pause = false;
		#endregion /* Restart Level from Start END */
		
	}
}
#endregion /* Show loading icon and reset level END */

#region /* Return to game */
if (keyboard_check_pressed(vk_escape))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_select))
{
	if (!can_remap_key)
	&& (!input_key)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		scr_config_save(); /* Save Config */
		audio_resume_all();
		if (global.music != noone)
		{
			audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
		}
		if (global.music_underwater != noone)
		{
			audio_sound_gain(global.music_underwater, 0, 0);
		}
		if (global.ambience != noone)
		{
			audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
		}
		if (global.ambience_underwater != noone)
		{
			audio_sound_gain(global.ambience_underwater, 0, 0);
		}
		global.pause = false;
	}
}
#endregion /* Return to game END */

/* PAUSE LEVEL SELECT / LEVEL EDITOR MENU */
if (!hide_menu_for_clean_screenshots)
{
	if (!show_loading_icon)
	&& (room == rm_world_map
	|| room == rm_leveleditor
	|| global.pause_room == rm_world_map
	|| global.pause_room == rm_leveleditor)
	{
		
		#region /* Continue */
		if (menu == "continue")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, continue_y, get_window_width * 0.5 + 185, continue_y + 41))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				
				#region /* Return to game */
				audio_resume_all();
				if (global.music != noone)
				{
					audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
				}
				if (global.music_underwater != noone)
				{
					audio_sound_gain(global.music_underwater, 0, 0);
				}
				if (global.ambience != noone)
				{
					audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
				}
				if (global.ambience_underwater != noone)
				{
					audio_sound_gain(global.ambience_underwater, 0, 0);
				}
				global.pause = false;
				#endregion /* Return to game END */
				
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.character_select_in_this_menu == "level_editor")
				&& (global.search_id != "")
				{
					menu = "report";
				}
				else
				if (!global.goal_active)
				{
					menu = "quit";
				}
				else
				{
					menu = "options";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "change_character";
			}
		}
		#endregion /* Continue END */
		
		else
		
		#region /* Change Character */
		if (menu == "change_character")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, change_character_y, get_window_width * 0.5 + 185, change_character_y + 41))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "load_characters";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "continue";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.character_select_in_this_menu == "level_editor")
				{
					menu = "edit_level";
				}
				else
				{
					menu = "options";
				}
			}
		}
		#endregion /* Change Character END */
		
		else
		
		#region /* Edit Level */
		if (menu == "edit_level")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.character_select_in_this_menu == "level_editor")
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_level_y, get_window_width * 0.5 + 185, edit_level_y + 41))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.character_select_in_this_menu == "level_editor")
			{
				if (!file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					if (ds_list_size(global.all_loaded_custom_levels) - 1 < global.max_custom_levels) /* Don't let player download levels if they have reached the max amount of levels stored */
					{
						/* Download the level to working directory */
						menu_delay = 3;
						global.use_temp_or_working = game_save_id;
						scr_copy_move_files(temp_directory + "custom_levels/" + global.level_name, game_save_id + "custom_levels/" + global.level_name, true);
					}
				}
				else
				if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					/* Edit the downloaded level */
					global.doing_clear_check_level = false;
					global.doing_clear_check_character = false;
					global.actually_play_edited_level = false;
					global.play_edited_level = false;
					global.use_temp_or_working = game_save_id;
					can_navigate = false;
					menu_delay = 9999;
					global.restart_level = true;
					global.pause = false;
				}
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "change_character";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "options";
			}
		}
		#endregion /* Edit Level END */
		
		else
		
		#region /* Options */
		if (menu == "options")
		{
			
			#region /* Select Options */
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, option_y, get_window_width * 0.5 + 185, option_y + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_cursor_y_position = 0; /* Reset so the scrolling menus are back to 0 */
				menu_delay = 3;
				scr_audio_play(voice_options, volume_source.voice);
				menu = noone;
				can_navigate_settings_sidebar = true;
				in_settings = true;
				scr_load_storage_variables();
			}
			#endregion /* Select Options END */
			
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.character_select_in_this_menu == "level_editor")
				{
					menu = "edit_level";
				}
				else
				{
					menu = "change_character";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (!global.goal_active)
				{
					if (global.pause_room == rm_leveleditor)
					{
						holding_key_timer = 0;
						menu_delay = 3;
						menu = "restart";
					}
					else
					{
						menu_delay = 3;
						menu = "quit";
					}
				}
				else
				{
					menu_delay = 3;
					menu = "continue";
				}
			}
		}
		#endregion /* Options END */
		
		else
		
		#region /* Restart */
		if (menu == "restart")
		&& (!global.goal_active)
		{
			if (global.checkpoint_x == 0)
			&& (global.checkpoint_y == 0)
			&& (key_a_hold)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			
			|| (global.checkpoint_x != 0)
			&& (global.checkpoint_y != 0)
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			
			|| (global.checkpoint_x == 0)
			&& (global.checkpoint_y == 0)
			&& (global.pause_room == rm_leveleditor)
			&& (mouse_check_button(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, restart_y, get_window_width * 0.5 + 185, restart_y + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			
			|| (global.checkpoint_x != 0)
			&& (global.checkpoint_y != 0)
			&& (global.pause_room == rm_leveleditor)
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, restart_y, get_window_width * 0.5 + 185, restart_y + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.checkpoint_x == 0)
				&& (global.checkpoint_y == 0)
				{
					holding_key_timer += 2;
					
					#region /* Restart Level */
					if (holding_key_timer > 61)
					{
						show_loading_icon = true;
					}
					#endregion /* Restart Level END */
					
				}
				else
				{
					holding_key_timer = 0;
					menu_delay = 3;
					menu = "reset_from_checkpoint";
				}
			}
			else
			if (holding_key_timer > 0)
			{
				holding_key_timer --;
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "options";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit";
			}
		}
		#endregion /* Restart END */
		
		else
		
		#region /* Reset from Checkpoint */
		if (menu == "reset_from_checkpoint")
		&& (!global.goal_active)
		{
			if (key_a_hold)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (mouse_check_button(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer += 2;
				
				#region /* Restart Level */
				if (holding_key_timer > 61)
				{
					show_loading_icon = true;
				}
				#endregion /* Restart Level END */
				
			}
			else
			if (holding_key_timer > 0)
			{
				holding_key_timer --;
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart_nevermind";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_start";
			}
		}
		#endregion /* Restart to Checkpoint END */
		
		else
		
		#region /* Reset from Start */
		if (menu == "reset_from_start")
		&& (!global.goal_active)
		{
			if (key_a_hold)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (mouse_check_button(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer += 2;
				
				#region /* Restart Level */
				if (holding_key_timer > 61)
				{
					show_loading_icon = true;
				}
				#endregion /* Restart Level END */
				
			}
			else
			if (holding_key_timer > 0)
			{
				holding_key_timer --;
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_checkpoint";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart_nevermind";
			}
		}
		#endregion /* Reset from Start END */
		
		else
		
		#region /* Restart Nevermind */
		if (menu == "restart_nevermind")
		&& (!global.goal_active)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_start";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_checkpoint";
			}
		}
		#endregion /* Restart Nevermind END */
		
		else
		
		#region /* Quit */
		if (menu == "quit")
		&& (!global.goal_active)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_world_map)
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, quit_y, get_window_width * 0.5 + 185, quit_y + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, quit_y, get_window_width * 0.5 + 185, quit_y + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.pause_room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "main_game")
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
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.pause_room == rm_leveleditor)
				{
					holding_key_timer = 0;
					menu_delay = 3;
					menu = "restart";
				}
				else
				{
					menu_delay = 3;
					menu = "options";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.character_select_in_this_menu == "level_editor")
				&& (global.search_id != "")
				{
					menu = "report";
				}
				else
				{
					menu = "continue";
				}
			}
		}
		#endregion /* Quit END */
		
		else
		
		#region /* Report */
		if (menu == "report")
		&& (global.character_select_in_this_menu == "level_editor")
		&& (global.search_id != "")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 42, get_window_width + 185, get_window_height))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				report_back_to_menu = "report";
				menu = "report_next";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (!global.goal_active)
				{
					menu = "quit";
				}
				else
				{
					menu = "options";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "continue";
			}
		}
		#endregion /* Report END */
		
		else
		
		#region /* Quit to Map */
		if (menu == "quit_to_map")
		&& (!global.goal_active)
		&& (global.pause_room == rm_leveleditor)
		{
			if (global.character_select_in_this_menu == "level_editor")
			{
				menu = "quit_to_title";
			}
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
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
				#endregion /* Return to Map END */
			
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_nevermind";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_to_title";
			}
		}
		#endregion /* Quit to Map END */
		
		else
		
		#region /* Quit to Title */
		if (menu == "quit_to_title")
		&& (!global.goal_active)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_world_map)
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (global.character_select_in_this_menu == "level_editor")
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				
				#region /* Return to Title */
				
				/* Reset timer back to zero */
				global.timeattack_realmillisecond = 0;
				global.timeattack_millisecond = 0;
				global.timeattack_second = 0;
				global.timeattack_minute = 0;
				
				global.quit_level = true;
				global.quit_to_title = true;
				audio_stop_all();
				global.pause = false;
				#endregion /* Return to Title END */
				
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.pause_room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "main_game")
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
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.enable_option_for_pc)
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
		&& (!global.goal_active)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (global.enable_option_for_pc)
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_world_map)
			&& (global.enable_option_for_pc)
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (global.enable_option_for_pc)
			&& (global.character_select_in_this_menu == "level_editor")
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_game_no";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_to_title";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_nevermind";
			}
		}
		#endregion /* Quit to Desktop END */
		
		else
		
		#region /* Quit Nevermind */
		if (menu == "quit_nevermind")
		&& (!global.goal_active)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, quit_nevermind_y, get_window_width * 0.5 + 185, quit_nevermind_y + 42))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.enable_option_for_pc)
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
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.pause_room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "main_game")
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
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "continue")
			|| (menu == "change_character")
			|| (menu == "edit_level")
			|| (menu == "options")
			|| (menu == "restart")
			|| (menu == "quit")
			{
				scr_config_save(); /* Save Config */
				audio_resume_all();
				if (global.music != noone)
				{
					audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
				}
				if (global.music_underwater != noone)
				{
					audio_sound_gain(global.music_underwater, 0, 0);
				}
				if (global.ambience != noone)
				{
					audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
				}
				if (global.ambience_underwater != noone)
				{
					audio_sound_gain(global.ambience_underwater, 0, 0);
				}
				global.pause = false;
			}
			else
			
			#region /* Return to first menu */
			if (menu == "reset_from_checkpoint")
			|| (menu == "reset_from_start")
			|| (menu == "restart_nevermind")
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart";
			}
			else
			if (menu == "quit_to_map")
			|| (menu == "quit_to_title")
			|| (menu == "quit_to_desktop")
			|| (menu == "quit_nevermind")
			{
				menu_delay = 3;
				menu = "quit";
			}
			#endregion /* Return to first menu END */
			
		}
		#endregion /* Return to game by pressing the back key END */
		
	}
	scr_character_select_menu_step();
	
	if (menu == "load_characters")
	{
		scr_load_rest_of_characters();
	}
}