//draw_text_outlined(320, 320, string(global.level_clear_rate), global.default_text_size, c_black, c_white, 1);

///HUD
if (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	
	#region /*Show HUD timers*/
	
	#region /*If HUD show timer is set to always hide*/
	if (global.hud_hide_time <= 0)
	or (show_letterbox > 0)
	{
		global.hud_show_lives = false;
		global.hud_show_deaths = false;
		global.hud_show_big_collectibles = false;
		global.hud_show_basic_collectibles = false;
		global.hud_show_score = false;
	}
	#endregion /*If HUD show timer is set to always hide*/
	
	#region /*If HUD show timer is set to never hide*/
	if (global.hud_hide_time >= 10)
	{
		global.hud_show_lives = true;
		if (global.show_deaths_counter = true)
		{
			global.hud_show_deaths = true;
		}
		global.hud_show_big_collectibles = true;
		global.hud_show_basic_collectibles = true;
		global.hud_show_score = true;
	}
	#endregion /*If HUD show timer is set to never hide*/
	
	if (global.hud_hide_time >= 10)
	{
		global.hud_show_lives = true;
		if (global.show_deaths_counter = true)
		{
			global.hud_show_deaths = true;
		}
		global.hud_show_basic_collectibles = true;
		global.hud_show_big_collectibles = true;
		global.hud_show_score = true;
		hud_show_lives_timer = global.hud_hide_time * 60;
		hud_show_deaths_timer = global.hud_hide_time * 60;
		hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
		hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		hud_show_score_timer = global.hud_hide_time * 60;
	}
	else
	{
		if (hud_show_lives_timer = 0)
		{
			global.hud_show_lives = false;
		}
		if (hud_show_lives_timer > 0)
		{
			hud_show_lives_timer -= 1;
		}
		if (hud_show_deaths_timer = 0)
		{
			global.hud_show_deaths = false;
		}
		if (hud_show_deaths_timer > 0)
		{
			hud_show_deaths_timer -= 1;
		}
		if (hud_show_basic_collectibles_timer = 0)
		{
			global.hud_show_basic_collectibles = false;
		}
		if (hud_show_basic_collectibles_timer > 0)
		{
			hud_show_basic_collectibles_timer -= 1;
		}
		if (hud_show_big_collectibles_timer = 0)
		{
			global.hud_show_big_collectibles = false;
		}
		if (hud_show_big_collectibles_timer > 0)
		{
			hud_show_big_collectibles_timer -= 1;
		}
		if (hud_show_score_timer = 0)
		{
			global.hud_show_score = false;
		}
		if (hud_show_score_timer > 0)
		{
			hud_show_score_timer -= 1;
		}
	}
	
	if (global.hud_hide_time > 0)
	{
		
		#region /*Show Lives*/
		if (asset_get_type("room_world_map") == asset_room)
		and (room = room_world_map)
		{
			hud_show_lives = 32;
		}
		else
		{
			if (global.hud_show_lives = true)
			{
				hud_show_lives = lerp(hud_show_lives, 32, 0.1);
			}
			else
			{
				hud_show_lives = lerp(hud_show_lives, -32, 0.1);
			}
		}
		#endregion /*Show Lives END*/
		
		#region /*Show Deaths*/
		if (global.hud_show_deaths = true)
		and (global.show_deaths_counter = true)
		{
			if (hud_show_lives > 0)
			{
				hud_show_deaths = lerp(hud_show_deaths, 70, 0.1);
			}
			else
			{
				hud_show_deaths = lerp(hud_show_deaths, 32, 0.1);
			}
		}
		else
		{
			hud_show_deaths = lerp(hud_show_deaths, -32, 0.1);
		}
		#endregion /*Show Deaths END*/
		
		#region /*Show Big Collectibles*/
		if (global.hud_show_big_collectibles = true)
		{
			if (hud_show_lives > 0)
			and (hud_show_deaths > 0)
			and (global.show_deaths_counter = true)
			{
				hud_show_big_collectibles = lerp(hud_show_big_collectibles, 110, 0.1);
			}
			else
			if (hud_show_lives > 0)
			and (hud_show_deaths < 0)
			or (hud_show_lives < 0)
			and (hud_show_deaths > 0)
			and (global.show_deaths_counter = true)
			{
				hud_show_big_collectibles = lerp(hud_show_big_collectibles, 70, 0.1);
			}
			else
			{
				hud_show_big_collectibles = lerp(hud_show_big_collectibles, 30, 0.1);
			}
		}
		else
		{
			hud_show_big_collectibles = lerp(hud_show_big_collectibles, -32, 0.1);
		}
		#endregion /*Show Big Collectibles END*/
		
		#region /*Show Basic Collectible*/
		if (global.hud_show_basic_collectibles = true)
		{
			if (hud_show_lives > 0)
			and (hud_show_deaths > 0)
			and (global.show_deaths_counter = true)
			and (hud_show_big_collectibles > 0)
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 150, 0.1);
			}
			else
			if (hud_show_lives < 0)
			and (hud_show_deaths > 0)
			and (global.show_deaths_counter = true)
			and (hud_show_big_collectibles > 0)
			or (hud_show_lives > 0)
			and (hud_show_deaths < 0)
			and (hud_show_big_collectibles > 0)
			or (hud_show_lives > 0)
			and (hud_show_deaths > 0)
			and (global.show_deaths_counter = true)
			and (hud_show_big_collectibles < 0)
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 110, 0.1);
			}
			else
			if (hud_show_lives > 0)
			and (hud_show_deaths < 0)
			and (hud_show_big_collectibles < 0)
			or (hud_show_lives < 0)
			and (hud_show_deaths > 0)
			and (global.show_deaths_counter = true)
			and (hud_show_big_collectibles < 0)
			or (hud_show_lives < 0)
			and (hud_show_deaths < 0)
			and (hud_show_big_collectibles > 0)
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 64, 0.1);
			}
			else
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 32, 0.1);
			}
		}
		else
		{
			hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, -32, 0.1);
		}
		#endregion /*Show Basic Collectible END*/
		
		#region /*Show Score*/
		if (global.hud_show_score = true)
		{
			hud_show_score = lerp(hud_show_score, 32, 0.1);
		}
		else
		{
			hud_show_score = lerp(hud_show_score, -32, 0.1);
		}
		#endregion /*Show Score END*/
		
	}
	
	#endregion /*Show HUD timers END*/
		
	#region /*Lives, Deaths, Big Collectibles, Basic Collectibles, Score and Timer*/
	if (asset_get_type("obj_pause") == asset_object)
	and (!instance_exists(obj_pause))
	{
		
		#region /*Lives*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		if (sprite_lives_icon > noone)
		{
			draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_lives, 1, 1, 0, c_white, 1);
		}
		if (lives < 0)
		{
			draw_text_outlined(64, hud_show_lives, "0", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(64, hud_show_lives, lives, global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Lives END*/
		
		#region /*Death Counter*/
		if (global.show_deaths_counter = true)
		{
			if (sprite_lives_icon > noone)
			{
				draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_deaths, 0.75, 0.75, 0, c_gray, 1);
			}
			draw_line_width_color (32- 16, hud_show_deaths - 16, 32+ 16, hud_show_deaths+ 16, 3, c_red, c_red);
			draw_line_width_color (32- 16, hud_show_deaths+ 16, 32+ 16, hud_show_deaths - 16, 3, c_red, c_red);
			draw_text_outlined(64, hud_show_deaths, string(global.lives_until_assist), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Death Counter END*/
		
		#region /*Big Collectibles*/
		
		#region /*Big Collectible 1*/
		if (global.big_collectible1 = false)
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 1 END*/
	
		#region /*Big Collectible 2*/
		if (global.big_collectible2 = false)
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 2 END*/
	
		#region /*Big Collectible 3*/
		if (global.big_collectible3 = false)
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 3 END*/
	
		#region /*Big Collectible 4*/
		if (global.big_collectible4 = false)
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 4 END*/
	
		#region /*Big Collectible 5*/
		if (global.big_collectible5 = false)
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 5 END*/
	
		#endregion /*Big Collectibles*/
	
		#region /*Basic Collectible*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_sprite_ext(global.resourcepack_sprite_basic_collectible, 0, 32, hud_show_basic_collectibles, 0.75, 0.75, 0, c_white, 1);
		draw_text_outlined(64, hud_show_basic_collectibles, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
		#endregion /*Basic Collectible END*/
		
		#region /*Score*/
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_text_outlined(window_get_width() - 200, hud_show_score, "SCORE\n" + string(score), global.default_text_size, c_white, c_black, 1);
		#endregion /*Score END*/
		
		#region /*Time Countdown*/
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		or (asset_get_type("obj_player_die") == asset_object)
		and (instance_exists(obj_player_die))
		{

			#region /*Time is running out message*/
			if (global.player_has_entered_goal = false)
			{
				if (global.time_countdown <= 99)
				and (global.time_countdown >= 95)
				{
					draw_set_halign(fa_center);
					draw_set_valign(fa_center);
					draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, "HURRY UP!", global.default_text_size, c_black, c_orange, 1);
					draw_text_transformed_color (display_get_gui_width() / 2, display_get_gui_height() / 2, "HURRY UP!", global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
				}
			}
			#endregion /*Time is running out message END*/

			#region /*Time Over Message*/
			if (global.time_countdown = 0)
			and (global.player_has_entered_goal = false)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
				draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, "TIME OVER", global.default_text_size * 5, c_black, c_white, 1);
			}
			#endregion /*Time Over Message END*/

			if (global.hud_hide_time > 0)
			if (global.time_countdown >= 0)
			{
				draw_set_halign(fa_right);
				draw_set_valign(fa_center);
				if (global.player_has_entered_goal = false)
				{
					if (global.time_countdown = 0)
					{
						draw_text_outlined(window_get_width() - 32, 32, "TIME\n0", global.default_text_size, c_black, c_red, 1);
					}
					else
					{
						if (global.time_countdown >= 100)
						{
							draw_text_outlined(window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_yellow, 1);
							draw_text_transformed_color (window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_orange, c_orange, c_orange, c_orange, timer_blinking_alpha);
						}
						else
						{
							draw_text_outlined(window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_orange, 1);
							draw_text_transformed_color (window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
						}
					}
					if (global.timeattack_millisecond < room_speed / 2)
					{
						timer_blinking_alpha = lerp(timer_blinking_alpha, 1, 0.2);
					}
					else
					{
						timer_blinking_alpha = lerp(timer_blinking_alpha, 0, 0.2);
					}
				}
				else
				{
					draw_text_outlined(window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
				}
			}
		
			#region /*Time countup in Minutes, Seconds and Milliseconds*/
			if (global.show_timer = true)
			{
				draw_set_halign(fa_right)
				if (global.timeattack_minute > 0)
				{
					draw_text_outlined(window_get_width() - 90, 74, string(global.timeattack_minute) + ":", global.default_text_size, c_black, c_white, 1);
				}
				if (global.timeattack_minute <= 0)
				and (global.timeattack_second <= 9)
				{
					draw_text_outlined(window_get_width() - 60, 74, global.timeattack_second, global.default_text_size, c_black, c_white, 1);
				}
				else
				{
					draw_text_outlined(window_get_width() - 60, 74, string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, c_white, 1);
				}
				draw_text_outlined(window_get_width() - 30, 74, "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size*0.75, c_black, c_white, 1);
			}
			#endregion /*Time countup in Minutes, Seconds and Milliseconds END*/
		
		}
		#endregion /*Time Countdown END*/
		
	}
	#endregion /*Lives, Deaths, Big Collectibles, Basic Collectibles, Score and Timer END*/

}

scr_show_fps();

if (global.pause = false)
and (global.show_instance_count = true)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text_outlined( 32, 164, "Instance Count: " + string(instance_count), global.default_text_size, c_black, c_white, 1);
}

#region /*Show if you have Assist mode enabled or not*/
if (global.assist_enable = true)
and (global.assist_show_assist_mode_text = true)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width() -32, window_get_height() -32, "Assist Mode", global.default_text_size, c_black, c_white, 1);
}
#endregion /*Show if you have Assist mode enabled or not END*/

#region /*Show Controls*/
if (os_type != os_ios)
and (os_type != os_android)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	
	#region /*Show Multiplayer Controls*/
	if (global.player1_can_play = true)
	or (global.player2_can_play = true)
	or (global.player3_can_play = true)
	or (global.player4_can_play = true)
	{
		
		#region /*Y position of show controls for each player*/
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 32, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /*+ 32 = don't show*/
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player2_controls_y = lerp(show_player2_controls_y, 32, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /*+ 32 = don't show*/
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /*+ 32 = don't show*/
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha > 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player4_controls_y = lerp(show_player4_controls_y, 32, 0.1);
		}
		else
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 74, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, 32, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /*+ 32 = don't show*/
		}
		else
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 116, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, 74, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /*+ 32 = don't show*/
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /*+ 32 = don't show*/
		}
		else
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 158, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, 116, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, 74, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, 32, 0.1);
		}
		
		#endregion /*Y position of show controls for each player END*/
		
		#region /*MULTIPLAYER PLAYER 1*/
		if (player1 >= 1)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player1_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			show_dive_key_x = 32;
			show_jump_key_x = 32+ 150;
			show_crouch_key_x = 32+ 150 + 150;
			if (global.player1_sprint_toggle = false)
			{
				show_sprint_key_x = 32+ 150 + 150 + 150;
				show_left_key_x = 32+ 150 + 150 + 150 + 150;
				show_right_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
				show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150 + 150;
			}
			else
			{
				show_sprint_key_x = -999;
				show_left_key_x = 32+ 150 + 150 + 150;
				show_right_key_x = 32+ 150 + 150 + 150 + 150;
				show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
			}
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_dive > noone)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_dive, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_dive > noone)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_dive, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_jump > noone)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_jump > noone)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_crouch> noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_crouch> noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_crouch_toggle > noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch_toggle, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_crouch_toggle > noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch_toggle, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player1_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 2, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key_sprint> noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key2_sprint> noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key_sprint_toggle > noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint_toggle, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key2_sprint_toggle > noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint_toggle, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_left> noone)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_left> noone)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_right> noone)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_right> noone)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_down > noone)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_down, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_down > noone)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_down, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 5, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_up > noone)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_up, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_up > noone)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_up, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
		}
		else
		if (player1 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player1_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			and (can_spawn_player1 = true)
			and (global.player1_key_jump > noone)
			and (lives > 0)
			and (global.player1_show_controls >= 1)
			{
				player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player1_controls_y, "Join Game", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				if (gamepad_is_connected(0))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 200, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 1 END*/
		
		#region /*MULTIPLAYER PLAYER 2*/
		if (player2 >= 1)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player2_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			player2_show_dive_key_x = 32;
			player2_show_jump_key_x = 32+ 150;
			player2_show_crouch_key_x = 32+ 150 + 150;
			if (global.player2_sprint_toggle = false)
			{
				player2_show_sprint_key_x = 32+ 150 + 150 + 150;
				player2_show_left_key_x = 32+ 150 + 150 + 150 + 150;
				player2_show_right_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				player2_show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
				player2_show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150 + 150;
			}
			else
			{
				player2_show_sprint_key_x = -999;
				player2_show_left_key_x = 32+ 150 + 150 + 150;
				player2_show_right_key_x = 32+ 150 + 150 + 150 + 150;
				player2_show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				player2_show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
			}
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, "Pounce", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_dive > noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, "Pounce", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_dive > noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, "Pounce", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, "Jump", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_jump > noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, "Jump", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_jump > noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, "Jump", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_crouch> noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_crouch> noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_crouch_toggle > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_crouch_toggle > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player2_sprint_toggle = false)
			{
				if (gamepad_is_connected(1))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 2, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key_sprint> noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key2_sprint> noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key_sprint_toggle > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key2_sprint_toggle > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, "Left", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_left> noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, "Left", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_left> noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, "Left", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, "Right", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_right> noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, "Right", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_right> noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, "Right", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, "Down", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_down > noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, "Down", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_down > noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, "Down", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(1))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, "Up", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 5, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_up > noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, "Up", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_up > noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, "Up", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
		}
		else
		if (player2 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player2_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);

			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			and (can_spawn_player2 = true)
			and (global.player2_key_jump > noone)
			and (lives > 0)
			and (global.player2_show_controls >= 1)
			{
				player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player2_controls_y, "Join Game", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				if (gamepad_is_connected(1))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, 200, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 2 END*/
		
		#region /*MULTIPLAYER PLAYER 3*/
		if (player3 >= 1)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player3_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			player3_show_dive_key_x = 32;
			player3_show_jump_key_x = 32+ 150;
			player3_show_crouch_key_x = 32+ 150 + 150;
			if (global.player3_sprint_toggle = false)
			{
				player3_show_sprint_key_x = 32+ 150 + 150 + 150;
				player3_show_left_key_x = 32+ 150 + 150 + 150 + 150;
				player3_show_right_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				player3_show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
				player3_show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150 + 150;
			}
			else
			{
				player3_show_sprint_key_x = -999;
				player3_show_left_key_x = 32+ 150 + 150 + 150;
				player3_show_right_key_x = 32+ 150 + 150 + 150 + 150;
				player3_show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				player3_show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
			}
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, "Pounce", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_dive > noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, "Pounce", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_dive > noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, "Pounce", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, "Jump", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_jump > noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, "Jump", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_jump > noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, "Jump", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_crouch> noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_crouch> noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_crouch_toggle > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_crouch_toggle > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player3_sprint_toggle = false)
			{
				if (gamepad_is_connected(2))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 0, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key_sprint> noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key2_sprint> noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key_sprint_toggle > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key2_sprint_toggle > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, "Left", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_left> noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, "Left", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_left> noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, "Left", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, "Right", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_right> noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, "Right", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_right> noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, "Right", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, "Down", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_down > noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, "Down", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_down > noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, "Down", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(2))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, "Up", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 5, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_up > noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, "Up", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_up > noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, "Up", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
		}
		else
		if (player3 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player3_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			and (can_spawn_player3 = true)
			and (global.player3_key_jump > noone)
			and (lives > 0)
			and (global.player3_show_controls >= 1)
			{
				player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player3_controls_y, "Join Game", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				if (gamepad_is_connected(2))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, 200, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 3 END*/
		
		#region /*MULTIPLAYER PLAYER 4*/
		if (player4 >= 1)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player4_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			player4_show_dive_key_x = 32;
			player4_show_jump_key_x = 32+ 150;
			player4_show_crouch_key_x = 32+ 150 + 150;
			if (global.player4_sprint_toggle = false)
			{
				player4_show_sprint_key_x = 32+ 150 + 150 + 150;
				player4_show_left_key_x = 32+ 150 + 150 + 150 + 150;
				player4_show_right_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				player4_show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
				player4_show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150 + 150;
			}
			else
			{
				player4_show_sprint_key_x = -999;
				player4_show_left_key_x = 32+ 150 + 150 + 150;
				player4_show_right_key_x = 32+ 150 + 150 + 150 + 150;
				player4_show_down_key_x = 32+ 150 + 150 + 150 + 150 + 150;
				player4_show_up_key_x = 32+ 150 + 150 + 150 + 150 + 150 + 150;
			}
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, "Pounce", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_dive > noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, "Pounce", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_dive > noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, "Pounce", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, "Jump", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_jump > noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, "Jump", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_jump > noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, "Jump", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_crouch> noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_crouch> noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_crouch_toggle > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_crouch_toggle > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player4_sprint_toggle = false)
			{
				if (gamepad_is_connected(3))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 2, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key_sprint> noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key2_sprint> noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key_sprint_toggle > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key2_sprint_toggle > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, "Left", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_left> noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, "Left", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_left> noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, "Left", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, "Right", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_right> noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, "Right", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_right> noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, "Right", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, "Down", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 7, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_down > noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, "Down", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_down > noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, "Down", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(3))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, "Up", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 5, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_up > noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, "Up", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_up > noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, "Up", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
		}
		else
		if (player4 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player4_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			and (can_spawn_player4 = true)
			and (global.player4_key_jump > noone)
			and (lives > 0)
			and (global.player4_show_controls >= 1)
			{
				player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player4_controls_y, "Join Game", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				if (gamepad_is_connected(3))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, 200, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 4 END*/
		
	}
	#endregion /*Show Multiplayer Controls END*/
	
}
#endregion /*Show Controls END*/

#region /*Show what input is used*/
if (show_controller_input_change_prompt > 0)
{
	show_controller_input_change_prompt -= 1;
	show_keyboard_and_mouse_input_change_prompt = 0;
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, -400, 0.1);
}
else
{
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, 0, 0.1);
}

if (show_keyboard_and_mouse_input_change_prompt > 0)
{
	show_keyboard_and_mouse_input_change_prompt -= 1;
	show_controller_input_change_prompt = 0;
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, -400, 0.1);
}
else
{
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, 0, 0.1);
}
if (global.player1_can_play >= 1) /*Only show controller input change if there is only one player in the game*/
and (global.player2_can_play <= 0)
and (global.player3_can_play <= 0)
and (global.player4_can_play <= 0)
or (global.player1_can_play <= 0)
and (global.player2_can_play >= 1)
and (global.player3_can_play <= 0)
and (global.player4_can_play <= 0)
or (global.player1_can_play <= 0)
and (global.player2_can_play <= 0)
and (global.player3_can_play >= 1)
and (global.player4_can_play <= 0)
or (global.player1_can_play <= 0)
and (global.player2_can_play <= 0)
and (global.player3_can_play <= 0)
and (global.player4_can_play >= 1)
{
	draw_sprite_ext(spr_change_input_to_controller, 0, 110, window_get_height() + 300 + show_controller_input_change_prompt_y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_change_input_to_keyboard, 0, 110, window_get_height() + 300 + show_keyboard_and_mouse_input_change_prompt_y, 1, 1, 0, c_white, 1);
}
#endregion /*Show what input is used END*/

scr_virtual_keys();

#region /*Letterboxing during cutscenes (when the player object is absent)*/
if (show_letterbox > 0)
and (global.play_edited_level = false)
and (global.actually_play_edited_level = false)
or (show_letterbox > 0)
and (global.play_edited_level = true)
and (global.actually_play_edited_level = true)
{
	draw_rectangle_color (0, 0, room_width*3, letterbox_top_y, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color (0, letterbox_bottom_y, room_width*3, window_get_height(), c_black, c_black, c_black, c_black, false);
}
if (asset_get_type("obj_player") == asset_object)
and (!instance_exists(obj_player))
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
or (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.can_move = false)
{
	letterbox_top_y = lerp(letterbox_top_y, +64, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, window_get_height() - 64, 0.1);
	show_letterbox = 60;
}
else
{
	letterbox_top_y = lerp(letterbox_top_y, 0, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, window_get_height(), 0.1);
	if (show_letterbox > 0)
	{
		show_letterbox -= 1;
	}
}
#endregion /*Letterboxing during cutscenes (when the player object is absent) END*/

#region /*Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation = "mouse")
and (os_type != os_ios)
and (os_type != os_android)
and (global.pause = false)
{
	draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/