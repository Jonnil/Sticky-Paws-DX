///scr_options_menu()
function scr_options_menu()
{
	
	#region /*Background Brightness in Menus Options*/
	if (background_brightness_menu_lerp < 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(-32,-32, room_width*2, room_height*2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	else
	if (background_brightness_menu_lerp > 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(-32,-32, room_width*2, room_height*2, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /*Background Brightness in Menus Options END*/
	
	#region /*Black Background behind sidebar*/
	draw_set_alpha(1);
	draw_rectangle_color(left_sidebar_x + 0, 0, left_sidebar_x + 370,window_get_height(), c_black, c_black, c_black, c_black, false);
	#endregion /*Black Background behind sidebar END*/
	
	#region /*Set Font*/
	if (global.language_localization = localization.ar_sa)
	{
		var text_x_offset = 290;
		var icon_x_offset = 330;
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
	}
	else
	{
		var text_x_offset = 0;
		var icon_x_offset = 0;
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
	}
	#endregion /*Set Font END*/
	
	#region /*Menu navigation tabs y positions*/
	accessibility_settings_y = 40;
	game_text_y = 40 *2;
	game_settings_y = 40 *3;
	multiplayer_settings_y = 40 *4;
	controls_text_y = 40 *5;
	keyboard_and_mouse_settings_y = 40 *6;
	controller_settings_y = 40 *7;
	touch_settings_y = 40 *8;
	general_text_y = 40 * 9;
	profile_settings_y = 40 * 10;
	video_settings_y = 40 * 11;
	audio_settings_y = 40 * 12;
	global_resources_settings_y = 40 * 13;
	storage_settings_y = 40 * 14;
	language_settings_y = 40 * 15;
	broadcast_settings_y = 40 * 16;
	how_to_play_y = 40 * 17;
	
	if (global.enable_multiplayer_settings = false)
	and (global.enable_controller_settings = false)
	and (global.enable_touch_settings = false)
	and (global.enable_profile_settings = false)
	and (global.enable_language_settings = false)
	and (global.enable_broadcast_settings = false)
	and (global.enable_how_to_play_settings = false)
	and (global.enable_add_ons_settings = false)
	{
		accessibility_settings_y = 40;
		game_text_y = 40 *2;
		game_settings_y = 40 *3;
		controls_text_y = 40 *4;
		keyboard_and_mouse_settings_y = 40 *5;
		general_text_y = 40 *6;
		video_settings_y = 40 *7;
		audio_settings_y = 40 *8;
		global_resources_settings_y = 40 * 9;
		storage_settings_y = 40 * 10;
	}
	#endregion /*Menu navigation tabs y positions END*/
	
	#region /*Tabs Graphics*/
	
	#region /*Accessibility Settings*/
	if (global.settings_sidebar_menu = "accessibility_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
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
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
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
	draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (game_text_y), Text("Game"), global.default_text_size *0.5, c_black, c_white, 1);
	
	#region /*Game Settings*/
	if (global.settings_sidebar_menu = "game_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, game_settings_y, 370, game_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +game_settings_y, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +game_settings_y, 1, 1, 0, c_gray, 1);
		}
		draw_sprite_ext(spr_settings_icons, 2, left_sidebar_x + 20 + icon_x_offset, 20 +game_settings_y, 1, 1, 0, c_white, 1) /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +game_settings_y, Text("Game"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, game_settings_y, 370, game_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +game_settings_y, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +game_settings_y, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_settings_icons, 2, left_sidebar_x + 20 + icon_x_offset, 20 +game_settings_y, 0.9, 0.9, 0, c_white, 1)
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +game_settings_y, Text("Game"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*Game Settings END*/
	
	#region /*Multiplayer Settings*/
	if(global.enable_multiplayer_settings = true)
	{
		if (global.settings_sidebar_menu = "multiplayer_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +multiplayer_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +multiplayer_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 3, left_sidebar_x + 20 + icon_x_offset, 20 +multiplayer_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +multiplayer_settings_y, Text("Multiplayer"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +multiplayer_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +multiplayer_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 3, left_sidebar_x + 20 + icon_x_offset, 20 +multiplayer_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +multiplayer_settings_y, Text("Multiplayer"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Multiplayer Settings END*/
	
	#endregion /*My Game Settings END*/
	
	#region /*Controls Settings*/
	draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (controls_text_y), Text("Controls"), global.default_text_size *0.5, c_black, c_white, 1);
	
	#region /*Keyboard and Mouse Settings*/
	if (global.settings_sidebar_menu = "keyboard_and_mouse_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1))
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
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, touch_settings_y, 370, touch_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, touch_settings_y, 370,(40 * 9) - 1))
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
	draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 +general_text_y, Text("General"), global.default_text_size *0.5, c_black, c_white, 1);
	
	#region /*Profile Settings*/
	if(global.enable_profile_settings = true)
	{
		if (global.settings_sidebar_menu = "profile_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,profile_settings_y, 370,profile_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,profile_settings_y, 370,profile_settings_y + 40 - 1))
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
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,video_settings_y, 370,video_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +video_settings_y, 1, 1, 0, c_green, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +video_settings_y, 1, 1, 0, c_gray, 1);
		}
		draw_sprite_ext(spr_settings_icons, 8, left_sidebar_x + 20 + icon_x_offset, 20 +video_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +video_settings_y, Text("Video"), global.default_text_size * 1.1, c_black, c_white, 1);
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,video_settings_y, 370,video_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +video_settings_y, 1, 1, 0, c_lime, 1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +video_settings_y, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_settings_icons, 8, left_sidebar_x + 20 + icon_x_offset, 20 +video_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +video_settings_y, Text("Video"), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /*Video Settings END*/
	
	#region /*Audio Settings*/
	if (global.settings_sidebar_menu = "audio_settings")
	{
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,audio_settings_y, 370,audio_settings_y + 40 - 1))
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
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,audio_settings_y, 370,audio_settings_y + 40 - 1))
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
	and (global.pause_room != room_leveleditor)
	{
		if (global.settings_sidebar_menu = "global_resources_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +global_resources_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +global_resources_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 10, left_sidebar_x + 20 + icon_x_offset, 20 +global_resources_settings_y, 1, 1, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +global_resources_settings_y, Text("Custom Resources"), global.default_text_size * 1.1, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation = "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +global_resources_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +global_resources_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 10, left_sidebar_x + 20 + icon_x_offset, 20 +global_resources_settings_y, 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
			draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +global_resources_settings_y, Text("Custom Resources"), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /*Global Resources Settings END*/
	
	#region /*Storage Settings*/
	if(global.enable_storage_settings = true)
	{
		if (global.settings_sidebar_menu = "storage_settings")
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,storage_settings_y, 370,storage_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,storage_settings_y, 370,storage_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, language_settings_y, 370, language_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, language_settings_y, 370, language_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,how_to_play_y, 370,how_to_play_y + 40 - 1))
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
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,how_to_play_y, 370,how_to_play_y + 40 - 1))
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
	if (global.enable_add_ons_settings= true)
	{
		draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (40 * 18), Text("Add-Ons"), global.default_text_size *0.5, c_black, c_white, 1);

		if (global.settings_sidebar_menu = "resource_packs_settings")
		{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_gray, 1); /*Button Hightlighted*/
		draw_sprite_ext(spr_settings_icons, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), Text("Resource Packs"), global.default_text_size * 1.1, c_black, c_white, 1);
		}else{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_white, 1); /*Button Not Selected*/
		draw_sprite_ext(spr_settings_icons, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), Text("Resource Packs"), global.default_text_size, c_white, c_black, 1);}

		if (global.settings_sidebar_menu = "behavior_packs_settings")
		{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 *20), 1, 1, 0, c_gray, 1); /*Button Hightlighted*/
		draw_sprite_ext(spr_settings_icons, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 *20), 1, 1, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 *20), Text("Behavior Packs"), global.default_text_size * 1.1, c_black, c_white, 1);
		}else{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 *20), 1, 1, 0, c_white, 1); /*Button Not Selected*/
		draw_sprite_ext(spr_settings_icons, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 *20), 0.9, 0.9, 0, c_white, 1); /*Settings Icon*/
		draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 *20), Text("Behavior Packs"), global.default_text_size, c_white, c_black, 1);}
	}
	#endregion /*Add-Ons Settings END*/

	#region /*The "Back" button should always appear at the top of the screen*/
	if (global.settings_sidebar_menu = "settings_back")
	{
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, 0 -room_height, 370, 39))
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
		if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, 0 -room_height, 370, 39))
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
	draw_rectangle_color(left_sidebar_x, 0, left_sidebar_x + 370,window_get_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	#endregion /*Tabs Graphics END*/
	
	if (in_settings= true)
	{

	#region /*Set a default font*/
	if (asset_get_type("font_other_languages") == asset_font)
	and (global.language_localization = localization.ar_sa)
	{
		draw_set_font(font_other_languages);
	}
	else
	if (asset_get_type("font_default") == asset_font)
	{
		draw_set_font(font_default);
	}
	#endregion /*Set a default font END*/

	#region /*Scroll menu on right side*/
	menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.1);
	if (menu_y_offset_real >= 0)
	{
		menu_y_offset_real = 0;
	}
	
	#region /*Scrolling menu down with mouse wheel*/
	if (mouse_wheel_down())
	and (can_navigate_settings_sidebar = false)
	{
		menu_y_offset_real -= 10;
		menu_y_offset-= 10;
	}
	#endregion /*Scrolling menu down with mouse wheel END*/
	
	#region /*Scrolling menu up with mouse wheel*/
	if (mouse_wheel_up())
	and (can_navigate_settings_sidebar = false)
	and (menu_y_offset<=- 10)
	{
		menu_y_offset_real += 10;
		menu_y_offset += 10;
	}
	#endregion /*Scrolling menu up with mouse wheel END*/
	
	if (abs(menu_y_offset_real) + window_get_height() - 60 < menu_cursor_y_position)
	and (menu_cursor_y_position > window_get_height())
	{
		menu_y_offset_real -= 10;
	}
	if (abs(menu_y_offset_real) + 60 > menu_cursor_y_position)
	{
		menu_y_offset_real += 10;
	}
	if (abs(menu_y_offset_real) + window_get_height() + 60 < menu_cursor_y_position)
	and (menu_cursor_y_position > window_get_height())
	{
		menu_y_offset_real -= 100;
	}
	if (abs(menu_y_offset_real) - 60 > menu_cursor_y_position)
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
	or(key_b_pressed)
	and (menu_delay = 0)
	and (can_navigate_settings_sidebar = true)
	and (input_key = false)
	{
		scr_config_save(); /*Save Config*/
		if (global.pause_room != room_leveleditor)
		and (global.selected_resourcepack != old_selected_resource_pack)
		{
			scr_load_resource_pack_sprite(); /*Load new sprites from resource pack*/
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
		if (global.settings_sidebar_menu = "audio_settings"){menu = "music_volume";}
		if (global.settings_sidebar_menu = "global_resources_settings"){menu = "resourcepacks";}
		if (global.settings_sidebar_menu = "storage_settings"){menu = "file_select";}
		if (global.settings_sidebar_menu = "language_settings"){menu = "language_id_id";}
	}
	/*When you navigate the sidebar or not*/
	
	/*Main Settings on left sidebar*/
	
	background_brightness_menu_lerp = lerp(background_brightness_menu_lerp, global.background_brightness_menu, 0.1); /*Background Brightness in Menus Options END*/
	
	left_sidebar_x = lerp(left_sidebar_x, 0, 0.1);
	
	#region /*Menu navigation with mouse*/
	
	#region /*Click Back*/
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, 0 -room_height, 370, 40 - 1))
	and (global.settings_sidebar_menu = "settings_back")
	and (mouse_check_button_released(mb_left))
	{
		scr_config_save(); /*Save Config*/
		if (global.pause_room != room_leveleditor)
		and (global.selected_resourcepack != old_selected_resource_pack)
		{
			scr_load_resource_pack_sprite(); /*Load new sprites from resource pack*/
		}
		input_key = false;
		in_settings = false;
		menu = "options";
		menu_delay = 3;
	}
	#endregion /*Click Back END*/
	
	else
	/*Back*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, 0 -room_height, 370, 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "settings_back";input_key = false;can_navigate_settings_sidebar = true;}else
	
	/*Click Accessibility*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1)) and (global.settings_sidebar_menu = "accessibility_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "accessibility_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "assist_enable";}else
	/*Accessibility*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "accessibility_settings";input_key = false;can_navigate_settings_sidebar = true;}else
	
	/*Click Game*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, game_settings_y, 370,(game_settings_y + 40) - 1)) and (global.settings_sidebar_menu = "game_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "game_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "difficulty_settings";}
	/*Game*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, game_settings_y, 370,(game_settings_y + 40) - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "game_settings";input_key = false;can_navigate_settings_sidebar = true;}
	
	if (global.enable_multiplayer_settings = true)
	{
		/*Click Multiplayer*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "multiplayer_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "multiplayer_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;}
		/*Multiplayer*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "multiplayer_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	/*Click Keyboard and Mouse*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "keyboard_and_mouse_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "keyboard_and_mouse_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "remap_select_player";}
	/*Keyboard and Mouse*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,keyboard_and_mouse_settings_y, 370,keyboard_and_mouse_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "keyboard_and_mouse_settings";input_key = false;can_navigate_settings_sidebar = true;}
	
	if(global.enable_controller_settings = true)
	{
		/*Click Controller*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, controller_settings_y, 370, controller_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "controller_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "controller_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;}
		/*Controller*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, controller_settings_y, 370, controller_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "controller_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_touch_settings = true)
	{
		/*Click Touch*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, touch_settings_y, 370, touch_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "touch_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "touch_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;}
		/*Touch*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, touch_settings_y, 370, touch_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "touch_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_profile_settings = true)
	{
		/*Click Profile*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,profile_settings_y, 370,profile_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "profile_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "profile_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;}
		/*Profile*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,profile_settings_y, 370,profile_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "profile_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	/*Click Video*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,video_settings_y, 370,video_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "video_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "video_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "fullscreen_mode";}
	/*Video*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,video_settings_y, 370,video_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "video_settings";input_key = false;can_navigate_settings_sidebar = true;}
	
	/*Click Audio*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,audio_settings_y, 370,audio_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "audio_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "audio_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "music_volume";}
	/*Audio*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,audio_settings_y, 370,audio_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "audio_settings";input_key = false;can_navigate_settings_sidebar = true;}
	
	if (global.enable_global_resources_settings = true)
	and (global.pause_room != room_leveleditor)
	
	{
		/*Click Global Resources*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "global_resources_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "global_resources_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "resourcepacks";}
		/*Global Resources*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "global_resources_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_storage_settings = true)
	{
		/*Click Storage*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,storage_settings_y, 370,storage_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "storage_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "storage_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "file_select";}
		/*Storage*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,storage_settings_y, 370,storage_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "storage_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_language_settings = true)
	{
		/*Click Language*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, language_settings_y, 370, language_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "language_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "language_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;menu = "language_id_id";}
		/*Language*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width, language_settings_y, 370, language_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "language_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_broadcast_settings = true)
	{
		/*Click Broadcast*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1)) and (global.settings_sidebar_menu = "broadcast_settings") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "broadcast_settings";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;}
		/*Broadcast*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,broadcast_settings_y, 370,broadcast_settings_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "broadcast_settings";input_key = false;can_navigate_settings_sidebar = true;}
	}
	
	if(global.enable_how_to_play_settings = true)
	{
		/*Click How to Play*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,how_to_play_y, 370,how_to_play_y + 40 - 1)) and (global.settings_sidebar_menu = "how_to_play") and (mouse_check_button_released(mb_left)){global.settings_sidebar_menu = "how_to_play";menu_delay = 3;input_key = false;can_navigate_settings_sidebar = false;}
		/*How to Play*/if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 0 -room_width,how_to_play_y, 370,how_to_play_y + 40 - 1)) and (mouse_check_button(mb_left)){global.settings_sidebar_menu = "how_to_play";input_key = false;can_navigate_settings_sidebar = true;}
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
				global.settings_sidebar_menu = "game_settings";
				menu_delay = 3;
			}
			/*Sidebar Navigation*/
		
		}
		#endregion /*Accessibility Settings END*/
		
		#region /*My Game Settings*/
	
		#region /*Game Settings*/
		if (global.settings_sidebar_menu = "game_settings")
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
				and (global.pause_room != room_leveleditor)
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
					global.settings_sidebar_menu = "resource_packs_settings";
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
						global.settings_sidebar_menu = "resource_packs_settings";
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
					and (global.pause_room != room_leveleditor)
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
						global.settings_sidebar_menu = "resource_packs_settings";
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
					global.settings_sidebar_menu = "broadcast_settings";
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
	
		#region /*How to play Settings*/
		if(global.enable_how_to_play_settings = true)
		{
			if (global.settings_sidebar_menu = "how_to_play")
			{
				if (key_up)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					global.settings_sidebar_menu = "broadcast_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar = true)
				and (menu_delay = 0)
				{
					if (global.enable_add_ons_settings= true)
					{
						global.settings_sidebar_menu = "resource_packs_settings";
					}
					else
					{
						global.settings_sidebar_menu = "settings_back";
					}
					menu_delay = 3;
				}
			}
		}
		#endregion /*General Settings END*/

		#region /*Add-Ons Settings*/
		if (global.enable_add_ons_settings= true)
		{
			if (global.settings_sidebar_menu = "resource_packs_settings")
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
					global.settings_sidebar_menu = "resource_packs_settings";
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
				and (global.pause_room != room_leveleditor)
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
				global.settings_sidebar_menu = "accessibility_settings";menu_delay = 3;
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
		draw_menu_checkmark(450, 50, "Enable Assist Mode", "assist_enable", global.assist_enable);
		draw_text_outlined(450, 100, "The game is meant to be played without Assist Mode. Only if you are unable to fully enjoy the game without extra help should you enable this.", global.default_text_size *0.75, c_menu_outline, c_menu_fill, 1);
		
		draw_menu_checkmark(450, 300, "Invincible", "assist_invincible", global.assist_invincible);
		draw_menu_checkmark(450, 350, "Breathe Underwater", "assist_breathe_underwater", global.assist_breathe_underwater);
		draw_menu_checkmark(450, 400, "Show Assist Arrows", "assist_guiding_arrows", global.assist_guiding_arrows);
		draw_menu_checkmark(450, 450, "Show Normal Arrows", "assist_normal_arrows", global.assist_normal_arrows);
		draw_menu_checkmark(450, 500, "Show Assist Mode Text", "assist_show_assist_mode_text", global.assist_show_assist_mode_text);
		
		#region /*Assist Extra HP*/
		draw_menu_dropdown(450, 230 + menu_y_offset, "Extra Health Points", "assist_extra_hp", global.assist_extra_hp,
		"None",
		"+1",
		"+2",
		"+3",
		"+4",
		"+5",
		"+6",
		"+7",
		"+8",
		"+9",
		"");
		#endregion /*Assist Extra HP END*/
		
		#region /*Assist item appear*/
		draw_menu_dropdown(450, 150 + menu_y_offset, "Assist Item", "assist_item_appear", global.assist_item_appear,
		"Always Appear",
		"Appear after 1 death on a level",
		"Appear after 2 deaths on a level",
		"Appear after 3 deaths on a level",
		"Appear after 4 deaths on a level",
		"Appear after 5 deaths on a level",
		"Appear after 6 deaths on a level",
		"Appear after 7 deaths on a level",
		"Appear after 8 deaths on a level",
		"Appear after 9 deaths on a level",
		"Never Appear");
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
			draw_rectangle_color(left_sidebar_x + 370, 125, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
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
		show_timer_settings_y = 164+ (48);
		show_deaths_counter_settings_y = 164+ (48 *2);
		show_tutorial_signs_y = 164+ (48 *3);
		hud_hide_time_y = 164+ (48 *5) - 16;
		custom_level_load_delay_settings_y = 164+ (48 *7) - 16;
		activate_cheats_y = 164+ (48 *8);
		enable_enemies_y = 164+ (48 * 10);
		enable_spikes_y = 164+ (48 * 11);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		draw_menu_checkmark(380, automatically_pause_when_window_is_unfocused_settings_y, "Automatically Pause When Window Is Unfocused", "automatically_pause_when_window_is_unfocused_settings", global.automatically_pause_when_window_is_unfocused); /*Automatically Pause When Window Is Unfocused*/
		draw_menu_checkmark(380, show_timer_settings_y, "Show Timer", "show_timer_settings", global.show_timer); /*Show Timer*/
		draw_menu_checkmark(380, show_deaths_counter_settings_y, "Show Deaths Counter", "show_deaths_counter_settings", global.show_deaths_counter); /*Show Deaths Counter*/
		draw_menu_checkmark(380, show_tutorial_signs_y, "Show Tutorial Signs", "show_tutorial_signs", global.show_tutorial_signs); /*Show Tutorial Signs*/
		draw_menu_checkmark(380, activate_cheats_y, "Activate Cheats", "activate_cheats", global.activate_cheats);
		draw_text_outlined(450, activate_cheats_y + 50, "The game is meant to be played without Cheats.", global.default_text_size *0.75, c_menu_outline, c_menu_fill, 1);
		draw_menu_checkmark(380, enable_enemies_y, "Enable Enemies", "enable_enemies", global.enable_enemies);
		draw_menu_checkmark(380, enable_spikes_y, "Enable Spikes", "enable_spikes", global.enable_spikes);
		
		if (global.activate_cheats = false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(left_sidebar_x + 370, activate_cheats_y+72, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		}
		if (global.hud_hide_time > 10)
		{
			global.hud_hide_time = 3;
		}
		
		draw_menu_dropdown(380, custom_level_load_delay_settings_y, "Custom Level Load Delay", "custom_level_load_delay_settings", global.custom_level_load_delay, "1 Frame", "2 Frames", "4 Frames", "8 Frames", "16 Frames", "32 Frames", "64 Frames", "128 Frames", "256 Frames", "512 Frames");
		draw_menu_dropdown(380, hud_hide_time_y, "HUD hide timer", "hud_hide_time", global.hud_hide_time, "Never Show", "After 1 Second", "After 2 Seconds", "After 3 Seconds", "After 4 Seconds", "After 5 Seconds", "After 6 Seconds", "After 7 Seconds", "After 8 Seconds", "After 9 Seconds", "Always Show");
		draw_menu_dropdown(380, difficulty_settings_y, "Level Layout Difficulty", "difficulty_settings", global.difficulty, "Easy", "Normal", "Hard"); /*Difficulty Settings*/
		
	}
	#endregion /*Game Settings END*/
	
	#region /*Multiplayer Settings*/
	if (global.settings_sidebar_menu = "multiplayer_settings")
	{
		draw_set_halign(fa_left);draw_set_valign(fa_center);
		draw_text_outlined(410, 20 + (40 *3), "Change how multiplayer works here", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /*Multiplayer Settings END*/
	
	#endregion /*My Game Settings*/
	
	#region /*Controls Settings*/
	if (global.settings_sidebar_menu = "keyboard_and_mouse_settings")
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		#region /*Remap Keyboard and Mouse*/
		
		menu_y_remap_key_dive = 64*2;
		menu_y_remap_key_jump = 64*3;
		menu_y_remap_key_crouch = 64*4;
		menu_y_remap_key_crouch_toggle = 64*5;
		menu_y_remap_key_sprint = 64*6;
		menu_y_remap_key_sprint_toggle = 64*7;
		menu_y_remap_key_left = 64*8;
		menu_y_remap_key_right = 64* 9;
		menu_y_remap_key_down = 64* 10;
		menu_y_remap_key_up = 64* 11;
		menu_y_remap_key_tongue = 64* 12;
		
		menu_y_remap_reset = 64* 13- 16;
		menu_y_up_key_is_jump_key = 64* 14;
		menu_y_double_tap_direction_to_run = 64* 15;
		menu_y_always_run = 64* 16;
		menu_y_cancel_dive_by_pressing_jump_or_dive_button = 64* 17;
		menu_y_cancel_dive_by_pressing_opposite_direction = 64* 18;
		menu_y_wall_jump_setting = 64* 19;
		menu_y_drop_down_from_rope = 64*20 + 16;
		menu_y_show_controls = 64*21+ 32;
		
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
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_dive,key1_x, menu_y_remap_key_dive +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_dive +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_dive > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_dive,key1_x, menu_y_remap_key_dive +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_dive +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Dive END*/
			#region /*Remap Key Jump*/
			if (menu = "remap_key_jump")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_jump,key1_x, menu_y_remap_key_jump +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_jump +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_jump,key1_x, menu_y_remap_key_jump +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_jump +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Jump END*/
			#region /*Remap Key Crouch*/
			if (menu = "remap_key_crouch")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch,key1_x, menu_y_remap_key_crouch +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch,key1_x, menu_y_remap_key_crouch +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Crouch*/
			#region /*Remap Key Crouch Toggle*/
			if (menu = "remap_key_crouch_toggle")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch_toggle,key1_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_crouch_toggle,key1_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Crouch Toggle END*/
			#region /*Remap Key Sprint*/
			if (menu = "remap_key_sprint")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint,key1_x, menu_y_remap_key_sprint +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint,key1_x, menu_y_remap_key_sprint +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Sprint END*/
			#region /*Remap Key Sprint Toggle*/
			if (menu = "remap_key_sprint_toggle")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint_toggle,key1_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_sprint_toggle,key1_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Sprint Toggle END*/
			#region /*Remap Key Left*/
			if (menu = "remap_key_left")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_left,key1_x, menu_y_remap_key_left +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_left +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_left,key1_x, menu_y_remap_key_left +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_left +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Left END*/
			#region /*Remap Key Right*/
			if (menu = "remap_key_right")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_right,key1_x, menu_y_remap_key_right +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_right +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_right,key1_x, menu_y_remap_key_right +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_right +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Right END*/
			#region /*Remap Key Down*/
			if (menu = "remap_key_down")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_down,key1_x, menu_y_remap_key_down+menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_down+menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_down,key1_x, menu_y_remap_key_down+menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_down+menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Down END*/
			#region /*Remap Key Up*/
			if (menu = "remap_key_up")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_up,key1_x, menu_y_remap_key_up +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_up +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_up,key1_x, menu_y_remap_key_up +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_up +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Up END*/
			#region /*Remap Key Tongue*/
			if (menu = "remap_key_tongue")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_key_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_tongue,key1_x, menu_y_remap_key_tongue +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_tongue +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key_tongue,key1_x, menu_y_remap_key_tongue +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key1_x, menu_y_remap_key_tongue +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Tongue END*/
		
			#region /*"OR" text*/
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text_outlined(or_text_x, menu_y_remap_key_dive +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_jump +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_crouch +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_crouch_toggle +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_sprint +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_sprint_toggle +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_left +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_right +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_down+menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_up +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(or_text_x, menu_y_remap_key_tongue +menu_y_offset, "OR", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			#endregion /*"OR" text END*/
		
			#region /*Remap Key 2 Dive*/
			if (menu = "remap_key_dive")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_dive > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_dive,key2_x, menu_y_remap_key_dive +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_dive +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_dive > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_dive,key2_x, menu_y_remap_key_dive +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_dive +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Dive END*/
			#region /*Remap Key 2 Jump*/
			if (menu = "remap_key_jump")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_jump,key2_x, menu_y_remap_key_jump +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_jump +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_jump,key2_x, menu_y_remap_key_jump +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_jump +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Jump END*/
			#region /*Remap Key 2 Crouch*/
			if (menu = "remap_key_crouch")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch,key2_x, menu_y_remap_key_crouch +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_crouch > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch,key2_x, menu_y_remap_key_crouch +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Crouch END*/
			#region /*Remap Key 2 Crouch Toggle*/
			if (menu = "remap_key_crouch_toggle")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch_toggle,key2_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_crouch_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_crouch_toggle,key2_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_crouch_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Crouch Toggle END*/
			#region /*Remap Key 2 Sprint*/
			if (menu = "remap_key_sprint")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint,key2_x, menu_y_remap_key_sprint +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_sprint > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint,key2_x, menu_y_remap_key_sprint +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Sprint END*/
			#region /*Remap Key 2 Sprint Toggle*/
			if (menu = "remap_key_sprint_toggle")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint_toggle,key2_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_sprint_toggle > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_sprint_toggle,key2_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_sprint_toggle +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Sprint Toggle END*/
			#region /*Remap Key 2 Left*/
			if (menu = "remap_key_left")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_left,key2_x, menu_y_remap_key_left +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_left +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_left,key2_x, menu_y_remap_key_left +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_left +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Left END*/
			#region /*Remap Key 2 Right*/
			if (menu = "remap_key_right")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_right,key2_x, menu_y_remap_key_right +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_right +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_right,key2_x, menu_y_remap_key_right +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_right +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Right END*/
			#region /*Remap Key 2 Down*/
			if (menu = "remap_key_down")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_down,key2_x, menu_y_remap_key_down+menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_down+menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_down > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_down,key2_x, menu_y_remap_key_down+menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_down+menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Down END*/
			#region /*Remap Key 2 Up*/
			if (menu = "remap_key_up")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_up,key2_x, menu_y_remap_key_up +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_up +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_up > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_up,key2_x, menu_y_remap_key_up +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_up +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Up END*/
			#region /*Remap Key 2 Tongue*/
			if (menu = "remap_key_tongue")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_key2_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_tongue,key2_x, menu_y_remap_key_tongue +menu_y_offset, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_tongue +menu_y_offset, 1, 1, 0, c_white, 1);
				}
			}
			else
			{
				if(remapping_player_key2_tongue > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, remapping_player_key2_tongue,key2_x, menu_y_remap_key_tongue +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, 0,key2_x, menu_y_remap_key_tongue +menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_dive +menu_y_offset-32, key1_x + 31, menu_y_remap_key_dive +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_dive +menu_y_offset-32, key1_x + 31, menu_y_remap_key_dive +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_jump +menu_y_offset-32, key1_x + 31, menu_y_remap_key_jump +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_jump +menu_y_offset-32, key1_x + 31, menu_y_remap_key_jump +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key1_x + 31, menu_y_remap_key_crouch +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key1_x + 31, menu_y_remap_key_crouch +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key1_x + 31, menu_y_remap_key_crouch_toggle +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key1_x + 31, menu_y_remap_key_crouch_toggle +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key1_x + 31, menu_y_remap_key_sprint +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key1_x + 31, menu_y_remap_key_sprint +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key1_x + 31, menu_y_remap_key_sprint +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key1_x + 31, menu_y_remap_key_sprint_toggle +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_left +menu_y_offset-32, key1_x + 31, menu_y_remap_key_left +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_left +menu_y_offset-32, key1_x + 31, menu_y_remap_key_left +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_right +menu_y_offset-32, key1_x + 31, menu_y_remap_key_right +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_right +menu_y_offset-32, key1_x + 31, menu_y_remap_key_right +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_down+menu_y_offset-32, key1_x + 31, menu_y_remap_key_down+menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_down+menu_y_offset-32, key1_x + 31, menu_y_remap_key_down+menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_up +menu_y_offset-32, key1_x + 31, menu_y_remap_key_up +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_up +menu_y_offset-32, key1_x + 31, menu_y_remap_key_up +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key1_x + 31, menu_y_remap_key_tongue +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key1_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key1_x + 31, menu_y_remap_key_tongue +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_dive +menu_y_offset-32, key2_x + 31, menu_y_remap_key_dive +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_dive +menu_y_offset-32, key2_x + 31, menu_y_remap_key_dive +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_jump +menu_y_offset-32, key2_x + 31, menu_y_remap_key_jump +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_jump +menu_y_offset-32, key2_x + 31, menu_y_remap_key_jump +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key2_x + 31, menu_y_remap_key_crouch +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key2_x + 31, menu_y_remap_key_crouch +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key2_x + 31, menu_y_remap_key_crouch_toggle +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key2_x + 31, menu_y_remap_key_crouch_toggle +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key2_x + 31, menu_y_remap_key_sprint +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key2_x + 31, menu_y_remap_key_sprint +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key2_x + 31, menu_y_remap_key_sprint +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key2_x + 31, menu_y_remap_key_sprint_toggle +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_left +menu_y_offset-32, key2_x + 31, menu_y_remap_key_left +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_left +menu_y_offset-32, key2_x + 31, menu_y_remap_key_left +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_right +menu_y_offset-32, key2_x + 31, menu_y_remap_key_right +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_right +menu_y_offset-32, key2_x + 31, menu_y_remap_key_right +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_down+menu_y_offset-32, key2_x + 31, menu_y_remap_key_down+menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_down+menu_y_offset-32, key2_x + 31, menu_y_remap_key_down+menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_up +menu_y_offset-32, key2_x + 31, menu_y_remap_key_up +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_up +menu_y_offset-32, key2_x + 31, menu_y_remap_key_up +menu_y_offset + 31, c_red, c_red, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key2_x + 31, menu_y_remap_key_tongue +menu_y_offset + 31, c_yellow, c_yellow, false);
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
					draw_roundrect_color(key2_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key2_x + 31, menu_y_remap_key_tongue +menu_y_offset + 31, c_red, c_red, false);
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
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_dive +menu_y_offset-32, key1_x + 32, menu_y_remap_key_dive +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_dive";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_jump +menu_y_offset-32, key1_x + 32, menu_y_remap_key_jump +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_jump";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key1_x + 32, menu_y_remap_key_crouch +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key1_x + 32, menu_y_remap_key_crouch_toggle +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch_toggle";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key1_x + 32, menu_y_remap_key_sprint +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key1_x + 32, menu_y_remap_key_sprint_toggle +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint_toggle";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_left +menu_y_offset-32, key1_x + 32, menu_y_remap_key_left +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_left";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_right +menu_y_offset-32, key1_x + 32, menu_y_remap_key_right +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_right";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_down+menu_y_offset-32, key1_x + 32, menu_y_remap_key_down+menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_down";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_up +menu_y_offset-32, key1_x + 32, menu_y_remap_key_up +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_up";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key1_x + 32, menu_y_remap_key_tongue +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_tongue";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
	
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_dive +menu_y_offset-32, key2_x + 32, menu_y_remap_key_dive +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_dive";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_jump +menu_y_offset-32, key2_x + 32, menu_y_remap_key_jump +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_jump";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key2_x + 32, menu_y_remap_key_crouch +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key2_x + 32, menu_y_remap_key_crouch_toggle +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_crouch_toggle";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key2_x + 32, menu_y_remap_key_sprint +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key2_x + 32, menu_y_remap_key_sprint_toggle +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_sprint_toggle";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_left +menu_y_offset-32, key2_x + 32, menu_y_remap_key_left +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_left";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_right +menu_y_offset-32, key2_x + 32, menu_y_remap_key_right +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_right";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_down+menu_y_offset-32, key2_x + 32, menu_y_remap_key_down+menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_down";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_up +menu_y_offset-32, key2_x + 32, menu_y_remap_key_up +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_up";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key2_x + 32, menu_y_remap_key_tongue +menu_y_offset + 32)) and (input_key = false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation = "mouse")
		{menu = "remap_key_tongue";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
	
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_dive +menu_y_offset-32, key1_x + 32, menu_y_remap_key_dive +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_jump +menu_y_offset-32, key1_x + 32, menu_y_remap_key_jump +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key1_x + 32, menu_y_remap_key_crouch +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key1_x + 32, menu_y_remap_key_crouch_toggle +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key1_x + 32, menu_y_remap_key_sprint +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key1_x + 32, menu_y_remap_key_sprint_toggle +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_left +menu_y_offset-32, key1_x + 32, menu_y_remap_key_left +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_right +menu_y_offset-32, key1_x + 32, menu_y_remap_key_right +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_down+menu_y_offset-32, key1_x + 32, menu_y_remap_key_down+menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_up +menu_y_offset-32, key1_x + 32, menu_y_remap_key_up +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key1_x + 32, menu_y_remap_key_tongue +menu_y_offset + 32))
	
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_dive +menu_y_offset-32, key2_x + 32, menu_y_remap_key_dive +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_jump +menu_y_offset-32, key2_x + 32, menu_y_remap_key_jump +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_crouch +menu_y_offset-32, key2_x + 32, menu_y_remap_key_crouch +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_crouch_toggle +menu_y_offset-32, key2_x + 32, menu_y_remap_key_crouch_toggle +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_sprint +menu_y_offset-32, key2_x + 32, menu_y_remap_key_sprint +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_sprint_toggle +menu_y_offset-32, key2_x + 32, menu_y_remap_key_sprint_toggle +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_left +menu_y_offset-32, key2_x + 32, menu_y_remap_key_left +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_right +menu_y_offset-32, key2_x + 32, menu_y_remap_key_right +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_down+menu_y_offset-32, key2_x + 32, menu_y_remap_key_down+menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_up +menu_y_offset-32, key2_x + 32, menu_y_remap_key_up +menu_y_offset + 32))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x-32, menu_y_remap_key_tongue +menu_y_offset-32, key2_x + 32, menu_y_remap_key_tongue +menu_y_offset + 32))
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
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_dive +menu_y_offset, 1, 1, 0, c_white, 1);
			menu_cursor_y_position = 128;
			draw_text_outlined(410, menu_y_remap_key_dive +menu_y_offset, "Dive", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
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
			draw_text_outlined(410, menu_y_remap_key_dive +menu_y_offset, "Dive", global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /*Remap Key Dive END*/
	
		#region /*Remap Key Jump*/
		if (menu = "remap_key_jump"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_jump +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128;
		draw_text_outlined(410, menu_y_remap_key_jump +menu_y_offset, "Jump", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_jump +menu_y_offset, "Jump", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Jump END*/
	
		#region /*Remap Key Crouch*/
		if (menu = "remap_key_crouch"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_crouch +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+64;
		draw_text_outlined(410, menu_y_remap_key_crouch +menu_y_offset, "Crouch", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_crouch +menu_y_offset, "Crouch", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Crouch END*/
	
		#region /*Remap Key Crouch Toggle*/
		if (menu = "remap_key_crouch_toggle"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_crouch_toggle +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+ 128;
		draw_text_outlined(410, menu_y_remap_key_crouch_toggle +menu_y_offset, "Crouch Toggle", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_crouch_toggle +menu_y_offset, "Crouch Toggle", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Crouch Toggle END*/
	
		#region /*Remap Key Sprint*/
		if (menu = "remap_key_sprint"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_sprint +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+ 192;
		draw_text_outlined(410, menu_y_remap_key_sprint +menu_y_offset, "Sprint", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_sprint +menu_y_offset, "Sprint", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Sprint END*/
	
		#region /*Remap Key Sprint Toggle*/
		if (menu = "remap_key_sprint_toggle"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_sprint_toggle +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+ 256;
		draw_text_outlined(410, menu_y_remap_key_sprint_toggle +menu_y_offset, "Sprint Toggle", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_sprint_toggle +menu_y_offset, "Sprint Toggle", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Sprint Toggle END*/
	
		#region /*Remap Key Left*/
		if (menu = "remap_key_left"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_left +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+ 320;
		draw_text_outlined(410, menu_y_remap_key_left +menu_y_offset, "Left", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_left +menu_y_offset, "Left", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Left END*/
	
		#region /*Remap Key Right*/
		if (menu = "remap_key_right"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_right +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+ 384;
		draw_text_outlined(410, menu_y_remap_key_right +menu_y_offset, "Right", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_right +menu_y_offset, "Right", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Right END*/
	
		#region /*Remap Key Down*/
		if (menu = "remap_key_down"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_down+menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+ 448;
		draw_text_outlined(410, menu_y_remap_key_down+menu_y_offset, "Down", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_down+menu_y_offset, "Down", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Down END*/
	
		#region /*Remap Key Up*/
		if (menu = "remap_key_up"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_up +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+512;
		draw_text_outlined(410, menu_y_remap_key_up +menu_y_offset, "Up", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_up +menu_y_offset, "Up", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Up END*/
	
		#region /*Remap Key Tongue*/
		if (menu = "remap_key_tongue"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_tongue +menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = 128+576;
		draw_text_outlined(410, menu_y_remap_key_tongue +menu_y_offset, "Tongue", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_keyboardremapping();}else
		if (key_a_pressed) and (menu_delay = 0){menu_delay = 3;input_key = true;}}else{draw_text_outlined(410, menu_y_remap_key_tongue +menu_y_offset, "Tongue", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Up END*/
	
		#endregion /*All the keys you can remap END*/
		
		#region /*Reset to Default Settings*/
		draw_menu_button(430, menu_y_remap_reset +menu_y_offset, "Default Settings", "remap_reset", "remap_reset");
	
		if (menu = "remap_reset")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 410, menu_y_remap_reset +menu_y_offset + 21, 1, 1, 0, c_white, 1);
			menu_cursor_y_position = 200 + menu_y_remap_reset;
			if (key_a_pressed)
			and (menu_delay = 0)
			or(mouse_check_button_pressed(mb_left))
			and (window_mouse_get_x() > 370)
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 430, menu_y_remap_reset +menu_y_offset + 1, 430 + 370, menu_y_remap_reset +menu_y_offset + 41))
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
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key+menu_y_offset, "Up key is jump key", "up_key_is_jump_key", global.player1_up_key_is_jump_key);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key+menu_y_offset, "Up key is jump key", "up_key_is_jump_key", global.player2_up_key_is_jump_key);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key+menu_y_offset, "Up key is jump key", "up_key_is_jump_key", global.player3_up_key_is_jump_key);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key+menu_y_offset, "Up key is jump key", "up_key_is_jump_key", global.player4_up_key_is_jump_key);
		}
		#endregion /*Up Key Is Jump Key END*/
		
		#region /*Double tap direction to run*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run+menu_y_offset, "Double tap direction to run", "double_tap_to_run", global.player1_double_tap_to_run);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run+menu_y_offset, "Double tap direction to run", "double_tap_to_run", global.player2_double_tap_to_run);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run+menu_y_offset, "Double tap direction to run", "double_tap_to_run", global.player3_double_tap_to_run);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run+menu_y_offset, "Double tap direction to run", "double_tap_to_run", global.player4_double_tap_to_run);
		}
		#endregion /*Double tap direction to run END*/
		
		#region /*Always run*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_always_run+menu_y_offset, "Always run", "always_run", global.player1_sprint_toggle);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_always_run+menu_y_offset, "Always run", "always_run", global.player2_sprint_toggle);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_always_run+menu_y_offset, "Always run", "always_run", global.player3_sprint_toggle);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_always_run+menu_y_offset, "Always run", "always_run", global.player4_sprint_toggle);
		}
		#endregion /*Always run END*/
		
		#region /*Cancel dive by pressing jump or dive button*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button+menu_y_offset, "Cancel dive by pressing jump or dive button", "cancel_dive_by_pressing_jump_or_dive_button", global.player1_cancel_dive_by_pressing_jump_or_dive_button);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button+menu_y_offset, "Cancel dive by pressing jump or dive button", "cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button+menu_y_offset, "Cancel dive by pressing jump or dive button", "cancel_dive_by_pressing_jump_or_dive_button", global.player3_cancel_dive_by_pressing_jump_or_dive_button);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button+menu_y_offset, "Cancel dive by pressing jump or dive button", "cancel_dive_by_pressing_jump_or_dive_button", global.player4_cancel_dive_by_pressing_jump_or_dive_button);
		}
		#endregion /*Cancel dive by pressing jump or dive button END*/
		
		#region /*Cancel dive by pressing opposite direction*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction+menu_y_offset, "Cancel dive by pressing opposite direction", "cancel_dive_by_pressing_opposite_direction", global.player1_cancel_dive_by_pressing_opposite_direction);
		}
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction+menu_y_offset, "Cancel dive by pressing opposite direction", "cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
		}
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction+menu_y_offset, "Cancel dive by pressing opposite direction", "cancel_dive_by_pressing_opposite_direction", global.player3_cancel_dive_by_pressing_opposite_direction);
		}
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction+menu_y_offset, "Cancel dive by pressing opposite direction", "cancel_dive_by_pressing_opposite_direction", global.player4_cancel_dive_by_pressing_opposite_direction);
		}
		#endregion /*Cancel dive by pressing opposite direction END*/
		
		#region /*Show Controls*/
		if (os_type!=os_ios)
		and (os_type!=os_android)
		{
			if (remapping_player = 0)
			{
				draw_menu_dropdown(390, menu_y_show_controls+menu_y_offset, "Show Controls", "show_controls", global.player1_show_controls, "Never Show", "After 1 Second", "After 2 Seconds", "After 3 Seconds", "After 4 Seconds", "After 5 Seconds", "After 6 Seconds", "After 7 Seconds", "After 8 Seconds", "After 9 Seconds", "Always Show");
			}
			if (remapping_player = 1)
			{
				draw_menu_dropdown(390, menu_y_show_controls+menu_y_offset, "Show Controls", "show_controls", global.player2_show_controls, "Never Show", "After 1 Second", "After 2 Seconds", "After 3 Seconds", "After 4 Seconds", "After 5 Seconds", "After 6 Seconds", "After 7 Seconds", "After 8 Seconds", "After 9 Seconds", "Always Show");
			}
	
			if (remapping_player = 2)
			{
				draw_menu_dropdown(390, menu_y_show_controls+menu_y_offset, "Show Controls", "show_controls", global.player3_show_controls, "Never Show", "After 1 Second", "After 2 Seconds", "After 3 Seconds", "After 4 Seconds", "After 5 Seconds", "After 6 Seconds", "After 7 Seconds", "After 8 Seconds", "After 9 Seconds", "Always Show");
			}
	
			if (remapping_player = 3)
			{
				draw_menu_dropdown(390, menu_y_show_controls+menu_y_offset, "Show Controls", "show_controls", global.player4_show_controls, "Never Show", "After 1 Second", "After 2 Seconds", "After 3 Seconds", "After 4 Seconds", "After 5 Seconds", "After 6 Seconds", "After 7 Seconds", "After 8 Seconds", "After 9 Seconds", "Always Show");
			}
			if (menu = "show_controls")
			{
				menu_cursor_y_position = 200 +menu_y_show_controls+50;
			}
		}
		#endregion /*Show Controls END*/
		
		#region /*Drop down from Rope*/
		if (remapping_player = 0)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope +menu_y_offset, "Drop down from rope", "drop_from_rope", global.player1_drop_from_rope, "Release Jump", "Down or Jump", "Only Down", "Only Jump", "Down + Jump");
		}
	
		if (remapping_player = 1)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope +menu_y_offset, "Drop down from rope", "drop_from_rope", global.player2_drop_from_rope, "Release Jump", "Down or Jump", "Only Down", "Only Jump", "Down + Jump");
		}
	
		if (remapping_player = 2)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope +menu_y_offset, "Drop down from rope", "drop_from_rope", global.player3_drop_from_rope, "Release Jump", "Down or Jump", "Only Down", "Only Jump", "Down + Jump");
		}
	
		if (remapping_player = 3)
		{
			draw_menu_dropdown(390, menu_y_drop_down_from_rope +menu_y_offset, "Drop down from rope", "drop_from_rope", global.player4_drop_from_rope, "Release Jump", "Down or Jump", "Only Down", "Only Jump", "Down + Jump");
		}
		if (menu = "drop_from_rope")
		{
			menu_cursor_y_position = 200 +menu_y_drop_down_from_rope +50;
		}
		#endregion /*Drop down from Rope END*/
		
		#region /*Wall Jump Setting*/
		if (remapping_player = 0)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+menu_y_offset, "Wall Jump", "wall_jump_setting", global.player1_wall_jump_setting, "Off", "When touching wall", "When holding towards wall");
		}
	
		if (remapping_player = 1)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+menu_y_offset, "Wall Jump", "wall_jump_setting", global.player2_wall_jump_setting, "Off", "When touching wall", "When holding towards wall");
		}
	
		if (remapping_player = 2)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+menu_y_offset, "Wall Jump", "wall_jump_setting", global.player3_wall_jump_setting, "Off", "When touching wall", "When holding towards wall");
		}
	
		if (remapping_player = 3)
		{
			draw_menu_dropdown(390, menu_y_wall_jump_setting+menu_y_offset, "Wall Jump", "wall_jump_setting", global.player4_wall_jump_setting, "Off", "When touching wall", "When holding towards wall");
		}
		if (menu = "wall_jump_setting")
		{
			menu_cursor_y_position = 200 +menu_y_wall_jump_setting+50;
		}
		#endregion /*Wall Jump Settings END*/
		
		draw_menu_dropdown(390, 50 +menu_y_offset, "Remap This Player", "remap_select_player", remapping_player, "Player 1", "Player 2", "Player 3", "Player 4"); /*Remap Select Player - Which player do you want to remap the controls for?*/
		
		#region /*Show the player when they can input a key to remap controls*/
		if (input_key = true)
		{
			draw_set_alpha(0.75);
			draw_rectangle_color(window_get_width()/ 2- 232, 32- 20, window_get_width()/ 2+ 232, 64+ 20, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		
			#region /*Text saying input key now for player 1*/
			if (remapping_player = 0)
			{
				draw_text_outlined(window_get_width()/ 2, 32, "INPUT KEY NOW FOR PLAYER 1", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2- 10, 64, "Buttons can be disabled using ", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width()/ 2 + 200, 64, 0.50, 0.50, 0, c_white, 1);
			}
			#endregion /*Text saying input key now for player 1 END*/
		
			#region /*Text saying input key now for player 2*/
			if (remapping_player = 1)
			{
				draw_text_outlined(window_get_width()/ 2, 32, "INPUT KEY NOW FOR PLAYER 2/nButtons can be disabled using ", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2- 10, 64, "Buttons can be disabled using ", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width()/ 2 + 200, 64, 0.50, 0.50, 0, c_white, 1);
			}
			#endregion /*Text saying input key now for player 2 END*/
		
			#region /*Text saying input key now for player 3*/
			if (remapping_player = 2)
			{
				draw_text_outlined(window_get_width()/ 2, 32, "INPUT KEY NOW FOR PLAYER 3/nButtons can be disabled using ", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2- 10, 64, "Buttons can be disabled using ", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width()/ 2 + 200, 64, 0.50, 0.50, 0, c_white, 1);
			}
			#endregion /*Text saying input key now for player 3 END*/
		
			#region /*Text saying input key now for player 4*/
			if (remapping_player = 3)
			{
				draw_text_outlined(window_get_width()/ 2, 32, "INPUT KEY NOW FOR PLAYER 4/nButtons can be disabled using ", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2- 10, 64, "Buttons can be disabled using ", global.default_text_size, c_menu_outline, c_menu_fill, 1);
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
		if (global.show_tutorial_signs= true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset +50, "> Show Tutorial Signs: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset +50, "> Show Tutorial Signs: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}}else
		if (global.show_tutorial_signs= true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset +50, "Show Tutorial Signs: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset +50, "Show Tutorial Signs: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
		if (menu = "players_can_collide"){
		if (global.players_can_collide = true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 110, "> Players can collide with each other: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 110, "> Players can collide with each other: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}}
		else
		if (global.players_can_collide = true)
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 110, "Players can collide with each other: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 110, "Players can collide with each other: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
		if (menu = "assist_settings")
		{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 140, "> Assist Settings <", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		else{draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 140, "Assist Settings", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
		if (menu = "convention_mode")
		{
			if (global.convention_mode = true)
			{
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 170, "> Convention Mode: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size *0.5, c_menu_outline, c_menu_fill, 1);
			}
			else
			{
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 170, "> Convention Mode: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size *0.5, c_menu_outline, c_menu_fill, 1);
			}
		}
		else
		if (global.convention_mode = true)
		{
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 170, "Convention Mode: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size *0.5, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 170, "Convention Mode: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			draw_text_outlined(window_get_width()/ 2, camera_get_view_height(view_camera[view_current])/ 2+menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size *0.5, c_menu_outline, c_menu_fill, 1);
		}
	}
	#endregion /*Gameplay Settings END*/
	
	#region /*Profile Settings*/
	if (global.settings_sidebar_menu = "profile_settings")
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(410, 20 + (40 *3), "Setup your profile here. \n Enter name here.", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /*Profile Settings END*/
	
	#region /*Graphics Settings*/
	if (global.settings_sidebar_menu = "video_settings")
	{
		
		#region /*Fullscreen toggle*/
		if (window_get_fullscreen())
		{
			draw_menu_checkmark(386, 48, "Fullscreen", "fullscreen_mode", true);
		}
		else
		{
			draw_menu_checkmark(386, 48, "Fullscreen", "fullscreen_mode", false);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		#endregion /*Fullscreen toggle END*/
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		draw_menu_checkmark(386, 48 *2, "Interpolation", "interpolate", global.interpolate);
		
		draw_menu_checkmark(386, 48 *3, "Show FPS", "show_fps", global.show_fps);
		
		draw_menu_checkmark(386, 48 *4, "Show FPS Real", "show_fps_real", global.show_fps_real);
		
		draw_menu_checkmark(386, 48 *5, "Show Instance Count", "show_instance_count", global.show_instance_count);
		
		draw_menu_checkmark(386, 48 *6, "Show Collision Mask", "show_collision_mask", global.show_collision_mask);
		
		draw_menu_checkmark(386, 48 *7, "Enable Transitions", "enable_transitions", global.enable_transitions);
		
		draw_menu_checkmark(386, 48 *8, "Enable Background Layer 1", "enable_background_layer1", global.enable_background_layer1);
		
		draw_menu_checkmark(386, 48 * 9, "Enable Background Layer 2", "enable_background_layer2", global.enable_background_layer2);
		
		draw_menu_checkmark(386, 48 * 10, "Enable Background Layer 3", "enable_background_layer3", global.enable_background_layer3);
		
		draw_menu_checkmark(386, 48 * 11, "Enable Background Layer 4", "enable_background_layer4", global.enable_background_layer4);
		
		draw_menu_checkmark(386, 48 * 12, "Enable Foreground Layer 1", "enable_foreground_layer1", global.enable_foreground_layer1);
		
		draw_menu_checkmark(386, 48 * 13, "Enable Foreground Layer Above Static Objects", "enable_foreground_layer_above_static_objects", global.enable_foreground_layer_above_static_objects);
		
		draw_menu_checkmark(386, 48 * 14, "Enable Foreground Layer 2", "enable_foreground_layer2", global.enable_foreground_layer2);
		
		draw_menu_checkmark(386, 48 * 15, "Enable Foreground Layer Secret", "enable_foreground_layer_secret", global.enable_foreground_layer_secret);
		
		#region /*Background Brightness Bars*/
		draw_menu_slider(420, 48 * 17, "Background Brightness in Gameplay", "background_brightness_gameplay", global.background_brightness_gameplay, c_gray);
		draw_menu_slider(420, 48 * 17 + 64, "Background Brightness in Menus", "background_brightness_menu", global.background_brightness_menu, c_gray);
		
		#region /*Draw a little arrow indicating what the default value is*/
		draw_set_color(c_menu_fill);
		draw_arrow(420 + 160, 48 * 17 - 20, 420 + 160, 48 * 17 - 10, 25);
		draw_arrow(420 + 160, 48 * 17 - 20 + 64, 420 + 160, 48 * 17 - 10 + 64, 25);
		#endregion /*Draw a little arrow indicating what the default value is END*/
		
		#endregion /*Background Brightness Bars END*/
		
		draw_menu_checkmark(386, 48 * 19, "Reset Level Zoom When Going Back To Map", "reset_level_zoom_when_going_back_to_map", global.reset_level_zoom_when_going_back_to_map);
		draw_menu_checkmark(386, 48 * 20, "Reset World Map Zoom When Going Back To Map", "reset_world_map_zoom_when_going_back_to_map", global.reset_world_map_zoom_when_going_back_to_map);
	}
	#endregion /*Graphics Settings END*/
	
	#region /*Audio Settings*/
	if (global.settings_sidebar_menu = "audio_settings")
	{
		
		#region /*Make volumes stay between 0 and 1*/
		if (global.music_volume < 0){global.music_volume = 0;}else
		if (global.music_volume >1){global.music_volume = 1;}
		if (global.sfx_volume < 0){global.sfx_volume = 0;}else
		if (global.sfx_volume >1){global.sfx_volume = 1;}
		if (global.ambient_volume < 0){global.ambient_volume = 0;}else
		if (global.ambient_volume >1){global.ambient_volume = 1;}
		if (global.voices_volume < 0){global.voices_volume = 0;}else
		if (global.voices_volume >1){global.voices_volume = 1;}
		if (global.verbosity_slider <0){global.verbosity_slider = 0;}else
		if (global.verbosity_slider > 1){global.verbosity_slider = 1;}
		#endregion /*Make volumes stay between 0 and 1 END*/
		
		#region /*Draw bars that represent how much volume each channel have*/
		draw_menu_slider(410, 100, "Music Volume", "music_volume", global.music_volume, c_red);
		draw_menu_slider(410, 164, "SFX Volume", "sfx_volume", global.sfx_volume, c_lime);
		draw_menu_slider(410, 228, "Ambient Volume", "ambient_volume", global.ambient_volume, c_lime);
		draw_menu_slider(410, 292, "Voices Volume", "voices_volume", global.voices_volume, c_aqua);
		draw_menu_dropdown(410, 356, "Number of Audio Channels", "number_of_audio_channels", global.number_of_audio_channels, "32", "64", "96", "128", "160", "192", "224", "256");
		
		#region /*Verbosity Bar*/
		if (global.enable_verbosity_slider = true)
		{
			if (menu = "verbosity_slider")
			{
				draw_rectangle_color(410 - 2, 20 + (40 *8) - 5- 2, 410 + 320 + 2, 20 + (40 *8) +5+ 2, c_black, c_black, c_black, c_black, false);
			}
			draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 320, 20 + (40 *8) +5, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
			if (global.verbosity_slider = 1){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 320, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.95){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 304, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.9){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 288, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.85){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 272, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.8){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 256, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.75){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 240, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.7){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 224, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.65){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 208, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.6){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 192, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.55){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 176, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.5){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 160, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.45){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 144, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.4){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 128, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.35){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 112, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.3){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 +96, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.25){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 +80, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.2){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 64, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.15){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 48, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.1){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 32, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
			if (global.verbosity_slider = 0.05){draw_rectangle_color(410, 20 + (40 *8) - 5, 410 + 16, 20 + (40 *8) +5, c_aqua, c_aqua, c_aqua, c_aqua, false);}
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
			var narrator_y = 454;
			
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
				draw_text_outlined(file_select_x, narrator_y, "Narrator: Nobody", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			}
			else
			if (global.narrator >= 0)
			{
				draw_text_outlined(file_select_x, narrator_y, "Narrator: " + string(narrator_name), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			}
			
			if (global.narrator >= 0)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x-32, narrator_y, 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x-32- 16, narrator_y - 16, file_select_x-32+ 16, narrator_y + 16))
				{
					draw_set_alpha(0.5);
					draw_rectangle_color(file_select_x-32- 16, narrator_y - 16, file_select_x-32+ 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
			
			if (global.narrator < ds_list_size(global.all_loaded_characters) - 1)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x, narrator_y, 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16))
				{
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
			or(gamepad_axis_value(0, gp_axislh)<0)
			and (menu_joystick1_delay <= 0)
			and (menu = "select_narrator")
			or(mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x-32- 16, narrator_y - 16, file_select_x-32+ 16, narrator_y + 16))
			{
				menu = "select_narrator";
				if (menu_delay = 0)
				and (global.narrator > -1)
				{
					menu_delay = 3;
					menu_joystick1_delay = 30;
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
						if (ini_key_exists("values", "character_name"))
						{
							narrator_name = ini_read_string("values", "character_name", "");
						}
						else
						{
							narrator_name = string(global.narrator + 1);
						}
						#endregion /*Character Name END*/
						
						ini_close();
					}
					else
					{
						narrator_name = string(global.narrator + 1);
					}
					#endregion /*Character Name END*/
					
					#region /*Character select portrait x and y origin points*/
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini"))
					or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini"))
					{
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini"))
						{
							ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini");
						}
						
						#region /*Character select portrait x and y origin points*/
						#region /*Character select portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Character select portrait y origin point END*/
					
						#region /*Character select portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Character select portrait x origin point END*/
						#endregion /*Character select portrait x and y origin points END*/
					
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/
					
						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Character select portrait x_scale and y_scale origin points*/
						#region /*Character select portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player1_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player1_select_portrait_yscale = 1;
						}
						#endregion /*Character select portrait y_scale origin point END*/

						#region /*Character select portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player1_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player1_select_portrait_xscale = 1;
						}
						#endregion /*Character select portrait x_scale origin point END*/
						#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player1_select_portrait_xscale = 1;
						player1_select_portrait_yscale = 1;
					}
					#endregion /*Character select portrait x and y origin points END*/
						
					#region /*Player 1 character select portrait sprite*/
					global.sprite_select_player_1 = spr_noone;
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, sprite_stand_xorig, sprite_stand_yorig, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, character_select_portrait_xorig, character_select_portrait_yorig, 0, global.skin_for_player_1);
					#endregion /*Player 1 character select portrait sprite END*/
						
				}
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
			and (menu_joystick1_delay <= 0)
			and (menu = "select_narrator")
			or(mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16))
			{
				menu = "select_narrator";
				if (menu_delay = 0)
				{
					menu_delay = 3;
					menu_joystick1_delay = 30;
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
						if (ini_key_exists("values", "character_name"))
						{
							narrator_name = ini_read_string("values", "character_name", "");
						}
						else
						{
							narrator_name = string(global.narrator + 1);
						}
						#endregion /*Character Name END*/
						
						ini_close();
					}
					else
					{
						narrator_name = string(global.narrator + 1);
					}
					#endregion /*Character Name END*/
						
					#region /*Character select portrait x and y origin points*/
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini"))
					or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini"))
					{
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini"))
						{
							ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini");
						}
						else
						{
							ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/sprite_origin_point.ini");
						}
						
						#region /*Character select portrait x and y origin points*/
						#region /*Character select portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							character_select_portrait_yorig = 0;
						}
						#endregion /*Character select portrait y origin point END*/

						#region /*Character select portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							character_select_portrait_xorig = 0;
						}
						#endregion /*Character select portrait x origin point END*/
						#endregion /*Character select portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						#region /*Character select portrait x_scale and y_scale origin points*/
						#region /*Character select portrait y_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
						{
							player1_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
						}
						else
						{
							player1_select_portrait_yscale = 1;
						}
						#endregion /*Character select portrait y_scale origin point END*/

						#region /*Character select portrait x_scale origin point*/
						if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
						{
							player1_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
						}
						else
						{
							player1_select_portrait_xscale = 1;
						}
						#endregion /*Character select portrait x_scale origin point END*/
						#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
						player1_select_portrait_xscale = 1;
						player1_select_portrait_yscale = 1;
					}
					#endregion /*Character select portrait x and y origin points END*/
						
					#region /*Player 1 character select portrait sprite*/
					global.sprite_select_player_1 = spr_noone;
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, sprite_stand_xorig, sprite_stand_yorig, 0, global.skin_for_player_1);
					global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, character_select_portrait_xorig, character_select_portrait_yorig, 0, global.skin_for_player_1);
					#endregion /*Player 1 character select portrait sprite END*/
						
				}
			}
			#endregion /*Player 1 Key Right (change portrait sprites) END*/
			
			#endregion /*Player 1 change portrait when clicking left or right END*/
			
		}
		#endregion /*Select Narrator END*/
		
		#region /*Verbosity Slider*/
		if (global.enable_verbosity_slider = true)
		{
			if (menu = "verbosity_slider")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, 20 + (40 *7), 1, 1, 0, c_white, 1);
				draw_text_outlined(410, 20 + (40 *7), "Verbosity: " + string(round(global.verbosity_slider* 100)) + "%", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			}
			else
			{
				draw_text_outlined(410, 20 + (40 *7), "Verbosity: " + string(round(global.verbosity_slider* 100)) + "%", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
		}
		#endregion /*Verbosity Slider END*/
		
	}
	#endregion /*Audio Settings END*/
	
	#region /*Language Options*/
	if (global.settings_sidebar_menu = "language_settings")
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		/*Language y positions*/
		var pos_ar_sa = 1;
		var pos_id_id = 2;
		var pos_da_dk = 3;
		var pos_de_de = 4;
		var pos_en_gb = 5;
		var pos_en_us = 6;
		var pos_es_es = 7;
		var pos_es_mx = 8;
		var pos_fr_ca = 9;
		var pos_fr_fr = 10;
		var pos_it_it = 11;
		var pos_hu_hu = 12;
		var pos_nl_nl = 13;
		var pos_nb_no = 14;
		var pos_pl_pl = 15;
		var pos_pt_br = 16;
		var pos_pt_pt = 17;
		var pos_sk_sk = 18;
		var pos_fi_fi = 19;
		var pos_sv_se = 20;
		var pos_th_th = 21;
		var pos_tr_tr = 22;
		var pos_cs_cz = 23;
		var pos_el_gr = 24;
		var pos_bg_bg = 25;
		var pos_ru_ru = 26;
		var pos_uk_ua = 27;
		var pos_ja_jp = 28;
		var pos_zh_cn = 29;
		var pos_zh_tw = 30;
		var pos_ko_kr = 31;
		var i;
		for(i = 0;
		i < array_length_1d(languages);
		i += 1;)
		{
			draw_menu_button(500, 42 * i + 42, languages[i], noone, noone);
		}
	}
	#endregion /*Language Options END*/
	
	#region /*Global Resources Settings*/
	if (global.settings_sidebar_menu = "global_resources_settings")
	{
		var resource_pack_x = 450;
		var resource_pack_right_arrow_x = 400;
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		if (!file_exists(working_directory + "/custom_resourcepacks/resourcepack0/data/sprite_origin_point.ini"))
		{
			draw_text_outlined(resource_pack_x, 20 + (40 *3), "Add Custom Resourcepacks in Local Appdata and it will appear here!", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		
		if (global.selected_resourcepack = 0)
		{
			draw_text_outlined(resource_pack_x, 20 + (40 *4), "Resource Pack: Official", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			draw_text_outlined(resource_pack_x, 20 + (40 *4), "Resource Pack: Custom " + string(global.selected_resourcepack), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		
		if (global.selected_resourcepack > 0)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x-32, 20 + (40 *4), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x-32- 16, 20 + (40 *4) - 16, resource_pack_x-32+ 16, 20 + (40 *4) + 16))
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x-32- 16, 20 + (40 *4) - 16, resource_pack_x-32+ 16, 20 + (40 *4) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks+ 1) + "/data/sprite_origin_point.ini"))
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (40 *4), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (40 *4) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (40 *4) + 16))
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (40 *4) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (40 *4) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (key_up)
		and (can_navigate_settings_sidebar = false)
		{
			menu = "resourcepacks";
		}
		else
		if (key_down)
		and (can_navigate_settings_sidebar = false)
		{
			menu = "title_backgrounds";
		}
		
		if (menu = "resourcepacks")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x-32-32, 20 + (40 *4));
		}
		
		if (key_left)
		and (can_navigate_settings_sidebar = false)
		and (menu = "resourcepacks")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x-32- 16, 20 + (40 *4) - 16, resource_pack_x-32+ 16, 20 + (40 *4) + 16))
		{
			menu = "resourcepacks";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (global.selected_resourcepack > 0)
			and (global.pause_room != room_leveleditor)
			{
				global.selected_resourcepack -= 1;
				menu_delay = 3;
			}
		}
		else
		if (key_right)
		and (can_navigate_settings_sidebar = false)
		and (menu = "resourcepacks")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (40 *4) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (40 *4) + 16))
		{
			menu = "resourcepacks";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks+ 1) + "/data/sprite_origin_point.ini"))
			and (global.pause_room != room_leveleditor)
			{
				global.selected_resourcepack += 1;
				menu_delay = 3;
			}
		}
		
		#region /*Custom Title Background*/
		draw_text_outlined(resource_pack_x, 20 + (40 *6), "Title Background: " + string(global.selected_title_background), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.selected_title_background > 0)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x-32, 20 + (40 *6), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x-32- 16, 20 + (40 *6) - 16, resource_pack_x-32+ 16, 20 + (40 *6) + 16))
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x-32- 16, 20 + (40 *6) - 16, resource_pack_x-32+ 16, 20 + (40 *6) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (file_exists("title_backgrounds/title_background" + string(global.selected_title_background+ 1) + ".png"))
		or(file_exists(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds+ 1) + ".png"))
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (40 *6), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (40 *6) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (40 *6) + 16))
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (40 *6) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (40 *6) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu = "title_backgrounds")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x-32-32, 20 + (40 *6));
		}
		
		if (key_left)
		and (menu = "title_backgrounds")
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x-32- 16, 20 + (40 *6) - 16, resource_pack_x-32+ 16, 20 + (40 *6) + 16))
		{
			menu = "title_backgrounds";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (global.selected_title_background > 0)
			{
				global.selected_title_background -= 1;
				menu_delay = 3;
			}
			if (file_exists("title_backgrounds/title_background" + string(global.selected_title_background) + ".png"))
			{
				title_screen_background = sprite_add("title_backgrounds/title_background" + string(global.selected_title_background) + ".png", 1, false, false, 0, 0);
			}
			else
			if (file_exists(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds) + ".png"))
			{
				title_screen_background = sprite_add(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds) + ".png", 1, false, false, 0, 0);
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
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (40 *6) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (40 *6) + 16))
		{
			menu = "title_backgrounds";
			if (menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists("title_backgrounds/title_background" + string(global.selected_title_background+ 1) + ".png"))
			or(menu_delay = 0)
			and (can_navigate_settings_sidebar = false)
			and (file_exists(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds+ 1) + ".png"))
			{
				global.selected_title_background += 1;
				menu_delay = 3;
			}
			if (file_exists("title_backgrounds/title_background" + string(global.selected_title_background) + ".png"))
			{
				title_screen_background = sprite_add("title_backgrounds/title_background" + string(global.selected_title_background) + ".png", 1, false, false, 0, 0);
			}
			else
			if (file_exists(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds) + ".png"))
			{
				title_screen_background = sprite_add(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds) + ".png", 1, false, false, 0, 0);
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
		
	}
	#endregion /*Global Resources Settings END*/
	
	#region /*Storage Settings*/
	if (global.settings_sidebar_menu = "storage_settings")
	{
		var file_select_x = 450;
		var file_select_right_arrow_x = 400;
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(file_select_x, 20 + (40 *4), "File: " + string(global.file), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (menu != "file_delete_yes")
		and (menu != "file_delete_no")
		{
			if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
			{
				draw_menu_button(450, 20 + (40 *5), "Delete File", "file_delete", "file_delete_no");
			}
		}
		else
		if (menu = "file_delete_yes")
		or(menu = "file_delete_no")
		{
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, window_get_width()*3, window_get_height()*3, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(0.1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text_outlined(window_get_width()/ 2, window_get_height()/ 2- 100, "Are you sure you want to delete file "+string(global.file) + "?", global.default_text_size, c_black, c_red, 1);
			draw_menu_button(window_get_width()/ 2-370 -32, window_get_height()/ 2, "Yes", "file_delete_yes", "file_delete_yes");
			draw_menu_button(window_get_width()/ 2+ 32, window_get_height()/ 2, "No", "file_delete_no", "file_delete");
			
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
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x-32, 20 + (40 *4), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x-32- 16, 20 + (40 *4) - 16, file_select_x-32+ 16, 20 + (40 *4) + 16))
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(file_select_x-32- 16, 20 + (40 *4) - 16, file_select_x-32+ 16, 20 + (40 *4) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x, 20 + (40 *4), 0.5, 0.5, 0, c_white, 1);
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, 20 + (40 *4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 *4) + 16))
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(file_select_x + file_select_right_arrow_x - 16, 20 + (40 *4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 *4) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
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
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width()/ 2-370 -32, window_get_height()/ 2- 21, window_get_width()/ 2-370 -32+ 370, window_get_height()/ 2+ 42))
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
			draw_sprite(spr_menu_cursor, menu_cursor_index, file_select_x-32-32, 20 + (40 *4));
		}
		
		if (key_left)
		and (menu = "file_select")
		and (can_navigate_settings_sidebar = false)
		or(mouse_check_button_pressed(mb_left))
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x-32- 16, 20 + (40 *4) - 16, file_select_x-32+ 16, 20 + (40 *4) + 16))
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
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), file_select_x + file_select_right_arrow_x - 16, 20 + (40 *4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 *4) + 16))
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
	{draw_set_halign(fa_left);draw_set_valign(fa_center);draw_text_outlined(410, 20 + (40 *3), "Connect your Twitch account \n and earn in-game rewards \n as you stream the game :)", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
	#endregion /*Broadcast Settings END*/
	
	#region /*How to Play*/
	if (global.settings_sidebar_menu = "how_to_play")
	{draw_set_halign(fa_left);draw_set_valign(fa_center);draw_text_outlined(410, 20 + (40 *3), "Control frog. \n Frog jump. \n Frog tongue. \n Frog happy.", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
	#endregion /*How to Play END*/
	
	#endregion /*General Settings END*/
	
	draw_set_alpha(darken_settings_alpha);
	draw_rectangle_color(left_sidebar_x + 370, 0,window_get_width(),window_get_height(), c_black, c_black, c_black, c_black, false);
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
				if (global.activate_cheats = true)
				{
					menu = "enable_spikes";
				}
				else
				{
					menu = "activate_cheats";
				}
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
				menu = "custom_level_load_delay_settings";
			}
		}
		else
		if (menu = "custom_level_load_delay_settings")
		{
			if (key_up)
			and (open_dropdown = true)
			and (menu_delay = 0)
			and (global.custom_level_load_delay > 0)
			{
				menu_delay = 3;
				global.custom_level_load_delay -= 1;
			}
			else
			if (key_down)
			and (open_dropdown = true)
			and (menu_delay = 0)
			and (global.custom_level_load_delay < 9)
			{
				menu_delay = 3;
				global.custom_level_load_delay += 1;
			}
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
				menu = "activate_cheats";
			}
		}
		else
		if (menu = "activate_cheats")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "custom_level_load_delay_settings";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				if (global.activate_cheats = true)
				{
					menu = "enable_enemies";
				}
				else
				{
					menu = "difficulty_settings";
				}
			}
		}
		else
		if (menu = "enable_enemies")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = "activate_cheats";
			}
			else
			if (key_down)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				if (global.activate_cheats = true)
				{
					menu = "enable_spikes";
				}
				else
				{
					menu = "difficulty_settings";
				}
			}
		}
		else
		if (menu = "enable_spikes")
		{
			if (key_up)
			and (open_dropdown = false)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				if (global.activate_cheats = true)
				{
					menu = "enable_enemies";
				}
				else
				{
					menu = "activate_cheats";
				}
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
				menu = "assist_show_assist_mode_text";
				menu_delay = 3;
			}
		}
		#endregion /*Assist Normal Arrows Navigation END*/
	
		else
	
		#region /*Assist Show Assist Mode Text Navigation*/
		if (menu = "assist_show_assist_mode_text")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "assist_normal_arrows";
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
			if (key_up)
			and (menu_delay = 0)
			{
				if (os_type!=os_ios)
				and (os_type!=os_android)
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
				if (os_type!=os_ios)
				and (os_type!=os_android)
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
	
		#region /*Music Volume Navigation*/
		if (menu = "music_volume")
		{
			if (key_left)
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
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.music_volume < + 1)
				{
					global.music_volume += 0.05;
				}
			}
			if (mouse_wheel_down())
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
				menu = "sfx_volume";
				menu_delay = 3;
			}
		}
		#endregion /*Music Volume Navigation END*/

		else

		#region /*SFX Volume Navigation*/
		if (menu = "sfx_volume")
		{
			if (key_left)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sfx_volume > 0)
				{
					global.sfx_volume -= 0.05;
				}
			}
			else
			if (key_right)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sfx_volume < + 1)
				{
					global.sfx_volume += 0.05;
				}
			}
			else
			if (mouse_wheel_down())
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sfx_volume > 0)
				{
					global.sfx_volume -= 0.0001;
				}
			}
			else
			if (mouse_wheel_up())
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (global.sfx_volume < + 1)
				{
					global.sfx_volume += 0.0001;
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
		#endregion /*Music Volume Navigation END*/
	
		else
	
		#region /*Ambient Volume Navigation*/
		if (menu = "ambient_volume")
		{
			if (key_left)
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
				menu = "sfx_volume";
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
		#endregion /*Ambient Volume Navigation END*/
	
		else
	
		#region /*Voices Volume Navigation*/
		if (menu = "voices_volume")
		{
			if (key_left)
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
				menu = "ambient_volume";
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
				menu = "music_volume";
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
			menu_cursor_y_position = 200 +menu_y_up_key_is_jump_key;
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
			menu_cursor_y_position = 200 +menu_y_double_tap_direction_to_run;
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
			menu_cursor_y_position = 200 +menu_y_always_run;
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
	
		#region /*Cancel Dive By Pressing Jump Or Dive Button Navigation*/
		if (menu = "cancel_dive_by_pressing_jump_or_dive_button")
		{
			menu_cursor_y_position = 200 +menu_y_cancel_dive_by_pressing_jump_or_dive_button;
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
		#endregion /*Cancel Dive By Pressing Jump Or Dive Button Navigation END*/
	
		else
	
		#region /*Cancel Dive By Pressing Opposite Direction Navigation*/
		if (menu = "cancel_dive_by_pressing_opposite_direction")
		{
			menu_cursor_y_position = 200 +menu_y_cancel_dive_by_pressing_opposite_direction;
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
				menu = "wall_jump_setting";
				menu_delay = 3;
			}
		}
		#endregion /*Cancel Dive By Pressing Opposite Direction Navigation END*/
	
		else
	
		#region /*Navigate Wall Jump Setting*/
		if (menu = "wall_jump_setting")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				menu = "cancel_dive_by_pressing_opposite_direction";
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
				global.player1_drop_from_rope-= 1;
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
				global.player2_drop_from_rope-= 1;
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
				global.player3_drop_from_rope-= 1;
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
				global.player4_drop_from_rope-= 1;
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
		or(menu = "custom_level_load_delay_settings")
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
		if (menu = "assist_guiding_arrows") and (menu_delay = 0){if (global.assist_guiding_arrows= true){global.assist_guiding_arrows= false;}else{global.assist_guiding_arrows= true;}menu_delay = 3;}
		if (menu = "assist_normal_arrows") and (menu_delay = 0){if (global.assist_normal_arrows= true){global.assist_normal_arrows= false;}else{global.assist_normal_arrows= true;}menu_delay = 3;}
		if (menu = "assist_show_assist_mode_text") and (menu_delay = 0){if (global.assist_show_assist_mode_text = true){global.assist_show_assist_mode_text = false;}else{global.assist_show_assist_mode_text = true;}menu_delay = 3;}
		
		if (menu = "automatically_pause_when_window_is_unfocused_settings") and (menu_delay = 0){if (global.automatically_pause_when_window_is_unfocused = true){global.automatically_pause_when_window_is_unfocused = false;}else{global.automatically_pause_when_window_is_unfocused = true;}menu_delay = 3;}
		if (menu = "show_timer_settings") and (menu_delay = 0){if (global.show_timer = true){global.show_timer = false;}else{global.show_timer = true;}menu_delay = 3;}
		if (menu = "show_deaths_counter_settings") and (menu_delay = 0){if (global.show_deaths_counter = true){global.show_deaths_counter = false;}else{global.show_deaths_counter = true;}menu_delay = 3;}
		if (menu = "show_tutorial_signs") and (menu_delay = 0){if (global.show_tutorial_signs= true){global.show_tutorial_signs= false;}else{global.show_tutorial_signs= true;}menu_delay = 3;}
		if (menu = "activate_cheats") and (menu_delay = 0){if (global.activate_cheats= true){global.activate_cheats= false;}else{global.activate_cheats= true;}menu_delay = 3;}
		if (menu = "enable_enemies") and (menu_delay = 0) and (global.activate_cheats= true){if (global.enable_enemies= true){global.enable_enemies= false;}else{global.enable_enemies= true;}menu_delay = 3;}
		if (menu = "enable_spikes") and (menu_delay = 0) and (global.activate_cheats= true){if (global.enable_spikes= true){global.enable_spikes= false;}else{global.enable_spikes= true;}menu_delay = 3;}
		if (menu = "players_can_collide") and (menu_delay = 0){if (global.players_can_collide = true){global.players_can_collide = false;}else{global.players_can_collide = true;}menu_delay = 3;}
		if (menu = "convention_mode") and (menu_delay = 0){if (global.convention_mode = true){global.convention_mode = false;}else{global.convention_mode = true;}menu_delay = 3;}
		
		if (menu = "fullscreen_mode") and (menu_delay = 0){if (window_get_fullscreen()){window_set_fullscreen(false);}else{window_set_fullscreen(true);}menu_delay = 3;}
		if (menu = "interpolate") and (menu_delay = 0){if (global.interpolate = true){global.interpolate = false;gpu_set_texfilter(false);}else{global.interpolate = true;gpu_set_texfilter(true);}menu_delay = 3;}
		if (menu = "show_fps") and (menu_delay = 0){if (global.show_fps= true){global.show_fps= false;}else{global.show_fps= true;}menu_delay = 3;}
		if (menu = "show_fps_real") and (menu_delay = 0){if (global.show_fps_real = true){global.show_fps_real = false;}else{global.show_fps_real = true;}menu_delay = 3;}
		if (menu = "show_instance_count") and (menu_delay = 0){if (global.show_instance_count = true){global.show_instance_count = false;}else{global.show_instance_count = true;}menu_delay = 3;}
		if (menu = "show_collision_mask") and (menu_delay = 0){if (global.show_collision_mask= true){global.show_collision_mask= false;}else{global.show_collision_mask= true;}menu_delay = 3;}
		if (menu = "enable_transitions") and (menu_delay = 0){if (global.enable_transitions= true){global.enable_transitions= false;}else{global.enable_transitions= true;}menu_delay = 3;}
		
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
		
		if (menu = "keyboard_controls_remapping") and (menu_delay = 0){image_alpha= 0;menu = "remap_save";menu_delay = 3;}
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
	if (gamepad_axis_value(0, gp_axislv)<0)
	or(gamepad_axis_value(0, gp_axislv) > 0)
	or(gamepad_axis_value(0, gp_axislh)<0)
	or(gamepad_axis_value(0, gp_axislh) > 0)
	or(gamepad_axis_value(1, gp_axislv)<0)
	or(gamepad_axis_value(1, gp_axislv) > 0)
	or(gamepad_axis_value(1, gp_axislh)<0)
	or(gamepad_axis_value(1, gp_axislh) > 0)
	or(gamepad_axis_value(2, gp_axislv)<0)
	or(gamepad_axis_value(2, gp_axislv) > 0)
	or(gamepad_axis_value(2, gp_axislh)<0)
	or(gamepad_axis_value(2, gp_axislh) > 0)
	or(gamepad_axis_value(3, gp_axislv)<0)
	or(gamepad_axis_value(3, gp_axislv) > 0)
	or(gamepad_axis_value(3, gp_axislh)<0)
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
	and (os_type!=os_ios)
	and (os_type!=os_android)
	{
		draw_sprite_ext(spr_cursor, 0,window_mouse_get_x(),window_mouse_get_y(), 1, 1, 0, c_white, 1);
	}
	#endregion /*Draw mouse cursor for menu navigation END*/
	
}
else
{
	left_sidebar_x = lerp(left_sidebar_x,-400, 0.1);
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