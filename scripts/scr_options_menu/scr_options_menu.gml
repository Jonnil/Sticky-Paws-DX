///scr_options_menu()
function scr_options_menu()
{
	
	#region /*Background Brightness in Menus Options*/
	if (background_brightness_menu_lerp < 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(-32, -32, room_width* 2, room_height* 2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	else
	if (background_brightness_menu_lerp > 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(-32, -32, room_width* 2, room_height* 2, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /*Background Brightness in Menus Options END*/
	
	#region /*Black Background behind sidebar*/
	draw_set_alpha(1);
	draw_rectangle_color(left_sidebar_x + 0, 0, left_sidebar_x + 370, window_get_height(), c_black, c_black, c_black, c_black, false);
	#endregion /*Black Background behind sidebar END*/
	
	#region /*Set Font*/
	//if (global.language_localization = localization.ar_sa)
	//{
	//	var text_x_offset = 290;
	//	var icon_x_offset = 330;
	//	draw_set_halign(fa_right);
	//	draw_set_valign(fa_center);
	//}
	//else
	//{
		var text_x_offset = 0;
		var icon_x_offset = 0;
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
	//}
	#endregion /*Set Font END*/
	
	#region /*Menu navigation tabs y positions*/
	accessibility_settings_y = 40;
	how_to_play_y = 40 * 2;
	game_text_y = 40 * 3;
	game_settings_y = 40 * 4;
	multiplayer_settings_y = 40 * 5;
	controls_text_y = 40 * 6;
	keyboard_and_mouse_settings_y = 40 * 7;
	controller_settings_y = 40 * 8;
	touch_settings_y = 40 * 9;
	general_text_y = 40 * 10;
	profile_settings_y = 40 * 11;
	video_settings_y = 40 * 12;
	audio_settings_y = 40 * 13;
	global_resources_settings_y = 40 * 14;
	storage_settings_y = 40 * 15;
	language_settings_y = 40 * 16;
	broadcast_settings_y = 40 * 17;
	
	if (global.enable_multiplayer_settings = false)
	and (global.enable_controller_settings = false)
	and (global.enable_touch_settings = false)
	and (global.enable_profile_settings = false)
	and (global.enable_broadcast_settings = false)
	and (global.enable_how_to_play_settings = false)
	and (global.enable_add_ons_settings = false)
	{
		accessibility_settings_y = 40;
		game_text_y = 40 * 2;
		game_settings_y = 40 * 3;
		controls_text_y = 40 * 4;
		keyboard_and_mouse_settings_y = 40 * 5;
		general_text_y = 40 * 6;
		video_settings_y = 40 * 7;
		audio_settings_y = 40 * 8;
		global_resources_settings_y = 40 * 9;
		storage_settings_y = 40 * 10;
		language_settings_y = 40 * 11;
	}
	#endregion /*Menu navigation tabs y positions END*/
	
	#region /*Tabs Graphics*/
	
	#region /*Accessibility Settings*/
	if (global.settings_sidebar_menu = "accessibility_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_gray, 1);
		}
		/*Button Hightlighted*/
		
		draw_sprite_ext(spr_settings_icons, 1, left_sidebar_x + 20 + icon_x_offset, 20 +accessibility_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +accessibility_settings_y, Text("Accessibility"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_settings_icons, 1, left_sidebar_x + 20 + icon_x_offset, 20 +accessibility_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +accessibility_settings_y, Text("Accessibility"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*Accessibility Settings END*/
	
	#region /*My Game Settings*/
	draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (game_text_y), Text("Game"), global.default_text_size * 0.5, c_black, c_white, 1);
	
	#region /*Game Settings*/
	if (global.settings_sidebar_menu = "game_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, game_settings_y, 370, game_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_gray, 1);
		}
		draw_sprite_ext(spr_settings_icons, 2, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 1, 1, 0, c_white, 1) /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + game_settings_y, Text("Game"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, game_settings_y, 370, game_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_settings_icons, 2, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 0.9, 0.9, 0, c_white, 1)
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + game_settings_y, Text("Game"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*Game Settings END*/
	
	#region /*Multiplayer Settings*/
	if(global.enable_multiplayer_settings = true)
	{
		if (global.settings_sidebar_menu = "multiplayer_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 3, left_sidebar_x + 20 + icon_x_offset, 20 + multiplayer_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + multiplayer_settings_y, Text("Multiplayer"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 3, left_sidebar_x + 20 + icon_x_offset, 20 + multiplayer_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + multiplayer_settings_y, Text("Multiplayer"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Multiplayer Settings END*/
	
	#endregion /*My Game Settings END*/
	
	#region /*Controls Settings*/
	draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (controls_text_y), Text("Controls"), global.default_text_size * 0.5, c_black, c_white, 1);
	
	#region /*Keyboard and Mouse Settings*/
	if (global.settings_sidebar_menu = "keyboard_and_mouse_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_gray, 1);
		}
		draw_sprite_ext(spr_settings_icons, 4, left_sidebar_x + 20 + icon_x_offset, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +keyboard_and_mouse_settings_y, Text("Keyboard & Mouse"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_settings_icons, 4, left_sidebar_x + 20 + icon_x_offset, 20 +keyboard_and_mouse_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +keyboard_and_mouse_settings_y, Text("Keyboard & Mouse"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*Keyboard and Mouse Settings*/
	
	#region /*Controller Settings*/
	if(global.enable_controller_settings = true)
	{
		if (global.settings_sidebar_menu = "controller_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 5, left_sidebar_x + 20 + icon_x_offset, 20 + controller_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + controller_settings_y, Text("Controller"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 5, left_sidebar_x + 20 + icon_x_offset, 20 + controller_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + controller_settings_y, Text("Controller"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Controller Settings END*/
	
	#region /*Touch Settings*/
	if(global.enable_touch_settings = true)
	{
		if (global.settings_sidebar_menu = "touch_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, touch_settings_y, 370, touch_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons,6, left_sidebar_x + 20 + icon_x_offset, 20 + touch_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + touch_settings_y, Text("Touch"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, touch_settings_y, 370,(40 * 9) - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons,6, left_sidebar_x + 20 + icon_x_offset, 20 + touch_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + touch_settings_y, Text("Touch"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Touch Settings END*/
	
	#endregion /*Controls Settings END*/

	#region /*General Settings*/
	draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + general_text_y, Text("General"), global.default_text_size * 0.5, c_black, c_white, 1);
	
	#region /*Profile Settings*/
	if(global.enable_profile_settings = true)
	{
		if (global.settings_sidebar_menu = "profile_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 7, left_sidebar_x + 20 + icon_x_offset, 20 +profile_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +profile_settings_y, Text("Profile"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 7, left_sidebar_x + 20 + icon_x_offset, 20 +profile_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +profile_settings_y, Text("Profile"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Profile Settings END*/
	
	#region /*Video Settings*/
	if (global.settings_sidebar_menu = "video_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,video_settings_y, 370,video_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_gray, 1);
		}
		draw_sprite_ext(spr_settings_icons, 8, left_sidebar_x + 20 + icon_x_offset, 20 + video_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + video_settings_y, Text("Video"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,video_settings_y, 370,video_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_settings_icons, 8, left_sidebar_x + 20 + icon_x_offset, 20 + video_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + video_settings_y, Text("Video"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*Video Settings END*/
	
	#region /*Audio Settings*/
	if (global.settings_sidebar_menu = "audio_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_gray, 1);
		}
		draw_sprite_ext(spr_settings_icons,9, left_sidebar_x + 20 + icon_x_offset, 20 +audio_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +audio_settings_y, Text("Audio"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
		{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_settings_icons,9, left_sidebar_x + 20 + icon_x_offset, 20 +audio_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +audio_settings_y, Text("Audio"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*Audio Settings END*/
	
	#region /*Global Resources Settings*/
	if (global.enable_global_resources_settings = true)
	{
		if (global.settings_sidebar_menu = "global_resources_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 10, left_sidebar_x + 20 + icon_x_offset, 20 + global_resources_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + global_resources_settings_y, Text("Custom Resources"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 10, left_sidebar_x + 20 + icon_x_offset, 20 + global_resources_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + global_resources_settings_y, Text("Custom Resources"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Global Resources Settings END*/
	
	#region /*Storage Settings*/
	if(global.enable_storage_settings = true)
	{
		if (global.settings_sidebar_menu = "storage_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,storage_settings_y, 370,storage_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 11, left_sidebar_x + 20 + icon_x_offset, 20 + storage_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + storage_settings_y, Text("Storage"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,storage_settings_y, 370,storage_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 11, left_sidebar_x + 20 + icon_x_offset, 20 + storage_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + storage_settings_y, Text("Storage"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Storage Settings END*/
	
	#region /*Language Settings*/
	if(global.enable_language_settings = true)
	{
		if (global.settings_sidebar_menu = "language_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 12, left_sidebar_x + 20 + icon_x_offset, 20 +language_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +language_settings_y, Text("Language"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 12, left_sidebar_x + 20 + icon_x_offset, 20 +language_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +language_settings_y, Text("Language"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Language Settings END*/
	
	#region /*Broadcast Settings*/
	if(global.enable_broadcast_settings = true)
	{
		if (global.settings_sidebar_menu = "broadcast_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 13, left_sidebar_x + 20 + icon_x_offset, 20 +broadcast_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +broadcast_settings_y, Text("Broadcast"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 13, left_sidebar_x + 20 + icon_x_offset, 20 +broadcast_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +broadcast_settings_y, Text("Broadcast"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Broadcast Settings END*/
	
	#region /*How to play Settings*/
	if(global.enable_how_to_play_settings = true)
	{
		if (global.settings_sidebar_menu = "how_to_play")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,how_to_play_y, 370,how_to_play_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 14, left_sidebar_x + 20 + icon_x_offset, 20 +how_to_play_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +how_to_play_y, Text("How to Play"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,how_to_play_y, 370,how_to_play_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 14, left_sidebar_x + 20 + icon_x_offset, 20 +how_to_play_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +how_to_play_y, Text("How to Play"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*General Settings END*/

	#region /*Add-Ons Settings*/
	if (global.enable_add_ons_settings = true)
	{
		draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (40 * 18), Text("Add-Ons"), global.default_text_size * 0.5, c_black, c_white, 1);

		if (global.settings_sidebar_menu = "resource_pack_settings")
		{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_gray, 1); /*Button Hightlighted*/
		draw_sprite_ext(spr_settings_icons, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), Text("Resource Packs"), global.default_text_size * 1.1, c_black, c_white, 1);
		}else{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_white, 1); /*Button Not Selected*/
		draw_sprite_ext(spr_settings_icons, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), Text("Resource Packs"), global.default_text_size, c_white, c_black, 1);}

		if (global.settings_sidebar_menu = "behavior_packs_settings")
		{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 20), 1, 1, 0, c_gray, 1); /*Button Hightlighted*/
		draw_sprite_ext(spr_settings_icons, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 20), 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 20), Text("Behavior Packs"), global.default_text_size * 1.1, c_black, c_white, 1);
		}else{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 20), 1, 1, 0, c_white, 1); /*Button Not Selected*/
		draw_sprite_ext(spr_settings_icons, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 20), 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 20), Text("Behavior Packs"), global.default_text_size, c_white, c_black, 1);}
	}
	#endregion /*Add-Ons Settings END*/

	#region /*The "Back" button should always appear at the top of the screen*/
	if (global.settings_sidebar_menu = "settings_back")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, 0 - room_height, 370, 39))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_gray, 1);
		}
		/*Button Hightlighted*/
		
		draw_sprite_ext(spr_settings_icons, 0, left_sidebar_x + 20 + icon_x_offset, 20, 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20, Text("Back"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, 0 - room_height, 370, 39))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_white, 1);
		}
		/*Button Not Selected*/
		
		draw_sprite_ext(spr_settings_icons, 0, left_sidebar_x + 20 + icon_x_offset, 20, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20, Text("Back"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*The "Back" button should always appear at the top of the screen END*/
	
	#endregion /*Settings Sidebar END*/
	
	draw_set_alpha(darken_settings_sidebar_alpha);
	draw_rectangle_color(left_sidebar_x, 0, left_sidebar_x + 370, window_get_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	#endregion /*Tabs Graphics END*/
	
	if (in_settings = true)
	{
	
	#region /*Scroll menu on right side*/
	menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.5);
	if (menu_y_offset_real >= 0)
	{
		menu_y_offset_real = 0;
	}
	if (abs(menu_y_offset_real) + window_get_height() - 200 < menu_cursor_y_position)
	{
		menu_y_offset_real -= 10;
	}
	if (abs(menu_y_offset_real) + 200 > menu_cursor_y_position)
	{
		menu_y_offset_real += 10;
	}
	if (abs(menu_y_offset_real) + window_get_height() + 200 < menu_cursor_y_position)
	{
		menu_y_offset_real -= 100;
	}
	if (abs(menu_y_offset_real) - 200 > menu_cursor_y_position)
	{
		menu_y_offset_real += 100;
	}
	#endregion /*Scroll menu on right side END*/
	
	#region /*Go back out of setting menu*/
	if (key_a_pressed)
	and (menu_delay = 0)
	and (global.settings_sidebar_menu = "settings_back")
	and (can_navigate_settings_sidebar = true)
	and (input_key = false)
	or (key_b_pressed)
	and (menu_delay = 0)
	and (can_navigate_settings_sidebar = true)
	and (input_key = false)
	{
		scr_config_save(); /*Save Config*/
		if (global.pause_room != room_leveleditor)
		and (global.selected_resource_pack != old_selected_resource_pack)
		{
			scr_load_resource_pack_sprite(); /*Load new sprites from resource pack*/
			old_selected_resource_pack = global.selected_resource_pack;
		}
		in_settings = false;
		menu = "options";
		menu_delay = 3;
	}
	#endregion /*Go back out of setting menu END*/
	
	if (key_b_pressed)
	and (can_navigate_settings_sidebar = false)
	and (menu_delay = 0)
	and (input_key = false)
	{
		if (open_dropdown = true)
		{
			open_dropdown = false;
		}
		else
		{
			can_navigate_settings_sidebar = true;
			menu_delay = 3;
			menu = noone;
		}
	}
	else
	if (key_right)
	and (global.settings_sidebar_menu!= "settings_back")
	and (can_navigate_settings_sidebar = true)
	and (menu_delay = 0)
	or(key_a_pressed)
	and (global.settings_sidebar_menu!= "settings_back")
	and (can_navigate_settings_sidebar = true)
	and (menu_delay = 0)
	{
		menu_delay = 3;
		can_navigate_settings_sidebar = false;
		if (global.settings_sidebar_menu = "accessibility_settings"){menu = "assist_enable";}
		if (global.settings_sidebar_menu = "game_settings"){menu = "difficulty_settings";}
		if (global.settings_sidebar_menu = "keyboard_and_mouse_settings"){menu = "remap_select_player";}
		if (global.settings_sidebar_menu = "video_settings"){menu = "fullscreen_mode";}
		if (global.settings_sidebar_menu = "audio_settings"){menu = "main_volume";}
		if (global.settings_sidebar_menu = "global_resources_settings"){menu = "resource_pack";}
		if (global.settings_sidebar_menu = "storage_settings"){menu = "file_select";}
		if (global.settings_sidebar_menu = "language_settings")
		{
			menu = "Language" + string(language_index);
			menu_cursor_y_position = language_index * 50;
		}
	}
	/*When you navigate the sidebar or not*/
	
	/*Main Settings on left sidebar*/
	
	background_brightness_menu_lerp = lerp(background_brightness_menu_lerp, global.background_brightness_menu, 0.1); /*Background Brightness in Menus Options END*/
	
	left_sidebar_x = lerp(left_sidebar_x, 0, 0.1);
	
	#region /*Menu navigation with mouse*/
	
	#region /*Click Back*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, 0 - room_height, 370, 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (global.settings_sidebar_menu = "settings_back")
	and (mouse_check_button_released(mb_left))
	{
		scr_config_save(); /*Save Config*/
		if (global.pause_room != room_leveleditor)
		and (global.selected_resource_pack != old_selected_resource_pack)
		{
			scr_load_resource_pack_sprite(); /*Load new sprites from resource pack*/
			old_selected_resource_pack = global.selected_resource_pack;
		}
		input_key = false;
		in_settings = false;
		menu = "options";
		menu_delay = 3;
	}
	#endregion /*Click Back END*/
	
	else
	/*Back*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, 0 - room_height, 370, 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "settings_back"; input_key = false;can_navigate_settings_sidebar = true;}else
	
	/*Click Accessibility*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (global.settings_sidebar_menu = "accessibility_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "accessibility_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;menu = "assist_enable";}else
	/*Accessibility*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "accessibility_settings"; input_key = false;can_navigate_settings_sidebar = true;}else
	
	/*Click Game*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, game_settings_y, 370,(game_settings_y + 40) - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (global.settings_sidebar_menu = "game_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "game_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;menu = "difficulty_settings";}
	/*Game*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, game_settings_y, 370,(game_settings_y + 40) - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "game_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	
	if (global.enable_multiplayer_settings = true)
	{
		/*Click Multiplayer*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "multiplayer_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "multiplayer_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;}
		/*Multiplayer*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "multiplayer_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	/*Click Keyboard and Mouse*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (global.settings_sidebar_menu = "keyboard_and_mouse_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "keyboard_and_mouse_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;menu = "remap_select_player";}
	/*Keyboard and Mouse*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "keyboard_and_mouse_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	
	if(global.enable_controller_settings = true)
	{
		/*Click Controller*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "controller_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "controller_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;}
		/*Controller*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "controller_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_touch_settings = true)
	{
		/*Click Touch*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, touch_settings_y, 370, touch_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "touch_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "touch_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;}
		/*Touch*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, touch_settings_y, 370, touch_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "touch_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_profile_settings = true)
	{
		/*Click Profile*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "profile_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "profile_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;}
		/*Profile*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "profile_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	/*Click Video*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,video_settings_y, 370,video_settings_y + 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (global.settings_sidebar_menu = "video_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "video_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;menu = "fullscreen_mode";}
	/*Video*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,video_settings_y, 370,video_settings_y + 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "video_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	
	/*Click Audio*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (global.settings_sidebar_menu = "audio_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "audio_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;menu = "main_volume";}
	/*Audio*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "audio_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	
	if (global.enable_global_resources_settings = true)
	{
		/*Click Global Resources*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "global_resources_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "global_resources_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;menu = "resource_pack";}
		/*Global Resources*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "global_resources_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_storage_settings = true)
	{
		/*Click Storage*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,storage_settings_y, 370,storage_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "storage_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "storage_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;menu = "file_select";}
		/*Storage*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,storage_settings_y, 370,storage_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "storage_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_language_settings = true)
	{
		/*Click Language*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "language_settings")
		and (mouse_check_button_released(mb_left))
		{
			global.settings_sidebar_menu = "language_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "Language" + string(language_index);
		}
		/*Language*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left))
		{
			global.settings_sidebar_menu = "language_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
	}
	
	if(global.enable_broadcast_settings = true)
	{
		/*Click Broadcast*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "broadcast_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "broadcast_settings";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;}
		/*Broadcast*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "broadcast_settings"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_how_to_play_settings = true)
	{
		/*Click How to Play*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,how_to_play_y, 370,how_to_play_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.settings_sidebar_menu = "how_to_play") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "how_to_play";menu_delay = 3; input_key = false;can_navigate_settings_sidebar = false;}
		/*How to Play*/if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0 - room_width,how_to_play_y, 370,how_to_play_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "how_to_play"; input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	#endregion /*Menu navigation with mouse END*/
	
	#region /*Settings Sidebar Navigation*/
	if (menu_joystick_delay <= 0)
	{
		
		#region /*Accessibility Settings*/
		if (global.settings_sidebar_menu = "accessibility_settings")
		{
			if (key_up)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				global.settings_sidebar_menu = "settings_back";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if (global.enable_how_to_play_settings = true)
				{
					global.settings_sidebar_menu = "how_to_play";
				}
				else
				{
					global.settings_sidebar_menu = "game_settings";
				}
				menu_delay = 3;
			}
			/*Sidebar Navigation*/
		
		}
		#endregion /*Accessibility Settings END*/
		
		#region /*How to play Settings*/
		if(global.enable_how_to_play_settings = true)
		{
			if (global.settings_sidebar_menu = "how_to_play")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "accessibility_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "game_settings";
					menu_delay = 3;
				}
			}
		}
		#endregion /*How to play Settings END*/
		
		#region /*My Game Settings*/
		
		#region /*Game Settings*/
		if (global.settings_sidebar_menu = "game_settings")
		{
			if (key_up)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if (global.enable_how_to_play_settings = true)
				{
					global.settings_sidebar_menu = "how_to_play";
				}
				else
				{
					global.settings_sidebar_menu = "accessibility_settings";
				}
				menu_delay = 3;
			}
			else
			if (key_down)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if(global.enable_multiplayer_settings = true){global.settings_sidebar_menu = "multiplayer_settings";}
				else{global.settings_sidebar_menu = "keyboard_and_mouse_settings";}
				menu_delay = 3;
			}
		}
		#endregion /*Game Settings END*/
	
		#region /*Multiplayer Settings*/
		if(global.enable_multiplayer_settings = true)
		{
			if (global.settings_sidebar_menu = "multiplayer_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "game_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "keyboard_and_mouse_settings";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Multiplayer Settings END*/
	
		#endregion /*My Game Settings END*/
		
		#region /*Controls Settings*/
	
		#region /*Keyboard and Mouse Settings*/
		if (global.settings_sidebar_menu = "keyboard_and_mouse_settings")
		{
			if (key_up)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if(global.enable_multiplayer_settings = true)
				{
					global.settings_sidebar_menu = "multiplayer_settings";
				}
				else
				{
					global.settings_sidebar_menu = "game_settings";
				}
				menu_delay = 3;
			}
			else
			if (key_down)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if (global.enable_controller_settings = true)
				{
					global.settings_sidebar_menu = "controller_settings";
				}
				else
				if (global.enable_touch_settings = true)
				{
					global.settings_sidebar_menu = "touch_settings";
				}
				else
				if (global.enable_profile_settings = true)
				{
					global.settings_sidebar_menu = "profile_settings";
				}
				else
				{
					global.settings_sidebar_menu = "video_settings";
				}
				menu_delay = 3;
			}
		}
		#endregion /*Keyboard and Mouse Settings*/
	
		#region /*Controller Settings*/
		if(global.enable_controller_settings = true)
		{
			if (global.settings_sidebar_menu = "controller_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "keyboard_and_mouse_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "touch_settings";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Controller Settings END*/
	
		#region /*Touch Settings*/
		if(global.enable_touch_settings = true)
		{
			if (global.settings_sidebar_menu = "touch_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "controller_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "profile_settings";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Touch Settings END*/
	
		#endregion /*Controls Settings END*/
		
		#region /*General Settings*/
	
		#region /*Profile Settings*/
		if(global.enable_profile_settings = true)
		{
			if (global.settings_sidebar_menu = "profile_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "touch_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "video_settings";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Profile Settings END*/
	
		#region /*Video Settings*/
		if (global.settings_sidebar_menu = "video_settings")
		{
			if (key_up)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if (global.enable_profile_settings = true)
				{
					global.settings_sidebar_menu = "profile_settings";
				}
				else
				if (global.enable_touch_settings = true)
				{
					global.settings_sidebar_menu = "touch_settings";
				}
				else
				if (global.enable_controller_settings = true)
				{
					global.settings_sidebar_menu = "controller_settings";
				}
				else
				{
					global.settings_sidebar_menu = "keyboard_and_mouse_settings";
				}
				menu_delay = 3;
			}
			else
			if (key_down)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				global.settings_sidebar_menu = "audio_settings";
				menu_delay = 3;
			}
		}
		#endregion /*Video Settings END*/
	
		#region /*Audio Settings*/
		if (global.settings_sidebar_menu = "audio_settings")
		{
			if (key_up)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				global.settings_sidebar_menu = "video_settings";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if (global.enable_global_resources_settings = true)
				{
					global.settings_sidebar_menu = "global_resources_settings";
				}
				else
				if (global.enable_storage_settings = true)
				{
					global.settings_sidebar_menu = "storage_settings";
				}
				else
				if (global.enable_language_settings = true)
				{
					global.settings_sidebar_menu = "language_settings";
				}
				else
				if (global.enable_broadcast_settings = true)
				{
					global.settings_sidebar_menu = "broadcast_settings";
				}
				else
				if (global.enable_how_to_play_settings = true)
				{
					global.settings_sidebar_menu = "how_to_play_settings";
				}
				else
				if (global.enable_add_ons_settings = true)
				{
					global.settings_sidebar_menu = "resource_pack_settings";
				}
				else
				{
					global.settings_sidebar_menu = "settings_back";
				}
				menu_delay = 3;
			}
		}
		#endregion /*Audio Settings END*/
	
		#region /*Global Resources Settings*/
		if(global.enable_global_resources_settings = true)
		{
			if (global.settings_sidebar_menu = "global_resources_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "audio_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					if (global.enable_storage_settings = true)
					{
						global.settings_sidebar_menu = "storage_settings";
					}
					else
					if (global.enable_language_settings = true)
					{
						global.settings_sidebar_menu = "language_settings";
					}
					else
					if (global.enable_broadcast_settings = true)
					{
						global.settings_sidebar_menu = "broadcast_settings";
					}
					else
					if (global.enable_how_to_play_settings = true)
					{
						global.settings_sidebar_menu = "how_to_play_settings";
					}
					else
					if (global.enable_add_ons_settings = true)
					{
						global.settings_sidebar_menu = "resource_pack_settings";
					}
					else
					{
						global.settings_sidebar_menu = "settings_back";
					}
					menu_delay = 3;
				}
			}
		}
		#endregion /*Global Resources Settings END*/
	
		#region /*Storage Settings*/
		if(global.enable_storage_settings = true)
		{
			if (global.settings_sidebar_menu = "storage_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					if (global.enable_global_resources_settings = true)
					{
						global.settings_sidebar_menu = "global_resources_settings";
					}
					else
					{
						global.settings_sidebar_menu = "audio_settings";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					if (global.enable_language_settings = true)
					{
						global.settings_sidebar_menu = "language_settings";
					}
					else
					if (global.enable_broadcast_settings = true)
					{
						global.settings_sidebar_menu = "broadcast_settings";
					}
					else
					if (global.enable_how_to_play_settings = true)
					{
						global.settings_sidebar_menu = "how_to_play_settings";
					}
					else
					if (global.enable_add_ons_settings = true)
					{
						global.settings_sidebar_menu = "resource_pack_settings";
					}
					else
					{
						global.settings_sidebar_menu = "settings_back";
					}
					menu_delay = 3;
				}
			}
		}
		#endregion /*Storage Settings END*/
	
		#region /*Language Settings*/
		if(global.enable_language_settings = true)
		{
			if (global.settings_sidebar_menu = "language_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "storage_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					if (global.enable_broadcast_settings = true)
					{
						global.settings_sidebar_menu = "broadcast_settings";
					}
					else
					if (global.enable_add_ons_settings = true)
					{
						global.settings_sidebar_menu = "resource_pack_settings";
					}
					else
					{
						global.settings_sidebar_menu = "settings_back";
					}
					menu_delay = 3;
				}
			}
		}
		#endregion /*Language Settings END*/
	
		#region /*Broadcast Settings*/
		if(global.enable_broadcast_settings = true)
		{
			if (global.settings_sidebar_menu = "broadcast_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "language_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "how_to_play";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Broadcast Settings END*/
		
		#region /*Add-Ons Settings*/
		if (global.enable_add_ons_settings = true)
		{
			if (global.settings_sidebar_menu = "resource_pack_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "how_to_play";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "behavior_packs_settings";
					menu_delay = 3;
				}
			}
		
			if (global.settings_sidebar_menu = "behavior_packs_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "resource_pack_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "settings_back";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Add-Ons Settings END*/

		#region /*The "Back" button should always appear at the top of the screen*/
		if (global.settings_sidebar_menu = "settings_back")
		{
			if (key_up)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				if (global.enable_add_ons_settings = true)
				{
					global.settings_sidebar_menu = "behavior_packs_settings";
				}
				else
				if (global.enable_how_to_play_settings = true)
				{
					global.settings_sidebar_menu = "how_to_play";
				}
				else
				if (global.enable_broadcast_settings = true)
				{
					global.settings_sidebar_menu = "broadcast_settings";
				}
				else
				if (global.enable_language_settings = true)
				{
					global.settings_sidebar_menu = "language_settings";
				}
				else
				if (global.enable_storage_settings = true)
				{
					global.settings_sidebar_menu = "storage_settings";
				}
				else
				if (global.enable_global_resources_settings = true)
				{
					global.settings_sidebar_menu = "global_resources_settings";
				}
				else
				{
					global.settings_sidebar_menu = "audio_settings";
				}
				menu_delay = 3;
			}
			else
			if (key_down)
			and (can_navigate_settings_sidebar = true)
			and (menu_delay = 0)
			{
				global.settings_sidebar_menu = "accessibility_settings";
				menu_delay = 3;
			}
		}
		#endregion /*The "Back" button should always appear at the top of the screen END*/
	
		#endregion /*General Settings END*/
		
	}
	
	#endregion /*Settings Sidebar Navigation END*/
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);

	#region /*Assist Settings*/
	if (global.settings_sidebar_menu = "accessibility_settings")
	{
		draw_menu_checkmark(450, 50, Text("Enable Assist Mode"), "assist_enable", global.assist_enable);
		draw_text_outlined(450, 100, Text("The game is meant to be played without Assist Mode."), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(450, 132, Text("Only if you are unable to enjoy the game without extra help should you enable this."), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		
		draw_menu_checkmark(450, 332, Text("Invincible"), "assist_invincible", global.assist_invincible);
		draw_menu_checkmark(450, 382, Text("Breathe Underwater"), "assist_breathe_underwater", global.assist_breathe_underwater);
		draw_menu_checkmark(450, 432, Text("Show Assist Arrows"), "assist_guiding_arrows", global.assist_guiding_arrows);
		draw_menu_checkmark(450, 482, Text("Show Normal Arrows"), "assist_normal_arrows", global.assist_normal_arrows);
		draw_menu_checkmark(450, 532, Text("Enable Enemies"), "assist_enable_enemies", global.assist_enable_enemies);
		draw_menu_checkmark(450, 582, Text("Enable Spikes"), "assist_enable_spikes", global.assist_enable_spikes);
		draw_menu_checkmark(450, 632, Text("Show Assist Mode Text"), "assist_show_assist_mode_text", global.assist_show_assist_mode_text);
		
		#region /*Assist Extra HP*/
		draw_menu_dropdown(450, 262 + menu_y_offset, Text("Extra Health Points"), "assist_extra_hp", global.assist_extra_hp,
		Text("None"),
		" +1",
		" +2",
		" +3",
		" +4",
		" +5",
		" +6",
		" +7",
		" +8",
		" +9",
		"");
		#endregion /*Assist Extra HP END*/
		
		#region /*Assist item appear*/
		draw_menu_dropdown(450, 182 + menu_y_offset, Text("Assist Item"), "assist_item_appear", global.assist_item_appear,
		Text("Always Appear"),
		Text("Appear after 1 death on a level"),
		Text("Appear after 2 deaths on a level"),
		Text("Appear after 3 deaths on a level"),
		Text("Appear after 4 deaths on a level"),
		Text("Appear after 5 deaths on a level"),
		Text("Appear after 6 deaths on a level"),
		Text("Appear after 7 deaths on a level"),
		Text("Appear after 8 deaths on a level"),
		Text("Appear after 9 deaths on a level"),
		Text("Never Appear"));
		#endregion /*Assist item appear END*/
		
		if (global.assist_enable = false)
		{
			if (menu = "assist_invincible")
			if (menu = "assist_breathe_underwater")
			or(menu = "assist_guiding_arrows")
			or(menu = "assist_normal_arrows")
			or(menu = "assist_extra_hp")
			or(menu = "assist_item_appear")
			or(menu = "assist_show_assist_mode_text")
			{
				menu = "assist_enable";
			}
			open_dropdown = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(left_sidebar_x + 370, 157, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		}
	}
	#endregion /*Assist Settings END*/
	
	#region /*My Game Settings*/
	
	#region /*Game Settings*/
	if (global.settings_sidebar_menu = "game_settings")
	{
		difficulty_settings_y = 98;
		automatically_pause_when_window_is_unfocused_settings_y = 164;
		show_timer_settings_y = 164 + (48);
		show_deaths_counter_settings_y = 164 + (48 * 2);
		show_tutorial_signs_y = 164 + (48 * 3);
		hud_hide_time_y = 164 + (48 * 5) - 16;
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		draw_menu_checkmark(380, automatically_pause_when_window_is_unfocused_settings_y, Text("Automatically pause when the game is unfocused"), "automatically_pause_when_window_is_unfocused_settings", global.automatically_pause_when_window_is_unfocused); /*Automatically Pause When Window Is Unfocused*/
		draw_menu_checkmark(380, show_timer_settings_y, Text("Show Timer"), "show_timer_settings", global.show_timer); /*Show Timer*/
		draw_menu_checkmark(380, show_deaths_counter_settings_y, Text("Show Deaths Counter"), "show_deaths_counter_settings", global.show_deaths_counter); /*Show Deaths Counter*/
		draw_menu_checkmark(380, show_tutorial_signs_y, Text("Show Tutorial Signs"), "show_tutorial_signs", global.show_tutorial_signs); /*Show Tutorial Signs*/
		
		if (global.hud_hide_time > 10)
		{
			global.hud_hide_time = 3;
		}
		
		draw_menu_dropdown(380, hud_hide_time_y, Text("HUD hide timer"), "hud_hide_time", global.hud_hide_time, Text("Never Show"), Text("After 1 Second"), Text("After 2 Seconds"), Text("After 3 Seconds"), Text("After 4 Seconds"), Text("After 5 Seconds"), Text("After 6 Seconds"), Text("After 7 Seconds"), Text("After 8 Seconds"), Text("After 9 Seconds"), Text("Always Show"));
		draw_menu_dropdown(380, difficulty_settings_y, Text("Level Layout Difficulty"), "difficulty_settings", global.difficulty, Text("Easy"), Text("Normal"), Text("Hard")); /*Difficulty Settings*/
		
	}
	#endregion /*Game Settings END*/
	
	#region /*Multiplayer Settings*/
	if (global.settings_sidebar_menu = "multiplayer_settings")
	{
		draw_set_halign(fa_left);draw_set_valign(fa_center);
		draw_text_outlined(410, 20 + (40 * 3), "Change how multiplayer works here", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /*Multiplayer Settings END*/
	
	#endregion /*My Game Settings*/
	
	#region /*Controls Settings*/
	if (global.settings_sidebar_menu = "keyboard_and_mouse_settings")
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		#region /*Remap Keyboard and Mouse*/
		
		menu_y_remap_key_dive = 64 * 2;
		menu_y_remap_key_jump = 64 * 3;
		menu_y_remap_key_crouch = 64 * 4;
		menu_y_remap_key_crouch_toggle = 64 * 5;
		menu_y_remap_key_sprint = 64 * 6;
		menu_y_remap_key_sprint_toggle = 64 * 7;
		menu_y_remap_key_left = 64 * 8;
		menu_y_remap_key_right = 64 * 9;
		menu_y_remap_key_down = 64 * 10;
		menu_y_remap_key_up = 64 * 11;
		menu_y_remap_key_tongue = 64 * 12;
		
		menu_y_remap_reset = 64 * 13 - 16;
		menu_y_up_key_is_jump_key = 64 * 14;
		menu_y_double_tap_direction_to_run = 64 * 15;
		menu_y_always_run = 64 * 16;
		menu_y_cancel_dive_by_pressing_jump_or_dive_button = 64 * 17;
		menu_y_cancel_dive_by_pressing_opposite_direction = 64 * 18;
		menu_y_down_and_jump_to_groundpound = 64 * 19;
		menu_y_wall_jump_setting = 64 * 20;
		menu_y_drop_down_from_rope = 64 * 21 + 16;
		menu_y_show_controls = 64 * 22 + 32;
		
		#region /*Show what key is used*/
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			image_speed = 0;
			key1_x = 800;
			or_text_x = 900;
			key2_x = 1000;
		
			#region /*Show the keys for every player*/
		
			#region /*Remapping Player 1 Key Variables*/
			if (remapping_player = 0)
			{
				var remapping_player_key_dive = global.player1_key_dive;
				var remapping_player_key_jump = global.player1_key_jump;
				var remapping_player_key_crouch = global.player1_key_crouch;
				var remapping_player_key_crouch_toggle = global.player1_key_crouch_toggle;
				var remapping_player_key_sprint = global.player1_key_sprint;
				var remapping_player_key_sprint_toggle = global.player1_key_sprint_toggle;
				var remapping_player_key_left = global.player1_key_left;
				var remapping_player_key_right = global.player1_key_right;
				var remapping_player_key_down = global.player1_key_down;
				var remapping_player_key_up = global.player1_key_up;
				var remapping_player_key_tongue = global.player1_key_tongue;
			
				var remapping_player_key2_dive = global.player1_key2_dive;
				var remapping_player_key2_jump = global.player1_key2_jump;
				var remapping_player_key2_crouch = global.player1_key2_crouch;
				var remapping_player_key2_crouch_toggle = global.player1_key2_crouch_toggle;
				var remapping_player_key2_sprint = global.player1_key2_sprint;
				var remapping_player_key2_sprint_toggle = global.player1_key2_sprint_toggle;
				var remapping_player_key2_left = global.player1_key2_left;
				var remapping_player_key2_right = global.player1_key2_right;
				var remapping_player_key2_down = global.player1_key2_down;
				var remapping_player_key2_up = global.player1_key2_up;
				var remapping_player_key2_tongue = global.player1_key2_tongue;
			
				#region /*Other player's keys*/
				var remapping_other1_player_key_dive = global.player2_key_dive;
				var remapping_other1_player_key_jump = global.player2_key_jump;
				var remapping_other1_player_key_crouch = global.player2_key_crouch;
				var remapping_other1_player_key_crouch_toggle = global.player2_key_crouch_toggle;
				var remapping_other1_player_key_sprint = global.player2_key_sprint;
				var remapping_other1_player_key_sprint_toggle = global.player2_key_sprint_toggle;
				var remapping_other1_player_key_left = global.player2_key_left;
				var remapping_other1_player_key_right = global.player2_key_right;
				var remapping_other1_player_key_down = global.player2_key_down;
				var remapping_other1_player_key_up = global.player2_key_up;
				var remapping_other1_player_key_tongue = global.player2_key_tongue;
			
				var remapping_other1_player_key2_dive = global.player2_key2_dive;
				var remapping_other1_player_key2_jump = global.player2_key2_jump;
				var remapping_other1_player_key2_crouch = global.player2_key2_crouch;
				var remapping_other1_player_key2_crouch_toggle = global.player2_key2_crouch_toggle;
				var remapping_other1_player_key2_sprint = global.player2_key2_sprint;
				var remapping_other1_player_key2_sprint_toggle = global.player2_key2_sprint_toggle;
				var remapping_other1_player_key2_left = global.player2_key2_left;
				var remapping_other1_player_key2_right = global.player2_key2_right;
				var remapping_other1_player_key2_down = global.player2_key2_down;
				var remapping_other1_player_key2_up = global.player2_key2_up;
				var remapping_other1_player_key2_tongue = global.player2_key2_tongue;
			
				var remapping_other2_player_key_dive = global.player3_key_dive;
				var remapping_other2_player_key_jump = global.player3_key_jump;
				var remapping_other2_player_key_crouch = global.player3_key_crouch;
				var remapping_other2_player_key_crouch_toggle = global.player3_key_crouch_toggle;
				var remapping_other2_player_key_sprint = global.player3_key_sprint;
				var remapping_other2_player_key_sprint_toggle = global.player3_key_sprint_toggle;
				var remapping_other2_player_key_left = global.player3_key_left;
				var remapping_other2_player_key_right = global.player3_key_right;
				var remapping_other2_player_key_down = global.player3_key_down;
				var remapping_other2_player_key_up = global.player3_key_up;
				var remapping_other2_player_key_tongue = global.player3_key_tongue;
			
				var remapping_other2_player_key2_dive = global.player3_key2_dive;
				var remapping_other2_player_key2_jump = global.player3_key2_jump;
				var remapping_other2_player_key2_crouch = global.player3_key2_crouch;
				var remapping_other2_player_key2_crouch_toggle = global.player3_key2_crouch_toggle;
				var remapping_other2_player_key2_sprint = global.player3_key2_sprint;
				var remapping_other2_player_key2_sprint_toggle = global.player3_key2_sprint_toggle;
				var remapping_other2_player_key2_left = global.player3_key2_left;
				var remapping_other2_player_key2_right = global.player3_key2_right;
				var remapping_other2_player_key2_down = global.player3_key2_down;
				var remapping_other2_player_key2_up = global.player3_key2_up;
				var remapping_other2_player_key2_tongue = global.player3_key2_tongue;
			
				var remapping_other3_player_key_dive = global.player4_key_dive;
				var remapping_other3_player_key_jump = global.player4_key_jump;
				var remapping_other3_player_key_crouch = global.player4_key_crouch;
				var remapping_other3_player_key_crouch_toggle = global.player4_key_crouch_toggle;
				var remapping_other3_player_key_sprint = global.player4_key_sprint;
				var remapping_other3_player_key_sprint_toggle = global.player4_key_sprint_toggle;
				var remapping_other3_player_key_left = global.player4_key_left;
				var remapping_other3_player_key_right = global.player4_key_right;
				var remapping_other3_player_key_down = global.player4_key_down;
				var remapping_other3_player_key_up = global.player4_key_up;
				var remapping_other3_player_key_tongue = global.player4_key_tongue;
			
				var remapping_other3_player_key2_dive = global.player4_key2_dive;
				var remapping_other3_player_key2_jump = global.player4_key2_jump;
				var remapping_other3_player_key2_crouch = global.player4_key2_crouch;
				var remapping_other3_player_key2_crouch_toggle = global.player4_key2_crouch_toggle;
				var remapping_other3_player_key2_sprint = global.player4_key2_sprint;
				var remapping_other3_player_key2_sprint_toggle = global.player4_key2_sprint_toggle;
				var remapping_other3_player_key2_left = global.player4_key2_left;
				var remapping_other3_player_key2_right = global.player4_key2_right;
				var remapping_other3_player_key2_down = global.player4_key2_down;
				var remapping_other3_player_key2_up = global.player4_key2_up;
				var remapping_other3_player_key2_tongue = global.player4_key2_tongue;
				#endregion /*Other player's keys END*/
			
			}
			#endregion /*Remapping Player 1 Key Variables END*/
		
			#region /*Remapping Player 2 Key Variables*/
			if (remapping_player = 1)
			{
				var remapping_player_key_dive = global.player2_key_dive;
				var remapping_player_key_jump = global.player2_key_jump;
				var remapping_player_key_crouch = global.player2_key_crouch;
				var remapping_player_key_crouch_toggle = global.player2_key_crouch_toggle;
				var remapping_player_key_sprint = global.player2_key_sprint;
				var remapping_player_key_sprint_toggle = global.player2_key_sprint_toggle;
				var remapping_player_key_left = global.player2_key_left;
				var remapping_player_key_right = global.player2_key_right;
				var remapping_player_key_down = global.player2_key_down;
				var remapping_player_key_up = global.player2_key_up;
				var remapping_player_key_tongue = global.player2_key_tongue;
		
				var remapping_player_key2_dive = global.player2_key2_dive;
				var remapping_player_key2_jump = global.player2_key2_jump;
				var remapping_player_key2_crouch = global.player2_key2_crouch;
				var remapping_player_key2_crouch_toggle = global.player2_key2_crouch_toggle;
				var remapping_player_key2_sprint = global.player2_key2_sprint;
				var remapping_player_key2_sprint_toggle = global.player2_key2_sprint_toggle;
				var remapping_player_key2_left = global.player2_key2_left;
				var remapping_player_key2_right = global.player2_key2_right;
				var remapping_player_key2_down = global.player2_key2_down;
				var remapping_player_key2_up = global.player2_key2_up;
				var remapping_player_key2_tongue = global.player2_key2_tongue;
			
				#region /*Other player's keys*/
				var remapping_other1_player_key_dive = global.player1_key_dive;
				var remapping_other1_player_key_jump = global.player1_key_jump;
				var remapping_other1_player_key_crouch = global.player1_key_crouch;
				var remapping_other1_player_key_crouch_toggle = global.player1_key_crouch_toggle;
				var remapping_other1_player_key_sprint = global.player1_key_sprint;
				var remapping_other1_player_key_sprint_toggle = global.player1_key_sprint_toggle;
				var remapping_other1_player_key_left = global.player1_key_left;
				var remapping_other1_player_key_right = global.player1_key_right;
				var remapping_other1_player_key_down = global.player1_key_down;
				var remapping_other1_player_key_up = global.player1_key_up;
				var remapping_other1_player_key_tongue = global.player1_key_tongue;
			
				var remapping_other1_player_key2_dive = global.player1_key2_dive;
				var remapping_other1_player_key2_jump = global.player1_key2_jump;
				var remapping_other1_player_key2_crouch = global.player1_key2_crouch;
				var remapping_other1_player_key2_crouch_toggle = global.player1_key2_crouch_toggle;
				var remapping_other1_player_key2_sprint = global.player1_key2_sprint;
				var remapping_other1_player_key2_sprint_toggle = global.player1_key2_sprint_toggle;
				var remapping_other1_player_key2_left = global.player1_key2_left;
				var remapping_other1_player_key2_right = global.player1_key2_right;
				var remapping_other1_player_key2_down = global.player1_key2_down;
				var remapping_other1_player_key2_up = global.player1_key2_up;
				var remapping_other1_player_key2_tongue = global.player1_key2_tongue;
			
				var remapping_other2_player_key_dive = global.player3_key_dive;
				var remapping_other2_player_key_jump = global.player3_key_jump;
				var remapping_other2_player_key_crouch = global.player3_key_crouch;
				var remapping_other2_player_key_crouch_toggle = global.player3_key_crouch_toggle;
				var remapping_other2_player_key_sprint = global.player3_key_sprint;
				var remapping_other2_player_key_sprint_toggle = global.player3_key_sprint_toggle;
				var remapping_other2_player_key_left = global.player3_key_left;
				var remapping_other2_player_key_right = global.player3_key_right;
				var remapping_other2_player_key_down = global.player3_key_down;
				var remapping_other2_player_key_up = global.player3_key_up;
				var remapping_other2_player_key_tongue = global.player3_key_tongue;
			
				var remapping_other2_player_key2_dive = global.player3_key2_dive;
				var remapping_other2_player_key2_jump = global.player3_key2_jump;
				var remapping_other2_player_key2_crouch = global.player3_key2_crouch;
				var remapping_other2_player_key2_crouch_toggle = global.player3_key2_crouch_toggle;
				var remapping_other2_player_key2_sprint = global.player3_key2_sprint;
				var remapping_other2_player_key2_sprint_toggle = global.player3_key2_sprint_toggle;
				var remapping_other2_player_key2_left = global.player3_key2_left;
				var remapping_other2_player_key2_right = global.player3_key2_right;
				var remapping_other2_player_key2_down = global.player3_key2_down;
				var remapping_other2_player_key2_up = global.player3_key2_up;
				var remapping_other2_player_key2_tongue = global.player3_key2_tongue;
			
				var remapping_other3_player_key_dive = global.player4_key_dive;
				var remapping_other3_player_key_jump = global.player4_key_jump;
				var remapping_other3_player_key_crouch = global.player4_key_crouch;
				var remapping_other3_player_key_crouch_toggle = global.player4_key_crouch_toggle;
				var remapping_other3_player_key_sprint = global.player4_key_sprint;
				var remapping_other3_player_key_sprint_toggle = global.player4_key_sprint_toggle;
				var remapping_other3_player_key_left = global.player4_key_left;
				var remapping_other3_player_key_right = global.player4_key_right;
				var remapping_other3_player_key_down = global.player4_key_down;
				var remapping_other3_player_key_up = global.player4_key_up;
				var remapping_other3_player_key_tongue = global.player4_key_tongue;
			
				var remapping_other3_player_key2_dive = global.player4_key2_dive;
				var remapping_other3_player_key2_jump = global.player4_key2_jump;
				var remapping_other3_player_key2_crouch = global.player4_key2_crouch;
				var remapping_other3_player_key2_crouch_toggle = global.player4_key2_crouch_toggle;
				var remapping_other3_player_key2_sprint = global.player4_key2_sprint;
				var remapping_other3_player_key2_sprint_toggle = global.player4_key2_sprint_toggle;
				var remapping_other3_player_key2_left = global.player4_key2_left;
				var remapping_other3_player_key2_right = global.player4_key2_right;
				var remapping_other3_player_key2_down = global.player4_key2_down;
				var remapping_other3_player_key2_up = global.player4_key2_up;
				var remapping_other3_player_key2_tongue = global.player4_key2_tongue;
				#endregion /*Other player's keys END*/
			}
			#endregion /*Remapping Player 2 Key Variables END*/
		
			#region /*Remapping Player 3 Key Variables*/
			if (remapping_player = 2)
			{
				var remapping_player_key_dive = global.player3_key_dive;
				var remapping_player_key_jump = global.player3_key_jump;
				var remapping_player_key_crouch = global.player3_key_crouch;
				var remapping_player_key_crouch_toggle = global.player3_key_crouch_toggle;
				var remapping_player_key_sprint = global.player3_key_sprint;
				var remapping_player_key_sprint_toggle = global.player3_key_sprint_toggle;
				var remapping_player_key_left = global.player3_key_left;
				var remapping_player_key_right = global.player3_key_right;
				var remapping_player_key_down = global.player3_key_down;
				var remapping_player_key_up = global.player3_key_up;
				var remapping_player_key_tongue = global.player3_key_tongue;
		
				var remapping_player_key2_dive = global.player3_key2_dive;
				var remapping_player_key2_jump = global.player3_key2_jump;
				var remapping_player_key2_crouch = global.player3_key2_crouch;
				var remapping_player_key2_crouch_toggle = global.player3_key2_crouch_toggle;
				var remapping_player_key2_sprint = global.player3_key2_sprint;
				var remapping_player_key2_sprint_toggle = global.player3_key2_sprint_toggle;
				var remapping_player_key2_left = global.player3_key2_left;
				var remapping_player_key2_right = global.player3_key2_right;
				var remapping_player_key2_down = global.player3_key2_down;
				var remapping_player_key2_up = global.player3_key2_up;
				var remapping_player_key2_tongue = global.player3_key2_tongue;
			
				#region /*Other player's keys*/
				var remapping_other1_player_key_dive = global.player2_key_dive;
				var remapping_other1_player_key_jump = global.player2_key_jump;
				var remapping_other1_player_key_crouch = global.player2_key_crouch;
				var remapping_other1_player_key_crouch_toggle = global.player2_key_crouch_toggle;
				var remapping_other1_player_key_sprint = global.player2_key_sprint;
				var remapping_other1_player_key_sprint_toggle = global.player2_key_sprint_toggle;
				var remapping_other1_player_key_left = global.player2_key_left;
				var remapping_other1_player_key_right = global.player2_key_right;
				var remapping_other1_player_key_down = global.player2_key_down;
				var remapping_other1_player_key_up = global.player2_key_up;
				var remapping_other1_player_key_tongue = global.player2_key_tongue;
			
				var remapping_other1_player_key2_dive = global.player2_key2_dive;
				var remapping_other1_player_key2_jump = global.player2_key2_jump;
				var remapping_other1_player_key2_crouch = global.player2_key2_crouch;
				var remapping_other1_player_key2_crouch_toggle = global.player2_key2_crouch_toggle;
				var remapping_other1_player_key2_sprint = global.player2_key2_sprint;
				var remapping_other1_player_key2_sprint_toggle = global.player2_key2_sprint_toggle;
				var remapping_other1_player_key2_left = global.player2_key2_left;
				var remapping_other1_player_key2_right = global.player2_key2_right;
				var remapping_other1_player_key2_down = global.player2_key2_down;
				var remapping_other1_player_key2_up = global.player2_key2_up;
				var remapping_other1_player_key2_tongue = global.player2_key2_tongue;
			
				var remapping_other2_player_key_dive = global.player1_key_dive;
				var remapping_other2_player_key_jump = global.player1_key_jump;
				var remapping_other2_player_key_crouch = global.player1_key_crouch;
				var remapping_other2_player_key_crouch_toggle = global.player1_key_crouch_toggle;
				var remapping_other2_player_key_sprint = global.player1_key_sprint;
				var remapping_other2_player_key_sprint_toggle = global.player1_key_sprint_toggle;
				var remapping_other2_player_key_left = global.player1_key_left;
				var remapping_other2_player_key_right = global.player1_key_right;
				var remapping_other2_player_key_down = global.player1_key_down;
				var remapping_other2_player_key_up = global.player1_key_up;
				var remapping_other2_player_key_tongue = global.player1_key_tongue;
			
				var remapping_other2_player_key2_dive = global.player1_key2_dive;
				var remapping_other2_player_key2_jump = global.player1_key2_jump;
				var remapping_other2_player_key2_crouch = global.player1_key2_crouch;
				var remapping_other2_player_key2_crouch_toggle = global.player1_key2_crouch_toggle;
				var remapping_other2_player_key2_sprint = global.player1_key2_sprint;
				var remapping_other2_player_key2_sprint_toggle = global.player1_key2_sprint_toggle;
				var remapping_other2_player_key2_left = global.player1_key2_left;
				var remapping_other2_player_key2_right = global.player1_key2_right;
				var remapping_other2_player_key2_down = global.player1_key2_down;
				var remapping_other2_player_key2_up = global.player1_key2_up;
				var remapping_other2_player_key2_tongue = global.player1_key2_tongue;
			
				var remapping_other3_player_key_dive = global.player4_key_dive;
				var remapping_other3_player_key_jump = global.player4_key_jump;
				var remapping_other3_player_key_crouch = global.player4_key_crouch;
				var remapping_other3_player_key_crouch_toggle = global.player4_key_crouch_toggle;
				var remapping_other3_player_key_sprint = global.player4_key_sprint;
				var remapping_other3_player_key_sprint_toggle = global.player4_key_sprint_toggle;
				var remapping_other3_player_key_left = global.player4_key_left;
				var remapping_other3_player_key_right = global.player4_key_right;
				var remapping_other3_player_key_down = global.player4_key_down;
				var remapping_other3_player_key_up = global.player4_key_up;
				var remapping_other3_player_key_tongue = global.player4_key_tongue;
			
				var remapping_other3_player_key2_dive = global.player4_key2_dive;
				var remapping_other3_player_key2_jump = global.player4_key2_jump;
				var remapping_other3_player_key2_crouch = global.player4_key2_crouch;
				var remapping_other3_player_key2_crouch_toggle = global.player4_key2_crouch_toggle;
				var remapping_other3_player_key2_sprint = global.player4_key2_sprint;
				var remapping_other3_player_key2_sprint_toggle = global.player4_key2_sprint_toggle;
				var remapping_other3_player_key2_left = global.player4_key2_left;
				var remapping_other3_player_key2_right = global.player4_key2_right;
				var remapping_other3_player_key2_down = global.player4_key2_down;
				var remapping_other3_player_key2_up = global.player4_key2_up;
				var remapping_other3_player_key2_tongue = global.player4_key2_tongue;
				#endregion /*Other player's keys END*/
			
			}
			#endregion /*Remapping Player 3 Key Variables*/
		
			#region /*Remapping Player 4 Key Variables*/
			if (remapping_player = 3)
			{
				var remapping_player_key_dive = global.player4_key_dive;
				var remapping_player_key_jump = global.player4_key_jump;
				var remapping_player_key_crouch = global.player4_key_crouch;
				var remapping_player_key_crouch_toggle = global.player4_key_crouch_toggle;
				var remapping_player_key_sprint = global.player4_key_sprint;
				var remapping_player_key_sprint_toggle = global.player4_key_sprint_toggle;
				var remapping_player_key_left = global.player4_key_left;
				var remapping_player_key_right = global.player4_key_right;
				var remapping_player_key_down = global.player4_key_down;
				var remapping_player_key_up = global.player4_key_up;
				var remapping_player_key_tongue = global.player4_key_tongue;
		
				var remapping_player_key2_dive = global.player4_key2_dive;
				var remapping_player_key2_jump = global.player4_key2_jump;
				var remapping_player_key2_crouch = global.player4_key2_crouch;
				var remapping_player_key2_crouch_toggle = global.player4_key2_crouch_toggle;
				var remapping_player_key2_sprint = global.player4_key2_sprint;
				var remapping_player_key2_sprint_toggle = global.player4_key2_sprint_toggle;
				var remapping_player_key2_left = global.player4_key2_left;
				var remapping_player_key2_right = global.player4_key2_right;
				var remapping_player_key2_down = global.player4_key2_down;
				var remapping_player_key2_up = global.player4_key2_up;
				var remapping_player_key2_tongue = global.player4_key2_tongue;
			
				#region /*Other player's keys*/
				var remapping_other1_player_key_dive = global.player2_key_dive;
				var remapping_other1_player_key_jump = global.player2_key_jump;
				var remapping_other1_player_key_crouch = global.player2_key_crouch;
				var remapping_other1_player_key_crouch_toggle = global.player2_key_crouch_toggle;
				var remapping_other1_player_key_sprint = global.player2_key_sprint;
				var remapping_other1_player_key_sprint_toggle = global.player2_key_sprint_toggle;
				var remapping_other1_player_key_left = global.player2_key_left;
				var remapping_other1_player_key_right = global.player2_key_right;
				var remapping_other1_player_key_down = global.player2_key_down;
				var remapping_other1_player_key_up = global.player2_key_up;
				var remapping_other1_player_key_tongue = global.player2_key_tongue;
			
				var remapping_other1_player_key2_dive = global.player2_key2_dive;
				var remapping_other1_player_key2_jump = global.player2_key2_jump;
				var remapping_other1_player_key2_crouch = global.player2_key2_crouch;
				var remapping_other1_player_key2_crouch_toggle = global.player2_key2_crouch_toggle;
				var remapping_other1_player_key2_sprint = global.player2_key2_sprint;
				var remapping_other1_player_key2_sprint_toggle = global.player2_key2_sprint_toggle;
				var remapping_other1_player_key2_left = global.player2_key2_left;
				var remapping_other1_player_key2_right = global.player2_key2_right;
				var remapping_other1_player_key2_down = global.player2_key2_down;
				var remapping_other1_player_key2_up = global.player2_key2_up;
				var remapping_other1_player_key2_tongue = global.player2_key2_tongue;
			
				var remapping_other2_player_key_dive = global.player3_key_dive;
				var remapping_other2_player_key_jump = global.player3_key_jump;
				var remapping_other2_player_key_crouch = global.player3_key_crouch;
				var remapping_other2_player_key_crouch_toggle = global.player3_key_crouch_toggle;
				var remapping_other2_player_key_sprint = global.player3_key_sprint;
				var remapping_other2_player_key_sprint_toggle = global.player3_key_sprint_toggle;
				var remapping_other2_player_key_left = global.player3_key_left;
				var remapping_other2_player_key_right = global.player3_key_right;
				var remapping_other2_player_key_down = global.player3_key_down;
				var remapping_other2_player_key_up = global.player3_key_up;
				var remapping_other2_player_key_tongue = global.player3_key_tongue;
			
				var remapping_other2_player_key2_dive = global.player3_key2_dive;
				var remapping_other2_player_key2_jump = global.player3_key2_jump;
				var remapping_other2_player_key2_crouch = global.player3_key2_crouch;
				var remapping_other2_player_key2_crouch_toggle = global.player3_key2_crouch_toggle;
				var remapping_other2_player_key2_sprint = global.player3_key2_sprint;
				var remapping_other2_player_key2_sprint_toggle = global.player3_key2_sprint_toggle;
				var remapping_other2_player_key2_left = global.player3_key2_left;
				var remapping_other2_player_key2_right = global.player3_key2_right;
				var remapping_other2_player_key2_down = global.player3_key2_down;
				var remapping_other2_player_key2_up = global.player3_key2_up;
				var remapping_other2_player_key2_tongue = global.player3_key2_tongue;
			
				var remapping_other3_player_key_dive = global.player1_key_dive;
				var remapping_other3_player_key_jump = global.player1_key_jump;
				var remapping_other3_player_key_crouch = global.player1_key_crouch;
				var remapping_other3_player_key_crouch_toggle = global.player1_key_crouch_toggle;
				var remapping_other3_player_key_sprint = global.player1_key_sprint;
				var remapping_other3_player_key_sprint_toggle = global.player1_key_sprint_toggle;
				var remapping_other3_player_key_left = global.player1_key_left;
				var remapping_other3_player_key_right = global.player1_key_right;
				var remapping_other3_player_key_down = global.player1_key_down;
				var remapping_other3_player_key_up = global.player1_key_up;
				var remapping_other3_player_key_tongue = global.player1_key_tongue;
			
				var remapping_other3_player_key2_dive = global.player1_key2_dive;
				var remapping_other3_player_key2_jump = global.player1_key2_jump;
				var remapping_other3_player_key2_crouch = global.player1_key2_crouch;
				var remapping_other3_player_key2_crouch_toggle = global.player1_key2_crouch_toggle;
				var remapping_other3_player_key2_sprint = global.player1_key2_sprint;
				var remapping_other3_player_key2_sprint_toggle = global.player1_key2_sprint_toggle;
				var remapping_other3_player_key2_left = global.player1_key2_left;
				var remapping_other3_player_key2_right = global.player1_key2_right;
				var remapping_other3_player_key2_down = global.player1_key2_down;
				var remapping_other3_player_key2_up = global.player1_key2_up;
				var remapping_other3_player_key2_tongue = global.player1_key2_tongue;
				#endregion /*Other player's keys END*/
			
			}
			#endregion /*Remapping Player 4 Key Variables END*/
		
			#region /*Remap Key Dive*/
			if (menu = "remap_key_dive")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_dive > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_dive,key1_x, menu_y_remap_key_dive + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_dive + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_dive > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_dive,key1_x, menu_y_remap_key_dive + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_dive + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Dive END*/
			#region /*Remap Key Jump*/
			if (menu = "remap_key_jump")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_jump,key1_x, menu_y_remap_key_jump + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_jump + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_jump,key1_x, menu_y_remap_key_jump + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_jump + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Jump END*/
			#region /*Remap Key Crouch*/
			if (menu = "remap_key_crouch")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch,key1_x, menu_y_remap_key_crouch + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch,key1_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Crouch*/
			#region /*Remap Key Crouch Toggle*/
			if (menu = "remap_key_crouch_toggle")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch_toggle,key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch_toggle,key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Crouch Toggle END*/
			#region /*Remap Key Sprint*/
			if (menu = "remap_key_sprint")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint,key1_x, menu_y_remap_key_sprint + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint,key1_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Sprint END*/
			#region /*Remap Key Sprint Toggle*/
			if (menu = "remap_key_sprint_toggle")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint_toggle,key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint_toggle,key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Sprint Toggle END*/
			#region /*Remap Key Left*/
			if (menu = "remap_key_left")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_left,key1_x, menu_y_remap_key_left + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_left + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_left,key1_x, menu_y_remap_key_left + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_left + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Left END*/
			#region /*Remap Key Right*/
			if (menu = "remap_key_right")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_right,key1_x, menu_y_remap_key_right + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_right + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_right,key1_x, menu_y_remap_key_right + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_right + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Right END*/
			#region /*Remap Key Down*/
			if (menu = "remap_key_down")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_down,key1_x, menu_y_remap_key_down + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_down + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_down,key1_x, menu_y_remap_key_down + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_down + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Down END*/
			#region /*Remap Key Up*/
			if (menu = "remap_key_up")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_up,key1_x, menu_y_remap_key_up + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_up + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_up,key1_x, menu_y_remap_key_up + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_up + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Up END*/
			#region /*Remap Key Tongue*/
			if (menu = "remap_key_tongue")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_tongue,key1_x, menu_y_remap_key_tongue + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_tongue + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_tongue,key1_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Tongue END*/
		
			#region /*"OR" text*/
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text_outlined(or_text_x, menu_y_remap_key_dive + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_jump + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_crouch + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_crouch_toggle + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_sprint + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_sprint_toggle + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_left + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_right + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_down + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_up + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_tongue + menu_y_offset, Text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			#endregion /*"OR" text END*/
		
			#region /*Remap Key 2 Dive*/
			if (menu = "remap_key_dive")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_dive > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_dive,key2_x, menu_y_remap_key_dive + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_dive + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_dive > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_dive,key2_x, menu_y_remap_key_dive + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_dive + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Dive END*/
			#region /*Remap Key 2 Jump*/
			if (menu = "remap_key_jump")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_jump,key2_x, menu_y_remap_key_jump + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_jump + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_jump,key2_x, menu_y_remap_key_jump + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_jump + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Jump END*/
			#region /*Remap Key 2 Crouch*/
			if (menu = "remap_key_crouch")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch,key2_x, menu_y_remap_key_crouch + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch,key2_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Crouch END*/
			#region /*Remap Key 2 Crouch Toggle*/
			if (menu = "remap_key_crouch_toggle")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch_toggle,key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch_toggle,key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Crouch Toggle END*/
			#region /*Remap Key 2 Sprint*/
			if (menu = "remap_key_sprint")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint,key2_x, menu_y_remap_key_sprint + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint,key2_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Sprint END*/
			#region /*Remap Key 2 Sprint Toggle*/
			if (menu = "remap_key_sprint_toggle")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint_toggle,key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint_toggle,key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Sprint Toggle END*/
			#region /*Remap Key 2 Left*/
			if (menu = "remap_key_left")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_left,key2_x, menu_y_remap_key_left + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_left + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_left,key2_x, menu_y_remap_key_left + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_left + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Left END*/
			#region /*Remap Key 2 Right*/
			if (menu = "remap_key_right")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_right,key2_x, menu_y_remap_key_right + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_right + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_right,key2_x, menu_y_remap_key_right + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_right + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Right END*/
			#region /*Remap Key 2 Down*/
			if (menu = "remap_key_down")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_down,key2_x, menu_y_remap_key_down + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_down + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_down,key2_x, menu_y_remap_key_down + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_down + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Down END*/
			#region /*Remap Key 2 Up*/
			if (menu = "remap_key_up")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_up,key2_x, menu_y_remap_key_up + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_up + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_up,key2_x, menu_y_remap_key_up + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_up + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Up END*/
			#region /*Remap Key 2 Tongue*/
			if (menu = "remap_key_tongue")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_tongue,key2_x, menu_y_remap_key_tongue + menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_tongue + menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_tongue,key2_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Tongue END*/
		
			#region /*Make keys red if in conflict with other keys*/
		
			#region /*Key 1 Conflicts*/
		
			#region /*Dive Conflict*/
			if (remapping_player_key_dive = remapping_player_key_jump)
			or(remapping_player_key_dive = remapping_player_key_crouch)
			or(remapping_player_key_dive = remapping_player_key_crouch_toggle)
			or(remapping_player_key_dive = remapping_player_key_sprint)
			or(remapping_player_key_dive = remapping_player_key_sprint_toggle)
			or(remapping_player_key_dive = remapping_player_key_left)
			or(remapping_player_key_dive = remapping_player_key_right)
			or(remapping_player_key_dive = remapping_player_key_down)
			or(remapping_player_key_dive = remapping_player_key_up)
			or(remapping_player_key_dive = remapping_player_key_tongue)
		
			or(remapping_player_key_dive = remapping_player_key2_dive)
			or(remapping_player_key_dive = remapping_player_key2_jump)
			or(remapping_player_key_dive = remapping_player_key2_crouch)
			or(remapping_player_key_dive = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_dive = remapping_player_key2_sprint)
			or(remapping_player_key_dive = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_dive = remapping_player_key2_left)
			or(remapping_player_key_dive = remapping_player_key2_right)
			or(remapping_player_key_dive = remapping_player_key2_down)
			or(remapping_player_key_dive = remapping_player_key2_up)
			or(remapping_player_key_dive = remapping_player_key2_tongue)
			{
				if (remapping_player_key_dive > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_dive + menu_y_offset -32, key1_x + 31, menu_y_remap_key_dive + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_dive = remapping_other1_player_key_dive)
			or(remapping_player_key_dive = remapping_other1_player_key_jump)
			or(remapping_player_key_dive = remapping_other1_player_key_crouch)
			or(remapping_player_key_dive = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_dive = remapping_other1_player_key_sprint)
			or(remapping_player_key_dive = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_dive = remapping_other1_player_key_left)
			or(remapping_player_key_dive = remapping_other1_player_key_right)
			or(remapping_player_key_dive = remapping_other1_player_key_down)
			or(remapping_player_key_dive = remapping_other1_player_key_up)
			or(remapping_player_key_dive = remapping_other1_player_key_tongue)
			or(remapping_player_key_dive = remapping_other1_player_key2_dive)
			or(remapping_player_key_dive = remapping_other1_player_key2_jump)
			or(remapping_player_key_dive = remapping_other1_player_key2_crouch)
			or(remapping_player_key_dive = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_dive = remapping_other1_player_key2_sprint)
			or(remapping_player_key_dive = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_dive = remapping_other1_player_key2_left)
			or(remapping_player_key_dive = remapping_other1_player_key2_right)
			or(remapping_player_key_dive = remapping_other1_player_key2_down)
			or(remapping_player_key_dive = remapping_other1_player_key2_up)
			or(remapping_player_key_dive = remapping_other1_player_key2_tongue)
			or(remapping_player_key_dive = remapping_other2_player_key_dive)
			or(remapping_player_key_dive = remapping_other2_player_key_jump)
			or(remapping_player_key_dive = remapping_other2_player_key_crouch)
			or(remapping_player_key_dive = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_dive = remapping_other2_player_key_sprint)
			or(remapping_player_key_dive = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_dive = remapping_other2_player_key_left)
			or(remapping_player_key_dive = remapping_other2_player_key_right)
			or(remapping_player_key_dive = remapping_other2_player_key_down)
			or(remapping_player_key_dive = remapping_other2_player_key_up)
			or(remapping_player_key_dive = remapping_other2_player_key_tongue)
			or(remapping_player_key_dive = remapping_other2_player_key2_dive)
			or(remapping_player_key_dive = remapping_other2_player_key2_jump)
			or(remapping_player_key_dive = remapping_other2_player_key2_crouch)
			or(remapping_player_key_dive = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_dive = remapping_other2_player_key2_sprint)
			or(remapping_player_key_dive = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_dive = remapping_other2_player_key2_left)
			or(remapping_player_key_dive = remapping_other2_player_key2_right)
			or(remapping_player_key_dive = remapping_other2_player_key2_down)
			or(remapping_player_key_dive = remapping_other2_player_key2_up)
			or(remapping_player_key_dive = remapping_other2_player_key2_tongue)
			or(remapping_player_key_dive = remapping_other3_player_key_dive)
			or(remapping_player_key_dive = remapping_other3_player_key_jump)
			or(remapping_player_key_dive = remapping_other3_player_key_crouch)
			or(remapping_player_key_dive = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_dive = remapping_other3_player_key_sprint)
			or(remapping_player_key_dive = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_dive = remapping_other3_player_key_left)
			or(remapping_player_key_dive = remapping_other3_player_key_right)
			or(remapping_player_key_dive = remapping_other3_player_key_down)
			or(remapping_player_key_dive = remapping_other3_player_key_up)
			or(remapping_player_key_dive = remapping_other3_player_key_tongue)
			or(remapping_player_key_dive = remapping_other3_player_key2_dive)
			or(remapping_player_key_dive = remapping_other3_player_key2_jump)
			or(remapping_player_key_dive = remapping_other3_player_key2_crouch)
			or(remapping_player_key_dive = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_dive = remapping_other3_player_key2_sprint)
			or(remapping_player_key_dive = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_dive = remapping_other3_player_key2_left)
			or(remapping_player_key_dive = remapping_other3_player_key2_right)
			or(remapping_player_key_dive = remapping_other3_player_key2_down)
			or(remapping_player_key_dive = remapping_other3_player_key2_up)
			or(remapping_player_key_dive = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_dive > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_dive + menu_y_offset -32, key1_x + 31, menu_y_remap_key_dive + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Dive Conflict END*/
			#region /*Jump Conflict*/
			if (remapping_player_key_jump = remapping_player_key_dive)
			or(remapping_player_key_jump = remapping_player_key_crouch)
			or(remapping_player_key_jump = remapping_player_key_crouch_toggle)
			or(remapping_player_key_jump = remapping_player_key_sprint)
			or(remapping_player_key_jump = remapping_player_key_sprint_toggle)
			or(remapping_player_key_jump = remapping_player_key_left)
			or(remapping_player_key_jump = remapping_player_key_right)
			or(remapping_player_key_jump = remapping_player_key_down)
			or(remapping_player_key_jump = remapping_player_key_up)
			or(remapping_player_key_jump = remapping_player_key_tongue)
		
			or(remapping_player_key_jump = remapping_player_key2_dive)
			or(remapping_player_key_jump = remapping_player_key2_jump)
			or(remapping_player_key_jump = remapping_player_key2_crouch)
			or(remapping_player_key_jump = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_jump = remapping_player_key2_sprint)
			or(remapping_player_key_jump = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_jump = remapping_player_key2_left)
			or(remapping_player_key_jump = remapping_player_key2_right)
			or(remapping_player_key_jump = remapping_player_key2_down)
			or(remapping_player_key_jump = remapping_player_key2_up)
			or(remapping_player_key_jump = remapping_player_key2_tongue)
			{
				if (remapping_player_key_jump > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_jump + menu_y_offset -32, key1_x + 31, menu_y_remap_key_jump + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_jump = remapping_other1_player_key_dive)
			or(remapping_player_key_jump = remapping_other1_player_key_jump)
			or(remapping_player_key_jump = remapping_other1_player_key_crouch)
			or(remapping_player_key_jump = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_jump = remapping_other1_player_key_sprint)
			or(remapping_player_key_jump = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_jump = remapping_other1_player_key_left)
			or(remapping_player_key_jump = remapping_other1_player_key_right)
			or(remapping_player_key_jump = remapping_other1_player_key_down)
			or(remapping_player_key_jump = remapping_other1_player_key_up)
			or(remapping_player_key_jump = remapping_other1_player_key_tongue)
			or(remapping_player_key_jump = remapping_other1_player_key2_dive)
			or(remapping_player_key_jump = remapping_other1_player_key2_jump)
			or(remapping_player_key_jump = remapping_other1_player_key2_crouch)
			or(remapping_player_key_jump = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_jump = remapping_other1_player_key2_sprint)
			or(remapping_player_key_jump = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_jump = remapping_other1_player_key2_left)
			or(remapping_player_key_jump = remapping_other1_player_key2_right)
			or(remapping_player_key_jump = remapping_other1_player_key2_down)
			or(remapping_player_key_jump = remapping_other1_player_key2_up)
			or(remapping_player_key_jump = remapping_other1_player_key2_tongue)
			or(remapping_player_key_jump = remapping_other2_player_key_dive)
			or(remapping_player_key_jump = remapping_other2_player_key_jump)
			or(remapping_player_key_jump = remapping_other2_player_key_crouch)
			or(remapping_player_key_jump = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_jump = remapping_other2_player_key_sprint)
			or(remapping_player_key_jump = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_jump = remapping_other2_player_key_left)
			or(remapping_player_key_jump = remapping_other2_player_key_right)
			or(remapping_player_key_jump = remapping_other2_player_key_down)
			or(remapping_player_key_jump = remapping_other2_player_key_up)
			or(remapping_player_key_jump = remapping_other2_player_key_tongue)
			or(remapping_player_key_jump = remapping_other2_player_key2_dive)
			or(remapping_player_key_jump = remapping_other2_player_key2_jump)
			or(remapping_player_key_jump = remapping_other2_player_key2_crouch)
			or(remapping_player_key_jump = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_jump = remapping_other2_player_key2_sprint)
			or(remapping_player_key_jump = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_jump = remapping_other2_player_key2_left)
			or(remapping_player_key_jump = remapping_other2_player_key2_right)
			or(remapping_player_key_jump = remapping_other2_player_key2_down)
			or(remapping_player_key_jump = remapping_other2_player_key2_up)
			or(remapping_player_key_jump = remapping_other2_player_key2_tongue)
			or(remapping_player_key_jump = remapping_other3_player_key_dive)
			or(remapping_player_key_jump = remapping_other3_player_key_jump)
			or(remapping_player_key_jump = remapping_other3_player_key_crouch)
			or(remapping_player_key_jump = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_jump = remapping_other3_player_key_sprint)
			or(remapping_player_key_jump = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_jump = remapping_other3_player_key_left)
			or(remapping_player_key_jump = remapping_other3_player_key_right)
			or(remapping_player_key_jump = remapping_other3_player_key_down)
			or(remapping_player_key_jump = remapping_other3_player_key_up)
			or(remapping_player_key_jump = remapping_other3_player_key_tongue)
			or(remapping_player_key_jump = remapping_other3_player_key2_dive)
			or(remapping_player_key_jump = remapping_other3_player_key2_jump)
			or(remapping_player_key_jump = remapping_other3_player_key2_crouch)
			or(remapping_player_key_jump = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_jump = remapping_other3_player_key2_sprint)
			or(remapping_player_key_jump = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_jump = remapping_other3_player_key2_left)
			or(remapping_player_key_jump = remapping_other3_player_key2_right)
			or(remapping_player_key_jump = remapping_other3_player_key2_down)
			or(remapping_player_key_jump = remapping_other3_player_key2_up)
			or(remapping_player_key_jump = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_jump > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_jump + menu_y_offset -32, key1_x + 31, menu_y_remap_key_jump + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Jump Conflict END*/
			#region /*Crouch Conflict*/
			if (remapping_player_key_crouch = remapping_player_key_dive)
			or(remapping_player_key_crouch = remapping_player_key_jump)
			or(remapping_player_key_crouch = remapping_player_key_crouch_toggle)
			or(remapping_player_key_crouch = remapping_player_key_sprint)
			or(remapping_player_key_crouch = remapping_player_key_sprint_toggle)
			or(remapping_player_key_crouch = remapping_player_key_left)
			or(remapping_player_key_crouch = remapping_player_key_right)
			or(remapping_player_key_crouch = remapping_player_key_down)
			or(remapping_player_key_crouch = remapping_player_key_up)
			or(remapping_player_key_crouch = remapping_player_key_tongue)
		
			or(remapping_player_key_crouch = remapping_player_key2_dive)
			or(remapping_player_key_crouch = remapping_player_key2_jump)
			or(remapping_player_key_crouch = remapping_player_key2_crouch)
			or(remapping_player_key_crouch = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_crouch = remapping_player_key2_sprint)
			or(remapping_player_key_crouch = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_crouch = remapping_player_key2_left)
			or(remapping_player_key_crouch = remapping_player_key2_right)
			or(remapping_player_key_crouch = remapping_player_key2_down)
			or(remapping_player_key_crouch = remapping_player_key2_up)
			or(remapping_player_key_crouch = remapping_player_key2_tongue)
			{
				if (remapping_player_key_crouch > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key1_x + 31, menu_y_remap_key_crouch + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_crouch = remapping_other1_player_key_dive)
			or(remapping_player_key_crouch = remapping_other1_player_key_jump)
			or(remapping_player_key_crouch = remapping_other1_player_key_crouch)
			or(remapping_player_key_crouch = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_crouch = remapping_other1_player_key_sprint)
			or(remapping_player_key_crouch = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_crouch = remapping_other1_player_key_left)
			or(remapping_player_key_crouch = remapping_other1_player_key_right)
			or(remapping_player_key_crouch = remapping_other1_player_key_down)
			or(remapping_player_key_crouch = remapping_other1_player_key_up)
			or(remapping_player_key_crouch = remapping_other1_player_key_tongue)
			or(remapping_player_key_crouch = remapping_other1_player_key2_dive)
			or(remapping_player_key_crouch = remapping_other1_player_key2_jump)
			or(remapping_player_key_crouch = remapping_other1_player_key2_crouch)
			or(remapping_player_key_crouch = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_crouch = remapping_other1_player_key2_sprint)
			or(remapping_player_key_crouch = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_crouch = remapping_other1_player_key2_left)
			or(remapping_player_key_crouch = remapping_other1_player_key2_right)
			or(remapping_player_key_crouch = remapping_other1_player_key2_down)
			or(remapping_player_key_crouch = remapping_other1_player_key2_up)
			or(remapping_player_key_crouch = remapping_other1_player_key2_tongue)
			or(remapping_player_key_crouch = remapping_other2_player_key_dive)
			or(remapping_player_key_crouch = remapping_other2_player_key_jump)
			or(remapping_player_key_crouch = remapping_other2_player_key_crouch)
			or(remapping_player_key_crouch = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_crouch = remapping_other2_player_key_sprint)
			or(remapping_player_key_crouch = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_crouch = remapping_other2_player_key_left)
			or(remapping_player_key_crouch = remapping_other2_player_key_right)
			or(remapping_player_key_crouch = remapping_other2_player_key_down)
			or(remapping_player_key_crouch = remapping_other2_player_key_up)
			or(remapping_player_key_crouch = remapping_other2_player_key_tongue)
			or(remapping_player_key_crouch = remapping_other2_player_key2_dive)
			or(remapping_player_key_crouch = remapping_other2_player_key2_jump)
			or(remapping_player_key_crouch = remapping_other2_player_key2_crouch)
			or(remapping_player_key_crouch = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_crouch = remapping_other2_player_key2_sprint)
			or(remapping_player_key_crouch = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_crouch = remapping_other2_player_key2_left)
			or(remapping_player_key_crouch = remapping_other2_player_key2_right)
			or(remapping_player_key_crouch = remapping_other2_player_key2_down)
			or(remapping_player_key_crouch = remapping_other2_player_key2_up)
			or(remapping_player_key_crouch = remapping_other2_player_key2_tongue)
			or(remapping_player_key_crouch = remapping_other3_player_key_dive)
			or(remapping_player_key_crouch = remapping_other3_player_key_jump)
			or(remapping_player_key_crouch = remapping_other3_player_key_crouch)
			or(remapping_player_key_crouch = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_crouch = remapping_other3_player_key_sprint)
			or(remapping_player_key_crouch = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_crouch = remapping_other3_player_key_left)
			or(remapping_player_key_crouch = remapping_other3_player_key_right)
			or(remapping_player_key_crouch = remapping_other3_player_key_down)
			or(remapping_player_key_crouch = remapping_other3_player_key_up)
			or(remapping_player_key_crouch = remapping_other3_player_key_tongue)
			or(remapping_player_key_crouch = remapping_other3_player_key2_dive)
			or(remapping_player_key_crouch = remapping_other3_player_key2_jump)
			or(remapping_player_key_crouch = remapping_other3_player_key2_crouch)
			or(remapping_player_key_crouch = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_crouch = remapping_other3_player_key2_sprint)
			or(remapping_player_key_crouch = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_crouch = remapping_other3_player_key2_left)
			or(remapping_player_key_crouch = remapping_other3_player_key2_right)
			or(remapping_player_key_crouch = remapping_other3_player_key2_down)
			or(remapping_player_key_crouch = remapping_other3_player_key2_up)
			or(remapping_player_key_crouch = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_crouch > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key1_x + 31, menu_y_remap_key_crouch + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Crouch Conflict END*/
			#region /*Crouch Toggle Conflict*/
			if (remapping_player_key_crouch_toggle = remapping_player_key_dive)
			or(remapping_player_key_crouch_toggle = remapping_player_key_jump)
			or(remapping_player_key_crouch_toggle = remapping_player_key_crouch)
			or(remapping_player_key_crouch_toggle = remapping_player_key_sprint)
			or(remapping_player_key_crouch_toggle = remapping_player_key_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_player_key_left)
			or(remapping_player_key_crouch_toggle = remapping_player_key_right)
			or(remapping_player_key_crouch_toggle = remapping_player_key_down)
			or(remapping_player_key_crouch_toggle = remapping_player_key_up)
			or(remapping_player_key_crouch_toggle = remapping_player_key_tongue)
		
			or(remapping_player_key_crouch_toggle = remapping_player_key2_dive)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_jump)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_crouch)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_sprint)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_left)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_right)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_down)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_up)
			or(remapping_player_key_crouch_toggle = remapping_player_key2_tongue)
			{
				if (remapping_player_key_crouch_toggle > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key1_x + 31, menu_y_remap_key_crouch_toggle + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_crouch_toggle = remapping_other1_player_key_dive)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_jump)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_crouch)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_sprint)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_left)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_right)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_down)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_up)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key_tongue)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_dive)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_jump)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_crouch)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_sprint)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_left)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_right)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_down)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_up)
			or(remapping_player_key_crouch_toggle = remapping_other1_player_key2_tongue)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_dive)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_jump)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_crouch)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_sprint)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_left)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_right)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_down)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_up)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key_tongue)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_dive)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_jump)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_crouch)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_sprint)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_left)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_right)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_down)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_up)
			or(remapping_player_key_crouch_toggle = remapping_other2_player_key2_tongue)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_dive)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_jump)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_crouch)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_sprint)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_left)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_right)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_down)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_up)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key_tongue)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_dive)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_jump)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_crouch)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_sprint)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_left)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_right)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_down)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_up)
			or(remapping_player_key_crouch_toggle = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_crouch_toggle > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key1_x + 31, menu_y_remap_key_crouch_toggle + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Crouch Toggle Conflict END*/
			#region /*Sprint Conflict*/
			if (remapping_player_key_sprint = remapping_player_key_dive)
			or(remapping_player_key_sprint = remapping_player_key_jump)
			or(remapping_player_key_sprint = remapping_player_key_crouch)
			or(remapping_player_key_sprint = remapping_player_key_crouch_toggle)
			or(remapping_player_key_sprint = remapping_player_key_sprint_toggle)
			or(remapping_player_key_sprint = remapping_player_key_left)
			or(remapping_player_key_sprint = remapping_player_key_right)
			or(remapping_player_key_sprint = remapping_player_key_down)
			or(remapping_player_key_sprint = remapping_player_key_up)
			or(remapping_player_key_sprint = remapping_player_key_tongue)
		
			or(remapping_player_key_sprint = remapping_player_key2_dive)
			or(remapping_player_key_sprint = remapping_player_key2_jump)
			or(remapping_player_key_sprint = remapping_player_key2_crouch)
			or(remapping_player_key_sprint = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_sprint = remapping_player_key2_sprint)
			or(remapping_player_key_sprint = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_sprint = remapping_player_key2_left)
			or(remapping_player_key_sprint = remapping_player_key2_right)
			or(remapping_player_key_sprint = remapping_player_key2_down)
			or(remapping_player_key_sprint = remapping_player_key2_up)
			or(remapping_player_key_sprint = remapping_player_key2_tongue)
			{
				if (remapping_player_key_sprint > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key1_x + 31, menu_y_remap_key_sprint + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_sprint = remapping_other1_player_key_dive)
			or(remapping_player_key_sprint = remapping_other1_player_key_jump)
			or(remapping_player_key_sprint = remapping_other1_player_key_crouch)
			or(remapping_player_key_sprint = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_sprint = remapping_other1_player_key_sprint)
			or(remapping_player_key_sprint = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_sprint = remapping_other1_player_key_left)
			or(remapping_player_key_sprint = remapping_other1_player_key_right)
			or(remapping_player_key_sprint = remapping_other1_player_key_down)
			or(remapping_player_key_sprint = remapping_other1_player_key_up)
			or(remapping_player_key_sprint = remapping_other1_player_key_tongue)
			or(remapping_player_key_sprint = remapping_other1_player_key2_dive)
			or(remapping_player_key_sprint = remapping_other1_player_key2_jump)
			or(remapping_player_key_sprint = remapping_other1_player_key2_crouch)
			or(remapping_player_key_sprint = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_sprint = remapping_other1_player_key2_sprint)
			or(remapping_player_key_sprint = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_sprint = remapping_other1_player_key2_left)
			or(remapping_player_key_sprint = remapping_other1_player_key2_right)
			or(remapping_player_key_sprint = remapping_other1_player_key2_down)
			or(remapping_player_key_sprint = remapping_other1_player_key2_up)
			or(remapping_player_key_sprint = remapping_other1_player_key2_tongue)
			or(remapping_player_key_sprint = remapping_other2_player_key_dive)
			or(remapping_player_key_sprint = remapping_other2_player_key_jump)
			or(remapping_player_key_sprint = remapping_other2_player_key_crouch)
			or(remapping_player_key_sprint = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_sprint = remapping_other2_player_key_sprint)
			or(remapping_player_key_sprint = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_sprint = remapping_other2_player_key_left)
			or(remapping_player_key_sprint = remapping_other2_player_key_right)
			or(remapping_player_key_sprint = remapping_other2_player_key_down)
			or(remapping_player_key_sprint = remapping_other2_player_key_up)
			or(remapping_player_key_sprint = remapping_other2_player_key_tongue)
			or(remapping_player_key_sprint = remapping_other2_player_key2_dive)
			or(remapping_player_key_sprint = remapping_other2_player_key2_jump)
			or(remapping_player_key_sprint = remapping_other2_player_key2_crouch)
			or(remapping_player_key_sprint = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_sprint = remapping_other2_player_key2_sprint)
			or(remapping_player_key_sprint = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_sprint = remapping_other2_player_key2_left)
			or(remapping_player_key_sprint = remapping_other2_player_key2_right)
			or(remapping_player_key_sprint = remapping_other2_player_key2_down)
			or(remapping_player_key_sprint = remapping_other2_player_key2_up)
			or(remapping_player_key_sprint = remapping_other2_player_key2_tongue)
			or(remapping_player_key_sprint = remapping_other3_player_key_dive)
			or(remapping_player_key_sprint = remapping_other3_player_key_jump)
			or(remapping_player_key_sprint = remapping_other3_player_key_crouch)
			or(remapping_player_key_sprint = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_sprint = remapping_other3_player_key_sprint)
			or(remapping_player_key_sprint = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_sprint = remapping_other3_player_key_left)
			or(remapping_player_key_sprint = remapping_other3_player_key_right)
			or(remapping_player_key_sprint = remapping_other3_player_key_down)
			or(remapping_player_key_sprint = remapping_other3_player_key_up)
			or(remapping_player_key_sprint = remapping_other3_player_key_tongue)
			or(remapping_player_key_sprint = remapping_other3_player_key2_dive)
			or(remapping_player_key_sprint = remapping_other3_player_key2_jump)
			or(remapping_player_key_sprint = remapping_other3_player_key2_crouch)
			or(remapping_player_key_sprint = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_sprint = remapping_other3_player_key2_sprint)
			or(remapping_player_key_sprint = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_sprint = remapping_other3_player_key2_left)
			or(remapping_player_key_sprint = remapping_other3_player_key2_right)
			or(remapping_player_key_sprint = remapping_other3_player_key2_down)
			or(remapping_player_key_sprint = remapping_other3_player_key2_up)
			or(remapping_player_key_sprint = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_sprint > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key1_x + 31, menu_y_remap_key_sprint + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Sprint Conflict END*/
			#region /*Sprint Toggle Conflict*/
			if (remapping_player_key_sprint_toggle = remapping_player_key_dive)
			or(remapping_player_key_sprint_toggle = remapping_player_key_jump)
			or(remapping_player_key_sprint_toggle = remapping_player_key_crouch)
			or(remapping_player_key_sprint_toggle = remapping_player_key_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_player_key_sprint)
			or(remapping_player_key_sprint_toggle = remapping_player_key_left)
			or(remapping_player_key_sprint_toggle = remapping_player_key_right)
			or(remapping_player_key_sprint_toggle = remapping_player_key_down)
			or(remapping_player_key_sprint_toggle = remapping_player_key_up)
			or(remapping_player_key_sprint_toggle = remapping_player_key_tongue)
		
			or(remapping_player_key_sprint_toggle = remapping_player_key2_dive)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_jump)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_crouch)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_sprint)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_left)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_right)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_down)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_up)
			or(remapping_player_key_sprint_toggle = remapping_player_key2_tongue)
			{
				if (remapping_player_key_sprint_toggle > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key1_x + 31, menu_y_remap_key_sprint + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_sprint_toggle = remapping_other1_player_key_dive)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_jump)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_crouch)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_sprint)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_left)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_right)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_down)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_up)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key_tongue)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_dive)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_jump)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_crouch)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_sprint)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_left)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_right)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_down)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_up)
			or(remapping_player_key_sprint_toggle = remapping_other1_player_key2_tongue)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_dive)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_jump)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_crouch)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_sprint)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_left)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_right)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_down)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_up)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key_tongue)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_dive)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_jump)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_crouch)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_sprint)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_left)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_right)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_down)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_up)
			or(remapping_player_key_sprint_toggle = remapping_other2_player_key2_tongue)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_dive)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_jump)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_crouch)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_sprint)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_left)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_right)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_down)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_up)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key_tongue)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_dive)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_jump)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_crouch)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_sprint)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_left)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_right)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_down)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_up)
			or(remapping_player_key_sprint_toggle = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_sprint_toggle > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key1_x + 31, menu_y_remap_key_sprint_toggle + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Sprint Toggle Conflict END*/
			#region /*Left Conflict*/
			if (remapping_player_key_left = remapping_player_key_dive)
			or(remapping_player_key_left = remapping_player_key_jump)
			or(remapping_player_key_left = remapping_player_key_crouch)
			or(remapping_player_key_left = remapping_player_key_crouch_toggle)
			or(remapping_player_key_left = remapping_player_key_sprint)
			or(remapping_player_key_left = remapping_player_key_sprint_toggle)
			or(remapping_player_key_left = remapping_player_key_right)
			or(remapping_player_key_left = remapping_player_key_down)
			or(remapping_player_key_left = remapping_player_key_up)
			or(remapping_player_key_left = remapping_player_key_tongue)
		
			or(remapping_player_key_left = remapping_player_key2_dive)
			or(remapping_player_key_left = remapping_player_key2_jump)
			or(remapping_player_key_left = remapping_player_key2_crouch)
			or(remapping_player_key_left = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_left = remapping_player_key2_sprint)
			or(remapping_player_key_left = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_left = remapping_player_key2_left)
			or(remapping_player_key_left = remapping_player_key2_right)
			or(remapping_player_key_left = remapping_player_key2_down)
			or(remapping_player_key_left = remapping_player_key2_up)
			or(remapping_player_key_left = remapping_player_key2_tongue)
			{
				if (remapping_player_key_left > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_left + menu_y_offset -32, key1_x + 31, menu_y_remap_key_left + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_left = remapping_other1_player_key_dive)
			or(remapping_player_key_left = remapping_other1_player_key_jump)
			or(remapping_player_key_left = remapping_other1_player_key_crouch)
			or(remapping_player_key_left = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_left = remapping_other1_player_key_sprint)
			or(remapping_player_key_left = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_left = remapping_other1_player_key_left)
			or(remapping_player_key_left = remapping_other1_player_key_right)
			or(remapping_player_key_left = remapping_other1_player_key_down)
			or(remapping_player_key_left = remapping_other1_player_key_up)
			or(remapping_player_key_left = remapping_other1_player_key_tongue)
			or(remapping_player_key_left = remapping_other1_player_key2_dive)
			or(remapping_player_key_left = remapping_other1_player_key2_jump)
			or(remapping_player_key_left = remapping_other1_player_key2_crouch)
			or(remapping_player_key_left = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_left = remapping_other1_player_key2_sprint)
			or(remapping_player_key_left = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_left = remapping_other1_player_key2_left)
			or(remapping_player_key_left = remapping_other1_player_key2_right)
			or(remapping_player_key_left = remapping_other1_player_key2_down)
			or(remapping_player_key_left = remapping_other1_player_key2_up)
			or(remapping_player_key_left = remapping_other1_player_key2_tongue)
			or(remapping_player_key_left = remapping_other2_player_key_dive)
			or(remapping_player_key_left = remapping_other2_player_key_jump)
			or(remapping_player_key_left = remapping_other2_player_key_crouch)
			or(remapping_player_key_left = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_left = remapping_other2_player_key_sprint)
			or(remapping_player_key_left = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_left = remapping_other2_player_key_left)
			or(remapping_player_key_left = remapping_other2_player_key_right)
			or(remapping_player_key_left = remapping_other2_player_key_down)
			or(remapping_player_key_left = remapping_other2_player_key_up)
			or(remapping_player_key_left = remapping_other2_player_key_tongue)
			or(remapping_player_key_left = remapping_other2_player_key2_dive)
			or(remapping_player_key_left = remapping_other2_player_key2_jump)
			or(remapping_player_key_left = remapping_other2_player_key2_crouch)
			or(remapping_player_key_left = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_left = remapping_other2_player_key2_sprint)
			or(remapping_player_key_left = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_left = remapping_other2_player_key2_left)
			or(remapping_player_key_left = remapping_other2_player_key2_right)
			or(remapping_player_key_left = remapping_other2_player_key2_down)
			or(remapping_player_key_left = remapping_other2_player_key2_up)
			or(remapping_player_key_left = remapping_other2_player_key2_tongue)
			or(remapping_player_key_left = remapping_other3_player_key_dive)
			or(remapping_player_key_left = remapping_other3_player_key_jump)
			or(remapping_player_key_left = remapping_other3_player_key_crouch)
			or(remapping_player_key_left = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_left = remapping_other3_player_key_sprint)
			or(remapping_player_key_left = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_left = remapping_other3_player_key_left)
			or(remapping_player_key_left = remapping_other3_player_key_right)
			or(remapping_player_key_left = remapping_other3_player_key_down)
			or(remapping_player_key_left = remapping_other3_player_key_up)
			or(remapping_player_key_left = remapping_other3_player_key_tongue)
			or(remapping_player_key_left = remapping_other3_player_key2_dive)
			or(remapping_player_key_left = remapping_other3_player_key2_jump)
			or(remapping_player_key_left = remapping_other3_player_key2_crouch)
			or(remapping_player_key_left = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_left = remapping_other3_player_key2_sprint)
			or(remapping_player_key_left = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_left = remapping_other3_player_key2_left)
			or(remapping_player_key_left = remapping_other3_player_key2_right)
			or(remapping_player_key_left = remapping_other3_player_key2_down)
			or(remapping_player_key_left = remapping_other3_player_key2_up)
			or(remapping_player_key_left = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_left > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_left + menu_y_offset -32, key1_x + 31, menu_y_remap_key_left + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Left Conflict END*/
			#region /*Right Conflict*/
			if (remapping_player_key_right = remapping_player_key_dive)
			or(remapping_player_key_right = remapping_player_key_jump)
			or(remapping_player_key_right = remapping_player_key_crouch)
			or(remapping_player_key_right = remapping_player_key_crouch_toggle)
			or(remapping_player_key_right = remapping_player_key_sprint)
			or(remapping_player_key_right = remapping_player_key_sprint_toggle)
			or(remapping_player_key_right = remapping_player_key_left)
			or(remapping_player_key_right = remapping_player_key_down)
			or(remapping_player_key_right = remapping_player_key_up)
			or(remapping_player_key_right = remapping_player_key_tongue)
		
			or(remapping_player_key_right = remapping_player_key2_dive)
			or(remapping_player_key_right = remapping_player_key2_jump)
			or(remapping_player_key_right = remapping_player_key2_crouch)
			or(remapping_player_key_right = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_right = remapping_player_key2_sprint)
			or(remapping_player_key_right = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_right = remapping_player_key2_left)
			or(remapping_player_key_right = remapping_player_key2_right)
			or(remapping_player_key_right = remapping_player_key2_down)
			or(remapping_player_key_right = remapping_player_key2_up)
			or(remapping_player_key_right = remapping_player_key2_tongue)
			{
				if (remapping_player_key_right > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_right + menu_y_offset -32, key1_x + 31, menu_y_remap_key_right + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_right = remapping_other1_player_key_dive)
			or(remapping_player_key_right = remapping_other1_player_key_jump)
			or(remapping_player_key_right = remapping_other1_player_key_crouch)
			or(remapping_player_key_right = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_right = remapping_other1_player_key_sprint)
			or(remapping_player_key_right = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_right = remapping_other1_player_key_left)
			or(remapping_player_key_right = remapping_other1_player_key_right)
			or(remapping_player_key_right = remapping_other1_player_key_down)
			or(remapping_player_key_right = remapping_other1_player_key_up)
			or(remapping_player_key_right = remapping_other1_player_key_tongue)
			or(remapping_player_key_right = remapping_other1_player_key2_dive)
			or(remapping_player_key_right = remapping_other1_player_key2_jump)
			or(remapping_player_key_right = remapping_other1_player_key2_crouch)
			or(remapping_player_key_right = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_right = remapping_other1_player_key2_sprint)
			or(remapping_player_key_right = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_right = remapping_other1_player_key2_left)
			or(remapping_player_key_right = remapping_other1_player_key2_right)
			or(remapping_player_key_right = remapping_other1_player_key2_down)
			or(remapping_player_key_right = remapping_other1_player_key2_up)
			or(remapping_player_key_right = remapping_other1_player_key2_tongue)
			or(remapping_player_key_right = remapping_other2_player_key_dive)
			or(remapping_player_key_right = remapping_other2_player_key_jump)
			or(remapping_player_key_right = remapping_other2_player_key_crouch)
			or(remapping_player_key_right = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_right = remapping_other2_player_key_sprint)
			or(remapping_player_key_right = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_right = remapping_other2_player_key_left)
			or(remapping_player_key_right = remapping_other2_player_key_right)
			or(remapping_player_key_right = remapping_other2_player_key_down)
			or(remapping_player_key_right = remapping_other2_player_key_up)
			or(remapping_player_key_right = remapping_other2_player_key_tongue)
			or(remapping_player_key_right = remapping_other2_player_key2_dive)
			or(remapping_player_key_right = remapping_other2_player_key2_jump)
			or(remapping_player_key_right = remapping_other2_player_key2_crouch)
			or(remapping_player_key_right = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_right = remapping_other2_player_key2_sprint)
			or(remapping_player_key_right = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_right = remapping_other2_player_key2_left)
			or(remapping_player_key_right = remapping_other2_player_key2_right)
			or(remapping_player_key_right = remapping_other2_player_key2_down)
			or(remapping_player_key_right = remapping_other2_player_key2_up)
			or(remapping_player_key_right = remapping_other2_player_key2_tongue)
			or(remapping_player_key_right = remapping_other3_player_key_dive)
			or(remapping_player_key_right = remapping_other3_player_key_jump)
			or(remapping_player_key_right = remapping_other3_player_key_crouch)
			or(remapping_player_key_right = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_right = remapping_other3_player_key_sprint)
			or(remapping_player_key_right = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_right = remapping_other3_player_key_left)
			or(remapping_player_key_right = remapping_other3_player_key_right)
			or(remapping_player_key_right = remapping_other3_player_key_down)
			or(remapping_player_key_right = remapping_other3_player_key_up)
			or(remapping_player_key_right = remapping_other3_player_key_tongue)
			or(remapping_player_key_right = remapping_other3_player_key2_dive)
			or(remapping_player_key_right = remapping_other3_player_key2_jump)
			or(remapping_player_key_right = remapping_other3_player_key2_crouch)
			or(remapping_player_key_right = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_right = remapping_other3_player_key2_sprint)
			or(remapping_player_key_right = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_right = remapping_other3_player_key2_left)
			or(remapping_player_key_right = remapping_other3_player_key2_right)
			or(remapping_player_key_right = remapping_other3_player_key2_down)
			or(remapping_player_key_right = remapping_other3_player_key2_up)
			or(remapping_player_key_right = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_right > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_right + menu_y_offset -32, key1_x + 31, menu_y_remap_key_right + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Right Conflict END*/
			#region /*Down Conflict*/
			if (remapping_player_key_down = remapping_player_key_dive)
			or(remapping_player_key_down = remapping_player_key_jump)
			or(remapping_player_key_down = remapping_player_key_crouch)
			or(remapping_player_key_down = remapping_player_key_crouch_toggle)
			or(remapping_player_key_down = remapping_player_key_sprint)
			or(remapping_player_key_down = remapping_player_key_sprint_toggle)
			or(remapping_player_key_down = remapping_player_key_left)
			or(remapping_player_key_down = remapping_player_key_right)
			or(remapping_player_key_down = remapping_player_key_up)
			or(remapping_player_key_down = remapping_player_key_tongue)
		
			or(remapping_player_key_down = remapping_player_key2_dive)
			or(remapping_player_key_down = remapping_player_key2_jump)
			or(remapping_player_key_down = remapping_player_key2_crouch)
			or(remapping_player_key_down = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_down = remapping_player_key2_sprint)
			or(remapping_player_key_down = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_down = remapping_player_key2_left)
			or(remapping_player_key_down = remapping_player_key2_right)
			or(remapping_player_key_down = remapping_player_key2_down)
			or(remapping_player_key_down = remapping_player_key2_up)
			or(remapping_player_key_down = remapping_player_key2_tongue)
			{
				if (remapping_player_key_down > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_down + menu_y_offset -32, key1_x + 31, menu_y_remap_key_down + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_down = remapping_other1_player_key_dive)
			or(remapping_player_key_down = remapping_other1_player_key_jump)
			or(remapping_player_key_down = remapping_other1_player_key_crouch)
			or(remapping_player_key_down = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_down = remapping_other1_player_key_sprint)
			or(remapping_player_key_down = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_down = remapping_other1_player_key_left)
			or(remapping_player_key_down = remapping_other1_player_key_right)
			or(remapping_player_key_down = remapping_other1_player_key_down)
			or(remapping_player_key_down = remapping_other1_player_key_up)
			or(remapping_player_key_down = remapping_other1_player_key_tongue)
			or(remapping_player_key_down = remapping_other1_player_key2_dive)
			or(remapping_player_key_down = remapping_other1_player_key2_jump)
			or(remapping_player_key_down = remapping_other1_player_key2_crouch)
			or(remapping_player_key_down = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_down = remapping_other1_player_key2_sprint)
			or(remapping_player_key_down = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_down = remapping_other1_player_key2_left)
			or(remapping_player_key_down = remapping_other1_player_key2_right)
			or(remapping_player_key_down = remapping_other1_player_key2_down)
			or(remapping_player_key_down = remapping_other1_player_key2_up)
			or(remapping_player_key_down = remapping_other1_player_key2_tongue)
			or(remapping_player_key_down = remapping_other2_player_key_dive)
			or(remapping_player_key_down = remapping_other2_player_key_jump)
			or(remapping_player_key_down = remapping_other2_player_key_crouch)
			or(remapping_player_key_down = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_down = remapping_other2_player_key_sprint)
			or(remapping_player_key_down = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_down = remapping_other2_player_key_left)
			or(remapping_player_key_down = remapping_other2_player_key_right)
			or(remapping_player_key_down = remapping_other2_player_key_down)
			or(remapping_player_key_down = remapping_other2_player_key_up)
			or(remapping_player_key_down = remapping_other2_player_key_tongue)
			or(remapping_player_key_down = remapping_other2_player_key2_dive)
			or(remapping_player_key_down = remapping_other2_player_key2_jump)
			or(remapping_player_key_down = remapping_other2_player_key2_crouch)
			or(remapping_player_key_down = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_down = remapping_other2_player_key2_sprint)
			or(remapping_player_key_down = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_down = remapping_other2_player_key2_left)
			or(remapping_player_key_down = remapping_other2_player_key2_right)
			or(remapping_player_key_down = remapping_other2_player_key2_down)
			or(remapping_player_key_down = remapping_other2_player_key2_up)
			or(remapping_player_key_down = remapping_other2_player_key2_tongue)
			or(remapping_player_key_down = remapping_other3_player_key_dive)
			or(remapping_player_key_down = remapping_other3_player_key_jump)
			or(remapping_player_key_down = remapping_other3_player_key_crouch)
			or(remapping_player_key_down = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_down = remapping_other3_player_key_sprint)
			or(remapping_player_key_down = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_down = remapping_other3_player_key_left)
			or(remapping_player_key_down = remapping_other3_player_key_right)
			or(remapping_player_key_down = remapping_other3_player_key_down)
			or(remapping_player_key_down = remapping_other3_player_key_up)
			or(remapping_player_key_down = remapping_other3_player_key_tongue)
			or(remapping_player_key_down = remapping_other3_player_key2_dive)
			or(remapping_player_key_down = remapping_other3_player_key2_jump)
			or(remapping_player_key_down = remapping_other3_player_key2_crouch)
			or(remapping_player_key_down = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_down = remapping_other3_player_key2_sprint)
			or(remapping_player_key_down = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_down = remapping_other3_player_key2_left)
			or(remapping_player_key_down = remapping_other3_player_key2_right)
			or(remapping_player_key_down = remapping_other3_player_key2_down)
			or(remapping_player_key_down = remapping_other3_player_key2_up)
			or(remapping_player_key_down = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_down > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_down + menu_y_offset -32, key1_x + 31, menu_y_remap_key_down + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Down Conflict END*/
			#region /*Up Conflict*/
			if (remapping_player_key_up = remapping_player_key_dive)
			or(remapping_player_key_up = remapping_player_key_jump)
			or(remapping_player_key_up = remapping_player_key_crouch)
			or(remapping_player_key_up = remapping_player_key_crouch_toggle)
			or(remapping_player_key_up = remapping_player_key_sprint)
			or(remapping_player_key_up = remapping_player_key_sprint_toggle)
			or(remapping_player_key_up = remapping_player_key_left)
			or(remapping_player_key_up = remapping_player_key_right)
			or(remapping_player_key_up = remapping_player_key_down)
			or(remapping_player_key_up = remapping_player_key_tongue)
		
			or(remapping_player_key_up = remapping_player_key2_dive)
			or(remapping_player_key_up = remapping_player_key2_jump)
			or(remapping_player_key_up = remapping_player_key2_crouch)
			or(remapping_player_key_up = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_up = remapping_player_key2_sprint)
			or(remapping_player_key_up = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_up = remapping_player_key2_left)
			or(remapping_player_key_up = remapping_player_key2_right)
			or(remapping_player_key_up = remapping_player_key2_down)
			or(remapping_player_key_up = remapping_player_key2_up)
			or(remapping_player_key_up = remapping_player_key2_tongue)
			{
				if (remapping_player_key_up > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_up + menu_y_offset -32, key1_x + 31, menu_y_remap_key_up + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_up = remapping_other1_player_key_dive)
			or(remapping_player_key_up = remapping_other1_player_key_jump)
			or(remapping_player_key_up = remapping_other1_player_key_crouch)
			or(remapping_player_key_up = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_up = remapping_other1_player_key_sprint)
			or(remapping_player_key_up = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_up = remapping_other1_player_key_left)
			or(remapping_player_key_up = remapping_other1_player_key_right)
			or(remapping_player_key_up = remapping_other1_player_key_down)
			or(remapping_player_key_up = remapping_other1_player_key_up)
			or(remapping_player_key_up = remapping_other1_player_key_tongue)
			or(remapping_player_key_up = remapping_other1_player_key2_dive)
			or(remapping_player_key_up = remapping_other1_player_key2_jump)
			or(remapping_player_key_up = remapping_other1_player_key2_crouch)
			or(remapping_player_key_up = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_up = remapping_other1_player_key2_sprint)
			or(remapping_player_key_up = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_up = remapping_other1_player_key2_left)
			or(remapping_player_key_up = remapping_other1_player_key2_right)
			or(remapping_player_key_up = remapping_other1_player_key2_down)
			or(remapping_player_key_up = remapping_other1_player_key2_up)
			or(remapping_player_key_up = remapping_other1_player_key2_tongue)
			or(remapping_player_key_up = remapping_other2_player_key_dive)
			or(remapping_player_key_up = remapping_other2_player_key_jump)
			or(remapping_player_key_up = remapping_other2_player_key_crouch)
			or(remapping_player_key_up = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_up = remapping_other2_player_key_sprint)
			or(remapping_player_key_up = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_up = remapping_other2_player_key_left)
			or(remapping_player_key_up = remapping_other2_player_key_right)
			or(remapping_player_key_up = remapping_other2_player_key_down)
			or(remapping_player_key_up = remapping_other2_player_key_up)
			or(remapping_player_key_up = remapping_other2_player_key_tongue)
			or(remapping_player_key_up = remapping_other2_player_key2_dive)
			or(remapping_player_key_up = remapping_other2_player_key2_jump)
			or(remapping_player_key_up = remapping_other2_player_key2_crouch)
			or(remapping_player_key_up = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_up = remapping_other2_player_key2_sprint)
			or(remapping_player_key_up = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_up = remapping_other2_player_key2_left)
			or(remapping_player_key_up = remapping_other2_player_key2_right)
			or(remapping_player_key_up = remapping_other2_player_key2_down)
			or(remapping_player_key_up = remapping_other2_player_key2_up)
			or(remapping_player_key_up = remapping_other2_player_key2_tongue)
			or(remapping_player_key_up = remapping_other3_player_key_dive)
			or(remapping_player_key_up = remapping_other3_player_key_jump)
			or(remapping_player_key_up = remapping_other3_player_key_crouch)
			or(remapping_player_key_up = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_up = remapping_other3_player_key_sprint)
			or(remapping_player_key_up = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_up = remapping_other3_player_key_left)
			or(remapping_player_key_up = remapping_other3_player_key_right)
			or(remapping_player_key_up = remapping_other3_player_key_down)
			or(remapping_player_key_up = remapping_other3_player_key_up)
			or(remapping_player_key_up = remapping_other3_player_key_tongue)
			or(remapping_player_key_up = remapping_other3_player_key2_dive)
			or(remapping_player_key_up = remapping_other3_player_key2_jump)
			or(remapping_player_key_up = remapping_other3_player_key2_crouch)
			or(remapping_player_key_up = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_up = remapping_other3_player_key2_sprint)
			or(remapping_player_key_up = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_up = remapping_other3_player_key2_left)
			or(remapping_player_key_up = remapping_other3_player_key2_right)
			or(remapping_player_key_up = remapping_other3_player_key2_down)
			or(remapping_player_key_up = remapping_other3_player_key2_up)
			or(remapping_player_key_up = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_up > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_up + menu_y_offset -32, key1_x + 31, menu_y_remap_key_up + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Up Conflict END*/
			#region /*Tongue Conflict*/
			if (remapping_player_key_tongue = remapping_player_key_dive)
			or(remapping_player_key_tongue = remapping_player_key_jump)
			or(remapping_player_key_tongue = remapping_player_key_crouch)
			or(remapping_player_key_tongue = remapping_player_key_crouch_toggle)
			or(remapping_player_key_tongue = remapping_player_key_sprint)
			or(remapping_player_key_tongue = remapping_player_key_sprint_toggle)
			or(remapping_player_key_tongue = remapping_player_key_left)
			or(remapping_player_key_tongue = remapping_player_key_right)
			or(remapping_player_key_tongue = remapping_player_key_down)
			or(remapping_player_key_tongue = remapping_player_key_up)
		
			or(remapping_player_key_tongue = remapping_player_key2_dive)
			or(remapping_player_key_tongue = remapping_player_key2_jump)
			or(remapping_player_key_tongue = remapping_player_key2_crouch)
			or(remapping_player_key_tongue = remapping_player_key2_crouch_toggle)
			or(remapping_player_key_tongue = remapping_player_key2_sprint)
			or(remapping_player_key_tongue = remapping_player_key2_sprint_toggle)
			or(remapping_player_key_tongue = remapping_player_key2_left)
			or(remapping_player_key_tongue = remapping_player_key2_right)
			or(remapping_player_key_tongue = remapping_player_key2_down)
			or(remapping_player_key_tongue = remapping_player_key2_up)
			or(remapping_player_key_tongue = remapping_player_key2_tongue)
			{
				if (remapping_player_key_tongue > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key1_x + 31, menu_y_remap_key_tongue + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key_tongue = remapping_other1_player_key_dive)
			or(remapping_player_key_tongue = remapping_other1_player_key_jump)
			or(remapping_player_key_tongue = remapping_other1_player_key_crouch)
			or(remapping_player_key_tongue = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key_tongue = remapping_other1_player_key_sprint)
			or(remapping_player_key_tongue = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key_tongue = remapping_other1_player_key_left)
			or(remapping_player_key_tongue = remapping_other1_player_key_right)
			or(remapping_player_key_tongue = remapping_other1_player_key_down)
			or(remapping_player_key_tongue = remapping_other1_player_key_up)
			or(remapping_player_key_tongue = remapping_other1_player_key_tongue)
			or(remapping_player_key_tongue = remapping_other1_player_key2_dive)
			or(remapping_player_key_tongue = remapping_other1_player_key2_jump)
			or(remapping_player_key_tongue = remapping_other1_player_key2_crouch)
			or(remapping_player_key_tongue = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key_tongue = remapping_other1_player_key2_sprint)
			or(remapping_player_key_tongue = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key_tongue = remapping_other1_player_key2_left)
			or(remapping_player_key_tongue = remapping_other1_player_key2_right)
			or(remapping_player_key_tongue = remapping_other1_player_key2_down)
			or(remapping_player_key_tongue = remapping_other1_player_key2_up)
			or(remapping_player_key_tongue = remapping_other1_player_key2_tongue)
			or(remapping_player_key_tongue = remapping_other2_player_key_dive)
			or(remapping_player_key_tongue = remapping_other2_player_key_jump)
			or(remapping_player_key_tongue = remapping_other2_player_key_crouch)
			or(remapping_player_key_tongue = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key_tongue = remapping_other2_player_key_sprint)
			or(remapping_player_key_tongue = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key_tongue = remapping_other2_player_key_left)
			or(remapping_player_key_tongue = remapping_other2_player_key_right)
			or(remapping_player_key_tongue = remapping_other2_player_key_down)
			or(remapping_player_key_tongue = remapping_other2_player_key_up)
			or(remapping_player_key_tongue = remapping_other2_player_key_tongue)
			or(remapping_player_key_tongue = remapping_other2_player_key2_dive)
			or(remapping_player_key_tongue = remapping_other2_player_key2_jump)
			or(remapping_player_key_tongue = remapping_other2_player_key2_crouch)
			or(remapping_player_key_tongue = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key_tongue = remapping_other2_player_key2_sprint)
			or(remapping_player_key_tongue = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key_tongue = remapping_other2_player_key2_left)
			or(remapping_player_key_tongue = remapping_other2_player_key2_right)
			or(remapping_player_key_tongue = remapping_other2_player_key2_down)
			or(remapping_player_key_tongue = remapping_other2_player_key2_up)
			or(remapping_player_key_tongue = remapping_other2_player_key2_tongue)
			or(remapping_player_key_tongue = remapping_other3_player_key_dive)
			or(remapping_player_key_tongue = remapping_other3_player_key_jump)
			or(remapping_player_key_tongue = remapping_other3_player_key_crouch)
			or(remapping_player_key_tongue = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key_tongue = remapping_other3_player_key_sprint)
			or(remapping_player_key_tongue = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key_tongue = remapping_other3_player_key_left)
			or(remapping_player_key_tongue = remapping_other3_player_key_right)
			or(remapping_player_key_tongue = remapping_other3_player_key_down)
			or(remapping_player_key_tongue = remapping_other3_player_key_up)
			or(remapping_player_key_tongue = remapping_other3_player_key_tongue)
			or(remapping_player_key_tongue = remapping_other3_player_key2_dive)
			or(remapping_player_key_tongue = remapping_other3_player_key2_jump)
			or(remapping_player_key_tongue = remapping_other3_player_key2_crouch)
			or(remapping_player_key_tongue = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key_tongue = remapping_other3_player_key2_sprint)
			or(remapping_player_key_tongue = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key_tongue = remapping_other3_player_key2_left)
			or(remapping_player_key_tongue = remapping_other3_player_key2_right)
			or(remapping_player_key_tongue = remapping_other3_player_key2_down)
			or(remapping_player_key_tongue = remapping_other3_player_key2_up)
			or(remapping_player_key_tongue = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key_tongue > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key1_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key1_x + 31, menu_y_remap_key_tongue + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Tongue Conflict END*/
		
			#endregion /*Key 1 Conflicts END*/
		
			#region /*Key 2 Conflicts*/
		
			#region /*Dive 2 Conflict*/
			if (remapping_player_key2_dive = remapping_player_key_dive)
			or(remapping_player_key2_dive = remapping_player_key_jump)
			or(remapping_player_key2_dive = remapping_player_key_crouch)
			or(remapping_player_key2_dive = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_dive = remapping_player_key_sprint)
			or(remapping_player_key2_dive = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_dive = remapping_player_key_left)
			or(remapping_player_key2_dive = remapping_player_key_right)
			or(remapping_player_key2_dive = remapping_player_key_down)
			or(remapping_player_key2_dive = remapping_player_key_up)
			or(remapping_player_key2_dive = remapping_player_key_tongue)
		
			or(remapping_player_key2_dive = remapping_player_key2_jump)
			or(remapping_player_key2_dive = remapping_player_key2_crouch)
			or(remapping_player_key2_dive = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_dive = remapping_player_key2_sprint)
			or(remapping_player_key2_dive = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_dive = remapping_player_key2_left)
			or(remapping_player_key2_dive = remapping_player_key2_right)
			or(remapping_player_key2_dive = remapping_player_key2_down)
			or(remapping_player_key2_dive = remapping_player_key2_up)
			or(remapping_player_key2_dive = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_dive > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_dive + menu_y_offset -32, key2_x + 31, menu_y_remap_key_dive + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_dive = remapping_other1_player_key_dive)
			or(remapping_player_key2_dive = remapping_other1_player_key_jump)
			or(remapping_player_key2_dive = remapping_other1_player_key_crouch)
			or(remapping_player_key2_dive = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_dive = remapping_other1_player_key_sprint)
			or(remapping_player_key2_dive = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_dive = remapping_other1_player_key_left)
			or(remapping_player_key2_dive = remapping_other1_player_key_right)
			or(remapping_player_key2_dive = remapping_other1_player_key_down)
			or(remapping_player_key2_dive = remapping_other1_player_key_up)
			or(remapping_player_key2_dive = remapping_other1_player_key_tongue)
			or(remapping_player_key2_dive = remapping_other1_player_key2_dive)
			or(remapping_player_key2_dive = remapping_other1_player_key2_jump)
			or(remapping_player_key2_dive = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_dive = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_dive = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_dive = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_dive = remapping_other1_player_key2_left)
			or(remapping_player_key2_dive = remapping_other1_player_key2_right)
			or(remapping_player_key2_dive = remapping_other1_player_key2_down)
			or(remapping_player_key2_dive = remapping_other1_player_key2_up)
			or(remapping_player_key2_dive = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_dive = remapping_other2_player_key_dive)
			or(remapping_player_key2_dive = remapping_other2_player_key_jump)
			or(remapping_player_key2_dive = remapping_other2_player_key_crouch)
			or(remapping_player_key2_dive = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_dive = remapping_other2_player_key_sprint)
			or(remapping_player_key2_dive = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_dive = remapping_other2_player_key_left)
			or(remapping_player_key2_dive = remapping_other2_player_key_right)
			or(remapping_player_key2_dive = remapping_other2_player_key_down)
			or(remapping_player_key2_dive = remapping_other2_player_key_up)
			or(remapping_player_key2_dive = remapping_other2_player_key_tongue)
			or(remapping_player_key2_dive = remapping_other2_player_key2_dive)
			or(remapping_player_key2_dive = remapping_other2_player_key2_jump)
			or(remapping_player_key2_dive = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_dive = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_dive = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_dive = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_dive = remapping_other2_player_key2_left)
			or(remapping_player_key2_dive = remapping_other2_player_key2_right)
			or(remapping_player_key2_dive = remapping_other2_player_key2_down)
			or(remapping_player_key2_dive = remapping_other2_player_key2_up)
			or(remapping_player_key2_dive = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_dive = remapping_other3_player_key_dive)
			or(remapping_player_key2_dive = remapping_other3_player_key_jump)
			or(remapping_player_key2_dive = remapping_other3_player_key_crouch)
			or(remapping_player_key2_dive = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_dive = remapping_other3_player_key_sprint)
			or(remapping_player_key2_dive = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_dive = remapping_other3_player_key_left)
			or(remapping_player_key2_dive = remapping_other3_player_key_right)
			or(remapping_player_key2_dive = remapping_other3_player_key_down)
			or(remapping_player_key2_dive = remapping_other3_player_key_up)
			or(remapping_player_key2_dive = remapping_other3_player_key_tongue)
			or(remapping_player_key2_dive = remapping_other3_player_key2_dive)
			or(remapping_player_key2_dive = remapping_other3_player_key2_jump)
			or(remapping_player_key2_dive = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_dive = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_dive = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_dive = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_dive = remapping_other3_player_key2_left)
			or(remapping_player_key2_dive = remapping_other3_player_key2_right)
			or(remapping_player_key2_dive = remapping_other3_player_key2_down)
			or(remapping_player_key2_dive = remapping_other3_player_key2_up)
			or(remapping_player_key2_dive = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_dive > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_dive + menu_y_offset -32, key2_x + 31, menu_y_remap_key_dive + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Dive 2 Conflict END*/
			#region /*Jump 2 Conflict*/
			if (remapping_player_key2_jump = remapping_player_key_dive)
			or(remapping_player_key2_jump = remapping_player_key_jump)
			or(remapping_player_key2_jump = remapping_player_key_crouch)
			or(remapping_player_key2_jump = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_jump = remapping_player_key_sprint)
			or(remapping_player_key2_jump = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_jump = remapping_player_key_left)
			or(remapping_player_key2_jump = remapping_player_key_right)
			or(remapping_player_key2_jump = remapping_player_key_down)
			or(remapping_player_key2_jump = remapping_player_key_up)
			or(remapping_player_key2_jump = remapping_player_key_tongue)
		
			or(remapping_player_key2_jump = remapping_player_key2_dive)
			or(remapping_player_key2_jump = remapping_player_key2_crouch)
			or(remapping_player_key2_jump = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_jump = remapping_player_key2_sprint)
			or(remapping_player_key2_jump = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_jump = remapping_player_key2_left)
			or(remapping_player_key2_jump = remapping_player_key2_right)
			or(remapping_player_key2_jump = remapping_player_key2_down)
			or(remapping_player_key2_jump = remapping_player_key2_up)
			or(remapping_player_key2_jump = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_jump > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_jump + menu_y_offset -32, key2_x + 31, menu_y_remap_key_jump + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_jump = remapping_other1_player_key_dive)
			or(remapping_player_key2_jump = remapping_other1_player_key_jump)
			or(remapping_player_key2_jump = remapping_other1_player_key_crouch)
			or(remapping_player_key2_jump = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_jump = remapping_other1_player_key_sprint)
			or(remapping_player_key2_jump = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_jump = remapping_other1_player_key_left)
			or(remapping_player_key2_jump = remapping_other1_player_key_right)
			or(remapping_player_key2_jump = remapping_other1_player_key_down)
			or(remapping_player_key2_jump = remapping_other1_player_key_up)
			or(remapping_player_key2_jump = remapping_other1_player_key_tongue)
			or(remapping_player_key2_jump = remapping_other1_player_key2_dive)
			or(remapping_player_key2_jump = remapping_other1_player_key2_jump)
			or(remapping_player_key2_jump = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_jump = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_jump = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_jump = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_jump = remapping_other1_player_key2_left)
			or(remapping_player_key2_jump = remapping_other1_player_key2_right)
			or(remapping_player_key2_jump = remapping_other1_player_key2_down)
			or(remapping_player_key2_jump = remapping_other1_player_key2_up)
			or(remapping_player_key2_jump = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_jump = remapping_other2_player_key_dive)
			or(remapping_player_key2_jump = remapping_other2_player_key_jump)
			or(remapping_player_key2_jump = remapping_other2_player_key_crouch)
			or(remapping_player_key2_jump = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_jump = remapping_other2_player_key_sprint)
			or(remapping_player_key2_jump = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_jump = remapping_other2_player_key_left)
			or(remapping_player_key2_jump = remapping_other2_player_key_right)
			or(remapping_player_key2_jump = remapping_other2_player_key_down)
			or(remapping_player_key2_jump = remapping_other2_player_key_up)
			or(remapping_player_key2_jump = remapping_other2_player_key_tongue)
			or(remapping_player_key2_jump = remapping_other2_player_key2_dive)
			or(remapping_player_key2_jump = remapping_other2_player_key2_jump)
			or(remapping_player_key2_jump = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_jump = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_jump = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_jump = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_jump = remapping_other2_player_key2_left)
			or(remapping_player_key2_jump = remapping_other2_player_key2_right)
			or(remapping_player_key2_jump = remapping_other2_player_key2_down)
			or(remapping_player_key2_jump = remapping_other2_player_key2_up)
			or(remapping_player_key2_jump = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_jump = remapping_other3_player_key_dive)
			or(remapping_player_key2_jump = remapping_other3_player_key_jump)
			or(remapping_player_key2_jump = remapping_other3_player_key_crouch)
			or(remapping_player_key2_jump = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_jump = remapping_other3_player_key_sprint)
			or(remapping_player_key2_jump = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_jump = remapping_other3_player_key_left)
			or(remapping_player_key2_jump = remapping_other3_player_key_right)
			or(remapping_player_key2_jump = remapping_other3_player_key_down)
			or(remapping_player_key2_jump = remapping_other3_player_key_up)
			or(remapping_player_key2_jump = remapping_other3_player_key_tongue)
			or(remapping_player_key2_jump = remapping_other3_player_key2_dive)
			or(remapping_player_key2_jump = remapping_other3_player_key2_jump)
			or(remapping_player_key2_jump = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_jump = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_jump = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_jump = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_jump = remapping_other3_player_key2_left)
			or(remapping_player_key2_jump = remapping_other3_player_key2_right)
			or(remapping_player_key2_jump = remapping_other3_player_key2_down)
			or(remapping_player_key2_jump = remapping_other3_player_key2_up)
			or(remapping_player_key2_jump = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_jump > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_jump + menu_y_offset -32, key2_x + 31, menu_y_remap_key_jump + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Jump 2 Conflict END*/
			#region /*Crouch 2 Conflict*/
			if (remapping_player_key2_crouch = remapping_player_key_dive)
			or(remapping_player_key2_crouch = remapping_player_key_jump)
			or(remapping_player_key2_crouch = remapping_player_key_crouch)
			or(remapping_player_key2_crouch = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_player_key_sprint)
			or(remapping_player_key2_crouch = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_player_key_left)
			or(remapping_player_key2_crouch = remapping_player_key_right)
			or(remapping_player_key2_crouch = remapping_player_key_down)
			or(remapping_player_key2_crouch = remapping_player_key_up)
			or(remapping_player_key2_crouch = remapping_player_key_tongue)
		
			or(remapping_player_key2_crouch = remapping_player_key2_dive)
			or(remapping_player_key2_crouch = remapping_player_key2_jump)
			or(remapping_player_key2_crouch = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_player_key2_sprint)
			or(remapping_player_key2_crouch = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_player_key2_left)
			or(remapping_player_key2_crouch = remapping_player_key2_right)
			or(remapping_player_key2_crouch = remapping_player_key2_down)
			or(remapping_player_key2_crouch = remapping_player_key2_up)
			or(remapping_player_key2_crouch = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_crouch > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key2_x + 31, menu_y_remap_key_crouch + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_crouch = remapping_other1_player_key_dive)
			or(remapping_player_key2_crouch = remapping_other1_player_key_jump)
			or(remapping_player_key2_crouch = remapping_other1_player_key_crouch)
			or(remapping_player_key2_crouch = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_other1_player_key_sprint)
			or(remapping_player_key2_crouch = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_other1_player_key_left)
			or(remapping_player_key2_crouch = remapping_other1_player_key_right)
			or(remapping_player_key2_crouch = remapping_other1_player_key_down)
			or(remapping_player_key2_crouch = remapping_other1_player_key_up)
			or(remapping_player_key2_crouch = remapping_other1_player_key_tongue)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_dive)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_jump)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_left)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_right)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_down)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_up)
			or(remapping_player_key2_crouch = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_crouch = remapping_other2_player_key_dive)
			or(remapping_player_key2_crouch = remapping_other2_player_key_jump)
			or(remapping_player_key2_crouch = remapping_other2_player_key_crouch)
			or(remapping_player_key2_crouch = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_other2_player_key_sprint)
			or(remapping_player_key2_crouch = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_other2_player_key_left)
			or(remapping_player_key2_crouch = remapping_other2_player_key_right)
			or(remapping_player_key2_crouch = remapping_other2_player_key_down)
			or(remapping_player_key2_crouch = remapping_other2_player_key_up)
			or(remapping_player_key2_crouch = remapping_other2_player_key_tongue)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_dive)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_jump)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_left)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_right)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_down)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_up)
			or(remapping_player_key2_crouch = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_crouch = remapping_other3_player_key_dive)
			or(remapping_player_key2_crouch = remapping_other3_player_key_jump)
			or(remapping_player_key2_crouch = remapping_other3_player_key_crouch)
			or(remapping_player_key2_crouch = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_other3_player_key_sprint)
			or(remapping_player_key2_crouch = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_other3_player_key_left)
			or(remapping_player_key2_crouch = remapping_other3_player_key_right)
			or(remapping_player_key2_crouch = remapping_other3_player_key_down)
			or(remapping_player_key2_crouch = remapping_other3_player_key_up)
			or(remapping_player_key2_crouch = remapping_other3_player_key_tongue)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_dive)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_jump)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_left)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_right)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_down)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_up)
			or(remapping_player_key2_crouch = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_crouch > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key2_x + 31, menu_y_remap_key_crouch + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Crouch 2 Conflict END*/
			#region /*Crouch Toggle 2 Conflict*/
			if (remapping_player_key2_crouch_toggle = remapping_player_key_dive)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_jump)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_left)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_right)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_down)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_up)
			or(remapping_player_key2_crouch_toggle = remapping_player_key_tongue)
		
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_dive)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_jump)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_left)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_right)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_down)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_up)
			or(remapping_player_key2_crouch_toggle = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_crouch_toggle > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key2_x + 31, menu_y_remap_key_crouch_toggle + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_crouch_toggle = remapping_other1_player_key_dive)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_jump)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_left)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_right)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_down)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_up)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key_tongue)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_dive)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_jump)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_left)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_right)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_down)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_up)
			or(remapping_player_key2_crouch_toggle = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_dive)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_jump)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_left)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_right)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_down)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_up)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key_tongue)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_dive)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_jump)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_left)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_right)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_down)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_up)
			or(remapping_player_key2_crouch_toggle = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_dive)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_jump)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_left)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_right)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_down)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_up)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key_tongue)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_dive)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_jump)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_left)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_right)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_down)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_up)
			or(remapping_player_key2_crouch_toggle = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_crouch_toggle > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key2_x + 31, menu_y_remap_key_crouch_toggle + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Crouch Toggle 2 Conflict END*/
			#region /*Sprint 2 Conflict*/
			if (remapping_player_key2_sprint = remapping_player_key_dive)
			or(remapping_player_key2_sprint = remapping_player_key_jump)
			or(remapping_player_key2_sprint = remapping_player_key_crouch)
			or(remapping_player_key2_sprint = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_player_key_sprint)
			or(remapping_player_key2_sprint = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_player_key_left)
			or(remapping_player_key2_sprint = remapping_player_key_right)
			or(remapping_player_key2_sprint = remapping_player_key_down)
			or(remapping_player_key2_sprint = remapping_player_key_up)
			or(remapping_player_key2_sprint = remapping_player_key_tongue)
		
			or(remapping_player_key2_sprint = remapping_player_key2_dive)
			or(remapping_player_key2_sprint = remapping_player_key2_jump)
			or(remapping_player_key2_sprint = remapping_player_key2_crouch)
			or(remapping_player_key2_sprint = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_player_key2_left)
			or(remapping_player_key2_sprint = remapping_player_key2_right)
			or(remapping_player_key2_sprint = remapping_player_key2_down)
			or(remapping_player_key2_sprint = remapping_player_key2_up)
			or(remapping_player_key2_sprint = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_sprint > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key2_x + 31, menu_y_remap_key_sprint + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_sprint = remapping_other1_player_key_dive)
			or(remapping_player_key2_sprint = remapping_other1_player_key_jump)
			or(remapping_player_key2_sprint = remapping_other1_player_key_crouch)
			or(remapping_player_key2_sprint = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_other1_player_key_sprint)
			or(remapping_player_key2_sprint = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_other1_player_key_left)
			or(remapping_player_key2_sprint = remapping_other1_player_key_right)
			or(remapping_player_key2_sprint = remapping_other1_player_key_down)
			or(remapping_player_key2_sprint = remapping_other1_player_key_up)
			or(remapping_player_key2_sprint = remapping_other1_player_key_tongue)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_dive)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_jump)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_left)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_right)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_down)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_up)
			or(remapping_player_key2_sprint = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_sprint = remapping_other2_player_key_dive)
			or(remapping_player_key2_sprint = remapping_other2_player_key_jump)
			or(remapping_player_key2_sprint = remapping_other2_player_key_crouch)
			or(remapping_player_key2_sprint = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_other2_player_key_sprint)
			or(remapping_player_key2_sprint = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_other2_player_key_left)
			or(remapping_player_key2_sprint = remapping_other2_player_key_right)
			or(remapping_player_key2_sprint = remapping_other2_player_key_down)
			or(remapping_player_key2_sprint = remapping_other2_player_key_up)
			or(remapping_player_key2_sprint = remapping_other2_player_key_tongue)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_dive)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_jump)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_left)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_right)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_down)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_up)
			or(remapping_player_key2_sprint = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_sprint = remapping_other3_player_key_dive)
			or(remapping_player_key2_sprint = remapping_other3_player_key_jump)
			or(remapping_player_key2_sprint = remapping_other3_player_key_crouch)
			or(remapping_player_key2_sprint = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_other3_player_key_sprint)
			or(remapping_player_key2_sprint = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_other3_player_key_left)
			or(remapping_player_key2_sprint = remapping_other3_player_key_right)
			or(remapping_player_key2_sprint = remapping_other3_player_key_down)
			or(remapping_player_key2_sprint = remapping_other3_player_key_up)
			or(remapping_player_key2_sprint = remapping_other3_player_key_tongue)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_dive)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_jump)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_left)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_right)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_down)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_up)
			or(remapping_player_key2_sprint = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_sprint > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key2_x + 31, menu_y_remap_key_sprint + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Sprint 2 Conflict END*/
			#region /*Sprint Toggle 2 Conflict*/
			if (remapping_player_key2_sprint_toggle = remapping_player_key_dive)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_jump)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_left)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_right)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_down)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_up)
			or(remapping_player_key2_sprint_toggle = remapping_player_key_tongue)
		
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_dive)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_jump)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_left)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_right)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_down)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_up)
			or(remapping_player_key2_sprint_toggle = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_sprint_toggle > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key2_x + 31, menu_y_remap_key_sprint + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_sprint_toggle = remapping_other1_player_key_dive)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_jump)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_left)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_right)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_down)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_up)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key_tongue)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_dive)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_jump)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_left)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_right)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_down)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_up)
			or(remapping_player_key2_sprint_toggle = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_dive)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_jump)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_left)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_right)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_down)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_up)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key_tongue)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_dive)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_jump)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_left)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_right)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_down)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_up)
			or(remapping_player_key2_sprint_toggle = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_dive)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_jump)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_left)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_right)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_down)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_up)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key_tongue)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_dive)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_jump)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_left)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_right)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_down)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_up)
			or(remapping_player_key2_sprint_toggle = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_sprint_toggle > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key2_x + 31, menu_y_remap_key_sprint_toggle + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Sprint Toggle 2 Conflict END*/
			#region /*Left 2 Conflict*/
			if (remapping_player_key2_left = remapping_player_key_dive)
			or(remapping_player_key2_left = remapping_player_key_jump)
			or(remapping_player_key2_left = remapping_player_key_crouch)
			or(remapping_player_key2_left = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_left = remapping_player_key_sprint)
			or(remapping_player_key2_left = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_left = remapping_player_key_left)
			or(remapping_player_key2_left = remapping_player_key_right)
			or(remapping_player_key2_left = remapping_player_key_down)
			or(remapping_player_key2_left = remapping_player_key_up)
			or(remapping_player_key2_left = remapping_player_key_tongue)
		
			or(remapping_player_key2_left = remapping_player_key2_dive)
			or(remapping_player_key2_left = remapping_player_key2_jump)
			or(remapping_player_key2_left = remapping_player_key2_crouch)
			or(remapping_player_key2_left = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_left = remapping_player_key2_sprint)
			or(remapping_player_key2_left = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_left = remapping_player_key2_right)
			or(remapping_player_key2_left = remapping_player_key2_down)
			or(remapping_player_key2_left = remapping_player_key2_up)
			or(remapping_player_key2_left = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_left > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_left + menu_y_offset -32, key2_x + 31, menu_y_remap_key_left + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_left = remapping_other1_player_key_dive)
			or(remapping_player_key2_left = remapping_other1_player_key_jump)
			or(remapping_player_key2_left = remapping_other1_player_key_crouch)
			or(remapping_player_key2_left = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_left = remapping_other1_player_key_sprint)
			or(remapping_player_key2_left = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_left = remapping_other1_player_key_left)
			or(remapping_player_key2_left = remapping_other1_player_key_right)
			or(remapping_player_key2_left = remapping_other1_player_key_down)
			or(remapping_player_key2_left = remapping_other1_player_key_up)
			or(remapping_player_key2_left = remapping_other1_player_key_tongue)
			or(remapping_player_key2_left = remapping_other1_player_key2_dive)
			or(remapping_player_key2_left = remapping_other1_player_key2_jump)
			or(remapping_player_key2_left = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_left = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_left = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_left = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_left = remapping_other1_player_key2_left)
			or(remapping_player_key2_left = remapping_other1_player_key2_right)
			or(remapping_player_key2_left = remapping_other1_player_key2_down)
			or(remapping_player_key2_left = remapping_other1_player_key2_up)
			or(remapping_player_key2_left = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_left = remapping_other2_player_key_dive)
			or(remapping_player_key2_left = remapping_other2_player_key_jump)
			or(remapping_player_key2_left = remapping_other2_player_key_crouch)
			or(remapping_player_key2_left = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_left = remapping_other2_player_key_sprint)
			or(remapping_player_key2_left = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_left = remapping_other2_player_key_left)
			or(remapping_player_key2_left = remapping_other2_player_key_right)
			or(remapping_player_key2_left = remapping_other2_player_key_down)
			or(remapping_player_key2_left = remapping_other2_player_key_up)
			or(remapping_player_key2_left = remapping_other2_player_key_tongue)
			or(remapping_player_key2_left = remapping_other2_player_key2_dive)
			or(remapping_player_key2_left = remapping_other2_player_key2_jump)
			or(remapping_player_key2_left = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_left = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_left = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_left = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_left = remapping_other2_player_key2_left)
			or(remapping_player_key2_left = remapping_other2_player_key2_right)
			or(remapping_player_key2_left = remapping_other2_player_key2_down)
			or(remapping_player_key2_left = remapping_other2_player_key2_up)
			or(remapping_player_key2_left = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_left = remapping_other3_player_key_dive)
			or(remapping_player_key2_left = remapping_other3_player_key_jump)
			or(remapping_player_key2_left = remapping_other3_player_key_crouch)
			or(remapping_player_key2_left = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_left = remapping_other3_player_key_sprint)
			or(remapping_player_key2_left = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_left = remapping_other3_player_key_left)
			or(remapping_player_key2_left = remapping_other3_player_key_right)
			or(remapping_player_key2_left = remapping_other3_player_key_down)
			or(remapping_player_key2_left = remapping_other3_player_key_up)
			or(remapping_player_key2_left = remapping_other3_player_key_tongue)
			or(remapping_player_key2_left = remapping_other3_player_key2_dive)
			or(remapping_player_key2_left = remapping_other3_player_key2_jump)
			or(remapping_player_key2_left = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_left = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_left = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_left = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_left = remapping_other3_player_key2_left)
			or(remapping_player_key2_left = remapping_other3_player_key2_right)
			or(remapping_player_key2_left = remapping_other3_player_key2_down)
			or(remapping_player_key2_left = remapping_other3_player_key2_up)
			or(remapping_player_key2_left = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_left > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_left + menu_y_offset -32, key2_x + 31, menu_y_remap_key_left + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Left 2 Conflict END*/
			#region /*Right 2 Conflict*/
			if (remapping_player_key2_right = remapping_player_key_dive)
			or(remapping_player_key2_right = remapping_player_key_jump)
			or(remapping_player_key2_right = remapping_player_key_crouch)
			or(remapping_player_key2_right = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_right = remapping_player_key_sprint)
			or(remapping_player_key2_right = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_right = remapping_player_key_left)
			or(remapping_player_key2_right = remapping_player_key_right)
			or(remapping_player_key2_right = remapping_player_key_down)
			or(remapping_player_key2_right = remapping_player_key_up)
			or(remapping_player_key2_right = remapping_player_key_tongue)
		
			or(remapping_player_key2_right = remapping_player_key2_dive)
			or(remapping_player_key2_right = remapping_player_key2_jump)
			or(remapping_player_key2_right = remapping_player_key2_crouch)
			or(remapping_player_key2_right = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_right = remapping_player_key2_sprint)
			or(remapping_player_key2_right = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_right = remapping_player_key2_left)
			or(remapping_player_key2_right = remapping_player_key2_down)
			or(remapping_player_key2_right = remapping_player_key2_up)
			or(remapping_player_key2_right = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_right > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_right + menu_y_offset -32, key2_x + 31, menu_y_remap_key_right + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_right = remapping_other1_player_key_dive)
			or(remapping_player_key2_right = remapping_other1_player_key_jump)
			or(remapping_player_key2_right = remapping_other1_player_key_crouch)
			or(remapping_player_key2_right = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_right = remapping_other1_player_key_sprint)
			or(remapping_player_key2_right = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_right = remapping_other1_player_key_left)
			or(remapping_player_key2_right = remapping_other1_player_key_right)
			or(remapping_player_key2_right = remapping_other1_player_key_down)
			or(remapping_player_key2_right = remapping_other1_player_key_up)
			or(remapping_player_key2_right = remapping_other1_player_key_tongue)
			or(remapping_player_key2_right = remapping_other1_player_key2_dive)
			or(remapping_player_key2_right = remapping_other1_player_key2_jump)
			or(remapping_player_key2_right = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_right = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_right = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_right = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_right = remapping_other1_player_key2_left)
			or(remapping_player_key2_right = remapping_other1_player_key2_right)
			or(remapping_player_key2_right = remapping_other1_player_key2_down)
			or(remapping_player_key2_right = remapping_other1_player_key2_up)
			or(remapping_player_key2_right = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_right = remapping_other2_player_key_dive)
			or(remapping_player_key2_right = remapping_other2_player_key_jump)
			or(remapping_player_key2_right = remapping_other2_player_key_crouch)
			or(remapping_player_key2_right = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_right = remapping_other2_player_key_sprint)
			or(remapping_player_key2_right = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_right = remapping_other2_player_key_left)
			or(remapping_player_key2_right = remapping_other2_player_key_right)
			or(remapping_player_key2_right = remapping_other2_player_key_down)
			or(remapping_player_key2_right = remapping_other2_player_key_up)
			or(remapping_player_key2_right = remapping_other2_player_key_tongue)
			or(remapping_player_key2_right = remapping_other2_player_key2_dive)
			or(remapping_player_key2_right = remapping_other2_player_key2_jump)
			or(remapping_player_key2_right = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_right = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_right = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_right = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_right = remapping_other2_player_key2_left)
			or(remapping_player_key2_right = remapping_other2_player_key2_right)
			or(remapping_player_key2_right = remapping_other2_player_key2_down)
			or(remapping_player_key2_right = remapping_other2_player_key2_up)
			or(remapping_player_key2_right = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_right = remapping_other3_player_key_dive)
			or(remapping_player_key2_right = remapping_other3_player_key_jump)
			or(remapping_player_key2_right = remapping_other3_player_key_crouch)
			or(remapping_player_key2_right = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_right = remapping_other3_player_key_sprint)
			or(remapping_player_key2_right = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_right = remapping_other3_player_key_left)
			or(remapping_player_key2_right = remapping_other3_player_key_right)
			or(remapping_player_key2_right = remapping_other3_player_key_down)
			or(remapping_player_key2_right = remapping_other3_player_key_up)
			or(remapping_player_key2_right = remapping_other3_player_key_tongue)
			or(remapping_player_key2_right = remapping_other3_player_key2_dive)
			or(remapping_player_key2_right = remapping_other3_player_key2_jump)
			or(remapping_player_key2_right = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_right = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_right = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_right = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_right = remapping_other3_player_key2_left)
			or(remapping_player_key2_right = remapping_other3_player_key2_right)
			or(remapping_player_key2_right = remapping_other3_player_key2_down)
			or(remapping_player_key2_right = remapping_other3_player_key2_up)
			or(remapping_player_key2_right = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_right > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_right + menu_y_offset -32, key2_x + 31, menu_y_remap_key_right + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Right 2 Conflict END*/
			#region /*Down 2 Conflict*/
			if (remapping_player_key2_down = remapping_player_key_dive)
			or(remapping_player_key2_down = remapping_player_key_jump)
			or(remapping_player_key2_down = remapping_player_key_crouch)
			or(remapping_player_key2_down = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_down = remapping_player_key_sprint)
			or(remapping_player_key2_down = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_down = remapping_player_key_left)
			or(remapping_player_key2_down = remapping_player_key_right)
			or(remapping_player_key2_down = remapping_player_key_down)
			or(remapping_player_key2_down = remapping_player_key_up)
			or(remapping_player_key2_down = remapping_player_key_tongue)
		
			or(remapping_player_key2_down = remapping_player_key2_dive)
			or(remapping_player_key2_down = remapping_player_key2_jump)
			or(remapping_player_key2_down = remapping_player_key2_crouch)
			or(remapping_player_key2_down = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_down = remapping_player_key2_sprint)
			or(remapping_player_key2_down = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_down = remapping_player_key2_left)
			or(remapping_player_key2_down = remapping_player_key2_right)
			or(remapping_player_key2_down = remapping_player_key2_up)
			or(remapping_player_key2_down = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_down > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_down + menu_y_offset -32, key2_x + 31, menu_y_remap_key_down + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_down = remapping_other1_player_key_dive)
			or(remapping_player_key2_down = remapping_other1_player_key_jump)
			or(remapping_player_key2_down = remapping_other1_player_key_crouch)
			or(remapping_player_key2_down = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_down = remapping_other1_player_key_sprint)
			or(remapping_player_key2_down = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_down = remapping_other1_player_key_left)
			or(remapping_player_key2_down = remapping_other1_player_key_right)
			or(remapping_player_key2_down = remapping_other1_player_key_down)
			or(remapping_player_key2_down = remapping_other1_player_key_up)
			or(remapping_player_key2_down = remapping_other1_player_key_tongue)
			or(remapping_player_key2_down = remapping_other1_player_key2_dive)
			or(remapping_player_key2_down = remapping_other1_player_key2_jump)
			or(remapping_player_key2_down = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_down = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_down = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_down = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_down = remapping_other1_player_key2_left)
			or(remapping_player_key2_down = remapping_other1_player_key2_right)
			or(remapping_player_key2_down = remapping_other1_player_key2_down)
			or(remapping_player_key2_down = remapping_other1_player_key2_up)
			or(remapping_player_key2_down = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_down = remapping_other2_player_key_dive)
			or(remapping_player_key2_down = remapping_other2_player_key_jump)
			or(remapping_player_key2_down = remapping_other2_player_key_crouch)
			or(remapping_player_key2_down = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_down = remapping_other2_player_key_sprint)
			or(remapping_player_key2_down = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_down = remapping_other2_player_key_left)
			or(remapping_player_key2_down = remapping_other2_player_key_right)
			or(remapping_player_key2_down = remapping_other2_player_key_down)
			or(remapping_player_key2_down = remapping_other2_player_key_up)
			or(remapping_player_key2_down = remapping_other2_player_key_tongue)
			or(remapping_player_key2_down = remapping_other2_player_key2_dive)
			or(remapping_player_key2_down = remapping_other2_player_key2_jump)
			or(remapping_player_key2_down = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_down = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_down = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_down = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_down = remapping_other2_player_key2_left)
			or(remapping_player_key2_down = remapping_other2_player_key2_right)
			or(remapping_player_key2_down = remapping_other2_player_key2_down)
			or(remapping_player_key2_down = remapping_other2_player_key2_up)
			or(remapping_player_key2_down = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_down = remapping_other3_player_key_dive)
			or(remapping_player_key2_down = remapping_other3_player_key_jump)
			or(remapping_player_key2_down = remapping_other3_player_key_crouch)
			or(remapping_player_key2_down = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_down = remapping_other3_player_key_sprint)
			or(remapping_player_key2_down = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_down = remapping_other3_player_key_left)
			or(remapping_player_key2_down = remapping_other3_player_key_right)
			or(remapping_player_key2_down = remapping_other3_player_key_down)
			or(remapping_player_key2_down = remapping_other3_player_key_up)
			or(remapping_player_key2_down = remapping_other3_player_key_tongue)
			or(remapping_player_key2_down = remapping_other3_player_key2_dive)
			or(remapping_player_key2_down = remapping_other3_player_key2_jump)
			or(remapping_player_key2_down = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_down = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_down = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_down = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_down = remapping_other3_player_key2_left)
			or(remapping_player_key2_down = remapping_other3_player_key2_right)
			or(remapping_player_key2_down = remapping_other3_player_key2_down)
			or(remapping_player_key2_down = remapping_other3_player_key2_up)
			or(remapping_player_key2_down = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_down > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_down + menu_y_offset -32, key2_x + 31, menu_y_remap_key_down + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Down 2 Conflict END*/
			#region /*Up 2 Conflict*/
			if (remapping_player_key2_up = remapping_player_key_dive)
			or(remapping_player_key2_up = remapping_player_key_jump)
			or(remapping_player_key2_up = remapping_player_key_crouch)
			or(remapping_player_key2_up = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_up = remapping_player_key_sprint)
			or(remapping_player_key2_up = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_up = remapping_player_key_left)
			or(remapping_player_key2_up = remapping_player_key_right)
			or(remapping_player_key2_up = remapping_player_key_down)
			or(remapping_player_key2_up = remapping_player_key_up)
			or(remapping_player_key2_up = remapping_player_key_tongue)
		
			or(remapping_player_key2_up = remapping_player_key2_dive)
			or(remapping_player_key2_up = remapping_player_key2_jump)
			or(remapping_player_key2_up = remapping_player_key2_crouch)
			or(remapping_player_key2_up = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_up = remapping_player_key2_sprint)
			or(remapping_player_key2_up = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_up = remapping_player_key2_left)
			or(remapping_player_key2_up = remapping_player_key2_right)
			or(remapping_player_key2_up = remapping_player_key2_down)
			or(remapping_player_key2_up = remapping_player_key2_tongue)
			{
				if (remapping_player_key2_up > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_up + menu_y_offset -32, key2_x + 31, menu_y_remap_key_up + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_up = remapping_other1_player_key_dive)
			or(remapping_player_key2_up = remapping_other1_player_key_jump)
			or(remapping_player_key2_up = remapping_other1_player_key_crouch)
			or(remapping_player_key2_up = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_up = remapping_other1_player_key_sprint)
			or(remapping_player_key2_up = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_up = remapping_other1_player_key_left)
			or(remapping_player_key2_up = remapping_other1_player_key_right)
			or(remapping_player_key2_up = remapping_other1_player_key_down)
			or(remapping_player_key2_up = remapping_other1_player_key_up)
			or(remapping_player_key2_up = remapping_other1_player_key_tongue)
			or(remapping_player_key2_up = remapping_other1_player_key2_dive)
			or(remapping_player_key2_up = remapping_other1_player_key2_jump)
			or(remapping_player_key2_up = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_up = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_up = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_up = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_up = remapping_other1_player_key2_left)
			or(remapping_player_key2_up = remapping_other1_player_key2_right)
			or(remapping_player_key2_up = remapping_other1_player_key2_down)
			or(remapping_player_key2_up = remapping_other1_player_key2_up)
			or(remapping_player_key2_up = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_up = remapping_other2_player_key_dive)
			or(remapping_player_key2_up = remapping_other2_player_key_jump)
			or(remapping_player_key2_up = remapping_other2_player_key_crouch)
			or(remapping_player_key2_up = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_up = remapping_other2_player_key_sprint)
			or(remapping_player_key2_up = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_up = remapping_other2_player_key_left)
			or(remapping_player_key2_up = remapping_other2_player_key_right)
			or(remapping_player_key2_up = remapping_other2_player_key_down)
			or(remapping_player_key2_up = remapping_other2_player_key_up)
			or(remapping_player_key2_up = remapping_other2_player_key_tongue)
			or(remapping_player_key2_up = remapping_other2_player_key2_dive)
			or(remapping_player_key2_up = remapping_other2_player_key2_jump)
			or(remapping_player_key2_up = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_up = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_up = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_up = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_up = remapping_other2_player_key2_left)
			or(remapping_player_key2_up = remapping_other2_player_key2_right)
			or(remapping_player_key2_up = remapping_other2_player_key2_down)
			or(remapping_player_key2_up = remapping_other2_player_key2_up)
			or(remapping_player_key2_up = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_up = remapping_other3_player_key_dive)
			or(remapping_player_key2_up = remapping_other3_player_key_jump)
			or(remapping_player_key2_up = remapping_other3_player_key_crouch)
			or(remapping_player_key2_up = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_up = remapping_other3_player_key_sprint)
			or(remapping_player_key2_up = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_up = remapping_other3_player_key_left)
			or(remapping_player_key2_up = remapping_other3_player_key_right)
			or(remapping_player_key2_up = remapping_other3_player_key_down)
			or(remapping_player_key2_up = remapping_other3_player_key_up)
			or(remapping_player_key2_up = remapping_other3_player_key_tongue)
			or(remapping_player_key2_up = remapping_other3_player_key2_dive)
			or(remapping_player_key2_up = remapping_other3_player_key2_jump)
			or(remapping_player_key2_up = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_up = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_up = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_up = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_up = remapping_other3_player_key2_left)
			or(remapping_player_key2_up = remapping_other3_player_key2_right)
			or(remapping_player_key2_up = remapping_other3_player_key2_down)
			or(remapping_player_key2_up = remapping_other3_player_key2_up)
			or(remapping_player_key2_up = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_up > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_up + menu_y_offset -32, key2_x + 31, menu_y_remap_key_up + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Up 2 Conflict END*/
			#region /*Tongue 2 Conflict*/
			if (remapping_player_key2_tongue = remapping_player_key_dive)
			or(remapping_player_key2_tongue = remapping_player_key_jump)
			or(remapping_player_key2_tongue = remapping_player_key_crouch)
			or(remapping_player_key2_tongue = remapping_player_key_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_player_key_sprint)
			or(remapping_player_key2_tongue = remapping_player_key_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_player_key_left)
			or(remapping_player_key2_tongue = remapping_player_key_right)
			or(remapping_player_key2_tongue = remapping_player_key_down)
			or(remapping_player_key2_tongue = remapping_player_key_up)
			or(remapping_player_key2_tongue = remapping_player_key_tongue)
		
			or(remapping_player_key2_tongue = remapping_player_key2_dive)
			or(remapping_player_key2_tongue = remapping_player_key2_jump)
			or(remapping_player_key2_tongue = remapping_player_key2_crouch)
			or(remapping_player_key2_tongue = remapping_player_key2_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_player_key2_sprint)
			or(remapping_player_key2_tongue = remapping_player_key2_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_player_key2_left)
			or(remapping_player_key2_tongue = remapping_player_key2_right)
			or(remapping_player_key2_tongue = remapping_player_key2_down)
			or(remapping_player_key2_tongue = remapping_player_key2_up)
			{
				if (remapping_player_key2_tongue > 0)
				{
					draw_set_alpha(0.25);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key2_x + 31, menu_y_remap_key_tongue + menu_y_offset + 31, c_yellow, c_yellow, false);
					draw_set_alpha(1);
				}
			}
			if (remapping_player_key2_tongue = remapping_other1_player_key_dive)
			or(remapping_player_key2_tongue = remapping_other1_player_key_jump)
			or(remapping_player_key2_tongue = remapping_other1_player_key_crouch)
			or(remapping_player_key2_tongue = remapping_other1_player_key_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_other1_player_key_sprint)
			or(remapping_player_key2_tongue = remapping_other1_player_key_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_other1_player_key_left)
			or(remapping_player_key2_tongue = remapping_other1_player_key_right)
			or(remapping_player_key2_tongue = remapping_other1_player_key_down)
			or(remapping_player_key2_tongue = remapping_other1_player_key_up)
			or(remapping_player_key2_tongue = remapping_other1_player_key_tongue)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_dive)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_jump)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_crouch)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_sprint)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_left)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_right)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_down)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_up)
			or(remapping_player_key2_tongue = remapping_other1_player_key2_tongue)
			or(remapping_player_key2_tongue = remapping_other2_player_key_dive)
			or(remapping_player_key2_tongue = remapping_other2_player_key_jump)
			or(remapping_player_key2_tongue = remapping_other2_player_key_crouch)
			or(remapping_player_key2_tongue = remapping_other2_player_key_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_other2_player_key_sprint)
			or(remapping_player_key2_tongue = remapping_other2_player_key_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_other2_player_key_left)
			or(remapping_player_key2_tongue = remapping_other2_player_key_right)
			or(remapping_player_key2_tongue = remapping_other2_player_key_down)
			or(remapping_player_key2_tongue = remapping_other2_player_key_up)
			or(remapping_player_key2_tongue = remapping_other2_player_key_tongue)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_dive)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_jump)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_crouch)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_sprint)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_left)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_right)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_down)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_up)
			or(remapping_player_key2_tongue = remapping_other2_player_key2_tongue)
			or(remapping_player_key2_tongue = remapping_other3_player_key_dive)
			or(remapping_player_key2_tongue = remapping_other3_player_key_jump)
			or(remapping_player_key2_tongue = remapping_other3_player_key_crouch)
			or(remapping_player_key2_tongue = remapping_other3_player_key_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_other3_player_key_sprint)
			or(remapping_player_key2_tongue = remapping_other3_player_key_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_other3_player_key_left)
			or(remapping_player_key2_tongue = remapping_other3_player_key_right)
			or(remapping_player_key2_tongue = remapping_other3_player_key_down)
			or(remapping_player_key2_tongue = remapping_other3_player_key_up)
			or(remapping_player_key2_tongue = remapping_other3_player_key_tongue)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_dive)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_jump)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_crouch)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_crouch_toggle)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_sprint)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_sprint_toggle)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_left)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_right)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_down)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_up)
			or(remapping_player_key2_tongue = remapping_other3_player_key2_tongue)
			{
				if (remapping_player_key2_tongue > 0)
				{
					draw_set_alpha(0.5);
					draw_roundrect_color(key2_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key2_x + 31, menu_y_remap_key_tongue + menu_y_offset + 31, c_red, c_red, false);
					draw_set_alpha(1);
				}
			}
			#endregion /*Tongue 2 Conflict END*/
		
			#endregion /*Key 2 Conflicts END*/
		
			#endregion /*Make keys red if in conflict with other keys END*/
		
			#endregion /*Show the keys for every player END*/
		
		}
		#endregion /*Show what key is used END*/
		
		#region /*All the keys you can remap*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
	
		#region /*Mouse Navigation*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_dive + menu_y_offset -32, key1_x + 32, menu_y_remap_key_dive + menu_y_offset + 32))and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_dive";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_jump + menu_y_offset -32, key1_x + 32, menu_y_remap_key_jump + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_jump";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key1_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key1_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch_toggle";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key1_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key1_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint_toggle";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_left + menu_y_offset -32, key1_x + 32, menu_y_remap_key_left + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_left";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_right + menu_y_offset -32, key1_x + 32, menu_y_remap_key_right + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_right";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_down + menu_y_offset -32, key1_x + 32, menu_y_remap_key_down + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_down";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_up + menu_y_offset -32, key1_x + 32, menu_y_remap_key_up + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_up";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key1_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_tongue";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
	
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_dive + menu_y_offset -32, key2_x + 32, menu_y_remap_key_dive + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_dive";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_jump + menu_y_offset -32, key2_x + 32, menu_y_remap_key_jump + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_jump";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key2_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key2_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch_toggle";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key2_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key2_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint_toggle";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_left + menu_y_offset -32, key2_x + 32, menu_y_remap_key_left + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_left";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_right + menu_y_offset -32, key2_x + 32, menu_y_remap_key_right + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_right";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_down + menu_y_offset -32, key2_x + 32, menu_y_remap_key_down + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_down";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_up + menu_y_offset -32, key2_x + 32, menu_y_remap_key_up + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_up";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key2_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_tongue";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
	
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_dive + menu_y_offset -32, key1_x + 32, menu_y_remap_key_dive + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_jump + menu_y_offset -32, key1_x + 32, menu_y_remap_key_jump + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key1_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key1_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key1_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key1_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_left + menu_y_offset -32, key1_x + 32, menu_y_remap_key_left + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_right + menu_y_offset -32, key1_x + 32, menu_y_remap_key_right + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_down + menu_y_offset -32, key1_x + 32, menu_y_remap_key_down + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_up + menu_y_offset -32, key1_x + 32, menu_y_remap_key_up + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key1_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32))
	
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_dive + menu_y_offset -32, key2_x + 32, menu_y_remap_key_dive + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_jump + menu_y_offset -32, key2_x + 32, menu_y_remap_key_jump + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_crouch + menu_y_offset -32, key2_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_crouch_toggle + menu_y_offset -32, key2_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_sprint + menu_y_offset -32, key2_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_sprint_toggle + menu_y_offset -32, key2_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_left + menu_y_offset -32, key2_x + 32, menu_y_remap_key_left + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_right + menu_y_offset -32, key2_x + 32, menu_y_remap_key_right + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_down + menu_y_offset -32, key2_x + 32, menu_y_remap_key_down + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_up + menu_y_offset -32, key2_x + 32, menu_y_remap_key_up + menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x -32, menu_y_remap_key_tongue + menu_y_offset -32, key2_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32))
		{
			if (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation = "mouse")
			and (menu_delay = 0)
			and (input_key = false)
			and (open_dropdown = false)
			{
				can_navigate_settings_sidebar = false;
				menu_delay = 3;
				input_key = true;
			}
		}
	
		if (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (menu_delay = 0)
		and (input_key = true)
		{
			can_navigate_settings_sidebar = false;
			menu_delay = 3;
			input_key = false;
		}
		#endregion /*Mouse Navigation END*/
	
		#region /*Remap Key Dive*/
		if (menu = "remap_key_dive")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_dive + menu_y_offset, 1, 1, 0, c_white, 1);
			menu_cursor_y_position = menu_y_remap_key_dive;
			draw_text_outlined(410, menu_y_remap_key_dive + menu_y_offset, Text("Dive"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			if (input_key = true)
			and (can_remap_key = false)
			{
				menu_delay = 3;
				scr_keyboardremapping();
			}
			else
			if (key_a_pressed)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				input_key = true;
			}
		}
		else
		{
			draw_text_outlined(410, menu_y_remap_key_dive + menu_y_offset, Text("Dive"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /*Remap Key Dive END*/
	
		#region /*Remap Key Jump*/
		if (menu = "remap_key_jump"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_jump + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_jump ;
		draw_text_outlined(410, menu_y_remap_key_jump + menu_y_offset, Text("Jump"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_jump + menu_y_offset, Text("Jump"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Jump END*/
	
		#region /*Remap Key Crouch*/
		if (menu = "remap_key_crouch"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_crouch + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_crouch;
		draw_text_outlined(410, menu_y_remap_key_crouch + menu_y_offset, Text("Crouch"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_crouch + menu_y_offset, Text("Crouch"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Crouch END*/
	
		#region /*Remap Key Crouch Toggle*/
		if (menu = "remap_key_crouch_toggle"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_crouch_toggle;
		draw_text_outlined(410, menu_y_remap_key_crouch_toggle + menu_y_offset, Text("Crouch Toggle"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_crouch_toggle + menu_y_offset, Text("Crouch Toggle"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Crouch Toggle END*/
	
		#region /*Remap Key Sprint*/
		if (menu = "remap_key_sprint"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_sprint + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_sprint;
		draw_text_outlined(410, menu_y_remap_key_sprint + menu_y_offset, Text("Sprint"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_sprint + menu_y_offset, Text("Sprint"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Sprint END*/
	
		#region /*Remap Key Sprint Toggle*/
		if (menu = "remap_key_sprint_toggle"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_sprint_toggle;
		draw_text_outlined(410, menu_y_remap_key_sprint_toggle + menu_y_offset, Text("Sprint Toggle"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_sprint_toggle + menu_y_offset, Text("Sprint Toggle"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Sprint Toggle END*/
	
		#region /*Remap Key Left*/
		if (menu = "remap_key_left"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_left + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_left;
		draw_text_outlined(410, menu_y_remap_key_left + menu_y_offset, Text("Left"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_left + menu_y_offset, Text("Left"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Left END*/
	
		#region /*Remap Key Right*/
		if (menu = "remap_key_right"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_right + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_right;
		draw_text_outlined(410, menu_y_remap_key_right + menu_y_offset, Text("Right"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_right + menu_y_offset, Text("Right"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Right END*/
	
		#region /*Remap Key Down*/
		if (menu = "remap_key_down"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_down + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_down;
		draw_text_outlined(410, menu_y_remap_key_down + menu_y_offset, Text("Down"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_down + menu_y_offset, Text("Down"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Down END*/
	
		#region /*Remap Key Up*/
		if (menu = "remap_key_up"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_up + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_up;
		draw_text_outlined(410, menu_y_remap_key_up + menu_y_offset, Text("Up"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_up + menu_y_offset, Text("Up"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Up END*/
	
		#region /*Remap Key Tongue*/
		if (menu = "remap_key_tongue"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_tongue + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_tongue;
		draw_text_outlined(410, menu_y_remap_key_tongue + menu_y_offset, Text("Tongue"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3; input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_tongue + menu_y_offset, Text("Tongue"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Up END*/
	
		#endregion /*All the keys you can remap END*/
		
		#region /*Reset to Default Settings*/
		draw_menu_button(430, menu_y_remap_reset + menu_y_offset, Text("Default Settings"), "remap_reset", "remap_reset");
	
		if (menu = "remap_reset")
		{
			menu_cursor_y_position = menu_y_remap_reset;
			if (key_a_pressed)
			and (menu_delay = 0)
			or(mouse_check_button_pressed(mb_left))
			and (window_mouse_get_x() > 370)
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 430, menu_y_remap_reset + menu_y_offset + 1, 430 + 370, menu_y_remap_reset + menu_y_offset + 41))
			and (global.controls_used_for_menu_navigation = "mouse")
			and (menu_delay = 0)
			{
		
				#region /*Reset Player 1 Keyboard Remapping*/
				if (remapping_player = 0)
				{
					image_speed = 0;
				
					#region /*Player 1 Key 1 defaults*/
					global.player1_key_dive = ord("X");
					global.player1_key_jump = ord("Z");
					global.player1_key_crouch = vk_down;
					global.player1_key_crouch_toggle = noone;
					global.player1_key_sprint = vk_lcontrol;
					global.player1_key_sprint_toggle = 20;
					global.player1_key_left = vk_left;
					global.player1_key_right = vk_right;
					global.player1_key_down = vk_down;
					global.player1_key_up = vk_up;
					global.player1_key_tongue = noone;
					#endregion /*Player 1 Key 1 defaults END*/
				
					#region /*Player 1 Key 2 defaults*/
					global.player1_key2_dive = noone;
					global.player1_key2_jump = vk_space;
					global.player1_key2_crouch = vk_shift;
					global.player1_key2_crouch_toggle = noone;
					global.player1_key2_sprint = ord("X");
					global.player1_key2_sprint_toggle = noone;
					global.player1_key2_left = ord("A");
					global.player1_key2_right = ord("D");
					global.player1_key2_down = ord("S");
					global.player1_key2_up = ord("W");
					global.player1_key2_tongue = noone;
					#endregion /*Player 1 Key 2 defaults END*/
				
					global.player1_up_key_is_jump_key = false;
					global.player1_double_tap_to_run = true;
					global.player1_sprint_toggle = false;
					global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;
					global.player1_cancel_dive_by_pressing_opposite_direction = false;
					global.player1_down_and_jump_to_groundpound = false;
					global.player1_wall_jump_setting = 1;
					global.player1_drop_from_rope = 1;
					global.player1_show_controls = 1;
				}
				#endregion /*Reset Player 1 Keyboard Remapping END*/
	
				else
	
				#region /*Reset Player 2 Keyboard Remapping*/
				if (remapping_player = 1)
				{
					image_speed = 0;
				
					#region /*Player 2 Key 1 defaults*/
					global.player2_key_dive = noone;
					global.player2_key_jump = noone;
					global.player2_key_crouch = noone;
					global.player2_key_crouch_toggle = noone;
					global.player2_key_sprint = noone;
					global.player2_key_sprint_toggle = noone;
					global.player2_key_left = noone;
					global.player2_key_right = noone;
					global.player2_key_down = noone;
					global.player2_key_up = noone;
					global.player2_key_tongue = noone;
					#endregion /*Player 2 Key 1 defaults END*/
				
					#region /*Player 2 Key 2 defaults*/
					global.player2_key2_dive = noone;
					global.player2_key2_jump = noone;
					global.player2_key2_crouch = noone;
					global.player2_key2_crouch_toggle = noone;
					global.player2_key2_sprint = noone;
					global.player2_key2_sprint_toggle = noone;
					global.player2_key2_left = noone;
					global.player2_key2_right = noone;
					global.player2_key2_down = noone;
					global.player2_key2_up = noone;
					global.player2_key2_tongue = noone;
					#endregion /*Player 2 Key 2 defaults END*/
				
					global.player2_up_key_is_jump_key = false;
					global.player2_double_tap_to_run = true;
					global.player2_sprint_toggle = false;
					global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;
					global.player2_cancel_dive_by_pressing_opposite_direction = false;
					global.player2_down_and_jump_to_groundpound = false;
					global.player2_wall_jump_setting = 1;
					global.player2_drop_from_rope = 1;
					global.player2_show_controls = 1;
				}
				#endregion /*Reset Player 2 Keyboard Remapping END*/
	
				else
	
				#region /*Reset Player 3 Keyboard Remapping*/
				if (remapping_player = 2)
				{
					image_speed = 0;
				
					#region /*Player 3 Key 1 defaults*/
					global.player3_key_dive = noone;
					global.player3_key_jump = noone;
					global.player3_key_crouch = noone;
					global.player3_key_crouch_toggle = noone;
					global.player3_key_sprint = noone;
					global.player3_key_sprint_toggle = noone;
					global.player3_key_left = noone;
					global.player3_key_right = noone;
					global.player3_key_down = noone;
					global.player3_key_up = noone;
					global.player3_key_tongue = noone;
					#endregion /*Player 3 Key 1 defaults END*/
				
					#region /*Player 3 Key 2 defaults*/
					global.player3_key2_dive = noone;
					global.player3_key2_jump = noone;
					global.player3_key2_crouch = noone;
					global.player3_key2_crouch_toggle = noone;
					global.player3_key2_sprint = noone;
					global.player3_key2_sprint_toggle = noone;
					global.player3_key2_left = noone;
					global.player3_key2_right = noone;
					global.player3_key2_down = noone;
					global.player3_key2_up = noone;
					global.player3_key2_tongue = noone;
					#endregion /*Player 3 Key 2 defaults END*/
				
					global.player3_up_key_is_jump_key = false;
					global.player3_double_tap_to_run = true;
					global.player3_sprint_toggle = false;
					global.player3_cancel_dive_by_pressing_jump_or_dive_button = false;
					global.player3_cancel_dive_by_pressing_opposite_direction = false;
					global.player3_down_and_jump_to_groundpound = false;
					global.player3_wall_jump_setting = 1;
					global.player3_drop_from_rope = 1;
					global.player3_show_controls = 1;
				}
				#endregion /*Reset Player 3 Keyboard Remapping END*/
	
				else
	
				#region /*Reset Player 4 Keyboard Remapping*/
				if (remapping_player = 3)
				{
					image_speed = 0;
				
					#region /*Player 4 Key 1 defaults*/
					global.player4_key_dive = noone;
					global.player4_key_jump = noone;
					global.player4_key_crouch = noone;
					global.player4_key_crouch_toggle = noone;
					global.player4_key_sprint = noone;
					global.player4_key_sprint_toggle = noone;
					global.player4_key_left = noone;
					global.player4_key_right = noone;
					global.player4_key_down = noone;
					global.player4_key_up = noone;
					global.player4_key_tongue = noone;
					#endregion /*Player 4 Key 1 defaults END*/
				
					#region /*Player 4 Key 2 defaults*/
					global.player4_key2_dive = noone;
					global.player4_key2_jump = noone;
					global.player4_key2_crouch = noone;
					global.player4_key2_crouch_toggle = noone;
					global.player4_key2_sprint = noone;
					global.player4_key2_sprint_toggle = noone;
					global.player4_key2_left = noone;
					global.player4_key2_right = noone;
					global.player4_key2_down = noone;
					global.player4_key2_up = noone;
					global.player4_key2_tongue = noone;
					#endregion /*Player 4 Key 2 defaults END*/
				
					global.player4_up_key_is_jump_key = false;
					global.player4_double_tap_to_run = true;
					global.player4_sprint_toggle = false;
					global.player4_cancel_dive_by_pressing_jump_or_dive_button = false;
					global.player4_cancel_dive_by_pressing_opposite_direction = false;
					global.player4_down_and_jump_to_groundpound = false;
					global.player4_wall_jump_setting = 1;
					global.player4_drop_from_rope = 1;
					global.player4_show_controls = 1;
				}
				#endregion /*Reset Player 4 Keyboard Remapping END*/
	
				menu_delay = 3;
			}
		}
		#endregion /*Reset to Default Settings END*/
		
		#region /*Keyboards Controls Remapping Navigation*/
	
		if (menu_joystick_delay <= 0)
		{
	
			#region /*Remap key dive*/
			if (menu = "remap_key_dive")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_select_player";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_jump";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key dive END*/
	
			else
	
			#region /*Remap key jump*/
			if (menu = "remap_key_jump")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_dive";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_crouch";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key jump END*/
	
			else
	
			#region /*Remap key crouch*/
			if (menu = "remap_key_crouch")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_jump";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_crouch_toggle";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key crouch END*/
	
			else
	
			#region /*Remap key crouch toggle*/
			if (menu = "remap_key_crouch_toggle")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_crouch";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_sprint";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key crouch toggle END*/
	
			else
	
			#region /*Remap key sprint*/
			if (menu = "remap_key_sprint")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_crouch_toggle";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_sprint_toggle";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key sprint END*/
	
			else
	
			#region /*Remap key sprint toggle*/
			if (menu = "remap_key_sprint_toggle")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_sprint";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_left";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key sprint toggle END*/
	
			else
	
			#region /*Remap key left*/
			if (menu = "remap_key_left")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_sprint_toggle";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_right";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key left END*/
	
			else
	
			#region /*Remap key right*/
			if (menu = "remap_key_right")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_left";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_down";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key right END*/
	
			else
	
			#region /*Remap key down*/
			if (menu = "remap_key_down")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_right";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_up";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key down END*/
	
			else
	
			#region /*Remap key up*/
			if (menu = "remap_key_up")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_down";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_tongue";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key up END*/
	
			else
	
			#region /*Remap Key Tongue*/
			if (menu = "remap_key_tongue")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_up";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_reset";
					menu_delay = 3;
				}
			}
			#endregion /*Remap Key Tongue END*/
	
			else
	
			#region /*Remap reset*/
			if (menu = "remap_reset")
			and (can_remap_key = false)
			and (input_key = false)
			and (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				if (key_up)
				{
					menu = "remap_key_tongue";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "up_key_is_jump_key";
					menu_delay = 3;
				}
			}
			#endregion /*Remap reset END*/
	
			#region /*Menu remap key number*/
			if (menu = "remap_key_dive")
			or(menu = "remap_key_jump")
			or(menu = "remap_key_crouch")
			or(menu = "remap_key_crouch_toggle")
			or(menu = "remap_key_sprint")
			or(menu = "remap_key_sprint_toggle")
			or(menu = "remap_key_left")
			or(menu = "remap_key_right")
			or(menu = "remap_key_down")
			or(menu = "remap_key_up")
			or(menu = "remap_key_tongue")
			{
				if (key_left)
				and (can_remap_key = false)
				and (input_key = false)
				and (menu_delay = 0)
				and (menu_joystick_delay = 0)
				or(key_right)
				and (can_remap_key = false)
				and (input_key = false)
				and (menu_delay = 0)
				and (menu_joystick_delay = 0)
				{
					if (menu_remap_key_number = 0)
					{
						menu_remap_key_number = 2;
						menu_delay = 3;
					}
					else
					if (menu_remap_key_number = 2)
					{
						menu_remap_key_number = 0;
						menu_delay = 3;
					}
				}
			}
			#endregion /*Menu remap key number*/
	
		}
	
		#endregion /*Keyboards Controls Remapping Navigation END*/
		
		#endregion /*Remap Keyboard and Mouse END*/
		
		#region /*Up Key Is Jump Key*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, Text("Up key is jump key"), "up_key_is_jump_key", global.player1_up_key_is_jump_key);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, Text("Up key is jump key"), "up_key_is_jump_key", global.player2_up_key_is_jump_key);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, Text("Up key is jump key"), "up_key_is_jump_key", global.player3_up_key_is_jump_key);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, Text("Up key is jump key"), "up_key_is_jump_key", global.player4_up_key_is_jump_key);
		}
		#endregion /*Up Key Is Jump Key END*/
		
		#region /*Double-tap direction to run*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, Text("Double-tap direction to run"), "double_tap_to_run", global.player1_double_tap_to_run);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, Text("Double-tap direction to run"), "double_tap_to_run", global.player2_double_tap_to_run);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, Text("Double-tap direction to run"), "double_tap_to_run", global.player3_double_tap_to_run);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, Text("Double-tap direction to run"), "double_tap_to_run", global.player4_double_tap_to_run);
		}
		#endregion /*Double-tap direction to run END*/
		
		#region /*Always run*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, Text("Always run"), "always_run", global.player1_sprint_toggle);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, Text("Always run"), "always_run", global.player2_sprint_toggle);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, Text("Always run"), "always_run", global.player3_sprint_toggle);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, Text("Always run"), "always_run", global.player4_sprint_toggle);
		}
		#endregion /*Always run END*/
		
		#region /*Cancel dive by pressing the jump or dive key*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, Text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player1_cancel_dive_by_pressing_jump_or_dive_button);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, Text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, Text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player3_cancel_dive_by_pressing_jump_or_dive_button);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, Text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player4_cancel_dive_by_pressing_jump_or_dive_button);
		}
		#endregion /*Cancel dive by pressing the jump or dive key END*/
		
		#region /*Cancel dive by pressing the opposite direction*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, Text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player1_cancel_dive_by_pressing_opposite_direction);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, Text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, Text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player3_cancel_dive_by_pressing_opposite_direction);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, Text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player4_cancel_dive_by_pressing_opposite_direction);
		}
		#endregion /*Cancel dive by pressing the opposite direction END*/
		
		#region /*Down + Jump to Ground Pound*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, Text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player1_down_and_jump_to_groundpound);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, Text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player2_down_and_jump_to_groundpound);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, Text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player3_down_and_jump_to_groundpound);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, Text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player4_down_and_jump_to_groundpound);
		}
		#endregion /*Down + Jump to Ground Pound END*/
		
		#region /*Show Controls*/
		if (os_type!= os_ios)
		and (os_type!= os_android)
		{
			if (remapping_player = 0)
			{
				draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, Text("Show Controls"), "show_controls", global.player1_show_controls, Text("Never Show"), Text("After 1 Second"), Text("After 2 Seconds"), Text("After 3 Seconds"), Text("After 4 Seconds"), Text("After 5 Seconds"), Text("After 6 Seconds"), Text("After 7 Seconds"), Text("After 8 Seconds"), Text("After 9 Seconds"), Text("Always Show"));
			}
			if (remapping_player = 1)
			{
				draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, Text("Show Controls"), "show_controls", global.player2_show_controls, Text("Never Show"), Text("After 1 Second"), Text("After 2 Seconds"), Text("After 3 Seconds"), Text("After 4 Seconds"), Text("After 5 Seconds"), Text("After 6 Seconds"), Text("After 7 Seconds"), Text("After 8 Seconds"), Text("After 9 Seconds"), Text("Always Show"));
			}
	
			if (remapping_player = 2)
			{
				draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, Text("Show Controls"), "show_controls", global.player3_show_controls, Text("Never Show"), Text("After 1 Second"), Text("After 2 Seconds"), Text("After 3 Seconds"), Text("After 4 Seconds"), Text("After 5 Seconds"), Text("After 6 Seconds"), Text("After 7 Seconds"), Text("After 8 Seconds"), Text("After 9 Seconds"), Text("Always Show"));
			}
	
			if (remapping_player = 3)
			{
				draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, Text("Show Controls"), "show_controls", global.player4_show_controls, Text("Never Show"), Text("After 1 Second"), Text("After 2 Seconds"), Text("After 3 Seconds"), Text("After 4 Seconds"), Text("After 5 Seconds"), Text("After 6 Seconds"), Text("After 7 Seconds"), Text("After 8 Seconds"), Text("After 9 Seconds"), Text("Always Show"));
			}
			if (menu = "show_controls")
			{
				menu_cursor_y_position = menu_y_show_controls + 132;
			}
		}
		#endregion /*Show Controls END*/
		
		#region /*Drop down from Rope*/
		if (remapping_player = 0)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, Text("Drop down from rope"), "drop_from_rope", global.player1_drop_from_rope, Text("Release Jump"), Text("Down or Jump"), Text("Only Down"), Text("Only Jump"), Text("Down + Jump"));
		}
	
		if (remapping_player = 1)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, Text("Drop down from rope"), "drop_from_rope", global.player2_drop_from_rope, Text("Release Jump"), Text("Down or Jump"), Text("Only Down"), Text("Only Jump"), Text("Down + Jump"));
		}
	
		if (remapping_player = 2)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, Text("Drop down from rope"), "drop_from_rope", global.player3_drop_from_rope, Text("Release Jump"), Text("Down or Jump"), Text("Only Down"), Text("Only Jump"), Text("Down + Jump"));
		}
	
		if (remapping_player = 3)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, Text("Drop down from rope"), "drop_from_rope", global.player4_drop_from_rope, Text("Release Jump"), Text("Down or Jump"), Text("Only Down"), Text("Only Jump"), Text("Down + Jump"));
		}
		if (menu = "drop_from_rope")
		{
			menu_cursor_y_position = menu_y_drop_down_from_rope;
		}
		#endregion /*Drop down from Rope END*/
		
		#region /*Wall Jump Setting*/
		if (remapping_player = 0)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, Text("Wall Jump"), "wall_jump_setting", global.player1_wall_jump_setting, Text("Off"), Text("When touching wall"), Text("When holding towards the wall"));
		}
	
		if (remapping_player = 1)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, Text("Wall Jump"), "wall_jump_setting", global.player2_wall_jump_setting, Text("Off"), Text("When touching wall"), Text("When holding towards the wall"));
		}
	
		if (remapping_player = 2)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, Text("Wall Jump"), "wall_jump_setting", global.player3_wall_jump_setting, Text("Off"), Text("When touching wall"), Text("When holding towards the wall"));
		}
	
		if (remapping_player = 3)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, Text("Wall Jump"), "wall_jump_setting", global.player4_wall_jump_setting, Text("Off"), Text("When touching wall"), Text("When holding towards the wall"));
		}
		if (menu = "wall_jump_setting")
		{
			menu_cursor_y_position = menu_y_wall_jump_setting;
		}
		#endregion /*Wall Jump Settings END*/
		
		draw_menu_dropdown(390, 50 + menu_y_offset, Text("Remap This Player"), "remap_select_player", remapping_player, Text("Player 1"), Text("Player 2"), Text("Player 3"), Text("Player 4")); /*Remap Select Player - Which player do you want to remap the controls for?*/
		
		#region /*Show the player when they can input a key to remap controls*/
		if (input_key = true)
		{
			draw_set_alpha(0.75);
			draw_rectangle_color(window_get_width()/ 2 - 232, 32 - 20, window_get_width()/ 2 + 232, 64 + 20, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		
			#region /*Text saying input key now for player 1*/
			if (remapping_player = 0)
			{
				draw_text_outlined(window_get_width()/ 2, 32, Text("INPUT KEY NOW FOR PLAYER 1"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2 - 10, 64, Text("Buttons can be disabled using"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width()/ 2 + 200, 64, 0.50, 0.50, 0, c_white, 1);
			}
			#endregion /*Text saying input key now for player 1 END*/
		
			#region /*Text saying input key now for player 2*/
			if (remapping_player = 1)
			{
				draw_text_outlined(window_get_width()/ 2, 32, Text("INPUT KEY NOW FOR PLAYER 2"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2 - 10, 64, Text("Buttons can be disabled using"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width()/ 2 + 200, 64, 0.50, 0.50, 0, c_white, 1);
			}
			#endregion /*Text saying input key now for player 2 END*/
		
			#region /*Text saying input key now for player 3*/
			if (remapping_player = 2)
			{
				draw_text_outlined(window_get_width()/ 2, 32, Text("INPUT KEY NOW FOR PLAYER 3"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2 - 10, 64, Text("Buttons can be disabled using"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width()/ 2 + 200, 64, 0.50, 0.50, 0, c_white, 1);
			}
			#endregion /*Text saying input key now for player 3 END*/
		
			#region /*Text saying input key now for player 4 */
			if (remapping_player = 3)
			{
				draw_text_outlined(window_get_width()/ 2, 32, Text("INPUT KEY NOW FOR PLAYER 4"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2 - 10, 64, Text("Buttons can be disabled using"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width()/ 2 + 200, 64, 0.50, 0.50, 0, c_white, 1);
			}
			#endregion /*Text saying input key now for player 4 END*/
		
		}
		#endregion /*Show the player when they can input a key to remap controls END*/
		
	}
	#endregion /*Controls Settings END*/
	
	#region /*General Settings*/
	
	#region /*Gameplay Settings*/
	if (menu = "players_can_collide")
	or(menu = "assist_settings")
	or(menu = "convention_mode")
	{
		if (menu = "show_tutorial_signs"){
		if (global.show_tutorial_signs = true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset +50, "> Show Tutorial Signs: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset +50, "> Show Tutorial Signs: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}}else
		if (global.show_tutorial_signs = true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset +50, "Show Tutorial Signs: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset +50, "Show Tutorial Signs: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
		if (menu = "players_can_collide"){
		if (global.players_can_collide = true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 110, "> Players can collide with each other: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 110, "> Players can collide with each other: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}}
		else
		if (global.players_can_collide = true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 110, "Players can collide with each other: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 110, "Players can collide with each other: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
		if (menu = "assist_settings")
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 140, "> Assist Settings <", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 140, "Assist Settings", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
		if (menu = "convention_mode")
		{
			if (global.convention_mode = true)
			{
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 170, "> Convention Mode: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
			}
			else
			{
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 170, "> Convention Mode: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
			}
		}
		else
		if (global.convention_mode = true)
		{
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 170, "Convention Mode: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 170, "Convention Mode: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
		}
	}
	#endregion /*Gameplay Settings END*/
	
	#region /*Profile Settings*/
	if (global.settings_sidebar_menu = "profile_settings")
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(410, 20 + (40 * 3), "Setup your profile here. \n Enter name here.", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /*Profile Settings END*/
	
	#region /*Graphics Settings*/
	if (global.settings_sidebar_menu = "video_settings")
	{
		
		#region /*Fullscreen toggle*/
		if (window_get_fullscreen())
		{
			draw_menu_checkmark(386, 48 + menu_y_offset, Text("Fullscreen"), "fullscreen_mode", true);
			if (global.controls_used_for_menu_navigation != "controller")
			and (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 386 + 57, 48 + 16 + menu_y_offset, 0.5, 0.5, 0, c_white, 1);
			}
		}
		else
		{
			draw_menu_checkmark(386, 48 + menu_y_offset, Text("Fullscreen"), "fullscreen_mode", false);
			if (global.controls_used_for_menu_navigation != "controller")
			and (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 386 + 57, 48 + 16 + menu_y_offset, 0.5, 0.5, 0, c_white, 1);
			}
		}
		#endregion /*Fullscreen toggle END*/
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		draw_menu_checkmark(386, 48 * 2 + menu_y_offset, Text("Interpolation"), "interpolate", global.interpolate);
		
		draw_menu_checkmark(386, 48 * 3 + menu_y_offset, Text("Show FPS"), "show_fps", global.show_fps);
		
		draw_menu_checkmark(386, 48 * 4 + menu_y_offset, Text("Show FPS Real"), "show_fps_real", global.show_fps_real);
		
		draw_menu_checkmark(386, 48 * 5 + menu_y_offset, Text("Show Instance Count"), "show_instance_count", global.show_instance_count);
		
		draw_menu_checkmark(386, 48 * 6 + menu_y_offset, Text("Show Collision Mask"), "show_collision_mask", global.show_collision_mask);
		
		draw_menu_checkmark(386, 48 * 7 + menu_y_offset, Text("Enable Transitions"), "enable_transitions", global.enable_transitions);
		
		draw_menu_checkmark(386, 48 * 8 + menu_y_offset, Text("Enable Background Layer 1"), "enable_background_layer1", global.enable_background_layer1);
		
		draw_menu_checkmark(386, 48 * 9 + menu_y_offset, Text("Enable Background Layer 2"), "enable_background_layer2", global.enable_background_layer2);
		
		draw_menu_checkmark(386, 48 * 10 + menu_y_offset, Text("Enable Background Layer 3"), "enable_background_layer3", global.enable_background_layer3);
		
		draw_menu_checkmark(386, 48 * 11 + menu_y_offset, Text("Enable Background Layer 4"), "enable_background_layer4", global.enable_background_layer4);
		
		draw_menu_checkmark(386, 48 * 12 + menu_y_offset, Text("Enable Foreground Layer 1"), "enable_foreground_layer1", global.enable_foreground_layer1);
		
		draw_menu_checkmark(386, 48 * 13 + menu_y_offset, Text("Enable Foreground Layer Above Static Objects"), "enable_foreground_layer_above_static_objects", global.enable_foreground_layer_above_static_objects);
		
		draw_menu_checkmark(386, 48 * 14 + menu_y_offset, Text("Enable Foreground Layer 2"), "enable_foreground_layer2", global.enable_foreground_layer2);
		
		draw_menu_checkmark(386, 48 * 15 + menu_y_offset, Text("Enable Foreground Layer Secret"), "enable_foreground_layer_secret", global.enable_foreground_layer_secret);
		
		#region /*Background Brightness Bars*/
		draw_menu_slider(420, 48 * 17 + menu_y_offset, Text("Background Brightness in Gameplay"), "background_brightness_gameplay", global.background_brightness_gameplay, c_gray);
		draw_menu_slider(420, 48 * 17 + 64 + menu_y_offset, Text("Background Brightness in Menus"), "background_brightness_menu", global.background_brightness_menu, c_gray);
		
		#region /*Draw a little arrow indicating what the default value is*/
		draw_set_color(c_menu_fill);
		draw_arrow(420 + 160, 48 * 17 - 20 + menu_y_offset, 420 + 160, 48 * 17 - 10 + menu_y_offset, 25);
		draw_arrow(420 + 160, 48 * 17 - 20 + 64 + menu_y_offset, 420 + 160, 48 * 17 - 10 + 64 + menu_y_offset, 25);
		#endregion /*Draw a little arrow indicating what the default value is END*/
		
		#endregion /*Background Brightness Bars END*/
		
		draw_menu_checkmark(386, 48 * 19 + menu_y_offset, Text("Reset Level Zoom When Going Back To Map"), "reset_level_zoom_when_going_back_to_map", global.reset_level_zoom_when_going_back_to_map);
		draw_menu_checkmark(386, 48 * 20 + menu_y_offset, Text("Reset World Map Zoom When Going Back To Map"), "reset_world_map_zoom_when_going_back_to_map", global.reset_world_map_zoom_when_going_back_to_map);
	}
	#endregion /*Graphics Settings END*/
	
	#region /*Audio Settings*/
	if (global.settings_sidebar_menu = "audio_settings")
	{
		
		#region /*Make volumes stay between 0 and 1*/
		if (global.main_volume < 0){global.main_volume = 0;}else
		if (global.main_volume > 1){global.main_volume = 1;}
		if (global.music_volume < 0){global.music_volume = 0;}else
		if (global.music_volume > 1){global.music_volume = 1;}
		if (global.sound_volume < 0){global.sound_volume = 0;}else
		if (global.sound_volume > 1){global.sound_volume = 1;}
		if (global.ambient_volume < 0){global.ambient_volume = 0;}else
		if (global.ambient_volume > 1){global.ambient_volume = 1;}
		if (global.footstep_volume < 0){global.footstep_volume = 0;}else
		if (global.footstep_volume > 1){global.footstep_volume = 1;}
		if (global.voices_volume < 0){global.voices_volume = 0;}else
		if (global.voices_volume > 1){global.voices_volume = 1;}
		if (global.verbosity_slider < 0){global.verbosity_slider = 0;}else
		if (global.verbosity_slider > 1){global.verbosity_slider = 1;}
		#endregion /*Make volumes stay between 0 and 1 END*/
		
		#region /*Draw bars that represent how much volume each channel have*/
		draw_menu_slider(410, 100, Text("Main Volume"), "main_volume", global.main_volume, c_red);
		draw_line_width_color(410, 132, 820, 132, 3, c_white, c_white);
		draw_menu_slider(410, 132 + (64), Text("Music Volume"), "music_volume", global.music_volume, c_red);
		draw_menu_slider(410, 132 + (64 * 2), Text("Sound Volume"), "sound_volume", global.sound_volume, c_lime);
		draw_menu_slider(410, 132 + (64 * 3), Text("Ambient Volume"), "ambient_volume", global.ambient_volume, c_lime);
		draw_menu_slider(410, 132 + (64 * 4), Text("Footstep Volume"), "footstep_volume", global.footstep_volume, c_lime);
		draw_menu_slider(410, 132 + (64 * 5), Text("Voices Volume"), "voices_volume", global.voices_volume, c_aqua);
		
		#region /*Verbosity Bar*/
		if (global.enable_verbosity_slider = true)
		{
			draw_menu_slider(410, 132 + (64 * 6), Text("Voices Volume"), "voices_volume", global.voices_volume, c_aqua);
		}
		#endregion /*Verbosity Bar END*/
		
		#endregion /*Draw bars that represent how much volume each channel have END*/
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		#region /*Select Narrator*/
		if (global.enable_narrator = true)
		{
			var file_select_x = 450;
			var file_select_right_arrow_x = 400;
			var narrator_y = 132 + (64 * 8);
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			if (global.narrator = -4)
			{
				global.narrator = -1;
			}
			
			if (menu = "select_narrator")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, narrator_y, 1, 1, 0, c_white, 1);
			}
			if (global.narrator <= -1)
			{
				draw_text_outlined(file_select_x, narrator_y, Text("Narrator") + " : " + Text("Nobody"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			}
			else
			if (global.narrator >= 0)
			{
				draw_text_outlined(file_select_x, narrator_y, Text("Narrator") + " : " + string(narrator_name), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			}
			
			if (global.narrator >= 0)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x -32, narrator_y, 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x -32 - 16, narrator_y - 16, file_select_x -32 + 16, narrator_y + 16))
				and (global.controls_used_for_menu_navigation = "mouse")
				{
					if (open_dropdown = false)
					{
						menu = "select_narrator";
					}
					draw_set_alpha(0.5);
					draw_rectangle_color(file_select_x -32 - 16, narrator_y - 16, file_select_x -32 + 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
			
			if (global.narrator < ds_list_size(global.all_loaded_characters) - 1)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x, narrator_y, 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16))
				and (global.controls_used_for_menu_navigation = "mouse")
				{
					if (open_dropdown = false)
					{
						menu = "select_narrator";
					}
					draw_set_alpha(0.5);
					draw_rectangle_color(file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
			
			#region /*Player 1 change portrait when clicking left or right*/
			
			#region /*Player 1 Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player1_key_left))
			and (!keyboard_check_pressed(global.player1_key_right))
			and (menu = "select_narrator")
			or(keyboard_check_pressed(global.player1_key2_left))
			and (!keyboard_check_pressed(global.player1_key2_right))
			and (menu = "select_narrator")
			or(gamepad_button_check_pressed(0, gp_padl))
			and (!gamepad_button_check_pressed(0, gp_padr))
			and (menu = "select_narrator")
			or(gamepad_axis_value(0, gp_axislh) < 0)
			and (menu_joystick_delay <= 0)
			and (menu = "select_narrator")
			or(mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x -32 - 16, narrator_y - 16, file_select_x -32 + 16, narrator_y + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "select_narrator";
				if (menu_delay = 0)
				and (global.narrator > -1)
				and (open_dropdown = false)
				{
					menu_delay = 3;
					menu_joystick_delay = 30;
					if (global.narrator > -1)
					{
						global.narrator -= 1;
					}
					else
					{
						global.narrator = -1;
					}
					
					#region /*Character Name*/
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
					or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
					{
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						{
							ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
						}
						else
						{
							ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
						}
						
						#region /*Character Name*/
						var uppercase_narrator_name;
						uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
						uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
						narrator_name = string(uppercase_narrator_name);
						#endregion /*Character Name END*/
						
						ini_close();
					}
					else
					{
						narrator_name = string(global.narrator + 1);
					}
					#endregion /*Character Name END*/
					
					#region /*Player 1 character select portrait sprite*/
					global.sprite_select_player_1 = spr_noone;
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
					#endregion /*Player 1 character select portrait sprite END*/
						
				}
				open_dropdown = false;
			}
			#endregion /*Player 1 Key Left (change portrait sprites) END*/
			
			#region /*Player 1 Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player1_key_right))
			and (!keyboard_check_pressed(global.player1_key_left))
			and (menu = "select_narrator")
			or(keyboard_check_pressed(global.player1_key2_right))
			and (!keyboard_check_pressed(global.player1_key2_left))
			and (menu = "select_narrator")
			or(gamepad_button_check_pressed(0, gp_padr))
			and (!gamepad_button_check_pressed(0, gp_padl))
			and (menu = "select_narrator")
			or(gamepad_axis_value(0, gp_axislh) > 0)
			and (menu_joystick_delay <= 0)
			and (menu = "select_narrator")
			or(mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "select_narrator";
				if (menu_delay = 0)
				and (open_dropdown = false)
				{
					menu_delay = 3;
					menu_joystick_delay = 30;
					global.narrator = clamp(global.narrator + 1, -1, ds_list_size(global.all_loaded_characters) - 1);
						
					#region /*Character Name*/
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
					or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
					{
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						{
							ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
						}
						else
						{
							ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
						}
						
						#region /*Character Name*/
						var uppercase_narrator_name;
						uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
						uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
						narrator_name = string(uppercase_narrator_name);
						#endregion /*Character Name END*/
						
						ini_close();
					}
					else
					{
						narrator_name = string(global.narrator + 1);
					}
					#endregion /*Character Name END*/
					
					#region /*Player 1 character select portrait sprite*/
					global.sprite_select_player_1 = spr_noone;
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
					#endregion /*Player 1 character select portrait sprite END*/
						
				}
				open_dropdown = false;
			}
			#endregion /*Player 1 Key Right (change portrait sprites) END*/
			
			#endregion /*Player 1 change portrait when clicking left or right END*/
			
		}
		#endregion /*Select Narrator END*/
		
		draw_menu_dropdown(390, 132 + (64 * 6), Text("Number of Audio Channels"), "number_of_audio_channels", global.number_of_audio_channels, "32", "64", "96", "128", "160", "192", "224", "256"); /*Dropdown menus should be drawn last so they are above everything else when you open them*/
	}
	#endregion /*Audio Settings END*/
	
	#region /*Language Options*/
	if (global.settings_sidebar_menu = "language_settings")
	{
		scr_language_menu();
	}
	#endregion /*Language Options END*/
	
	#region /*Global Resources Settings*/
	if (global.settings_sidebar_menu = "global_resources_settings")
	{
		var resource_pack_y = 40 * 4;
		var open_resource_pack_y = 40 * 6;
		var custom_title_background_y = 40 * 8;
		var custom_title_background_scale_y = 40 * 10;
		var background_layer_x_scroll_y = 40 * 11;
		var background_layer_y_scroll_y = 40 * 12;
		var custom_title_background_open_y = 40 * 13;
		var custom_title_logo_y = 40 * 15;
		var custom_title_logo_open_y = 40 * 17;
		
		#region /*Custom Resource Packs*/
		var resource_pack_x = 450;
		var resource_pack_right_arrow_x = 450;
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(resource_pack_x, 20 + (40 * 1), Text("Add Custom Resource Packs in Local Appdata"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(resource_pack_x, 20 + (40 * 2), Text("and it will appear here!"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.selected_resource_pack = 0)
		{
			draw_text_outlined(resource_pack_x, 20 + (resource_pack_y), Text("Resource Pack") + " : " + Text("Official"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			draw_text_outlined(resource_pack_x, 20 + (resource_pack_y), Text("Resource Pack") + " : " + Text("Custom") + " " + string(global.selected_resource_pack), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		draw_text_outlined(resource_pack_x, 20 + (resource_pack_y + 40), string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.selected_resource_pack > 0)
		and (global.pause_room != room_leveleditor)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x -32, 20 + (resource_pack_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x -32 + 16, 20 + (resource_pack_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "resource_pack";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x -32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x -32 + 16, 20 + (resource_pack_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
		and (global.pause_room != room_leveleditor)
		or (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
		and (global.pause_room != room_leveleditor)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (resource_pack_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "resource_pack";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (key_up)
		and (can_navigate_settings_sidebar = false)
		and (menu_delay = 0)
		{
			if (menu = "resource_pack")
			{
				menu = "open_title_logo_folder";
			}
			else
			if (menu = "open_resource_pack_folder")
			{
				menu = "resource_pack";
			}
			else
			if (menu = "title_backgrounds")
			{
				menu = "open_resource_pack_folder";
			}
			else
			if (menu = "title_background_scale")
			{
				menu = "title_backgrounds";
			}
			else
			if (menu = "background_layer_x_scroll")
			{
				menu = "title_background_scale";
			}
			else
			if (menu = "background_layer_y_scroll")
			{
				menu = "background_layer_x_scroll";
			}
			else
			if (menu = "open_title_background_folder")
			{
				menu = "background_layer_y_scroll";
			}
			else
			if (menu = "title_logos")
			{
				menu = "open_title_background_folder";
			}
			else
			if (menu = "open_title_logo_folder")
			{
				menu = "title_logos";
			}
			menu_delay = 0;
		}
		else
		if (key_down)
		and (can_navigate_settings_sidebar = false)
		and (menu_delay = 0)
		{
			if (menu = "resource_pack")
			{
				menu = "open_resource_pack_folder";
			}
			else
			if (menu = "open_resource_pack_folder")
			{
				menu = "title_backgrounds";
			}
			else
			if (menu = "title_backgrounds")
			{
				menu = "title_background_scale";
			}
			else
			if (menu = "title_background_scale")
			{
				menu = "background_layer_x_scroll";
			}
			else
			if (menu = "background_layer_x_scroll")
			{
				menu = "background_layer_y_scroll";
			}
			else
			if (menu = "background_layer_y_scroll")
			{
				menu = "open_title_background_folder";
			}
			else
			if (menu = "open_title_background_folder")
			{
				menu = "title_logos";
			}
			else
			if (menu = "title_logos")
			{
				menu = "open_title_logo_folder";
			}
			else
			if (menu = "open_title_logo_folder")
			{
				menu = "resource_pack";
			}
			menu_delay = 0;
		}
		
		if (menu = "resource_pack")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x -32 -32, 20 + (resource_pack_y));
		}
		
		if (key_left)
		and (can_navigate_settings_sidebar = false)
		and (menu = "resource_pack")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x -32 + 16, 20 + (resource_pack_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "resource_pack";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (global.selected_resource_pack > 0)
			and (global.pause_room != room_leveleditor)
			{
				global.selected_resource_pack -= 1;
				menu_delay = 3;
			}
		}
		else
		if (key_right)
		and (can_navigate_settings_sidebar = false)
		and (menu = "resource_pack")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "resource_pack";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
			and (global.pause_room != room_leveleditor)
			{
				global.selected_resource_pack += 1;
				menu_delay = 3;
			}
		}
		#endregion /*Custom Resource Packs END*/
		
		draw_menu_button(resource_pack_x, 20 + (open_resource_pack_y), Text("Open Resource Pack Folder"), "open_resource_pack_folder", "open_resource_pack_folder");
		
		#region /*Custom Title Background*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(resource_pack_x, 20 + (custom_title_background_y), Text("Title Background") + ": " + string(global.selected_title_background), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(resource_pack_x, 20 + (custom_title_background_y + 40), string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (global.selected_title_background > 0)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x -32, 20 + (custom_title_background_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_background_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "title_backgrounds";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x -32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_background_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (file_exists("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
		and (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
		or(file_exists(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
		and (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_background_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "title_backgrounds";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (menu = "title_backgrounds")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x -32 -32, 20 + (custom_title_background_y));
		}
		if (key_left)
		and (menu = "title_backgrounds")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_background_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "title_backgrounds";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (global.selected_title_background > 0)
			{
				global.selected_title_background -= 1;
				menu_delay = 3;
			}
			if (file_exists("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
			{
				title_screen_background = sprite_add("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 1, false, false, 0, 0);
			}
			else
			if (file_exists(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
			{
				title_screen_background = sprite_add(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 1, false, false, 0, 0);
			}
			else
			{
				title_screen_background = noone;
			}
			if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
			{
				layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
			}
		}
		if (key_right)
		and (menu = "title_backgrounds")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "title_backgrounds";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
			and (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
			or(menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
			and (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
			{
				global.selected_title_background += 1;
				menu_delay = 3;
			}
			if (file_exists("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
			{
				title_screen_background = sprite_add("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 1, false, false, 0, 0);
			}
			else
			if (file_exists(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
			{
				title_screen_background = sprite_add(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 1, false, false, 0, 0);
			}
			else
			{
				title_screen_background = noone;
			}
			if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
			{
				layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
			}
		}
		#endregion /*Custom Title Background END*/
		
		#region /*Custom Title Background Scale*/
		var scale_increment = 0.05;
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(resource_pack_x, 20 + (custom_title_background_scale_y), Text("Background Scale") + ": " + string(global.title_background_scale), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (global.title_background_scale > scale_increment)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x -32, 20 + (custom_title_background_scale_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_background_scale_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "title_background_scale";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x -32 - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_background_scale_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_background_scale_y), 0.5, 0.5, 0, c_white, 1);
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_scale_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "title_background_scale";
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_scale_y) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		if (menu = "title_background_scale")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x -32 -32, 20 + (custom_title_background_scale_y));
		}
		if (key_left)
		and (menu = "title_background_scale")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_background_scale_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "title_background_scale";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (global.title_background_scale > scale_increment)
			{
				global.title_background_scale -= scale_increment;
				menu_delay = 3;
			}
		}
		if (key_right)
		and (menu = "title_background_scale")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_scale_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "title_background_scale";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			{
				global.title_background_scale += scale_increment;
				menu_delay = 3;
			}
		}
		#endregion /*Custom Title Background Scale END*/
		
		#region /*Background Layer X Scroll*/
		var scale_increment = 0.05;
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(resource_pack_x, 20 + (background_layer_x_scroll_y), Text("Background Scroll X") + ": " + string(global.background_layer_x_scroll), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x -32, 20 + (background_layer_x_scroll_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x -32 + 16, 20 + (background_layer_x_scroll_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "background_layer_x_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x -32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x -32 + 16, 20 + (background_layer_x_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (background_layer_x_scroll_y), 0.5, 0.5, 0, c_white, 1);
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "background_layer_x_scroll";
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		if (menu = "background_layer_x_scroll")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x -32 -32, 20 + (background_layer_x_scroll_y));
		}
		if (key_left)
		and (menu = "background_layer_x_scroll")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x -32 + 16, 20 + (background_layer_x_scroll_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "background_layer_x_scroll";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			{
				global.background_layer_x_scroll -= scale_increment;
				menu_delay = 3;
			}
		}
		if (key_right)
		and (menu = "background_layer_x_scroll")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "background_layer_x_scroll";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			{
				global.background_layer_x_scroll += scale_increment;
				menu_delay = 3;
			}
		}
		#endregion /*Background Layer X Scroll END*/
		
		#region /*Background Layer Y Scroll*/
		var scale_increment = 0.05;
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(resource_pack_x, 20 + (background_layer_y_scroll_y), Text("Background Scroll Y") + ": " + string(global.background_layer_y_scroll), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x -32, 20 + (background_layer_y_scroll_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x -32 + 16, 20 + (background_layer_y_scroll_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "background_layer_y_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x -32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x -32 + 16, 20 + (background_layer_y_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (background_layer_y_scroll_y), 0.5, 0.5, 0, c_white, 1);
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "background_layer_y_scroll";
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		if (menu = "background_layer_y_scroll")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x -32 -32, 20 + (background_layer_y_scroll_y));
		}
		if (key_left)
		and (menu = "background_layer_y_scroll")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x -32 + 16, 20 + (background_layer_y_scroll_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "background_layer_y_scroll";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			{
				global.background_layer_y_scroll -= scale_increment;
				menu_delay = 3;
			}
		}
		if (key_right)
		and (menu = "background_layer_y_scroll")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "background_layer_y_scroll";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			{
				global.background_layer_y_scroll += scale_increment;
				menu_delay = 3;
			}
		}
		#endregion /*Background Layer Y Scroll END*/
		
		draw_menu_button(resource_pack_x, 20 + (custom_title_background_open_y), Text("Open Background Folder"), "open_title_background_folder", "open_title_background_folder");
		
		#region /*Custom Title Logo*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		if (global.title_logo_index >= 0)
		and (global.title_logo_index != undefined)
		{
			draw_sprite_ext(global.title_logo_index, image_index, display_get_gui_width() - 500, display_get_gui_height() / 2 - 100, (402 / sprite_get_height(global.title_logo_index)), (402 / sprite_get_height(global.title_logo_index)), 0, c_white, 1);
		}
		if (global.selected_title_logo >= 0)
		{
			draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y), Text("Title Logo") + ": " + string(global.selected_title_logo), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y + 40), string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y), Text("Title Logo") + ": " + Text("Noone"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		if (global.selected_title_logo > -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x -32, 20 + (custom_title_logo_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_logo_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "title_logos";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x -32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_logo_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
		and (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
		or(file_exists(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
		and (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
		or (global.selected_title_logo <= -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_logo_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "title_logos";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (menu = "title_logos")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x -32 -32, 20 + (custom_title_logo_y));
		}
		if (key_left)
		and (menu = "title_logos")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x -32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x -32 + 16, 20 + (custom_title_logo_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "title_logos";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (global.selected_title_logo > -1)
			{
				global.selected_title_logo -= 1;
				menu_delay = 3;
			}
			if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			and (global.selected_title_logo >= 0)
			{
				global.title_logo_index = sprite_add("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
				sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) / 2, sprite_get_height(global.title_logo_index) / 2);
			}
			else
			if (file_exists(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			and (global.selected_title_logo >= 0)
			{
				global.title_logo_index = sprite_add(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
				sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) / 2, sprite_get_height(global.title_logo_index) / 2);
			}
			else
			{
				global.title_logo_index = spr_noone;
			}
		}
		if (key_right)
		and (menu = "title_logos")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			menu = "title_logos";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			and (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
			or(menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			and (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
			or (global.selected_title_logo <= -1)
			{
				global.selected_title_logo += 1;
				menu_delay = 3;
			}
			if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			and (global.selected_title_logo >= 0)
			{
				global.title_logo_index = sprite_add("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
				sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) / 2, sprite_get_height(global.title_logo_index) / 2);
			}
			else
			if (file_exists(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			and (global.selected_title_logo >= 0)
			{
				global.title_logo_index = sprite_add(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
				sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) / 2, sprite_get_height(global.title_logo_index) / 2);
			}
			else
			{
				global.title_logo_index = spr_noone;
			}
		}
		#endregion /*Custom Title Logo END*/
		
		draw_menu_button(resource_pack_x, 20 + (custom_title_logo_open_y), Text("Open Title Logo Folder"), "open_title_logo_folder", "open_title_logo_folder");
		
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x, 20 + (open_resource_pack_y) + 2, resource_pack_x + 371, 20 + (open_resource_pack_y) + 41))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay = 0)
		or (menu = "open_resource_pack_folder")
		and (key_a_pressed)
		and (menu_delay = 0)
		{
			scr_open_folder(game_save_id + "\custom_resource_pack")
			menu_delay = 60 * 5;
		}
		else
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x, 20 + (custom_title_background_open_y) + 2, resource_pack_x + 371, 20 + (custom_title_background_open_y) + 41))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay = 0)
		or (menu = "open_title_background_folder")
		and (key_a_pressed)
		and (menu_delay = 0)
		{
			scr_open_folder(game_save_id + "\custom_title_backgrounds")
			menu_delay = 60 * 5;
		}
		else
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x, 20 + (custom_title_logo_open_y) + 2, resource_pack_x + 371, 20 + (custom_title_logo_open_y) + 41))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay = 0)
		or (menu = "open_title_logo_folder")
		and (key_a_pressed)
		and (menu_delay = 0)
		{
			scr_open_folder(game_save_id + "\custom_title_logos")
			menu_delay = 60 * 5;
		}
		
	}
	#endregion /*Global Resources Settings END*/
	
	#region /*Storage Settings*/
	if (global.settings_sidebar_menu = "storage_settings")
	{
		var file_select_x = 450;
		var file_select_right_arrow_x = 400;
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(file_select_x, 20 + (40 * 4), Text("File") + ": " + string(global.file), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		#region /*Display save file data*/
		if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
		{
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			
			if (ini_key_exists("Player", "current_month"))
			and (ini_key_exists("Player", "current_day"))
			and (ini_key_exists("Player", "current_year"))
			and (ini_key_exists("Player", "current_hour"))
			and (ini_key_exists("Player", "current_minute"))
			and (ini_key_exists("Player", "current_second"))
			{
				draw_text_outlined(file_select_x, 20 + (40 * 7), Text("Date modified") + ":", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(file_select_x, 20 + (40 * 8),
				string(ini_read_real("Player", "current_month", 0)) + "/" +
				string(ini_read_real("Player", "current_day", 0)) + "/" +
				string(ini_read_real("Player", "current_year", 0)) + " " +
				string(string_replace_all(string_format(ini_read_real("Player", "current_hour", 0), 2, 0), " ", "0")) + ":" +
				string(string_replace_all(string_format(ini_read_real("Player", "current_minute", 0), 2, 0), " ", "0")) + "." +
				string(string_replace_all(string_format(ini_read_real("Player", "current_second", 0), 2, 0), " ", "0"))
				, global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				
				if (ini_read_real("Player", "current_month", 0) = current_month)
				and (ini_read_real("Player", "current_day", 0) = current_day)
				and (ini_read_real("Player", "current_year", 0) = current_year)
				{
					draw_text_outlined(file_select_x, 20 + (40 * 9), Text("Last played today!"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				}
				
			}
			
			if (ini_key_exists("Player", "number_of_levels_cleared"))
			{
				draw_text_outlined(file_select_x, 20 + (40 * 11), Text("Number of levels passed") + ": " + string(ini_read_real("Player", "number_of_levels_cleared", false)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			}
			
			ini_close();
		}
		#endregion /*Display save file data END*/
		
		if (menu != "file_delete_yes")
		and (menu != "file_delete_no")
		{
			if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
			{
				draw_menu_button(450, 20 + (40 * 5), Text("Delete File"), "file_delete", "file_delete_no");
			}
		}
		else
		if (menu = "file_delete_yes")
		or(menu = "file_delete_no")
		{
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, window_get_width()* 3, window_get_height()* 3, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(0.1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text_outlined(window_get_width()/ 2, window_get_height()/ 2 - 100, Text("Are you sure you want to delete file") + " " + string(global.file) + "?", global.default_text_size, c_black, c_red, 1);
			draw_menu_button(window_get_width()/ 2 -370 -32, window_get_height()/ 2, Text("Yes"), "file_delete_yes", "file_delete_yes");
			draw_menu_button(window_get_width()/ 2 + 32, window_get_height()/ 2, Text("No"), "file_delete_no", "file_delete");
			
			if (key_left)
			and (menu_joystick_delay = 0)
			or(key_right)
			and (menu_joystick_delay = 0)
			{
				menu_joystick_delay = 30;
				if (menu = "file_delete_no")
				{
					menu = "file_delete_yes";
				}
				else
				if (menu = "file_delete_yes")
				{
					menu = "file_delete_no";
				}
			}
		}
		
		if (global.file < 1)
		{
			global.file = 1; /*Don't let file go less than 1*/
		}
		
		if (global.file > 1)
		and (menu != "file_delete_no")
		and (menu != "file_delete_yes")
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x -32, 20 + (40 * 4), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x -32 - 16, 20 + (40 * 4) - 16, file_select_x -32 + 16, 20 + (40 * 4) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "file_delete";
				draw_set_alpha(0.5);
				draw_rectangle_color(file_select_x -32 - 16, 20 + (40 * 4) - 16, file_select_x -32 + 16, 20 + (40 * 4) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (menu != "file_delete_no")
		and (menu != "file_delete_yes")
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x, 20 + (40 * 4), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, 20 + (40 * 4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 * 4) + 16))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				menu = "file_delete";
				draw_set_alpha(0.5);
				draw_rectangle_color(file_select_x + file_select_right_arrow_x - 16, 20 + (40 * 4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 * 4) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu = "file_delete")
		and (key_a_pressed)
		and (menu_delay = 0)
		{
			can_navigate_settings_sidebar = false;
			menu = "file_delete_no";
			menu_delay = 10;
		}
		
		if (menu = "file_delete_no")
		and (key_a_pressed)
		and (menu_delay = 0)
		or(menu = "file_delete_no")
		and (key_b_pressed)
		and (menu_delay = 0)
		or(menu = "file_delete_yes")
		and (key_b_pressed)
		and (menu_delay = 0)
		{
			can_navigate_settings_sidebar = false;
			menu = "file_delete";
			menu_delay = 10;
			
		}
		
		if (menu = "file_delete_yes")
		and (key_a_pressed)
		and (menu_delay = 0)
		or(menu = "file_delete_yes")
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/ 2 -370 -32, window_get_height()/ 2 - 21, window_get_width()/ 2 -370 -32 + 370, window_get_height()/ 2 + 42))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay = 0)
		{
			can_navigate_settings_sidebar = false;
			menu = "file_select";
			file_delete(working_directory + "save_files/file" + string(global.file) + ".ini");
			menu_delay = 10;
		}
		
		if (key_up)
		and (menu != "file_delete_yes")
		and (menu != "file_delete_no")
		and (can_navigate_settings_sidebar = false)
		and (menu_joystick_delay = 0)
		{
			menu_joystick_delay = 10;
			menu = "file_select";
		}
		else
		if (key_down)
		and (menu != "file_delete_yes")
		and (menu != "file_delete_no")
		and (can_navigate_settings_sidebar = false)
		and (menu_joystick_delay = 0)
		and (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
		{
			menu_joystick_delay = 10;
			menu = "file_delete";
		}
		
		if (menu = "file_select")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, file_select_x -32 -32, 20 + (40 * 4));
		}
		
		if (key_left)
		and (menu = "file_select")
		and (can_navigate_settings_sidebar = false)
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x -32 - 16, 20 + (40 * 4) - 16, file_select_x -32 + 16, 20 + (40 * 4) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (menu != "file_delete_no")
		and (menu != "file_delete_yes")
		{
			can_navigate_settings_sidebar = false;
			menu = "file_select";
			if (menu_delay = 0)
			and (menu_joystick_delay = 0)
			and (global.file > 1)
			{
				global.file -= 1;
				menu_delay = 3;
				menu_joystick_delay = 30;
			}
		}
		else
		if (key_right)
		and (menu = "file_select")
		and (can_navigate_settings_sidebar = false)
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, 20 + (40 * 4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 * 4) + 16))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (menu != "file_delete_no")
		and (menu != "file_delete_yes")
		{
			can_navigate_settings_sidebar = false;
			menu = "file_select";
			if (menu_delay = 0)
			and (menu_joystick_delay = 0)
			{
				global.file += 1;
				menu_delay = 3;
				menu_joystick_delay = 30;
			}
		}
	}
	#endregion /*Storage Settings END*/
	
	#region /*Broadcast Settings*/
	if (global.settings_sidebar_menu = "broadcast_settings")
	{draw_set_halign(fa_left);draw_set_valign(fa_center);draw_text_outlined(410, 20 + (40 * 3), "Connect your Twitch account \n and earn in-game rewards \n as you stream the game :)", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
	#endregion /*Broadcast Settings END*/
	
	#region /*How to Play*/
	if (global.settings_sidebar_menu = "how_to_play")
	{draw_set_halign(fa_left);draw_set_valign(fa_center);draw_text_outlined(410, 20 + (40 * 3), "Control frog. \n Frog jump. \n Frog tongue. \n Frog happy.", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
	#endregion /*How to Play END*/
	
	#endregion /*General Settings END*/
	
	draw_set_alpha(darken_settings_alpha);
	draw_rectangle_color(left_sidebar_x + 370, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	#region /*Menu Navigation*/
	if (menu_joystick_delay <= 0)
	and (can_navigate = true)
	{
		
		#region /*Options Menu*/
	
		#region /*Difficulty Settings Navigation*/
		if (menu = "difficulty_settings")
		{
			if (key_up)
			and (open_dropdown = true)
			and (menu_delay = 0)
			and (global.difficulty > 0)
			{
				menu_delay = 3;
				global.difficulty -= 1;
			}
			else
			if (key_down)
			and (open_dropdown = true)
			and (menu_delay = 0)
			and (global.difficulty < 2)
			{
				menu_delay = 3;
				global.difficulty += 1;
			}
			else
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "hud_hide_time";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "automatically_pause_when_window_is_unfocused_settings";
			}
		}
		#endregion /*Difficulty Settings Navigation END*/
	
		else
	
		#region /*Navigate Game Settings*/
		if (menu = "automatically_pause_when_window_is_unfocused_settings")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "difficulty_settings";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "show_timer_settings";
			}
		}
		else
		if (menu = "show_timer_settings")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "automatically_pause_when_window_is_unfocused_settings";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "show_deaths_counter_settings";
			}
		}
		else
		if (menu = "show_deaths_counter_settings")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "show_timer_settings";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "show_tutorial_signs";
			}
		}
		else
		if (menu = "show_tutorial_signs")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "show_deaths_counter_settings";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "hud_hide_time";
			}
		}
		else
		if (menu = "hud_hide_time")
		{
			if (key_up)
			and (open_dropdown = true)
			and (menu_delay = 0)
			and (global.hud_hide_time > 0)
			{
				menu_delay = 3;
				global.hud_hide_time -= 1;
			}
			else
			if (key_down)
			and (open_dropdown = true)
			and (menu_delay = 0)
			and (global.hud_hide_time < 10)
			{
				menu_delay = 3;
				global.hud_hide_time += 1;
			}
			else
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "show_tutorial_signs";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "difficulty_settings";
			}
		}
		#endregion /*Navigate Game Settings END*/
	
		else
	
		#region /*Players can collide*/
		if (menu = "players_can_collide")
		{
			if (key_up)
			{
				menu = "hud_hide_time";
			}
			else
			if (key_down)
			{
				menu = "assist_settings";
			}
		}
		#endregion /*Players can collide END*/
	
		else
	
		#region /*Convention Mode*/
		if (menu = "convention_mode")
		{
			if (key_up)
			{
				menu = "assist_settings";
			}
			else
			if (key_down)
			{
				menu = "show_tutorial_signs";
			}
		}
		#endregion /*Convention Mode END*/
	
		else
	
		#region /*Assist Enable Navigation*/
		if (menu = "assist_enable")
		and (global.assist_enable = true)
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_show_assist_mode_text";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_item_appear";
				menu_delay = 3;
			}
		}
		#endregion /*Assist Enable Navigation END*/
	
		else
	
		#region /*Assist Item Appear Navigation*/
		if (menu = "assist_item_appear")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_enable";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_extra_hp";
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (global.assist_item_appear > 0)
			{
				global.assist_item_appear -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (global.assist_item_appear < 10)
			{
				global.assist_item_appear += 1;
				menu_delay = 3;
			}
		}
		#endregion /*Assist Item Appear Navigation END*/
	
		else
	
		#region /*Assist Extra HP Navigation*/
		if (menu = "assist_extra_hp")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_item_appear";
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_invincible";
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (global.assist_extra_hp > 0)
			{
				global.assist_extra_hp -= 1;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (global.assist_extra_hp < 9)
			{
				global.assist_extra_hp += 1;
			}
		}
		#endregion /*Assist Extra HP Navigation END*/
	
		else
	
		#region /*Assist Invincible Navigation*/
		if (menu = "assist_invincible")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_extra_hp";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_breathe_underwater";
				menu_delay = 3;
			}
		}
		#endregion /*Assist Invincible Navigation END*/
	
		else
	
		#region /*Assist Breathe Underwater Navigation*/
		if (menu = "assist_breathe_underwater")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_invincible";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_guiding_arrows";
				menu_delay = 3;
			}
		}
		#endregion /*Assist Breathe Underwater Navigation END*/
	
		else
	
		#region /*Assist Guiding Arrows Navigation*/
		if (menu = "assist_guiding_arrows")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_breathe_underwater";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_normal_arrows";
				menu_delay = 3;
			}
		}
		#endregion /*Assist Guiding Arrows Navigation END*/
	
		else
	
		#region /*Assist Normal Arrows Navigation*/
		if (menu = "assist_normal_arrows")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_guiding_arrows";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_enable_enemies";
				menu_delay = 3;
			}
		}
		#endregion /*Assist Normal Arrows Navigation END*/
		
		else
		
		#region /*Assist Enable Enemies Navigation*/
		if (menu = "assist_enable_enemies")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "assist_normal_arrows";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "assist_enable_spikes";
			}
		}
		#endregion /*Assist Enable Enemies Navigation END*/
		
		else
		
		#region /*Assist Enable Spikes Navigation*/
		if (menu = "assist_enable_spikes")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "assist_enable_enemies";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "assist_show_assist_mode_text";
			}
		}
		#endregion /*Assist Enable Spikes Navigation END*/
		
		else
		
		#region /*Assist Show Assist Mode Text Navigation*/
		if (menu = "assist_show_assist_mode_text")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_enable_spikes";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_enable";
				menu_delay = 3;
			}
		}
		#endregion /*Assist Show Assist Mode Text Navigation END*/
		
		else
		
		#region /*Navigate Fullscreen Mode*/
		if (menu = "fullscreen_mode")
		{
			menu_cursor_y_position = 48;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "reset_world_map_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "interpolate";
				menu_delay = 3;
			}
		}
		#endregion /*Navigate Fullscreen Mode END*/
	
		else
	
		#region /*Navigate Interpolate*/
		if (menu = "interpolate")
		{
			menu_cursor_y_position = 48 * 2;
			if (key_up)
			and (menu_delay = 0)
			{
				if (os_type!= os_ios)
				and (os_type!= os_android)
				{
					menu = "fullscreen_mode";
					menu_delay = 3;
				}
				else
				{
					menu = "background_brightness_gameplay";
					menu_delay = 3;
				}
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "show_fps";
				menu_delay = 3;
			}
		}
		#endregion /*Navigate Interpolate END*/
	
		else
	
		#region /*Show fps*/
		if (menu = "show_fps")
		{
			menu_cursor_y_position = 48 * 3;
			if (key_up)
			{
				menu = "interpolate";
			}
			else
			if (key_down)
			{
				menu = "show_fps_real";
			}
		}
		#endregion /*Show fps END*/
	
		else
	
		#region /*Show fps real*/
		if (menu = "show_fps_real")
		{
			menu_cursor_y_position = 48 * 4;
			if (key_up)
			{
				menu = "show_fps";
			}
			else
			if (key_down)
			{
				menu = "show_instance_count";
			}
		}
		#endregion /*Show fps real END*/
	
		else
	
		#region /*Show instance count*/
		if (menu = "show_instance_count")
		{
			menu_cursor_y_position = 48 * 5;
			if (key_up)
			{
				menu = "show_fps_real";
			}
			else
			if (key_down)
			{
				menu = "show_collision_mask";
			}
		}
		#endregion /*Show instance count END*/
	
		else
	
		#region /*Show collision mask*/
		if (menu = "show_collision_mask")
		{
			menu_cursor_y_position = 48 * 6;
			if (key_up)
			{
				menu = "show_instance_count";
			}
			else
			if (key_down)
			{
				menu = "enable_transitions";
			}
		}
		#endregion /*Show collision mask END*/
	
		else
	
		#region /*Navigate Enable Transitions*/
		if (menu = "enable_transitions")
		{
			menu_cursor_y_position = 48 * 7;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "show_collision_mask";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer1";
				menu_delay = 3;
			}
		}
		#endregion /*Navigate Enable Transitions END*/
	
		else
	
		#region /*Enable Backgrounds and Foregrounds*/
		if (menu = "enable_background_layer1")
		{
			menu_cursor_y_position = 48 * 8;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_transitions";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer2";
				menu_delay = 3;
			}
		}
		else
		if (menu = "enable_background_layer2")
		{
			menu_cursor_y_position = 48 * 9;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer1";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer3";
				menu_delay = 3;
			}
		}
		else
		if (menu = "enable_background_layer3")
		{
			menu_cursor_y_position = 48 * 10;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer2";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer4";
				menu_delay = 3;
			}
		}
		else
		if (menu = "enable_background_layer4")
		{
			menu_cursor_y_position = 48 * 11;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer3";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer1";
				menu_delay = 3;
			}
		}
		else
		if (menu = "enable_foreground_layer1")
		{
			menu_cursor_y_position = 48 * 12;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_background_layer4";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer_above_static_objects";
				menu_delay = 3;
			}
		}
		else
		if (menu = "enable_foreground_layer_above_static_objects")
		{
			menu_cursor_y_position = 48 * 13;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer1";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer2";
				menu_delay = 3;
			}
		}
		else
		if (menu = "enable_foreground_layer2")
		{
			menu_cursor_y_position = 48 * 14;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer1";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer_secret";
				menu_delay = 3;
			}
		}
		else
		if (menu = "enable_foreground_layer_secret")
		{
			menu_cursor_y_position = 48 * 15;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer2";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "background_brightness_gameplay";
				menu_delay = 3;
			}
		}
		#endregion /*Enable Backgrounds and Foregrounds END*/
	
		else
	
		#region /*Navigate Background Brightness in Gameplay*/
		if (menu = "background_brightness_gameplay")
		{
			menu_cursor_y_position = 48 * 16;
			if (global.background_brightness_gameplay < - 1)
			{
				global.background_brightness_gameplay = -1;
			}
			if (global.background_brightness_gameplay > + 1)
			{
				global.background_brightness_gameplay = +1;
			}
			if (key_left)
			and (menu_delay = 0)
			and (global.background_brightness_gameplay > - 1)
			{
				global.background_brightness_gameplay -= 0.1;
				menu_delay = 3;
			}
			else
			if (key_right)
			and (menu_delay = 0)
			and (global.background_brightness_gameplay < + 1)
			{
				global.background_brightness_gameplay += 0.1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_foreground_layer_secret";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
					menu = "background_brightness_menu";
					menu_delay = 3;
			}
		}
		#endregion /*Navigate Background Brightness in Gameplay END*/
	
		else
	
		#region /*Navigate Background Brightness in Menus*/
		if (menu = "background_brightness_menu")
		{
			menu_cursor_y_position = 48 * 17;
			if (global.background_brightness_menu < - 1)
			{
				global.background_brightness_menu = -1;
			}
			if (global.background_brightness_menu > + 1)
			{
				global.background_brightness_menu = +1;
			}
			if (key_left)
			and (menu_delay = 0)
			and (global.background_brightness_menu>- 1)
			{
				global.background_brightness_menu-= 0.1;
				menu_delay = 3;
			}
			else
			if (key_right)
			and (menu_delay = 0)
			and (global.background_brightness_menu<+ 1)
			{
				global.background_brightness_menu+= 0.1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "background_brightness_gameplay";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "reset_level_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
		}
		#endregion /*Navigate Background Brightness in Menus END*/
	
		else
	
		#region /*Reset level zoom when going back to map*/
		if (menu = "reset_level_zoom_when_going_back_to_map")
		{
			menu_cursor_y_position = 48 * 18;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "background_brightness_menu";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "reset_world_map_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
		}
		#endregion /*Reset level zoom when going back to map END*/
	
		else
	
		#region /*Reset world map zoom when going back to map*/
		if (menu = "reset_world_map_zoom_when_going_back_to_map")
		{
			menu_cursor_y_position = 48 * 19;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "reset_level_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				if (os_type!= os_ios)
				and (os_type!= os_android)
				{
					menu = "fullscreen_mode";
					menu_delay = 3;
				}
				else
				{
					menu = "interpolate";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Reset world map zoom when going back to map END*/
	
		else
	
		#region /*Main Volume Navigation*/
		if (menu = "main_volume")
		{
			if (key_left)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.main_volume > 0)
				{
					global.main_volume -= 0.05;
				}
			}
			else
			if (key_right)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.main_volume < + 1)
				{
					global.main_volume += 0.05;
				}
			}
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_left)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.main_volume > 0)
				{
					global.main_volume -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_right)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.main_volume < + 1)
				{
					global.main_volume += 0.0001;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.enable_narrator = true)
				{
					menu = "select_narrator";
					menu_delay = 3;
				}
				else
				if (global.enable_verbosity_slider = true)
				{
					menu = "verbosity_slider";
					menu_delay = 3;
				}
				else
				{
					menu = "number_of_audio_channels";
					menu_delay = 3;
				}
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "music_volume";
				menu_delay = 3;
			}
		}
		#endregion /*Main Volume Navigation END*/
		
		else
		
		#region /*Msuic Volume Navigation*/
		if (menu = "music_volume")
		{
			if (key_left)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.music_volume > 0)
				{
					global.music_volume -= 0.05;
				}
			}
			else
			if (key_right)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.music_volume < + 1)
				{
					global.music_volume += 0.05;
				}
			}
			else
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_left)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.music_volume > 0)
				{
					global.music_volume -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_right)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.music_volume < + 1)
				{
					global.music_volume += 0.0001;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "main_volume";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "sound_volume";
				menu_delay = 3;
			}
		}
		#endregion /*Music Volume Navigation END*/
		
		else
		
		#region /*Sound Volume Navigation*/
		if (menu = "sound_volume")
		{
			if (key_left)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sound_volume > 0)
				{
					global.sound_volume -= 0.05;
				}
			}
			else
			if (key_right)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sound_volume < + 1)
				{
					global.sound_volume += 0.05;
				}
			}
			else
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_left)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sound_volume > 0)
				{
					global.sound_volume -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_right)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sound_volume < + 1)
				{
					global.sound_volume += 0.0001;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "music_volume";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "ambient_volume";
				menu_delay = 3;
			}
		}
		#endregion /*Sound Volume Navigation END*/
	
		else
	
		#region /*Ambient Volume Navigation*/
		if (menu = "ambient_volume")
		{
			if (key_left)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.ambient_volume > 0)
				{
					global.ambient_volume -= 0.05;
				}
			}
			else
			if (key_right)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.ambient_volume < + 1)
				{
					global.ambient_volume += 0.05;
				}
			}
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_left)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.ambient_volume > 0)
				{
					global.ambient_volume -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_right)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.ambient_volume < + 1)
				{
					global.ambient_volume += 0.0001;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "sound_volume";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "footstep_volume";
				menu_delay = 3;
			}
		}
		#endregion /*Ambient Volume Navigation END*/
		
		else
		
		#region /*Footstep Volume Navigation*/
		if (menu = "footstep_volume")
		{
			if (key_left)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.footstep_volume > 0)
				{
					global.footstep_volume -= 0.05;
				}
			}
			else
			if (key_right)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.footstep_volume < + 1)
				{
					global.footstep_volume += 0.05;
				}
			}
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_left)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.footstep_volume > 0)
				{
					global.footstep_volume -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_right)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.footstep_volume < + 1)
				{
					global.footstep_volume += 0.0001;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "ambient_volume";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "voices_volume";
				menu_delay = 3;
			}
		}
		#endregion /*Footstep Volume Navigation END*/
		
		else
		
		#region /*Voices Volume Navigation*/
		if (menu = "voices_volume")
		{
			if (key_left)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.voices_volume > 0)
				{
					global.voices_volume -= 0.05;
				}
			}
			else
			if (key_right)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.voices_volume < + 1)
				{
					global.voices_volume += 0.05;
				}
			}
			else
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_left)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.voices_volume > 0)
				{
					global.voices_volume -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_right)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.voices_volume < + 1)
				{
					global.voices_volume += 0.0001;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "footstep_volume";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "number_of_audio_channels";
				menu_delay = 3;
			}
		}
		#endregion /*Voices Volume Navigation END*/

		else
	
		#region /*Number of Audio Channels Navigation*/
		if (menu = "number_of_audio_channels")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "voices_volume";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.enable_verbosity_slider = true)
				{
					menu = "verbosity_slider";
					menu_delay = 3;
				}
				else
				if (global.enable_narrator = true)
				{
					menu = "select_narrator";
					menu_delay = 3;
				}
				else
				{
					menu = "music_volume";
					menu_delay = 3;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (global.number_of_audio_channels> 0)
			{
				global.number_of_audio_channels -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (global.number_of_audio_channels<7)
			{
				global.number_of_audio_channels+= 1;
				menu_delay = 3;
			}
		}
		#endregion /*Number of Audio Channels Navigation END*/
	
		else
	
		#region /*Verbosity Slider Navigation*/
		if (menu = "verbosity_slider")
		{
			if (key_left)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.verbosity_slider > 0)
				{
					global.verbosity_slider -= 0.05;
				}
			}
			else
			if (key_right)
			and (!keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.verbosity_slider < + 1)
				{
					global.verbosity_slider += 0.05;
				}
			}
			else
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_left)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.verbosity_slider > 0)
				{
					global.verbosity_slider -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			or (key_right)
			and (keyboard_check(vk_shift))
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.verbosity_slider < + 1)
				{
					global.verbosity_slider += 0.0001;
				}
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "voices_volume";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.enable_narrator = true)
				{
					menu = "select_narrator";
					menu_delay = 3;
				}
				else
				{
					menu = "music_volume";
					menu_delay = 3;
				}
			}
		}
		#endregion /*Verbosity Slider Navigation END*/

		else

		#region /*Select Narrator Navigation*/
		if (menu = "select_narrator")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.enable_verbosity_slider = true)
				{
					menu = "verbosity_slider";
					menu_delay = 3;
				}
				else
				{
					menu = "number_of_audio_channels";
					menu_delay = 3;
				}
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "main_volume";
				menu_delay = 3;
			}
		}
		#endregion /*Select Narrator Navigation*/
	
		else
	
		#region /*Remap Select Player Navigation*/
		if (menu = "remap_select_player")
		{
			menu_cursor_y_position = 0;
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "show_controls";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "remap_key_dive";
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player > 0)
			{
				remapping_player -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player <3)
			{
				remapping_player += 1;
				menu_delay = 3;
			}
		}
		#endregion /*Remap Select Player Navigation END*/
	
		else
	
		#region /*Up Key is Jump Key Navigation*/
		if (menu = "up_key_is_jump_key")
		{
			menu_cursor_y_position = menu_y_up_key_is_jump_key;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "remap_reset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "double_tap_to_run";
				menu_delay = 3;
			}
		}
		#endregion /*Up Key is Jump Key Navigation END*/
	
		else
	
		#region /*Double Tap To Run Navigation*/
		if (menu = "double_tap_to_run")
		{
			menu_cursor_y_position = menu_y_double_tap_direction_to_run;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "up_key_is_jump_key";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "always_run";
				menu_delay = 3;
			}
		}
		#endregion /*Double Tap To Run Navigation END*/
	
		else
	
		#region /*Always Run Navigation*/
		if (menu = "always_run")
		{
			menu_cursor_y_position = menu_y_always_run;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "double_tap_to_run";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "cancel_dive_by_pressing_jump_or_dive_button";
				menu_delay = 3;
			}
		}
		#endregion /*Always Run Navigation END*/
	
		else
	
		#region /*Cancel dive by pressing the jump or dive key Navigation*/
		if (menu = "cancel_dive_by_pressing_jump_or_dive_button")
		{
			menu_cursor_y_position = menu_y_cancel_dive_by_pressing_jump_or_dive_button;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "always_run";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "cancel_dive_by_pressing_opposite_direction";
				menu_delay = 3;
			}
		}
		#endregion /*Cancel dive by pressing the jump or dive key Navigation END*/
		
		else
		
		#region /*Cancel dive by pressing the opposite direction Navigation*/
		if (menu = "cancel_dive_by_pressing_opposite_direction")
		{
			menu_cursor_y_position = menu_y_cancel_dive_by_pressing_opposite_direction;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "cancel_dive_by_pressing_jump_or_dive_button";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "down_and_jump_to_groundpound";
				menu_delay = 3;
			}
		}
		#endregion /*Cancel dive by pressing the opposite direction Navigation END*/
		
		else
		
		#region /*Down + Jump to Ground Pound Navigation*/
		if (menu = "down_and_jump_to_groundpound")
		{
			menu_cursor_y_position = menu_y_down_and_jump_to_groundpound;
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "cancel_dive_by_pressing_opposite_direction";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "wall_jump_setting";
				menu_delay = 3;
			}
		}
		#endregion /*Down + Jump to Ground Pound Navigation END*/
		
		else
		
		#region /*Navigate Wall Jump Setting*/
		if (menu = "wall_jump_setting")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "down_and_jump_to_groundpound";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "drop_from_rope";
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 0)
			and (global.player1_wall_jump_setting> 0)
			{
				global.player1_wall_jump_setting-= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 0)
			and (global.player1_wall_jump_setting<2)
			{
				global.player1_wall_jump_setting+= 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 1)
			and (global.player2_wall_jump_setting> 0)
			{
				global.player2_wall_jump_setting-= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 1)
			and (global.player2_wall_jump_setting<2)
			{
				global.player2_wall_jump_setting+= 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 2)
			and (global.player3_wall_jump_setting> 0)
			{
				global.player3_wall_jump_setting-= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 2)
			and (global.player3_wall_jump_setting<2)
			{
				global.player3_wall_jump_setting+= 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 3)
			and (global.player4_wall_jump_setting> 0)
			{
				global.player4_wall_jump_setting-= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 3)
			and (global.player4_wall_jump_setting<2)
			{
				global.player4_wall_jump_setting+= 1;
				menu_delay = 3;
			}
		}
		#endregion /*Navigate Wall Jump Setting END*/
	
		else
	
		#region /*Navigate Drop From Rope Setting*/
		if (menu = "drop_from_rope")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "wall_jump_setting";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "show_controls";
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 0)
			and (global.player1_drop_from_rope > 0)
			{
				global.player1_drop_from_rope -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 0)
			and (global.player1_drop_from_rope <4)
			{
				global.player1_drop_from_rope += 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 1)
			and (global.player2_drop_from_rope > 0)
			{
				global.player2_drop_from_rope -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 1)
			and (global.player2_drop_from_rope <4)
			{
				global.player2_drop_from_rope += 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 2)
			and (global.player3_drop_from_rope > 0)
			{
				global.player3_drop_from_rope -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 2)
			and (global.player3_drop_from_rope <4)
			{
				global.player3_drop_from_rope += 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 3)
			and (global.player4_drop_from_rope > 0)
			{
				global.player4_drop_from_rope -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 3)
			and (global.player4_drop_from_rope <4)
			{
				global.player4_drop_from_rope += 1;
				menu_delay = 3;
			}
		}
		#endregion /*Navigate Drop From Rope Setting END*/
	
		else
	
		#region /*Navigate Show Controls Settings*/
		if (menu = "show_controls")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "drop_from_rope";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "remap_select_player";
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 0)
			and (global.player1_show_controls> 0)
			{
				global.player1_show_controls -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 0)
			and (global.player1_show_controls< 10)
			{
				global.player1_show_controls+= 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 1)
			and (global.player2_show_controls> 0)
			{
				global.player2_show_controls -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 1)
			and (global.player2_show_controls< 10)
			{
				global.player2_show_controls+= 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 2)
			and (global.player3_show_controls> 0)
			{
				global.player3_show_controls -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 2)
			and (global.player3_show_controls< 10)
			{
				global.player3_show_controls+= 1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 3)
			and (global.player4_show_controls> 0)
			{
				global.player4_show_controls -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = true)
			and (remapping_player = 3)
			and (global.player4_show_controls< 10)
			{
				global.player4_show_controls+= 1;
				menu_delay = 3;
			}
		}
		#endregion /*Navigate Show Controls Settings END*/

		#endregion /*Options Menu END*/
		
	}
	#endregion /*Menu Navigation END*/
	
	#region /*Accept*/
	if (key_a_pressed)
	or(mouse_check_button_pressed(mb_left))
	and (window_mouse_get_x() > 370)
	{
		if (menu = "assist_enable")
		and (menu_delay = 0)
		{
			if (global.assist_enable = true)
			{
				global.assist_enable = false;
			}
			else
			{
				global.assist_enable = true;
			}
			menu_delay = 3;
		}
		
		#region /*Drop down menu*/
		if (menu = "assist_item_appear")
		or(menu = "assist_extra_hp")
		or(menu = "difficulty_settings")
		or(menu = "hud_hide_time")
		or(menu = "remap_select_player")
		or(menu = "wall_jump_setting")
		or(menu = "drop_from_rope")
		or(menu = "show_controls")
		or(menu = "number_of_audio_channels")
		{
			if (menu_delay = 0)
			and (open_dropdown = false)
			{
				open_dropdown = true;
				menu_delay = 3;
			}
			else
			if (menu_delay = 0)
			and (open_dropdown = true)
			{
				open_dropdown = false;
				menu_delay = 3;
			}
		}
		#endregion /*Drop down menu END*/
		
		if (menu = "assist_invincible") and (menu_delay = 0){if (global.assist_invincible = true){global.assist_invincible = false;}else{global.assist_invincible = true;}menu_delay = 3;}
		if (menu = "assist_breathe_underwater") and (menu_delay = 0){if (global.assist_breathe_underwater = true){global.assist_breathe_underwater = false;}else{global.assist_breathe_underwater = true;}menu_delay = 3;}
		if (menu = "assist_guiding_arrows") and (menu_delay = 0){if (global.assist_guiding_arrows = true){global.assist_guiding_arrows = false;}else{global.assist_guiding_arrows = true;}menu_delay = 3;}
		if (menu = "assist_normal_arrows") and (menu_delay = 0){if (global.assist_normal_arrows = true){global.assist_normal_arrows = false;}else{global.assist_normal_arrows = true;}menu_delay = 3;}
		if (menu = "assist_enable_enemies") and (menu_delay = 0) and (global.assist_enable = true){if (global.assist_enable_enemies = true){global.assist_enable_enemies = false;}else{global.assist_enable_enemies = true;}menu_delay = 3;}
		if (menu = "assist_enable_spikes") and (menu_delay = 0) and (global.assist_enable = true){if (global.assist_enable_spikes = true){global.assist_enable_spikes = false;}else{global.assist_enable_spikes = true;}menu_delay = 3;}
		if (menu = "assist_show_assist_mode_text") and (menu_delay = 0){if (global.assist_show_assist_mode_text = true){global.assist_show_assist_mode_text = false;}else{global.assist_show_assist_mode_text = true;}menu_delay = 3;}
		
		if (menu = "automatically_pause_when_window_is_unfocused_settings") and (menu_delay = 0){if (global.automatically_pause_when_window_is_unfocused = true){global.automatically_pause_when_window_is_unfocused = false;}else{global.automatically_pause_when_window_is_unfocused = true;}menu_delay = 3;}
		if (menu = "show_timer_settings") and (menu_delay = 0){if (global.show_timer = true){global.show_timer = false;}else{global.show_timer = true;}menu_delay = 3;}
		if (menu = "show_deaths_counter_settings") and (menu_delay = 0){if (global.show_deaths_counter = true){global.show_deaths_counter = false;}else{global.show_deaths_counter = true;}menu_delay = 3;}
		if (menu = "show_tutorial_signs") and (menu_delay = 0){if (global.show_tutorial_signs = true){global.show_tutorial_signs = false;}else{global.show_tutorial_signs = true;}menu_delay = 3;}
		if (menu = "players_can_collide") and (menu_delay = 0){if (global.players_can_collide = true){global.players_can_collide = false;}else{global.players_can_collide = true;}menu_delay = 3;}
		if (menu = "convention_mode") and (menu_delay = 0){if (global.convention_mode = true){global.convention_mode = false;}else{global.convention_mode = true;}menu_delay = 3;}
		
		if (menu = "fullscreen_mode") and (menu_delay = 0){if (window_get_fullscreen()){window_set_fullscreen(false);}else{window_set_fullscreen(true);}menu_delay = 3;}
		if (menu = "interpolate") and (menu_delay = 0){if (global.interpolate = true){global.interpolate = false;gpu_set_texfilter(false);}else{global.interpolate = true;gpu_set_texfilter(true);}menu_delay = 3;}
		if (menu = "show_fps") and (menu_delay = 0){if (global.show_fps = true){global.show_fps = false;}else{global.show_fps = true;}menu_delay = 3;}
		if (menu = "show_fps_real") and (menu_delay = 0){if (global.show_fps_real = true){global.show_fps_real = false;}else{global.show_fps_real = true;}menu_delay = 3;}
		if (menu = "show_instance_count") and (menu_delay = 0){if (global.show_instance_count = true){global.show_instance_count = false;}else{global.show_instance_count = true;}menu_delay = 3;}
		if (menu = "show_collision_mask") and (menu_delay = 0){if (global.show_collision_mask= true){global.show_collision_mask= false;}else{global.show_collision_mask= true;}menu_delay = 3;}
		if (menu = "enable_transitions") and (menu_delay = 0){if (global.enable_transitions = true){global.enable_transitions = false;}else{global.enable_transitions = true;}menu_delay = 3;}
		
		if (menu = "enable_background_layer1") and (menu_delay = 0){if (global.enable_background_layer1 = true){global.enable_background_layer1 = false;}else{global.enable_background_layer1 = true;}menu_delay = 3;}
		if (menu = "enable_background_layer2") and (menu_delay = 0){if (global.enable_background_layer2 = true){global.enable_background_layer2 = false;}else{global.enable_background_layer2 = true;}menu_delay = 3;}
		if (menu = "enable_background_layer3") and (menu_delay = 0){if (global.enable_background_layer3 = true){global.enable_background_layer3 = false;}else{global.enable_background_layer3 = true;}menu_delay = 3;}
		if (menu = "enable_background_layer4") and (menu_delay = 0){if (global.enable_background_layer4 = true){global.enable_background_layer4 = false;}else{global.enable_background_layer4 = true;}menu_delay = 3;}
		if (menu = "enable_foreground_layer1") and (menu_delay = 0){if (global.enable_foreground_layer1 = true){global.enable_foreground_layer1 = false;}else{global.enable_foreground_layer1 = true;}menu_delay = 3;}
		if (menu = "enable_foreground_layer_above_static_objects") and (menu_delay = 0){if (global.enable_foreground_layer_above_static_objects = true){global.enable_foreground_layer_above_static_objects = false;}else{global.enable_foreground_layer_above_static_objects = true;}menu_delay = 3;}
		if (menu = "enable_foreground_layer2") and (menu_delay = 0){if (global.enable_foreground_layer2 = true){global.enable_foreground_layer2 = false;}else{global.enable_foreground_layer2 = true;}menu_delay = 3;}
		if (menu = "enable_foreground_layer_secret") and (menu_delay = 0){if (global.enable_foreground_layer_secret = true){global.enable_foreground_layer_secret = false;}else{global.enable_foreground_layer_secret = true;}menu_delay = 3;}
		if (menu = "reset_level_zoom_when_going_back_to_map") and (menu_delay = 0){if (global.reset_level_zoom_when_going_back_to_map = true){global.reset_level_zoom_when_going_back_to_map = false;}else{global.reset_level_zoom_when_going_back_to_map = true;}menu_delay = 3;}
		if (menu = "reset_world_map_zoom_when_going_back_to_map") and (menu_delay = 0){if (global.reset_world_map_zoom_when_going_back_to_map = true){global.reset_world_map_zoom_when_going_back_to_map = false;}else{global.reset_world_map_zoom_when_going_back_to_map = true;}menu_delay = 3;}
		
		if (menu = "up_key_is_jump_key") and (menu_delay = 0){
		if (remapping_player = 0){if (global.player1_up_key_is_jump_key = true){global.player1_up_key_is_jump_key = false;}else{global.player1_up_key_is_jump_key = true;}menu_delay = 3;}
		else
		if (remapping_player = 1){if (global.player2_up_key_is_jump_key = true){global.player2_up_key_is_jump_key = false;}else{global.player2_up_key_is_jump_key = true;}menu_delay = 3;}
		else
		if (remapping_player = 2){if (global.player3_up_key_is_jump_key = true){global.player3_up_key_is_jump_key = false;}else{global.player3_up_key_is_jump_key = true;}menu_delay = 3;}
		else
		if (remapping_player = 3){if (global.player4_up_key_is_jump_key = true){global.player4_up_key_is_jump_key = false;}else{global.player4_up_key_is_jump_key = true;}menu_delay = 3;}}
		
		if (menu = "double_tap_to_run") and (menu_delay = 0){
		if (remapping_player = 0){if (global.player1_double_tap_to_run = true){global.player1_double_tap_to_run = false;}else{global.player1_double_tap_to_run = true;}menu_delay = 3;}else
		if (remapping_player = 1){if (global.player2_double_tap_to_run = true){global.player2_double_tap_to_run = false;}else{global.player2_double_tap_to_run = true;}menu_delay = 3;}else
		if (remapping_player = 2){if (global.player3_double_tap_to_run = true){global.player3_double_tap_to_run = false;}else{global.player3_double_tap_to_run = true;}menu_delay = 3;}else
		if (remapping_player = 3){if (global.player4_double_tap_to_run = true){global.player4_double_tap_to_run = false;}else{global.player4_double_tap_to_run = true;}menu_delay = 3;}}
		
		if (menu = "always_run") and (menu_delay = 0){
		if (remapping_player = 0){if (global.player1_sprint_toggle = true){global.player1_sprint_toggle = false;}else{global.player1_sprint_toggle = true;}menu_delay = 3;}else
		if (remapping_player = 1){if (global.player2_sprint_toggle = true){global.player2_sprint_toggle = false;}else{global.player2_sprint_toggle = true;}menu_delay = 3;}else
		if (remapping_player = 2){if (global.player3_sprint_toggle = true){global.player3_sprint_toggle = false;}else{global.player3_sprint_toggle = true;}menu_delay = 3;}else
		if (remapping_player = 3){if (global.player4_sprint_toggle = true){global.player4_sprint_toggle = false;}else{global.player4_sprint_toggle = true;}menu_delay = 3;}}
		
		if (menu = "cancel_dive_by_pressing_jump_or_dive_button") and (menu_delay = 0){
		if (remapping_player = 0){if (global.player1_cancel_dive_by_pressing_jump_or_dive_button = true){global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player1_cancel_dive_by_pressing_jump_or_dive_button = true;}menu_delay = 3;}else
		if (remapping_player = 1){if (global.player2_cancel_dive_by_pressing_jump_or_dive_button = true){global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player2_cancel_dive_by_pressing_jump_or_dive_button = true;}menu_delay = 3;}else
		if (remapping_player = 2){if (global.player3_cancel_dive_by_pressing_jump_or_dive_button = true){global.player3_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player3_cancel_dive_by_pressing_jump_or_dive_button = true;}menu_delay = 3;}else
		if (remapping_player = 3){if (global.player4_cancel_dive_by_pressing_jump_or_dive_button = true){global.player4_cancel_dive_by_pressing_jump_or_dive_button = false;}else{global.player4_cancel_dive_by_pressing_jump_or_dive_button = true;}menu_delay = 3;}}
		
		if (menu = "cancel_dive_by_pressing_opposite_direction") and (menu_delay = 0){
		if (remapping_player = 0){if (global.player1_cancel_dive_by_pressing_opposite_direction = true){global.player1_cancel_dive_by_pressing_opposite_direction = false;}else{global.player1_cancel_dive_by_pressing_opposite_direction = true;}menu_delay = 3;}else
		if (remapping_player = 1){if (global.player2_cancel_dive_by_pressing_opposite_direction = true){global.player2_cancel_dive_by_pressing_opposite_direction = false;}else{global.player2_cancel_dive_by_pressing_opposite_direction = true;}menu_delay = 3;}else
		if (remapping_player = 2){if (global.player3_cancel_dive_by_pressing_opposite_direction = true){global.player3_cancel_dive_by_pressing_opposite_direction = false;}else{global.player3_cancel_dive_by_pressing_opposite_direction = true;}menu_delay = 3;}else
		if (remapping_player = 3){if (global.player4_cancel_dive_by_pressing_opposite_direction = true){global.player4_cancel_dive_by_pressing_opposite_direction = false;}else{global.player4_cancel_dive_by_pressing_opposite_direction = true;}menu_delay = 3;}}
		
		if (menu = "down_and_jump_to_groundpound") and (menu_delay = 0){
		if (remapping_player = 0){if (global.player1_down_and_jump_to_groundpound = true){global.player1_down_and_jump_to_groundpound = false;}else{global.player1_down_and_jump_to_groundpound = true;}menu_delay = 3;}else
		if (remapping_player = 1){if (global.player2_down_and_jump_to_groundpound = true){global.player2_down_and_jump_to_groundpound = false;}else{global.player2_down_and_jump_to_groundpound = true;}menu_delay = 3;}else
		if (remapping_player = 2){if (global.player3_down_and_jump_to_groundpound = true){global.player3_down_and_jump_to_groundpound = false;}else{global.player3_down_and_jump_to_groundpound = true;}menu_delay = 3;}else
		if (remapping_player = 3){if (global.player4_down_and_jump_to_groundpound = true){global.player4_down_and_jump_to_groundpound = false;}else{global.player4_down_and_jump_to_groundpound = true;}menu_delay = 3;}}
	}
	#endregion /*Accept END*/

	if (menu_delay > 0)
	{
		menu_delay -= 1;
	}
	if (menu_delay < 0)
	{
		menu_delay = 0;
	}

	#region /*Menu navigation with joystick*/
	if (gamepad_axis_value(0, gp_axislv) < 0)
	or(gamepad_axis_value(0, gp_axislv) > 0)
	or(gamepad_axis_value(0, gp_axislh) < 0)
	or(gamepad_axis_value(0, gp_axislh) > 0)
	or(gamepad_axis_value(1, gp_axislv) < 0)
	or(gamepad_axis_value(1, gp_axislv) > 0)
	or(gamepad_axis_value(1, gp_axislh) < 0)
	or(gamepad_axis_value(1, gp_axislh) > 0)
	or(gamepad_axis_value(2, gp_axislv) < 0)
	or(gamepad_axis_value(2, gp_axislv) > 0)
	or(gamepad_axis_value(2, gp_axislh) < 0)
	or(gamepad_axis_value(2, gp_axislh) > 0)
	or(gamepad_axis_value(3, gp_axislv) < 0)
	or(gamepad_axis_value(3, gp_axislv) > 0)
	or(gamepad_axis_value(3, gp_axislh) < 0)
	or(gamepad_axis_value(3, gp_axislh) > 0)
	{
		if (menu_joystick_delay = 0)
		{
			menu_joystick_delay = 15;
		}
	}
	if (gamepad_axis_value(0, gp_axislv)= 0)
	and (gamepad_axis_value(0, gp_axislh)= 0)
	and (gamepad_axis_value(1, gp_axislv)= 0)
	and (gamepad_axis_value(1, gp_axislh)= 0)
	and (gamepad_axis_value(2, gp_axislv)= 0)
	and (gamepad_axis_value(2, gp_axislh)= 0)
	and (gamepad_axis_value(3, gp_axislv)= 0)
	and (gamepad_axis_value(3, gp_axislh)= 0)
	{
		menu_joystick_delay = 0;
	}
	if (menu_joystick_delay > 0)
	{
		menu_joystick_delay -= 1;
	}
	#endregion /*Menu navigation with joystick END*/
	
	#region /*Draw mouse cursor for menu navigation*/
	if (global.controls_used_for_menu_navigation = "mouse")
	and (global.full_level_map_screenshot = false)
	and (os_type!= os_android)
	and (os_type!= os_ios)
	{
		draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
	}
	#endregion /*Draw mouse cursor for menu navigation END*/
	
}
else
{
	left_sidebar_x = lerp(left_sidebar_x, -400, 0.1);
	background_brightness_menu_lerp = lerp(background_brightness_menu_lerp, 0, 0.1);
}

#region /*Darken sidebar when it's not the focus*/
if (can_navigate_settings_sidebar = true)
and (in_settings = true)
{
	darken_settings_alpha = lerp(darken_settings_alpha, 0.5, 0.1); /*Darken the settings*/
	darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0, 0.1); /*But not the settings sidebar*/
}
else
if (can_navigate_settings_sidebar = false)
and (in_settings = true)
{
	darken_settings_alpha = lerp(darken_settings_alpha, 0, 0.1); /*Don't darken the settings*/
	darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0.5, 0.1); /*But darken the settings sidebar*/
}
else
if (in_settings = false)
{
	darken_settings_alpha = lerp(darken_settings_alpha, 0, 0.1); /*Don't darken the settings*/
	darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0, 0.1); /*And don't darken the settings sidebar*/
}
#endregion /*Darken sidebar when it's not the focus END*/

}