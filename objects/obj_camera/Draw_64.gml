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
	draw_text_outlined(window_get_width() - 200, hud_show_score, "SCORE\n" + string(score), global.default_text_size, c_white, c_black, 1);
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
			draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, "TIME OVER", global.default_text_size * 5, c_black, c_white, 1);
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
					draw_text_outlined(window_get_width() - 32, 32, "TIME\n0", global.default_text_size, c_black, c_red, 1);
				}
				else
				if (global.time_countdown <= 99)
				and(global.timeattack_millisecond < room_speed / 2)
				{
					draw_text_outlined(window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_red, 1);
				}
				else
				{
					draw_text_outlined(window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
				}
			}
			else
			{
				draw_text_outlined(window_get_width() - 32, 32, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
			}

			#region /*Time in Minutes, Seconds and Milliseconds*/
			if (global.player_has_entered_goal = false)
			{
				if (global.time_countdown <= 99)
				and(global.timeattack_millisecond < room_speed / 2)
				{
					draw_text_outlined(window_get_width() - 32, 74, string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(global.timeattack_millisecond), global.default_text_size, c_black, c_red, 1);
				}
				else
				{
					draw_text_outlined(window_get_width() - 32, 74, string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(global.timeattack_millisecond), global.default_text_size, c_black, c_white, 1);
				}
			}
			else
			{
				draw_text_outlined(window_get_width() - 32, 74, string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(global.timeattack_millisecond), global.default_text_size, c_black, c_white, 1);
			}
			#endregion /*Time in Minutes, Seconds and Milliseconds END*/
				
		}
	}
	#endregion /*Time Countdown END*/
		
	}
	#endregion /*Lives, Big Collectibles, Basic Collectibles, Score and Timer END*/

}

#region /*Show FPS Options*/
if (global.pause = false)
and(asset_get_type("obj_title") == asset_object)
and(!instance_exists(obj_title))
{
	
	#region /*FPS*/
	if (global.show_fps = true)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
	
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
	}
	#endregion /*FPS END*/
	
	#region /*FPS Real*/
	if (global.show_fps_real = true)
	{
		if (fps_real >= 60)
		{
			draw_text_outlined(30, 132, "FPS Real: " + string(fps_real), global.default_text_size, c_black, c_lime, 1);
		}
		else
		if (fps_real >= 50)
		{
			draw_text_outlined(30, 132, "FPS Real: " + string(fps_real), global.default_text_size, c_black, c_yellow, 1);
		}
		else
		if (fps_real >= 40)
		{
			draw_text_outlined(30, 132, "FPS Real: " + string(fps_real), global.default_text_size, c_black, c_orange, 1);
		}
		else
		{
			draw_text_outlined(30, 132, "FPS Real: " + string(fps_real), global.default_text_size, c_black, c_red, 1);
		}
	}
	#endregion /*FPS Real END*/
	
}
#endregion /*Show FPS Options END*/

#region /*Show Controls*/
if (os_type != os_ios)
and(os_type != os_android)
and(asset_get_type("obj_pause") == asset_object)
and(!instance_exists(obj_pause))
{
	if (global.playergame = 0)
	{
		
		#region /*SINGLEPLAYER PLAYER 1*/
		if (player1 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_exists(obj_player))
		and(global.player1_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			show_dive_key_x = 32;
			show_jump_key_x = 32+150;
			show_crouch_key_x = 32+150+150;
			if (global.player1_sprint_toggle = false)
			{
				show_sprint_key_x = 32+150+150+150;
				show_left_key_x = 32+150+150+150+150;
				show_right_key_x = 32+150+150+150+150+150;
				show_down_key_x = 32+150+150+150+150+150+150;
				show_up_key_x = 32+150+150+150+150+150+150+150;
			}
			else
			{
				show_sprint_key_x = -999;
				show_left_key_x = 32+150+150+150;
				show_right_key_x = 32+150+150+150+150;
				show_down_key_x = 32+150+150+150+150+150;
				show_up_key_x = 32+150+150+150+150+150+150;
			}
			
			show_player1_controls_y = 32;
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_dive>noone)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_dive, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_dive>noone)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_dive, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_jump>noone)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_jump>noone)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_crouch>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_crouch>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_crouch_toggle>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch_toggle, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_crouch_toggle>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch_toggle, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player1_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 0, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key_sprint>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key2_sprint>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key_sprint_toggle>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint_toggle, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key2_sprint_toggle>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint_toggle, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_left>noone)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_left>noone)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_right>noone)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_right>noone)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_down>noone)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_down, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_down>noone)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_down, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_up>noone)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_up, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_up>noone)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, c_white, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_up, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
		}
		#endregion /*SINGLEPLAYER PLAYER 1 END*/
		
	}
	
	else
	
	#region /*Show Multiplayer Controls*/
	if (global.playergame > 0)
	{
		
		#region /*MULTIPLAYER PLAYER 1*/
		if (player1 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player1_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			show_dive_key_x = 32;
			show_jump_key_x = 32+150;
			show_crouch_key_x = 32+150+150;
			if (global.player1_sprint_toggle = false)
			{
				show_sprint_key_x = 32+150+150+150;
				show_left_key_x = 32+150+150+150+150;
				show_right_key_x = 32+150+150+150+150+150;
				show_down_key_x = 32+150+150+150+150+150+150;
				show_up_key_x = 32+150+150+150+150+150+150+150;
			}
			else
			{
				show_sprint_key_x = -999;
				show_left_key_x = 32+150+150+150;
				show_right_key_x = 32+150+150+150+150;
				show_down_key_x = 32+150+150+150+150+150;
				show_up_key_x = 32+150+150+150+150+150+150;
			}
			
			show_player1_controls_y = 158;
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_dive>noone)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_dive, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_dive>noone)
			{
				draw_text_outlined(show_dive_key_x + 22, window_get_height() - show_player1_controls_y, "Pounce", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_dive, show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_jump>noone)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_jump>noone)
			{
				draw_text_outlined(show_jump_key_x + 22, window_get_height() - show_player1_controls_y, "Jump", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_crouch>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_crouch>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_crouch_toggle>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch_toggle, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_crouch_toggle>noone)
			{
				draw_text_outlined(show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, "Crouch", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch_toggle, show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player1_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 0, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key_sprint>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key2_sprint>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key_sprint_toggle>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint_toggle, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player1_key2_sprint_toggle>noone)
				{
					draw_text_outlined(show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, "Sprint", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint_toggle, show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_left>noone)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_left>noone)
			{
				draw_text_outlined(show_left_key_x + 22, window_get_height() - show_player1_controls_y, "Left", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_right>noone)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_right>noone)
			{
				draw_text_outlined(show_right_key_x + 22, window_get_height() - show_player1_controls_y, "Right", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_down>noone)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_down, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_down>noone)
			{
				draw_text_outlined(show_down_key_x + 22, window_get_height() - show_player1_controls_y, "Down", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_down, show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key_up>noone)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_up, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player1_key2_up>noone)
			{
				draw_text_outlined(show_up_key_x + 22, window_get_height() - show_player1_controls_y, "Up", global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_up, show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
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
			and(global.player1_key_jump>noone)
			{
				draw_text_outlined(30, window_get_height() - 158, "Join Game:", global.default_text_size, c_black, global.player1_color, 1);
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - 158, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 200, window_get_height() - 158, 0.5, 0.5, 0, c_white, 1);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 1*/
		
		#region /*MULTIPLAYER PLAYER 2*/
		if (player2 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player2_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			player2_show_dive_key_x = 32;
			player2_show_jump_key_x = 32+150;
			player2_show_crouch_key_x = 32+150+150;
			if (global.player2_sprint_toggle = false)
			{
				player2_show_sprint_key_x = 32+150+150+150;
				player2_show_left_key_x = 32+150+150+150+150;
				player2_show_right_key_x = 32+150+150+150+150+150;
				player2_show_down_key_x = 32+150+150+150+150+150+150;
				player2_show_up_key_x = 32+150+150+150+150+150+150+150;
			}
			else
			{
				player2_show_sprint_key_x = -999;
				player2_show_left_key_x = 32+150+150+150;
				player2_show_right_key_x = 32+150+150+150+150;
				player2_show_down_key_x = 32+150+150+150+150+150;
				player2_show_up_key_x = 32+150+150+150+150+150+150;
			}
			
			show_player2_controls_y = 116;
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, "Pounce", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_dive>noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, "Pounce", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_dive>noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, "Pounce", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, "Jump", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_jump>noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, "Jump", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_jump>noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, "Jump", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_crouch>noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_crouch>noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_crouch_toggle>noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_crouch_toggle>noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, "Crouch", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player2_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 0, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player2_key_sprint>noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player2_key2_sprint>noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player2_key_sprint_toggle>noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player2_key2_sprint_toggle>noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, "Sprint", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, "Left", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_left>noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, "Left", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_left>noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, "Left", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, "Right", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_right>noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, "Right", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_right>noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, "Right", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, "Down", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_down>noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, "Down", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_down>noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, "Down", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, "Up", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key_up>noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, "Up", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player2_key2_up>noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, "Up", global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
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
			and(global.player2_key_jump>noone)
			{
				draw_text_outlined(30, window_get_height() - 116, "Join Game:", global.default_text_size, c_black, global.player2_color, 1);
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - 116, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, 200, window_get_height() - 116, 0.5, 0.5, 0, c_white, 1);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 2*/
		
		#region /*MULTIPLAYER PLAYER 3*/
		if (player3 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player3_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			player3_show_dive_key_x = 32;
			player3_show_jump_key_x = 32+150;
			player3_show_crouch_key_x = 32+150+150;
			if (global.player3_sprint_toggle = false)
			{
				player3_show_sprint_key_x = 32+150+150+150;
				player3_show_left_key_x = 32+150+150+150+150;
				player3_show_right_key_x = 32+150+150+150+150+150;
				player3_show_down_key_x = 32+150+150+150+150+150+150;
				player3_show_up_key_x = 32+150+150+150+150+150+150+150;
			}
			else
			{
				player3_show_sprint_key_x = -999;
				player3_show_left_key_x = 32+150+150+150;
				player3_show_right_key_x = 32+150+150+150+150;
				player3_show_down_key_x = 32+150+150+150+150+150;
				player3_show_up_key_x = 32+150+150+150+150+150+150;
			}
			
			show_player3_controls_y = 74;
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, "Pounce", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_dive>noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, "Pounce", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_dive>noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, "Pounce", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, "Jump", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_jump>noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, "Jump", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_jump>noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, "Jump", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_crouch>noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_crouch>noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_crouch_toggle>noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_crouch_toggle>noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, "Crouch", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player3_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 0, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player3_key_sprint>noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player3_key2_sprint>noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player3_key_sprint_toggle>noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player3_key2_sprint_toggle>noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, "Sprint", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, "Left", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_left>noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, "Left", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_left>noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, "Left", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, "Right", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_right>noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, "Right", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_right>noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, "Right", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, "Down", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_down>noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, "Down", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_down>noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, "Down", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, "Up", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key_up>noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, "Up", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player3_key2_up>noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, "Up", global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
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
			and(global.player3_key_jump>noone)
			{
				draw_text_outlined(30, window_get_height() - 74, "Join Game:", global.default_text_size, c_black, global.player3_color, 1);
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - 74, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, 200, window_get_height() - 74, 0.5, 0.5, 0, c_white, 1);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 3 END*/
		
		#region /*MULTIPLAYER PLAYER 4*/
		if (player4 > noone)
		and(asset_get_type("obj_player") == asset_object)
		and(instance_number(obj_player) > 0)
		and(global.player4_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			player4_show_dive_key_x = 32;
			player4_show_jump_key_x = 32+150;
			player4_show_crouch_key_x = 32+150+150;
			if (global.player4_sprint_toggle = false)
			{
				player4_show_sprint_key_x = 32+150+150+150;
				player4_show_left_key_x = 32+150+150+150+150;
				player4_show_right_key_x = 32+150+150+150+150+150;
				player4_show_down_key_x = 32+150+150+150+150+150+150;
				player4_show_up_key_x = 32+150+150+150+150+150+150+150;
			}
			else
			{
				player4_show_sprint_key_x = -999;
				player4_show_left_key_x = 32+150+150+150;
				player4_show_right_key_x = 32+150+150+150+150;
				player4_show_down_key_x = 32+150+150+150+150+150;
				player4_show_up_key_x = 32+150+150+150+150+150+150;
			}
			
			show_player4_controls_y = 32;
			
			#region /*Show Dive Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, "Pounce", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 2, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_dive>noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, "Pounce", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_dive>noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, "Pounce", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Dive Key END*/
			
			#region /*Show Jump Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, "Jump", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_jump>noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, "Jump", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_jump>noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, "Jump", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Jump Key END*/
			
			#region /*Show Crouch Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 0, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_crouch>noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_crouch>noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_crouch_toggle>noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_crouch_toggle>noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, "Crouch", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Crouch Key END*/
			
			#region /*Show Sprint Key*/
			if (global.player4_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_xbox_buttons, 0, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player4_key_sprint>noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player4_key2_sprint>noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player4_key_sprint_toggle>noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if(asset_get_type("spr_keyboard_keys") == asset_sprite)
				and(global.player4_key2_sprint_toggle>noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, "Sprint", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
			}
			#endregion /*Show Sprint Key END*/
			
			#region /*Show Left Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, "Left", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 4, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_left>noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, "Left", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_left>noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, "Left", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Left Key END*/
			
			#region /*Show Right Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, "Right", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_right>noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, "Right", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_right>noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, "Right", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Right Key END*/
			
			#region /*Show Down Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, "Down", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_down>noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, "Down", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_down>noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, "Down", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
			#region /*Show Up Key*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, "Up", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_xbox_buttons, 210, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key_up>noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, "Up", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if(asset_get_type("spr_keyboard_keys") == asset_sprite)
			and(global.player4_key2_up>noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, "Up", global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Down Key END*/
			
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
			and(global.player4_key_jump>noone)
			{
				draw_text_outlined(30, window_get_height() - 32, "Join Game:", global.default_text_size, c_black, global.player4_color, 1);
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 0, 200, window_get_height() - 32, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, 200, window_get_height() - 32, 0.5, 0.5, 0, c_white, 1);
				}
			}
			#endregion /*Show Join Game Key END*/
			
		}
		#endregion /*MULTIPLAYER PLAYER 4 END*/
		
	}
	#endregion /*Show Multiplayer Controls END*/
	
}
#endregion /*Show Controls END*/

#region /*Draw mouse cursor for menu navigation*/
if (window_has_focus())
and(global.controls_used_for_menu_navigation="mouse")
and(os_type!=os_ios)
and(os_type!=os_android)
and(global.pause = false)
{
	draw_sprite_ext(spr_cursor,0,window_mouse_get_x(),window_mouse_get_y(),1,1,0,c_white,1);
}
#endregion /*Draw mouse cursor for menu navigation END*/

#region /*Window is focused, hide cursor*/
if (window_has_focus())
and(mouse_x > + 8)
and(mouse_x < window_get_width() - 8)
and(mouse_y > + 8)
and(mouse_y < window_get_height() - 8)
{
	window_set_cursor(cr_none);
}
else
{
	if (!window_get_fullscreen())
	{
		window_set_cursor(cr_default);
	}
}
#endregion /*Window is focused, hide cursor END*/