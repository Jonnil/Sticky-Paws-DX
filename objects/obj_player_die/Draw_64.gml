#region /*Game Over*/
if (lives <= 0)
{
	
	#region /*When you get a game over, reset checkpoints*/
	global.x_checkpoint=0;
	global.y_checkpoint=0;
	global.checkpoint_millisecond=0;
	global.checkpoint_second=0;
	global.checkpoint_minute=0;
	global.checkpoint_realmillisecond=0;
	#endregion /*When you get a game over, reset checkpoints END*/
	
	window_get_height()
	
	draw_set_halign(fa_center);
	if (iris_xscale <= 0.3)
	{
		game_over_sprite_y = lerp(game_over_sprite_y, window_get_height() / 2 + 170, 0.07);
		game_over_text_y = lerp(game_over_text_y, window_get_height() / 2 - 180, 0.1);
	}
	
	if (sprite_game_over_character_portrait > noone)
	{
		draw_sprite(sprite_game_over_character_portrait, image_index, window_get_width() / 2, game_over_sprite_y);
	}
	
	draw_sprite(spr_game_over_text, image_index, window_get_width() / 2, game_over_text_y);
	
	#region /*Continue / Quit from Game Over*/
	if (game_over_text_y >= window_get_height() / 2 - 190)
	{
		draw_menu_button(window_get_width() / 2 - 370 - game_over_menu_seperation_distance, window_get_height() / 2 + game_over_menu_y, "Continue", "continue", "continue");
		draw_menu_button(window_get_width() / 2 + game_over_menu_seperation_distance, window_get_height() / 2 + game_over_menu_y, "Quit", "quit", "quit");
		
		if (keyboard_check_pressed(global.player1_key_left))
		or (keyboard_check_pressed(global.player2_key_left))
		or (keyboard_check_pressed(global.player3_key_left))
		or (keyboard_check_pressed(global.player4_key_left))
		or (keyboard_check_pressed(global.player1_key2_left))
		or (keyboard_check_pressed(global.player2_key2_left))
		or (keyboard_check_pressed(global.player3_key2_left))
		or (keyboard_check_pressed(global.player4_key2_left))
		or (keyboard_check_pressed(ord("A")))
		or (keyboard_check_pressed(vk_left))
		or (gamepad_button_check_pressed(0, gp_padl))
		or (gamepad_button_check_pressed(1, gp_padl))
		or (gamepad_button_check_pressed(2, gp_padl))
		or (gamepad_button_check_pressed(3, gp_padl))
		or (gamepad_axis_value(0, gp_axislh) < 0)
		or (keyboard_check_pressed(global.player1_key_right))
		or (keyboard_check_pressed(global.player2_key_right))
		or (keyboard_check_pressed(global.player3_key_right))
		or (keyboard_check_pressed(global.player4_key_right))
		or (keyboard_check_pressed(global.player1_key2_right))
		or (keyboard_check_pressed(global.player2_key2_right))
		or (keyboard_check_pressed(global.player3_key2_right))
		or (keyboard_check_pressed(global.player4_key2_right))
		or (keyboard_check_pressed(ord("D")))
		or (keyboard_check_pressed(vk_right))
		or (gamepad_button_check_pressed(0, gp_padr))
		or (gamepad_button_check_pressed(1, gp_padr))
		or (gamepad_button_check_pressed(2, gp_padr))
		or (gamepad_button_check_pressed(3, gp_padr))
		or (gamepad_axis_value(0, gp_axislh) > 0)
		{
			if (menu_delay = 0)
			{
				if (menu = "continue")
				{
					menu = "quit";
					menu_delay = 10;
				}
				else
				if (menu = "quit")
				{
					menu = "continue";
					menu_delay = 10;
				}
			}
		}
		
		if (keyboard_check_pressed(global.player1_key_jump))
		or (keyboard_check_pressed(global.player2_key_jump))
		or (keyboard_check_pressed(global.player3_key_jump))
		or (keyboard_check_pressed(global.player4_key_jump))
		or (keyboard_check_pressed(global.player1_key2_jump))
		or (keyboard_check_pressed(global.player2_key2_jump))
		or (keyboard_check_pressed(global.player3_key2_jump))
		or (keyboard_check_pressed(global.player4_key2_jump))
		or (keyboard_check_pressed(ord("Z")))
		or (keyboard_check_pressed(vk_space))
		or (keyboard_check_pressed(vk_enter))
		or (gamepad_button_check_pressed(0, gp_face1))
		or (gamepad_button_check_pressed(1, gp_face1))
		or (gamepad_button_check_pressed(2, gp_face1))
		or (gamepad_button_check_pressed(3, gp_face1))
		or (menu = "continue")
		and (point_in_rectangle(
		window_mouse_get_x(),
		window_mouse_get_y(),
		window_get_width() / 2 - 370 - game_over_menu_seperation_distance,
		window_get_height() / 2 + game_over_menu_y + 2,
		window_get_width() / 2 - 370 + 370 - game_over_menu_seperation_distance,
		window_get_height() / 2 + game_over_menu_y + 41))
		and (mouse_check_button_pressed(mb_left))
		or (menu = "quit")
		and (point_in_rectangle(
		window_mouse_get_x(),
		window_mouse_get_y(),
		window_get_width() / 2 + game_over_menu_seperation_distance,
		window_get_height() / 2 + game_over_menu_y + 2,
		window_get_width() / 2 + 370 + game_over_menu_seperation_distance,
		window_get_height() / 2 + game_over_menu_y + 41))
		and (mouse_check_button_pressed(mb_left))
		{
			
			#region /*Click Menu*/
			if (global.playergame = 0)
			{
				lives = 5;
			}
			if (global.playergame = 1)
			{
				lives = 10;
			}
			if (global.playergame = 2)
			{
				lives = 15;
			}
			if (global.playergame = 3)
			{
				lives = 20;
			}
				
			if (menu = "quit")
			{
				global.quit_level = true; /*Quit level and go to map screen*/
			}
				
			#region /*Reset Level*/
			global.timeattack_realmillisecond=0;
			global.theme="ground";
			global.level_clear_rate = "enter";
			score = 0;
			scr_savelevel();
			audio_stop_all();
				
			#region /*Go to level editor if you die in level editor*/
			if (asset_get_type("room_leveleditor")==asset_room)
			and(room=room_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /*Go to level editor if you die in level editor END*/
				
			#endregion /*Reset Level END*/
			
			#endregion /*Click Menu END*/
			
		}
	}
	#endregion /*Continue / Quit from Game Over END*/
	
}
#endregion /*Game Over END*/

#region /*Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation = "mouse")
and (os_type != os_ios)
and (os_type != os_android)
{
	draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/