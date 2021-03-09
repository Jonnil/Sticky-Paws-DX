///HUD
if (asset_get_type("obj_title") == asset_object)
and(!instance_exists(obj_title))
	{
		
		#region /*Show HUD timers*/

		#region /*If HUD show timer is set to always hide*/
		if (global.hud_show_timer <= 0)
		{
			global.hud_show_lives = false;
			global.hud_show_big_collectibles = false;
			global.hud_show_big_collectibles = false;
			global.hud_show_score = false;
		}
		#endregion /*If HUD show timer is set to always hide*/

		#region /*If HUD show timer is set to never hide*/
		if (global.hud_show_timer >= 600)
		{
			global.hud_show_lives = true;
			global.hud_show_big_collectibles = true;
			global.hud_show_big_collectibles = true;
			global.hud_show_score = true;
		}
		#endregion /*If HUD show timer is set to never hide*/

		#region /*Show Lives*/
		if (asset_get_type("room_level_select") == asset_room)
		and(room = room_level_select)
		{
			hud_show_lives = 32;
		}
		else
		{
			if (global.hud_show_lives = true)
			{
				hud_show_lives = lerp(hud_show_lives, 32, 0.1);
				if (hud_show_lives_timer = 32)
				{
					global.hud_show_lives = false;
				}
				if (hud_show_lives_timer = -32)
				{
					hud_show_lives_timer = global.hud_show_timer;
				}
			}
			else
			{
				hud_show_lives = lerp(hud_show_lives, -32, 0.1);
			}
			if (hud_show_lives_timer > -32)
			{
				hud_show_lives_timer -= 1;
			}
		}
		#endregion /*Show Lives END*/

		#region /*Show Big Collectibles*/
		if (global.hud_show_big_collectibles = true)
		{
			if (hud_show_lives > 0)
			{
				hud_show_big_collectibles = lerp(hud_show_big_collectibles, 60, 0.1);
				if (hud_show_big_collectibles_timer = 60)
				{
					global.hud_show_big_collectibles = false;
				}
			}
			else
			{
				hud_show_big_collectibles = lerp(hud_show_big_collectibles, 20, 0.1);
				if (hud_show_big_collectibles_timer = 20)
				{
					global.hud_show_big_collectibles = false;
				}
			}
			if (hud_show_big_collectibles_timer = -32)
			{
				hud_show_big_collectibles_timer = global.hud_show_timer;
			}
		}
		else
		{
			hud_show_big_collectibles = lerp(hud_show_big_collectibles, -32, 0.1);
		}
		if (hud_show_big_collectibles_timer > -32)
		{
			hud_show_big_collectibles_timer -= 1;
		}
		#endregion /*Show Big Collectibles END*/

		#region /*Show Basic Collectible*/
		if (global.hud_show_basic_collectibles = true)
		{
			if (hud_show_lives > 0)
			and (hud_show_big_collectibles > 0)
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 110, 0.1);
				if (hud_show_basic_collectibles_timer = 110)
				{
					global.hud_show_basic_collectibles = false;
				}
			}
			else
			if (hud_show_lives > 0)
			and (hud_show_big_collectibles < 0)
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 64, 0.1);
				if (hud_show_basic_collectibles_timer = 64)
				{
					global.hud_show_basic_collectibles = false;
				}
			}
			else
			if (hud_show_lives < 0)
			and (hud_show_big_collectibles > 0)
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 64, 0.1);
				if (hud_show_basic_collectibles_timer = 64)
				{
					global.hud_show_basic_collectibles = false;
				}
			}
			else
			{
				hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, 32, 0.1);
				if (hud_show_basic_collectibles_timer = 32)
				{
					global.hud_show_basic_collectibles = false;
				}
			}
			
			if (hud_show_basic_collectibles_timer = -32)
			{
				hud_show_basic_collectibles_timer = global.hud_show_timer;
			}
		}
		else
		{
			hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, -32, 0.1);
		}
		if (hud_show_basic_collectibles_timer > -32)
		{
			hud_show_basic_collectibles_timer -= 1;
		}
		#endregion /*Show Basic Collectible END*/

		#region /*Show Score*/
		if (global.hud_show_score = true)
		{
			hud_show_score = lerp(hud_show_score, 32, 0.1);
			if (hud_show_score_timer = 32)
			{
				global.hud_show_score = false;
			}
			if (hud_show_score_timer = -32)
			{
				hud_show_score_timer = global.hud_show_timer;
			}
		}
		else
		{
			hud_show_score = lerp(hud_show_score, -32, 0.1);
		}
		if (hud_show_score_timer > -32)
		{
			hud_show_score_timer -= 1;
		}
		#endregion /*Show Score END*/

		#endregion /*Show HUD timers END*/
		
		#region /*Lives, Big Collectibles, Basic Collectibles, Score and Timer*/
		if (asset_get_type("obj_pause") == asset_object)
		and(!instance_exists(obj_pause))
		{
		
		#region /*Lives*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		if (asset_get_type("obj_player") == asset_object)
		and(instance_exists(obj_player))
		and(sprite_lives_icon > noone)
		{
			if (asset_get_type("spr_1up") == asset_sprite)
			and(sprite_lives_icon=spr_1up)
			{
				draw_sprite_ext(spr_1up, 0, 16, hud_show_lives, 0.75, 0.75, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_lives, 1, 1, 0, c_white, 1);
			}
			if (lives < 0)
			{
				draw_text_outlined(32, hud_show_lives, "0", global.default_text_size, c_black, c_white, 1);
			}
			else
			{
				draw_text_outlined(32, hud_show_lives, lives, global.default_text_size, c_black, c_white, 1);
			}
		}
		else
		{
			if (asset_get_type("spr_1up") == asset_sprite)
			{
				draw_sprite_ext(spr_1up, 0, 16, hud_show_lives, 0.75, 0.75, 0, c_white, 1);
			}
			if (lives < 0)
			{
				draw_text_outlined(32, hud_show_lives, "0", global.default_text_size, c_black, c_white, 1);
			}
			else
			{
				draw_text_outlined(32, hud_show_lives, lives, global.default_text_size, c_black, c_white, 1);
			}
		}
		#endregion /*Lives END*/

		#region /*Big Collectibles*/
		if (asset_get_type("spr_big_collectible") == asset_sprite)
		{
			#region /*Big Collectible 1*/
			if (global.big_collectible1 = false)
			{
				draw_sprite_ext(spr_big_collectible, 0, 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
			}
			#endregion /*Big Collectible 1 END*/

			#region /*Big Collectible 2*/
			if (global.big_collectible2 = false)
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
			}
			#endregion /*Big Collectible 2 END*/

			#region /*Big Collectible 3*/
			if (global.big_collectible3 = false)
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 64, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 64, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
			}
			#endregion /*Big Collectible 3 END*/

			#region /*Big Collectible 4*/
			if (global.big_collectible4 = false)
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 96, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 96, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
			}
			#endregion /*Big Collectible 4 END*/

			#region /*Big Collectible 5*/
			if (global.big_collectible5 = false)
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 128, hud_show_big_collectibles, 0.5, 0.5, 0, c_gray, 0.5);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, 32 + 128, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
			}
			#endregion /*Big Collectible 5 END*/
		}
		#endregion /*Big Collectibles*/

		#region /*Basic Collectible*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		if (asset_get_type("spr_basic_collectible") == asset_sprite)
		{
			draw_sprite_ext(spr_basic_collectible, 0, 32, hud_show_basic_collectibles, 0.75, 0.75, 0, c_white, 1);
			draw_text_outlined(64, hud_show_basic_collectibles, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(32, hud_show_basic_collectibles, "Collectibles: " + string(global.basic_collectibles), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Basic Collectible END*/
		
		#region /*Score*/
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_text_outlined(set_view_wview + 200, hud_show_score, "SCORE\n" + string(score), global.default_text_size, c_white, c_black, 1);
		#endregion /*Score END*/
		
		#region /*Time Countdown*/
		if (asset_get_type("obj_player") == asset_object)
		and(instance_exists(obj_player))
		or(asset_get_type("obj_player_die") == asset_object)
		and(instance_exists(obj_player_die))
		{

			#region /*Time is running out message*/
			if (global.player_has_entered_goal = false)
			{
				if (global.time_countdown <= 99)
				and(global.time_countdown >= 95)
				{
					draw_set_halign(fa_center);
					draw_set_valign(fa_center);
					if (global.time_countdown <= 99)
						and(global.timeattack_millisecond < room_speed / 2)
						{
							draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, "TIME IS RUNNING OUT!", global.default_text_size, c_black, c_red, 1);
						}
					else
					{
						draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, "TIME IS RUNNING OUT!", global.default_text_size, c_black, c_white, 1);
					}
				}
			}
			#endregion /*Time is running out message END*/

			#region /*Time Over Message*/
			if (global.time_countdown < 0)
			and(global.player_has_entered_goal = false)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
				draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, "TIME OVER", global.default_text_size * 10, c_black, c_white, 1);
			}
			#endregion /*Time Over Message END*/

			if (global.hud_show_timer > 0)
			{
				draw_set_halign(fa_right);
				draw_set_valign(fa_center);
				if (global.player_has_entered_goal = false)
				{
					if (global.time_countdown <= 0)
					{
						draw_text_outlined(set_view_wview + 400 - 32, 32, "TIME\n0", global.default_text_size, c_black, c_red, 1);
					}
					else
					if (global.time_countdown <= 99)
					and(global.timeattack_millisecond < room_speed / 2)
					{
						draw_text_outlined(set_view_wview + 400 - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_red, 1);
					}
					else
					{
						draw_text_outlined(set_view_wview + 400 - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
					}
				}
				else
				{
					draw_text_outlined(set_view_wview + 400 - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
				}

				#region /*Time in Minutes, Seconds and Milliseconds*/
				if (global.player_has_entered_goal = false)
				{
					if (global.time_countdown <= 99)
					and(global.timeattack_millisecond < room_speed / 2)
					{
						draw_text_outlined(set_view_wview + 400 - 32, 74, string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(global.timeattack_millisecond), global.default_text_size, c_black, c_red, 1);
					}
					else
					{
						draw_text_outlined(set_view_wview + 400 - 32, 74, string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(global.timeattack_millisecond), global.default_text_size, c_black, c_white, 1);
					}
				}
				else
				{
					draw_text_outlined(set_view_wview + 400 - 32, 74, string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(global.timeattack_millisecond), global.default_text_size, c_black, c_white, 1);
				}
				#endregion /*Time in Minutes, Seconds and Milliseconds END*/
				
			}
		}
		#endregion /*Time Countdown END*/
		
		}
		#endregion /*Lives, Big Collectibles, Basic Collectibles, Score and Timer END*/

	}

#region /*Show FPS Options*/
if (global.show_fps = true)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	#region /*FPS*/
	if (fps >= 60)
	{
		draw_text_outlined(30, 100, "FPS: " + string(fps) + " / " + string(room_speed), global.default_text_size, c_black, c_lime, 1);
	}
	else
	if (fps >= 50)
	{
		draw_text_outlined(30, 100, "FPS: " + string(fps) + " / " + string(room_speed), global.default_text_size, c_black, c_yellow, 1);
	}
	else
	if (fps >= 40)
	{
		draw_text_outlined(30, 100, "FPS: " + string(fps) + " / " + string(room_speed), global.default_text_size, c_black, c_orange, 1);
	}
	else
	{
		draw_text_outlined(30, 100, "FPS: " + string(fps) + " / " + string(room_speed), global.default_text_size, c_black, c_red, 1);
	}
	#endregion /*FPS*/
	
	#region /*FPS Real*/
	if (fps_real >= 60)
	{
		draw_text_outlined(30, 132, "FPS Real: " + string(fps_real) + " / " + string(room_speed), global.default_text_size, c_black, c_lime, 1);
	}
	else
	if (fps_real >= 50)
	{
		draw_text_outlined(30, 132, "FPS Real: " + string(fps_real) + " / " + string(room_speed), global.default_text_size, c_black, c_yellow, 1);
	}
	else
	if (fps_real >= 40)
	{
		draw_text_outlined(30, 132, "FPS Real: " + string(fps_real) + " / " + string(room_speed), global.default_text_size, c_black, c_orange, 1);
	}
	else
	{
		draw_text_outlined(30, 132, "FPS Real: " + string(fps_real) + " / " + string(room_speed), global.default_text_size, c_black, c_red, 1);
	}
	#endregion /*FPS Real*/
	
}
#endregion /*Show FPS Options END*/

#region /*Show Controls*/
if (os_type != os_ios)
and(os_type != os_android)
{
	if (global.playergame = 0)
	{
		
		/*SINGLEPLAYER PLAYER 1*/
		if (player1 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_exists(obj_player))
		and(global.player1_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Left Key*/
			draw_text_outlined(30, set_view_hview + 250 - 32, "Move Left:", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 4, 170, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, 170, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			draw_text_outlined(180, set_view_hview + 250 - 32, "Move Right:", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 6, 320, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, 320, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Pounce Key*/
			draw_text_outlined(350, set_view_hview + 250 - 32, "Pounce:", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 2, 450, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, 450, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Pounce Key END*/
			
			#region /*Show Jump Key*/
			draw_text_outlined(480, set_view_hview + 250 - 32, "Jump:", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 0, 560, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 560, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
		}
	}
	
	else
	if (global.playergame > 0)
	{
		
		/*MULTIPLAYER PLAYER 1*/
		if (player1 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player1_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Left Key*/
			draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32 - 96, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(32, set_view_hview + 250 - 32 - 96, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2 - 96, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2 - 96, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 96, "Move Left:", global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 4, 150, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, 150, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			draw_text_transformed_colour(180 - 2, set_view_hview + 250 - 32 - 96, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(182, set_view_hview + 250 - 32 - 96, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 - 2 - 96, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 + 2 - 96, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 - 96, "Move Right:", global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 6, 320, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, 320, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Pounce Key*/
			draw_text_transformed_colour(350 - 2, set_view_hview + 250 - 32 - 96, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(352, set_view_hview + 250 - 32 - 96, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 - 2 - 96, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 + 2 - 96, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 - 96, "Pounce:", global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 2, 450, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, 450, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Pounce Key END*/
			
			#region /*Show Jump Key*/
			draw_text_transformed_colour(480 - 2, set_view_hview + 250 - 32 - 96, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(482, set_view_hview + 250 - 32 - 96, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 - 2 - 96, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 + 2 - 96, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player1_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 - 96, "Jump:", global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, player1_show_controls_alpha);
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 0, 560, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 560, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
		}
		else
		if (player1 = noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(lives > 0)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			{
				draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32 - 96, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(32, set_view_hview + 250 - 32 - 96, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2 - 96, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2 - 96, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 96, "Join Game:", global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, 1);
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 160, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 160, set_view_hview + 250 - 32 - 96, 0.5, 0.5, 0, c_white, 1);
				}
			}
		}
		#endregion /*Show Join Game Key END*/
		
		/*MULTIPLAYER PLAYER 2*/
		if (player2 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player2_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Left Key*/
			draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32 - 64, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(32, set_view_hview + 250 - 32 - 64, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2 - 64, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2 - 64, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 64, "Move Left:", global.default_text_size, global.default_text_size, 0, c_lime, c_lime, c_lime, c_lime, player2_show_controls_alpha);
			if (gamepad_is_connected(1))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 4, 150, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, 150, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			draw_text_transformed_colour(180 - 2, set_view_hview + 250 - 32 - 64, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(182, set_view_hview + 250 - 32 - 64, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 - 2 - 64, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 + 2 - 64, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 - 64, "Move Right:", global.default_text_size, global.default_text_size, 0, c_lime, c_lime, c_lime, c_lime, player2_show_controls_alpha);
			if (gamepad_is_connected(1))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 6, 320, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, 320, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Pounce Key*/
			draw_text_transformed_colour(350 - 2, set_view_hview + 250 - 32 - 64, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(352, set_view_hview + 250 - 32 - 64, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 - 2 - 64, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 + 2 - 64, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 - 64, "Pounce:", global.default_text_size, global.default_text_size, 0, c_lime, c_lime, c_lime, c_lime, player2_show_controls_alpha);
			if (gamepad_is_connected(1))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 2, 450, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint, 450, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Pounce Key END*/
			
			#region /*Show Jump Key*/
			draw_text_transformed_colour(480 - 2, set_view_hview + 250 - 32 - 64, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(482, set_view_hview + 250 - 32 - 64, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 - 2 - 64, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 + 2 - 64, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player2_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 - 64, "Jump:", global.default_text_size, global.default_text_size, 0, c_lime, c_lime, c_lime, c_lime, player2_show_controls_alpha);
			if (gamepad_is_connected(1))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 0, 560, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, 560, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
		}
		else
		if (player2 = noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.playergame > 0)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			{
				draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32 - 64, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(32, set_view_hview + 250 - 32 - 64, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2 - 64, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2 - 64, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 64, "Join Game:", global.default_text_size, global.default_text_size, 0, c_lime, c_lime, c_lime, c_lime, 1);
				if (gamepad_is_connected(1))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 160, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, 160, set_view_hview + 250 - 32 - 64, 0.5, 0.5, 0, c_white, 1);
				}
			}
		}
		#endregion /*Show Join Game Key END*/
		
		/*MULTIPLAYER PLAYER 3*/
		if (player3 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player3_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Left Key*/
			draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(32, set_view_hview + 250 - 32 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, player3_show_controls_alpha);
			if (gamepad_is_connected(2))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 4, 150, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, 150, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			draw_text_transformed_colour(180 - 2, set_view_hview + 250 - 32 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(182, set_view_hview + 250 - 32 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 - 2 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 + 2 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, player3_show_controls_alpha);
			if (gamepad_is_connected(2))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 6, 320, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, 320, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Pounce Key*/
			draw_text_transformed_colour(350 - 2, set_view_hview + 250 - 32 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(352, set_view_hview + 250 - 32 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 - 2 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 + 2 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, player3_show_controls_alpha);
			if (gamepad_is_connected(2))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 2, 450, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint, 450, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Pounce Key END*/
			
			#region /*Show Jump Key*/
			draw_text_transformed_colour(480 - 2, set_view_hview + 250 - 32 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(482, set_view_hview + 250 - 32 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 - 2 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 + 2 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player3_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, player3_show_controls_alpha);
			if (gamepad_is_connected(2))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 0, 560, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, 560, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
		}
		else
		if (player3 = noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.playergame > 1)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			{
				draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(32, set_view_hview + 250 - 32 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
				if (gamepad_is_connected(2))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 160, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, 160, set_view_hview + 250 - 32 - 32, 0.5, 0.5, 0, c_white, 1);
				}
			}
		}
		#endregion /*Show Join Game Key END*/
		
		/*MULTIPLAYER PLAYER 4*/
		if (player4 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player4_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Left Key*/
			draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(32, set_view_hview + 250 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2, "Move Left:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(30, set_view_hview + 250 - 32, "Move Left:", global.default_text_size, global.default_text_size, 0, c_aqua, c_aqua, c_aqua, c_aqua, player4_show_controls_alpha);
			if (gamepad_is_connected(3))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 4, 150, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, 150, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			draw_text_transformed_colour(180 - 2, set_view_hview + 250 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(182, set_view_hview + 250 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 - 2, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32 + 2, "Move Right:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(180, set_view_hview + 250 - 32, "Move Right:", global.default_text_size, global.default_text_size, 0, c_aqua, c_aqua, c_aqua, c_aqua, player4_show_controls_alpha);
			if (gamepad_is_connected(3))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 6, 320, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, 320, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Pounce Key*/
			draw_text_transformed_colour(350 - 2, set_view_hview + 250 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(352, set_view_hview + 250 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 - 2, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32 + 2, "Pounce:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(350, set_view_hview + 250 - 32, "Pounce:", global.default_text_size, global.default_text_size, 0, c_aqua, c_aqua, c_aqua, c_aqua, player4_show_controls_alpha);
			if (gamepad_is_connected(3))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 2, 450, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint, 450, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Pounce Key END*/
			
			#region /*Show Jump Key*/
			draw_text_transformed_colour(480 - 2, set_view_hview + 250 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(482, set_view_hview + 250 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 - 2, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32 + 2, "Jump:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, player4_show_controls_alpha);
			draw_text_transformed_colour(480, set_view_hview + 250 - 32, "Jump:", global.default_text_size, global.default_text_size, 0, c_aqua, c_aqua, c_aqua, c_aqua, player4_show_controls_alpha);
			if (gamepad_is_connected(3))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons, 0, 560, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, 560, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
		}
		else
		if (player4 = noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.playergame > 2)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Join Game Key*/
			if (can_spawn_player = true)
			{
				draw_text_transformed_colour(30 - 2, set_view_hview + 250 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(32, set_view_hview + 250 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 - 2, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32 + 2, "Join Game:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_colour(30, set_view_hview + 250 - 32, "Join Game:", global.default_text_size, global.default_text_size, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
				if (gamepad_is_connected(3))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 160, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, 160, set_view_hview + 250 - 32, 0.5, 0.5, 0, c_white, 1);
				}
			}
		}
		#endregion /*Show Join Game Key END*/
		
	}
}
#endregion /*Show Controls END*/