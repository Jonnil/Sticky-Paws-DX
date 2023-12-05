var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* Game Over */
if (lives <= 0)
{
	
	#region /* When you get a game over, reset checkpoints */
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
	#endregion /* When you get a game over, reset checkpoints END */
	
	draw_set_halign(fa_center);
	if (iris_xscale <= 0.3)
	{
		game_over_sprite_y = lerp(game_over_sprite_y, get_window_height * 0.5 + 170, 0.07);
		game_over_text_y = lerp(game_over_text_y, get_window_height * 0.5 - 180, 0.1);
	}
	
	if (sprite_game_over_character_portrait > noone)
	{
		draw_sprite(sprite_game_over_character_portrait, image_index, get_window_width * 0.5, game_over_sprite_y);
	}
	
	draw_sprite(spr_game_over_text, image_index, get_window_width * 0.5, game_over_text_y);
	
	#region /* Continue / Quit from Game Over */
	if (game_over_text_y >= get_window_height * 0.5 - 190)
	{
		draw_menu_button(get_window_width * 0.5 - 370 - game_over_menu_seperation_distance, get_window_height - game_over_menu_y, l10n_text("Continue"), "continue", "continue");
		
		if (global.go_to_menu_when_going_back_to_title == "online_download_list_load")
		{
			var quit_to_title_name = "Quit to Online Level List";
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var quit_to_title_name = "Quit to Level Select";
		}
		else
		{
			var quit_to_title_name = "Quit to Map";
		}
		
		draw_menu_button(get_window_width * 0.5 + game_over_menu_seperation_distance, get_window_height - game_over_menu_y, l10n_text(string(quit_to_title_name)), "quit", "quit", c_red);
		
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][2][1][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][3][1][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][4][1][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][2][2][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][3][2][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][4][2][action.left]))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_padl))
		|| (gamepad_button_check_pressed(global.player_slot[2], gp_padl))
		|| (gamepad_button_check_pressed(global.player_slot[3], gp_padl))
		|| (gamepad_button_check_pressed(global.player_slot[4], gp_padl))
		|| (gamepad_axis_value(global.player_slot[1], gp_axislh) < -0.3)
		|| (keyboard_check_pressed(global.player_[inp.key][1][1][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][2][1][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][3][1][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][4][1][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][2][2][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][3][2][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][4][2][action.right]))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_padr))
		|| (gamepad_button_check_pressed(global.player_slot[2], gp_padr))
		|| (gamepad_button_check_pressed(global.player_slot[3], gp_padr))
		|| (gamepad_button_check_pressed(global.player_slot[4], gp_padr))
		|| (gamepad_axis_value(global.player_slot[1], gp_axislh) > +0.3)
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (menu == "continue")
				{
					menu = "quit";
					menu_delay = 3;
				}
				else
				if (menu == "quit")
				{
					menu = "continue";
					menu_delay = 3;
				}
			}
		}
		
		if (keyboard_check_pressed(vk_enter))
		|| (keyboard_check_pressed(vk_space))
		|| (keyboard_check_pressed(global.player_[inp.key][1][1][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][2][1][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][3][1][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][4][1][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][2][2][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][3][2][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][4][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept]))
		|| (menu == "continue")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370 - game_over_menu_seperation_distance, get_window_height - game_over_menu_y + 2, get_window_width * 0.5 - 370 + 370 - game_over_menu_seperation_distance, get_window_height - game_over_menu_y + 41))
		&& (mouse_check_button_released(mb_left))
		|| (menu == "quit")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + game_over_menu_seperation_distance, get_window_height - game_over_menu_y + 2, get_window_width * 0.5 + 370 + game_over_menu_seperation_distance, get_window_height - game_over_menu_y + 41))
		&& (mouse_check_button_released(mb_left))
		{
			
			#region /* Click Menu */
			if (global.playergame == 0)
			{
				lives = 5;
			}
			else
			if (global.playergame == 1)
			{
				lives = 10;
			}
			else
			if (global.playergame == 2)
			{
				lives = 15;
			}
			else
			if (global.playergame == 3)
			{
				lives = 20;
			}
			
			if (global.character_select_in_this_menu == "main_game")
			{
				ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
				ini_write_real("Player", "lives", lives);
				ini_close();
			}
			
			#region /* Reset Level */
			global.timeattack_realmillisecond = 0;
			score = 0;
			scr_save_level();
			audio_stop_all();
			
			#region /* Go to level editor if you die in level editor */
			if (global.character_select_in_this_menu == "level_editor")
			{
				global.play_edited_level = false;
			}
			#endregion /* Go to level editor if you die in level editor END */
			
			if (menu == "quit")
			{
				room_persistent = false; /* Turn OFF Room Persistency */
				if (global.character_select_in_this_menu == "level_editor")
				{
					room_goto(rm_title);
				}
				else
				{
					global.quit_level = true; /* Quit level and go to map screen */
					room_goto(rm_world_map);
				}
			}
			else
			{
				room_restart();
			}
			
			#endregion /* Reset Level END */
			
			#endregion /* Click Menu END */
			
		}
	}
	#endregion /* Continue / Quit from Game Over END */
	
}
#endregion /* Game Over END */

#region /* Draw loading screen when reloading level */
if (iris_xscale <= 0.01)
&& (lives >= 1)
{
	if (global.enable_transitions)
	{
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false); /* Make the screen completly black in Draw GUI whenever the iris is small enough, to make sure that effects are completly hidden */
	}
	scr_draw_loading(1);
}
#endregion /* Draw loading screen when reloading level END */

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();