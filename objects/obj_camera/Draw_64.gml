scr_zoom_camera_draw_gui(10);

if (global.convention_mode = true)
and (!instance_exists(obj_title))
{
	reset_game_if_no_interactivity += 1;
	reset_game_if_no_interactivity_second_countdown_timer += 1;
	if (reset_game_if_no_interactivity_second_countdown_timer >= 60)
	{
		reset_game_if_no_interactivity_second_countdown_timer = 0;
		reset_game_if_no_interactivity_second_countdown -= 1;
	}
	if (reset_game_if_no_interactivity >= 3600)
	{
		game_restart();
	}
}
if (keyboard_check(vk_anykey))
or (mouse_check_button(mb_any))
or (mouse_wheel_down())
or (mouse_wheel_up())
or (instance_exists(obj_camera))
and (mouse_moving)

or (gamepad_button_check(0, gp_face1))
or (gamepad_button_check(0, gp_face2))
or (gamepad_button_check(0, gp_face3))
or (gamepad_button_check(0, gp_face4))
or (gamepad_button_check(0, gp_padd))
or (gamepad_button_check(0, gp_padl))
or (gamepad_button_check(0, gp_padr))
or (gamepad_button_check(0, gp_padu))
or (gamepad_button_check(0, gp_select))
or (gamepad_button_check(0, gp_shoulderl))
or (gamepad_button_check(0, gp_shoulderlb))
or (gamepad_button_check(0, gp_shoulderr))
or (gamepad_button_check(0, gp_shoulderrb))
or (gamepad_button_check(0, gp_start))
or (gamepad_button_check(0, gp_stickl))
or (gamepad_button_check(0, gp_stickr))
or (gamepad_axis_value(0, gp_axislh) <> 0)
or (gamepad_axis_value(0, gp_axislv) <> 0)
or (gamepad_axis_value(0, gp_axisrh) <> 0)
or (gamepad_axis_value(0, gp_axisrv) <> 0)

or (gamepad_button_check(1, gp_face1))
or (gamepad_button_check(1, gp_face2))
or (gamepad_button_check(1, gp_face3))
or (gamepad_button_check(1, gp_face4))
or (gamepad_button_check(1, gp_padd))
or (gamepad_button_check(1, gp_padl))
or (gamepad_button_check(1, gp_padr))
or (gamepad_button_check(1, gp_padu))
or (gamepad_button_check(1, gp_select))
or (gamepad_button_check(1, gp_shoulderl))
or (gamepad_button_check(1, gp_shoulderlb))
or (gamepad_button_check(1, gp_shoulderr))
or (gamepad_button_check(1, gp_shoulderrb))
or (gamepad_button_check(1, gp_start))
or (gamepad_button_check(1, gp_stickl))
or (gamepad_button_check(1, gp_stickr))
or (gamepad_axis_value(1, gp_axislh) <> 0)
or (gamepad_axis_value(1, gp_axislv) <> 0)
or (gamepad_axis_value(1, gp_axisrh) <> 0)
or (gamepad_axis_value(1, gp_axisrv) <> 0)

or (gamepad_button_check(2, gp_face1))
or (gamepad_button_check(2, gp_face2))
or (gamepad_button_check(2, gp_face3))
or (gamepad_button_check(2, gp_face4))
or (gamepad_button_check(2, gp_padd))
or (gamepad_button_check(2, gp_padl))
or (gamepad_button_check(2, gp_padr))
or (gamepad_button_check(2, gp_padu))
or (gamepad_button_check(2, gp_select))
or (gamepad_button_check(2, gp_shoulderl))
or (gamepad_button_check(2, gp_shoulderlb))
or (gamepad_button_check(2, gp_shoulderr))
or (gamepad_button_check(2, gp_shoulderrb))
or (gamepad_button_check(2, gp_start))
or (gamepad_button_check(2, gp_stickl))
or (gamepad_button_check(2, gp_stickr))
or (gamepad_axis_value(2, gp_axislh) <> 0)
or (gamepad_axis_value(2, gp_axislv) <> 0)
or (gamepad_axis_value(2, gp_axisrh) <> 0)
or (gamepad_axis_value(2, gp_axisrv) <> 0)

or (gamepad_button_check(3, gp_face1))
or (gamepad_button_check(3, gp_face2))
or (gamepad_button_check(3, gp_face3))
or (gamepad_button_check(3, gp_face4))
or (gamepad_button_check(3, gp_padd))
or (gamepad_button_check(3, gp_padl))
or (gamepad_button_check(3, gp_padr))
or (gamepad_button_check(3, gp_padu))
or (gamepad_button_check(3, gp_select))
or (gamepad_button_check(3, gp_shoulderl))
or (gamepad_button_check(3, gp_shoulderlb))
or (gamepad_button_check(3, gp_shoulderr))
or (gamepad_button_check(3, gp_shoulderrb))
or (gamepad_button_check(3, gp_start))
or (gamepad_button_check(3, gp_stickl))
or (gamepad_button_check(3, gp_stickr))
or (gamepad_axis_value(3, gp_axislh) <> 0)
or (gamepad_axis_value(3, gp_axislv) <> 0)
or (gamepad_axis_value(3, gp_axisrh) <> 0)
or (gamepad_axis_value(3, gp_axisrv) <> 0)
{
	reset_game_if_no_interactivity = 0;
	reset_game_if_no_interactivity_second_countdown_timer = 0;
	reset_game_if_no_interactivity_second_countdown = 60;
}
if (global.convention_mode = true)
and (!instance_exists(obj_title))
and (reset_game_if_no_interactivity_second_countdown <= 30)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if (reset_game_if_no_interactivity_second_countdown >= 2)
	{
		draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, Text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + Text("seconds"), global.default_text_size * 2, c_black, c_red, 1);
	}
	else
	{
		draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, Text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + Text("second"), global.default_text_size * 2, c_black, c_red, 1);
	}
	draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2 + 42, Text("Start moving to continue playing"), global.default_text_size, c_black, c_red, 1);
}

///HUD
if (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	
	#region /*Show HUD timers*/
	
	#region /*If HUD show timer is set to always hide*/
	if (global.hud_hide_time <= 0)
	or(show_letterbox > 0)
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
				hud_show_lives = lerp(hud_show_lives, - 32, 0.1);
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
			hud_show_deaths = lerp(hud_show_deaths, - 32, 0.1);
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
			or(hud_show_lives < 0)
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
			hud_show_big_collectibles = lerp(hud_show_big_collectibles, - 32, 0.1);
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
			or(hud_show_lives > 0)
			and (hud_show_deaths < 0)
			and (hud_show_big_collectibles > 0)
			or(hud_show_lives > 0)
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
			or(hud_show_lives < 0)
			and (hud_show_deaths > 0)
			and (global.show_deaths_counter = true)
			and (hud_show_big_collectibles < 0)
			or(hud_show_lives < 0)
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
			hud_show_basic_collectibles = lerp(hud_show_basic_collectibles, - 32, 0.1);
		}
		#endregion /*Show Basic Collectible END*/
		
		#region /*Show Score*/
		if (global.hud_show_score = true)
		{
			hud_show_score = lerp(hud_show_score, 32, 0.1);
		}
		else
		{
			hud_show_score = lerp(hud_show_score, -64, 0.1);
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
			draw_line_width_color(32 - 16, hud_show_deaths - 16, 32 + 16, hud_show_deaths+ 16, 3, c_red, c_red);
			draw_line_width_color(32 - 16, hud_show_deaths+ 16, 32 + 16, hud_show_deaths - 16, 3, c_red, c_red);
			draw_text_outlined(64, hud_show_deaths, string(global.lives_until_assist), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Death Counter END*/
		
		#region /*Big Collectibles*/
		
		#region /*Big Collectible 1*/
		if (global.big_collectible1 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible1 = true)
		and (big_collectible1_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 1 END*/
		
		#region /*Big Collectible 2*/
		if (global.big_collectible2 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible2 = true)
		and (big_collectible2_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 2 END*/
		
		#region /*Big Collectible 3*/
		if (global.big_collectible3 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 64, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible3 = true)
		and (big_collectible3_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 3 END*/
		
		#region /*Big Collectible 4 */
		if (global.big_collectible4 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 96, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible4 = true)
		and (big_collectible4_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 4 END*/
		
		#region /*Big Collectible 5*/
		if (global.big_collectible5 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 128, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible5 = true)
		and (big_collectible5_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*Big Collectible 5 END*/
		
		#endregion /*Big Collectibles*/
		
		#region /*Basic Collectible*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, 32, hud_show_basic_collectibles, 0.75, 0.75, 0, c_white, 1);
		draw_text_outlined(64, hud_show_basic_collectibles, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
		#endregion /*Basic Collectible END*/
		
		#region /*Score*/
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_text_outlined(window_get_width() - 200, hud_show_score, Text("Score"), global.default_text_size, c_white, c_black, 1);
		draw_text_outlined(window_get_width() - 200, hud_show_score + 32, string(score), global.default_text_size, c_white, c_black, 1);
		#endregion /*Score END*/
		
		#region /*Time Countdown*/
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.enable_time_countdown = true)
		or(asset_get_type("obj_player_die") == asset_object)
		and (instance_exists(obj_player_die))
		and (global.enable_time_countdown = true)
		{
			time_countup_y = 94;
			
			#region /*Time is running out message*/
			if (global.player_has_entered_goal = false)
			{
				if (global.time_countdown <= 99)
				and (hurry_up_message_timer <= 300) /*Make the hurry up message stay on screen for 5 seconds (which is 300 frames)*/
				{
					hurry_up_message_timer += 1;
					draw_set_halign(fa_center);
					draw_set_valign(fa_center);
					draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, Text("HURRY UP!"), global.default_text_size, c_black, c_orange, 1);
					draw_text_transformed_color(display_get_gui_width() / 2, display_get_gui_height() / 2, Text("HURRY UP!"), global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
				}
			}
			#endregion /*Time is running out message END*/
			
			#region /*Time Over Message*/
			if (global.time_countdown = 0)
			and (global.player_has_entered_goal = false)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
				draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, Text("TIME OVER"), global.default_text_size * 5, c_black, c_white, 1);
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
						draw_text_outlined(window_get_width() - 32, 42, "TIME\n0", global.default_text_size, c_black, c_red, 1);
					}
					else
					{
						if (global.time_countdown >= 100)
						{
							draw_text_outlined(window_get_width() - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_yellow, 1);
							draw_text_transformed_color(window_get_width() - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_orange, c_orange, c_orange, c_orange, timer_blinking_alpha);
						}
						else
						{
							draw_text_outlined(window_get_width() - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_orange, 1);
							draw_text_transformed_color(window_get_width() - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
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
					draw_text_outlined(window_get_width() - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
				}
			}
		}
		else
		{
			time_countup_y = 32;
		}
		#endregion /*Time Countdown END*/
		
		#region /*Time countup in Minutes, Seconds and Milliseconds*/
		if (global.show_timer = true)
		{
			draw_set_halign(fa_right)
			if (global.timeattack_minute > 0)
			{
				draw_text_outlined(window_get_width() - 100, time_countup_y, string(global.timeattack_minute) + ":", global.default_text_size, c_black, c_white, 1);
			}
			if (global.timeattack_minute <= 0)
			and (global.timeattack_second <= 9)
			{
				draw_text_outlined(window_get_width() - 65, time_countup_y, global.timeattack_second, global.default_text_size, c_black, c_white, 1);
			}
			else
			{
				draw_text_outlined(window_get_width() - 65, time_countup_y, string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, c_white, 1);
			}
			draw_text_outlined(window_get_width() - 30, time_countup_y + 2, "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size * 0.75, c_black, c_white, 1);
		}
		#endregion /*Time countup in Minutes, Seconds and Milliseconds END*/
		
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
	draw_text_outlined( 32, 164, Text("Instance Count") + " : " + string(instance_count), global.default_text_size, c_black, c_white, 1);
}

#region /*Show if you are playing the demo version or not*/
if (global.demo = true)
and (global.play_attract_demo = false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if (global.arcade_mode = true)
	{
		draw_text_outlined(window_get_width() / 2, + 32, string(global.game_name) + " " + Text("Demo") + " - " + Text("Arcade mode"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (global.convention_mode = true)
	{
		draw_text_outlined(window_get_width() / 2, + 32, string(global.game_name) + " " + Text("Demo") + " - " + Text("Convention mode"), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		draw_text_outlined(window_get_width() / 2, + 32, string(global.game_name) + " " + Text("Demo"), global.default_text_size, c_black, c_white, 1);
	}
}
#endregion /*Show if you are playing the demo version or not END*/

#region /*Show if you are playing on convention mode or not*/
if (global.convention_mode = true)
and (global.demo = false)
and (global.play_attract_demo = false)
and (room = room_title)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width() / 2, + 32, Text("Convention mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /*Show if you are playing on convention mode or not END*/

#region /*Show if you are playing on arcade mode or not*/
if (global.arcade_mode = true)
and (global.demo = false)
and (global.play_attract_demo = false)
and (room = room_title)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width() / 2, + 32, Text("Arcade mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /*Show if you are playing on arcade mode or not END*/

#region /*Show if you have Assist mode enabled or not*/
if (global.assist_enable = true)
and (global.assist_show_assist_mode_text = true)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width() - 32, window_get_height() - 32, Text("Assist Mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /*Show if you have Assist mode enabled or not END*/

#region /*Show Controls*/

#region /*Show keys x positions*/

#region /*Player 1 show keys x positions*/
player1_show_dive_key_x = 32;
player1_show_jump_key_x = string_width(Text("Pounce")) + 75;
player1_show_crouch_key_x = player1_show_jump_key_x + string_width(Text("Jump")) + 37;
if (global.player1_sprint_toggle = false)
{
	player1_show_sprint_key_x = player1_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player1_show_left_key_x = player1_show_sprint_key_x + string_width(Text("Sprint")) + 37;
	player1_show_right_key_x = player1_show_left_key_x + string_width(Text("Left")) + 37;
	player1_show_down_key_x = player1_show_right_key_x + string_width(Text("Right")) + 37;
	player1_show_up_key_x = player1_show_down_key_x + string_width(Text("Down")) + 37;
}
else
{
	player1_show_sprint_key_x = -999; /*Hide the sprint key if you have "Always Run" turned on*/
	player1_show_left_key_x = player1_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player1_show_right_key_x = player1_show_left_key_x + string_width(Text("Left")) + 37;
	player1_show_down_key_x = player1_show_right_key_x + string_width(Text("Right")) + 37;
	player1_show_up_key_x = player1_show_down_key_x + string_width(Text("Down")) + 37;
}
#endregion /*Player 1 show keys x positions END*/

#region /*Player 2 show keys x positions*/
player2_show_dive_key_x = 32;
player2_show_jump_key_x = string_width(Text("Pounce")) + 75;
player2_show_crouch_key_x = player2_show_jump_key_x + string_width(Text("Jump")) + 37;
if (global.player2_sprint_toggle = false)
{
	player2_show_sprint_key_x = player2_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player2_show_left_key_x = player2_show_sprint_key_x + string_width(Text("Sprint")) + 37;
	player2_show_right_key_x = player2_show_left_key_x + string_width(Text("Left")) + 37;
	player2_show_down_key_x = player2_show_right_key_x + string_width(Text("Right")) + 37;
	player2_show_up_key_x = player2_show_down_key_x + string_width(Text("Down")) + 37;
}
else
{
	player2_show_sprint_key_x = -999; /*Hide the sprint key if you have "Always Run" turned on*/
	player2_show_left_key_x = player2_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player2_show_right_key_x = player2_show_left_key_x + string_width(Text("Left")) + 37;
	player2_show_down_key_x = player2_show_right_key_x + string_width(Text("Right")) + 37;
	player2_show_up_key_x = player2_show_down_key_x + string_width(Text("Down")) + 37;
}
#endregion /*Player 2 show keys x positions END*/

#region /*Player 3 show keys x positions*/
player3_show_dive_key_x = 32;
player3_show_jump_key_x = string_width(Text("Pounce")) + 75;
player3_show_crouch_key_x = player3_show_jump_key_x + string_width(Text("Jump")) + 37;
if (global.player3_sprint_toggle = false)
{
	player3_show_sprint_key_x = player3_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player3_show_left_key_x = player3_show_sprint_key_x + string_width(Text("Sprint")) + 37;
	player3_show_right_key_x = player3_show_left_key_x + string_width(Text("Left")) + 37;
	player3_show_down_key_x = player3_show_right_key_x + string_width(Text("Right")) + 37;
	player3_show_up_key_x = player3_show_down_key_x + string_width(Text("Down")) + 37;
}
else
{
	player3_show_sprint_key_x = -999; /*Hide the sprint key if you have "Always Run" turned on*/
	player3_show_left_key_x = player3_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player3_show_right_key_x = player3_show_left_key_x + string_width(Text("Left")) + 37;
	player3_show_down_key_x = player3_show_right_key_x + string_width(Text("Right")) + 37;
	player3_show_up_key_x = player3_show_down_key_x + string_width(Text("Down")) + 37;
}
#endregion /*Player 3 show keys x positions END*/

#region /*Player 4 show keys x positions*/
player4_show_dive_key_x = 32;
player4_show_jump_key_x = string_width(Text("Pounce")) + 75;
player4_show_crouch_key_x = player4_show_jump_key_x + string_width(Text("Jump")) + 37;
if (global.player4_sprint_toggle = false)
{
	player4_show_sprint_key_x = player4_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player4_show_left_key_x = player4_show_sprint_key_x + string_width(Text("Sprint")) + 37;
	player4_show_right_key_x = player4_show_left_key_x + string_width(Text("Left")) + 37;
	player4_show_down_key_x = player4_show_right_key_x + string_width(Text("Right")) + 37;
	player4_show_up_key_x = player4_show_down_key_x + string_width(Text("Down")) + 37;
}
else
{
	player4_show_sprint_key_x = -999; /*Hide the sprint key if you have "Always Run" turned on*/
	player4_show_left_key_x = player4_show_crouch_key_x + string_width(Text("Crouch")) + 37;
	player4_show_right_key_x = player4_show_left_key_x + string_width(Text("Left")) + 37;
	player4_show_down_key_x = player4_show_right_key_x + string_width(Text("Right")) + 37;
	player4_show_up_key_x = player4_show_down_key_x + string_width(Text("Down")) + 37;
}
#endregion /*Player 4 show keys x positions END*/

#endregion /*Show keys x positions END*/

if (os_type != os_ios)
and (os_type != os_android)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	
	#region /*Show Multiplayer Controls*/
	if (global.player1_can_play = true)
	or(global.player2_can_play = true)
	or(global.player3_can_play = true)
	or(global.player4_can_play = true)
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
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 74, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /*+ 32 = don't show*/
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /*+ 32 = don't show*/
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
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /*+ 32 = don't show*/
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /*+ 32 = don't show*/
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
		
		#region /*Multiplayer Player 1*/
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player1_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 1 Dive Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_dive > noone)
			{
				draw_text_outlined(player1_show_dive_key_x + 22, window_get_height() - show_player1_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_dive, player1_show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_dive > noone)
			{
				draw_text_outlined(player1_show_dive_key_x + 22, window_get_height() - show_player1_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_dive, player1_show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_dive > noone)
			{
				draw_text_outlined(player1_show_dive_key_x + 22, window_get_height() - show_player1_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_dive, player1_show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_dive > noone)
			{
				draw_text_outlined(player1_show_dive_key_x + 22, window_get_height() - show_player1_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_dive, player1_show_dive_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Player 1 Dive Key END*/
			
			#region /*Show Player 1 Jump Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_jump > noone)
			{
				draw_text_outlined(player1_show_jump_key_x + 22, window_get_height() - show_player1_controls_y, Text("Jump"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_jump, player1_show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_jump > noone)
			{
				draw_text_outlined(player1_show_jump_key_x + 22, window_get_height() - show_player1_controls_y, Text("Jump"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_jump, player1_show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_jump > noone)
			{
				draw_text_outlined(player1_show_jump_key_x + 22, window_get_height() - show_player1_controls_y, Text("Jump"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, player1_show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_jump > noone)
			{
				draw_text_outlined(player1_show_jump_key_x + 22, window_get_height() - show_player1_controls_y, Text("Jump"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, player1_show_jump_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Player 1 Jump Key END*/
			
			#region /*Show Player 1 Crouch Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_crouch > noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_crouch, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_crouch > noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_crouch, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_crouch_toggle > noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_crouch_toggle, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_crouch_toggle > noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_crouch_toggle, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_crouch> noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_crouch> noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_crouch_toggle > noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_crouch_toggle, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_crouch_toggle > noone)
			{
				draw_text_outlined(player1_show_crouch_key_x + 22, window_get_height() - show_player1_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_crouch_toggle, player1_show_crouch_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Player 1 Crouch Key END*/
			
			#region /*Show Player 1 Sprint Key*/
			if (global.player1_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player1_gamepad_button_sprint > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player1_gamepad_button_sprint, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player1_gamepad_button2_sprint > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player1_gamepad_button2_sprint, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player1_gamepad_button_sprint_toggle > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player1_gamepad_button_sprint_toggle, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player1_gamepad_button2_sprint_toggle > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player1_gamepad_button2_sprint_toggle, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key_sprint > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key2_sprint > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key_sprint_toggle > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint_toggle, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key2_sprint_toggle > noone)
				{
					draw_text_outlined(player1_show_sprint_key_x + 22, window_get_height() - show_player1_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint_toggle, player1_show_sprint_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
			}
			#endregion /*Show Player 1 Sprint Key END*/
			
			#region /*Show Player 1 Left Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_left > noone)
			{
				draw_text_outlined(player1_show_left_key_x + 22, window_get_height() - show_player1_controls_y, Text("Left"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_left, player1_show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_left > noone)
			{
				draw_text_outlined(player1_show_left_key_x + 22, window_get_height() - show_player1_controls_y, Text("Left"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_left, player1_show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_left > noone)
			{
				draw_text_outlined(player1_show_left_key_x + 22, window_get_height() - show_player1_controls_y, Text("Left"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, player1_show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_left > noone)
			{
				draw_text_outlined(player1_show_left_key_x + 22, window_get_height() - show_player1_controls_y, Text("Left"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, player1_show_left_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Player 1 Left Key END*/
			
			#region /*Show Player 1 Right Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_right > noone)
			{
				draw_text_outlined(player1_show_right_key_x + 22, window_get_height() - show_player1_controls_y, Text("Right"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_right, player1_show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_right > noone)
			{
				draw_text_outlined(player1_show_right_key_x + 22, window_get_height() - show_player1_controls_y, Text("Right"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_right, player1_show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_right > noone)
			{
				draw_text_outlined(player1_show_right_key_x + 22, window_get_height() - show_player1_controls_y, Text("Right"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, player1_show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_right > noone)
			{
				draw_text_outlined(player1_show_right_key_x + 22, window_get_height() - show_player1_controls_y, Text("Right"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, player1_show_right_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Player 1 Right Key END*/
			
			#region /*Show Player 1 Down Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_down > noone)
			{
				draw_text_outlined(player1_show_down_key_x + 22, window_get_height() - show_player1_controls_y, Text("Down"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_down, player1_show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_down > noone)
			{
				draw_text_outlined(player1_show_down_key_x + 22, window_get_height() - show_player1_controls_y, Text("Down"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_down, player1_show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_down > noone)
			{
				draw_text_outlined(player1_show_down_key_x + 22, window_get_height() - show_player1_controls_y, Text("Down"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_down, player1_show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_down > noone)
			{
				draw_text_outlined(player1_show_down_key_x + 22, window_get_height() - show_player1_controls_y, Text("Down"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_down, player1_show_down_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Player 1 Down Key END*/
			
			#region /*Show Player 1 Up Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button_up > noone)
			{
				draw_text_outlined(player1_show_up_key_x + 22, window_get_height() - show_player1_controls_y, Text("Up"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button_up, player1_show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player1_gamepad_button2_up > noone)
			{
				draw_text_outlined(player1_show_up_key_x + 22, window_get_height() - show_player1_controls_y, Text("Up"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player1_gamepad_button2_up, player1_show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key_up > noone)
			{
				draw_text_outlined(player1_show_up_key_x + 22, window_get_height() - show_player1_controls_y, Text("Up"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_up, player1_show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player1_key2_up > noone)
			{
				draw_text_outlined(player1_show_up_key_x + 22, window_get_height() - show_player1_controls_y, Text("Up"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_up, player1_show_up_key_x, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
			}
			#endregion /*Show Player 1 Down Key END*/
			
		}
		else
		if (player1 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player1_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 1 Join Game Key*/
			if (can_spawn_player1 = true)
			and (lives > 0)
			and (global.player1_show_controls >= 1)
			{
				player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player1_controls_y, Text("Join Game"), global.default_text_size, c_black, global.player1_color, player1_show_controls_alpha);
				
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				{
					scr_draw_gamepad_buttons(gp_face1, 252, window_get_height() - show_player1_controls_y, 0.5, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 252, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player1_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, 252, window_get_height() - show_player1_controls_y, 0.5, 0.5, 0, c_white, player1_show_controls_alpha);
				}
			}
			#endregion /*Show Player 1 Join Game Key END*/
			
		}
		#endregion /*Multiplayer Player 1 END*/
		
		#region /*Multiplayer Player 2*/
		if (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player2_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 2 Dive Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_dive > noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_dive > noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_dive > noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_dive > noone)
			{
				draw_text_outlined(player2_show_dive_key_x + 22, window_get_height() - show_player2_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_dive, player2_show_dive_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Player 2 Dive Key END*/
			
			#region /*Show Player 2 Jump Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_jump > noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, Text("Jump"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_jump > noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, Text("Jump"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_jump > noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, Text("Jump"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_jump > noone)
			{
				draw_text_outlined(player2_show_jump_key_x + 22, window_get_height() - show_player2_controls_y, Text("Jump"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, player2_show_jump_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Player 2 Jump Key END*/
			
			#region /*Show Player 2 Crouch Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_crouch > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_crouch > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_crouch_toggle > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_crouch_toggle > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_crouch> noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_crouch> noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_crouch, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_crouch_toggle > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_crouch_toggle > noone)
			{
				draw_text_outlined(player2_show_crouch_key_x + 22, window_get_height() - show_player2_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_crouch_toggle, player2_show_crouch_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Player 2 Crouch Key END*/
			
			#region /*Show Player 2 Sprint Key*/
			if (global.player2_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player2_gamepad_button_sprint > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player2_gamepad_button_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player2_gamepad_button2_sprint > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player2_gamepad_button2_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player2_gamepad_button_sprint_toggle > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player2_gamepad_button_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player2_gamepad_button2_sprint_toggle > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player2_gamepad_button2_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key_sprint > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key2_sprint > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key_sprint_toggle > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key2_sprint_toggle > noone)
				{
					draw_text_outlined(player2_show_sprint_key_x + 22, window_get_height() - show_player2_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint_toggle, player2_show_sprint_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
			}
			#endregion /*Show Player 2 Sprint Key END*/
			
			#region /*Show Player 2 Left Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_left > noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, Text("Left"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_left > noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, Text("Left"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_left > noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, Text("Left"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_left > noone)
			{
				draw_text_outlined(player2_show_left_key_x + 22, window_get_height() - show_player2_controls_y, Text("Left"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_left, player2_show_left_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Player 2 Left Key END*/
			
			#region /*Show Player 2 Right Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_right > noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, Text("Right"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_right > noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, Text("Right"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_right > noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, Text("Right"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_right > noone)
			{
				draw_text_outlined(player2_show_right_key_x + 22, window_get_height() - show_player2_controls_y, Text("Right"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_right, player2_show_right_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Player 2 Right Key END*/
			
			#region /*Show Player 2 Down Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_down > noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, Text("Down"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_down > noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, Text("Down"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_down > noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, Text("Down"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_down > noone)
			{
				draw_text_outlined(player2_show_down_key_x + 22, window_get_height() - show_player2_controls_y, Text("Down"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_down, player2_show_down_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Player 2 Down Key END*/
			
			#region /*Show Player 2 Up Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button_up > noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, Text("Up"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player2_gamepad_button2_up > noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, Text("Up"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player2_gamepad_button2_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key_up > noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, Text("Up"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player2_key2_up > noone)
			{
				draw_text_outlined(player2_show_up_key_x + 22, window_get_height() - show_player2_controls_y, Text("Up"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_up, player2_show_up_key_x, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
			}
			#endregion /*Show Player 2 Down Key END*/
			
		}
		else
		if (player2 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player2_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 2 Join Game Key*/
			if (can_spawn_player2 = true)
			and (lives > 0)
			and (global.player2_show_controls >= 1)
			{
				player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player2_controls_y, Text("Join Game"), global.default_text_size, c_black, global.player2_color, player2_show_controls_alpha);
				
				if (gamepad_is_connected(1))
				and (global.controls_used_for_menu_navigation = "controller")
				{
					scr_draw_gamepad_buttons(gp_face1, 252, window_get_height() - show_player2_controls_y, 0.5, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, 252, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player2_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, 252, window_get_height() - show_player2_controls_y, 0.5, 0.5, 0, c_white, player2_show_controls_alpha);
				}
			}
			#endregion /*Show Player 2 Join Game Key END*/
			
		}
		#endregion /*Multiplayer Player 2 END*/
		
		#region /*Multiplayer Player 3*/
		if (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player3_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 3 Dive Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_dive > noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_dive > noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_dive > noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_dive > noone)
			{
				draw_text_outlined(player3_show_dive_key_x + 22, window_get_height() - show_player3_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_dive, player3_show_dive_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Player 3 Dive Key END*/
			
			#region /*Show Player 3 Jump Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_jump > noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, Text("Jump"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_jump > noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, Text("Jump"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_jump > noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, Text("Jump"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_jump > noone)
			{
				draw_text_outlined(player3_show_jump_key_x + 22, window_get_height() - show_player3_controls_y, Text("Jump"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, player3_show_jump_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Player 3 Jump Key END*/
			
			#region /*Show Player 3 Crouch Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_crouch > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_crouch > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_crouch_toggle > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_crouch_toggle > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_crouch> noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_crouch> noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_crouch, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_crouch_toggle > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_crouch_toggle > noone)
			{
				draw_text_outlined(player3_show_crouch_key_x + 22, window_get_height() - show_player3_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_crouch_toggle, player3_show_crouch_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Player 3 Crouch Key END*/
			
			#region /*Show Player 3 Sprint Key*/
			if (global.player3_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player3_gamepad_button_sprint > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player3_gamepad_button_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player3_gamepad_button2_sprint > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player3_gamepad_button2_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player3_gamepad_button_sprint_toggle > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player3_gamepad_button_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player3_gamepad_button2_sprint_toggle > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player3_gamepad_button2_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key_sprint > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key2_sprint > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key_sprint_toggle > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key2_sprint_toggle > noone)
				{
					draw_text_outlined(player3_show_sprint_key_x + 22, window_get_height() - show_player3_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint_toggle, player3_show_sprint_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
			}
			#endregion /*Show Player 3 Sprint Key END*/
			
			#region /*Show Player 3 Left Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_left > noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, Text("Left"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_left > noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, Text("Left"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_left > noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, Text("Left"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_left > noone)
			{
				draw_text_outlined(player3_show_left_key_x + 22, window_get_height() - show_player3_controls_y, Text("Left"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_left, player3_show_left_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Player 3 Left Key END*/
			
			#region /*Show Player 3 Right Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_right > noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, Text("Right"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_right > noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, Text("Right"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_right > noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, Text("Right"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_right > noone)
			{
				draw_text_outlined(player3_show_right_key_x + 22, window_get_height() - show_player3_controls_y, Text("Right"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_right, player3_show_right_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Player 3 Right Key END*/
			
			#region /*Show Player 3 Down Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_down > noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, Text("Down"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_down > noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, Text("Down"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_down > noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, Text("Down"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_down > noone)
			{
				draw_text_outlined(player3_show_down_key_x + 22, window_get_height() - show_player3_controls_y, Text("Down"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_down, player3_show_down_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Player 3 Down Key END*/
			
			#region /*Show Player 3 Up Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button_up > noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, Text("Up"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player3_gamepad_button2_up > noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, Text("Up"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player3_gamepad_button2_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key_up > noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, Text("Up"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player3_key2_up > noone)
			{
				draw_text_outlined(player3_show_up_key_x + 22, window_get_height() - show_player3_controls_y, Text("Up"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_up, player3_show_up_key_x, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
			}
			#endregion /*Show Player 3 Down Key END*/
			
		}
		else
		if (player3 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player3_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 3 Join Game Key*/
			if (can_spawn_player3 = true)
			and (lives > 0)
			and (global.player3_show_controls >= 1)
			{
				player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player3_controls_y, Text("Join Game"), global.default_text_size, c_black, global.player3_color, player3_show_controls_alpha);
				
				if (gamepad_is_connected(2))
				and (global.controls_used_for_menu_navigation = "controller")
				{
					scr_draw_gamepad_buttons(gp_face1, 252, window_get_height() - show_player3_controls_y, 0.5, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, 252, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player3_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, 252, window_get_height() - show_player3_controls_y, 0.5, 0.5, 0, c_white, player3_show_controls_alpha);
				}
			}
			#endregion /*Show Player 3 Join Game Key END*/
			
		}
		#endregion /*Multiplayer Player 3 END*/
		
		#region /*Multiplayer Player 4*/
		if (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player4_show_controls >= true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 4 Dive Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_dive > noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_dive > noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_dive > noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_dive > noone)
			{
				draw_text_outlined(player4_show_dive_key_x + 22, window_get_height() - show_player4_controls_y, Text("Pounce"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_dive, player4_show_dive_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Player 4 Dive Key END*/
			
			#region /*Show Player 4 Jump Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_jump > noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, Text("Jump"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_jump > noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, Text("Jump"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_jump > noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, Text("Jump"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_jump > noone)
			{
				draw_text_outlined(player4_show_jump_key_x + 22, window_get_height() - show_player4_controls_y, Text("Jump"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, player4_show_jump_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Player 4 Jump Key END*/
			
			#region /*Show Player 4 Crouch Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_crouch > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_crouch > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_crouch_toggle > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_crouch_toggle > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_crouch> noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_crouch> noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_crouch, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_crouch_toggle > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_crouch_toggle > noone)
			{
				draw_text_outlined(player4_show_crouch_key_x + 22, window_get_height() - show_player4_controls_y, Text("Crouch"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_crouch_toggle, player4_show_crouch_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Player 4 Crouch Key END*/
			
			#region /*Show Player 4 Sprint Key*/
			if (global.player4_sprint_toggle = false)
			{
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player4_gamepad_button_sprint > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player4_gamepad_button_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player4_gamepad_button2_sprint > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player4_gamepad_button2_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player4_gamepad_button_sprint_toggle > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player4_gamepad_button_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
				}
				else
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation = "controller")
				and (global.player4_gamepad_button2_sprint_toggle > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					scr_draw_gamepad_buttons(global.player4_gamepad_button2_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key_sprint > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key2_sprint > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key_sprint_toggle > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key2_sprint_toggle > noone)
				{
					draw_text_outlined(player4_show_sprint_key_x + 22, window_get_height() - show_player4_controls_y, Text("Sprint"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint_toggle, player4_show_sprint_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
			}
			#endregion /*Show Player 4 Sprint Key END*/
			
			#region /*Show Player 4 Left Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_left > noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, Text("Left"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_left > noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, Text("Left"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_left > noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, Text("Left"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_left > noone)
			{
				draw_text_outlined(player4_show_left_key_x + 22, window_get_height() - show_player4_controls_y, Text("Left"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_left, player4_show_left_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Player 4 Left Key END*/
			
			#region /*Show Player 4 Right Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_right > noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, Text("Right"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_right > noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, Text("Right"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_right > noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, Text("Right"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_right > noone)
			{
				draw_text_outlined(player4_show_right_key_x + 22, window_get_height() - show_player4_controls_y, Text("Right"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_right, player4_show_right_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Player 4 Right Key END*/
			
			#region /*Show Player 4 Down Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_down > noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, Text("Down"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_down > noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, Text("Down"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_down > noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, Text("Down"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_down > noone)
			{
				draw_text_outlined(player4_show_down_key_x + 22, window_get_height() - show_player4_controls_y, Text("Down"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_down, player4_show_down_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Player 4 Down Key END*/
			
			#region /*Show Player 4 Up Key*/
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button_up > noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, Text("Up"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation = "controller")
			and (global.player4_gamepad_button2_up > noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, Text("Up"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				scr_draw_gamepad_buttons(global.player4_gamepad_button2_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key_up > noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, Text("Up"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			and (global.player4_key2_up > noone)
			{
				draw_text_outlined(player4_show_up_key_x + 22, window_get_height() - show_player4_controls_y, Text("Up"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_up, player4_show_up_key_x, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
			}
			#endregion /*Show Player 4 Down Key END*/
			
		}
		else
		if (player4 <= 0)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.player4_can_play = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			#region /*Show Player 4 Join Game Key*/
			if (can_spawn_player4 = true)
			and (lives > 0)
			and (global.player4_show_controls >= 1)
			{
				player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.3);
				draw_text_outlined(30, window_get_height() - show_player4_controls_y, Text("Join Game"), global.default_text_size, c_black, global.player4_color, player4_show_controls_alpha);
				
				if (gamepad_is_connected(3))
				and (global.controls_used_for_menu_navigation = "controller")
				{
					scr_draw_gamepad_buttons(gp_face1, 252, window_get_height() - show_player4_controls_y, 0.5, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, 252, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				and (global.player4_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, 252, window_get_height() - show_player4_controls_y, 0.5, 0.5, 0, c_white, player4_show_controls_alpha);
				}
			}
			#endregion /*Show Player 4 Join Game Key END*/
			
		}
		#endregion /*Multiplayer Player 4 END*/
		
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
or(global.player1_can_play <= 0)
and (global.player2_can_play >= 1)
and (global.player3_can_play <= 0)
and (global.player4_can_play <= 0)
or(global.player1_can_play <= 0)
and (global.player2_can_play <= 0)
and (global.player3_can_play >= 1)
and (global.player4_can_play <= 0)
or(global.player1_can_play <= 0)
and (global.player2_can_play <= 0)
and (global.player3_can_play <= 0)
and (global.player4_can_play >= 1)
{
	if (global.show_prompt_when_changing_to_gamepad = true)
	{
		draw_sprite_ext(spr_change_input_to_controller, 0, 110, window_get_height() + 300 + show_controller_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
	if (global.show_prompt_when_changing_to_keyboard_and_mouse = true)
	{
		draw_sprite_ext(spr_change_input_to_keyboard, 0, 110, window_get_height() + 300 + show_keyboard_and_mouse_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
}
#endregion /*Show what input is used END*/

scr_virtual_keys();

#region /*Display Rank*/
if (global.goal_active = true)
and (global.show_ranks = true)
and (global.enable_ranks = true)
{
	if (global.character_select_in_this_menu = "main_game")
	and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
	
	or (global.character_select_in_this_menu = "level_editor")
	and (global.select_level_index <= 0)
	and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
	or (global.character_select_in_this_menu = "level_editor")
	and (global.create_level_from_template >= 2)
	and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
	
	or (global.character_select_in_this_menu = "level_editor")
	and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
	{
		if (global.character_select_in_this_menu = "main_game")
		{
			ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		else
		if (global.character_select_in_this_menu = "level_editor")
		and (global.select_level_index <= 0)
		or(global.character_select_in_this_menu = "level_editor")
		and (global.create_level_from_template >= 2)
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		}
		else
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		
		if (ini_key_exists("rank", "rank_level_score"))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text_outlined(window_get_width() / 2 - 128, window_get_height() / 2 - 74, Text("Score"), global.default_text_size, c_black, c_white, 1);
			draw_set_halign(fa_right);
			draw_text_outlined(window_get_width() / 2 - 32, window_get_height() / 2 + 74, Text("S Rank Score") + ": " + string(ini_read_real("rank", "rank_level_score", 0)), global.default_text_size, c_black, c_white, 1);
			draw_text_outlined(window_get_width() / 2 - 32, window_get_height() / 2 + 74 + 32, Text("Your Score") + ": " + string(score), global.default_text_size, c_black, c_white, 1);
			if (score >= ini_read_real("rank", "rank_level_score", 0))
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 0, window_get_width() / 2 - 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank S*/
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 10000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 1, window_get_width() / 2 - 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank A*/
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 50000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 2, window_get_width() / 2 - 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank B*/
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 80000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 3, window_get_width() / 2 - 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank C*/
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 100000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 4, window_get_width() / 2 - 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank D*/
			}
			else
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 5, window_get_width() / 2 - 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank E*/
			}
		}
		if (ini_key_exists("rank", "rank_timeattack_realmillisecond"))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text_outlined(window_get_width() / 2 + 128, window_get_height() / 2 - 74, Text("Time"), global.default_text_size, c_black, c_white, 1);
			draw_set_halign(fa_right)
			draw_text_outlined(window_get_width() / 2 + 328, window_get_height() / 2 + 74, Text("S Rank Time") + ": " + string(ini_read_real("rank", "rank_timeattack_minute", 0)) + ":" + string(ini_read_real("rank", "rank_timeattack_second", 0)) + "." + string(string_replace_all(string_format(ini_read_real("rank", "rank_timeattack_millisecond", 0), 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
			draw_text_outlined(window_get_width() / 2 + 328, window_get_height() / 2 + 74 + 32, Text("Your Time") + ": " + string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
			
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0))
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 0, window_get_width() / 2 + 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank S*/
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 1000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 1, window_get_width() / 2 + 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank A*/
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 5000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 2, window_get_width() / 2 + 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank B*/
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 8000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 3, window_get_width() / 2 + 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank C*/
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 10000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 4, window_get_width() / 2 + 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank D*/
			}
			else
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 5, window_get_width() / 2 + 128, window_get_height() / 2, 1, 1, 0, c_white, 1); /*Rank E*/
			}
		}
		ini_close();
	}
}
#endregion /*Display Rank END*/

#region /*Letterboxing during cutscenes (when the player object is absent)*/
if (show_letterbox > 0)
and (global.play_edited_level = false)
and (global.actually_play_edited_level = false)
or(show_letterbox > 0)
and (global.play_edited_level = true)
and (global.actually_play_edited_level = true)
{
	draw_rectangle_color(0, 0, room_width * 3, letterbox_top_y, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(0, letterbox_bottom_y, room_width * 3, window_get_height(), c_black, c_black, c_black, c_black, false);
}
if (asset_get_type("obj_player") == asset_object)
and (!instance_exists(obj_player))
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
or(asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.can_move = false)
{
	letterbox_top_y = lerp(letterbox_top_y, + 64, 0.1);
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
and (global.full_level_map_screenshot = false)
and (global.pause = false)
and (os_type!= os_android)
and (os_type!= os_ios)
{
	draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/

#region /*Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see*/
if (iris_xscale <= 1)
or (instance_exists(obj_player_die))
and (obj_player_die.iris_xscale <= 1)
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 1, 0.1);
}
else
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 0, 0.1);
}
draw_set_alpha(black_screen_gui_alpha);
draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
#endregion /*Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END*/