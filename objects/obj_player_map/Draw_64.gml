var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var clear_prompt_x = 164;


#region /* Show Enter Level Key */
if (can_move == true)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed == 0)
and (instance_nearest(x, y, obj_level).clear_rate != "closed")
and (global.pause == false)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, get_window_height - 28, l10n_text("Play"), global.default_text_size, c_black, c_white, 1);
	if (gamepad_is_connected(0))
	and (global.controls_used_for_menu_navigation == "controller")
	{
		scr_draw_gamepad_buttons(global.player1_gamepad_button_accept, 32, get_window_height - 28, 0.5, c_white, 1);
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	{
		if (global.player1_can_play == true)
		{
			if (global.player1_key_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player1_key2_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player1_key2_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
		}
		else
		if (global.player2_can_play == true)
		{
			if (global.player2_key_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player2_key_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player2_key2_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player2_key2_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
		}
		else
		if (global.player3_can_play == true)
		{
			if (global.player3_key_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player3_key_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player3_key2_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player3_key2_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
		}
		else
		if (global.player4_can_play == true)
		{
			if (global.player4_key_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player4_key_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player4_key2_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player4_key2_accept, 32, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
			}
		}
	}
}
#endregion /* Show Enter Level Key END */

#region /* Show Clear Level Key in debug */
if (global.debug_screen == true)
{
	if (can_move == true)
	and (can_enter_level >= 30)
	and (asset_get_type("obj_level") == asset_object)
	and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
	and (speed == 0)
	and (instance_nearest(x, y, obj_level).clear_rate = "enter")
	and (global.pause == false)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(clear_prompt_x + 32, get_window_height - 28, l10n_text("Clear"), global.default_text_size, c_black, c_white, 1);
		if (gamepad_is_connected(0))
		and (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_gamepad_buttons(global.player1_gamepad_button_back, clear_prompt_x, get_window_height - 28, 0.5, c_white, 1);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			if (global.player1_can_play == true)
			{
				if (global.player1_key_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player1_key2_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
			}
			else
			if (global.player2_can_play == true)
			{
				if (global.player2_key_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player2_key_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player2_key2_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player2_key2_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
			}
			else
			if (global.player3_can_play == true)
			{
				if (global.player3_key_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player3_key_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player3_key2_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player3_key2_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
			}
			else
			if (global.player4_can_play == true)
			{
				if (global.player4_key_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player4_key_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player4_key2_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player4_key2_back, clear_prompt_x, get_window_height - 28, 0.5, 0.5, 0, c_white, 1);
				}
			}
		}
	}
}
#endregion /* Show Clear Level Key in debug END */

#region /* Show if you are playing the demo version or not */
if (global.demo == true)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width * 0.5, + 32, string(global.game_name) + " " + l10n_text("Demo"), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Show if you are playing the demo version or not END */

if (show_demo_over_message == true)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, get_window_width* 3, get_window_height* 3, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("The demo is over"), global.default_text_size, c_black, c_white, 1);
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 + 32, l10n_text("Buy the full version of") + " " + string(global.game_name), global.default_text_size, c_black, c_white, 1);
	draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 64, l10n_text("Purchase now!"), "purchase_now", noone)
	draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 106, l10n_text("Continue playing!"), "continue_playing", noone)
}
if (menu == noone)
{
	show_demo_over_message = false;
}

#region /* Have a black screen at the first frame so transitions look natural */
if (black_screen_at_start_delay < 1)
{
	draw_rectangle_color(0, 0, get_window_width* 3, get_window_height* 3, c_black, c_black, c_black, c_black, false);
	black_screen_at_start_delay += 1;
}
#endregion /* Have a black screen at the first frame so transitions look natural END */

scr_draw_cursor_mouse();

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (iris_yscale <= 0.002)
or (brand_new_file == true)
{
	draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */