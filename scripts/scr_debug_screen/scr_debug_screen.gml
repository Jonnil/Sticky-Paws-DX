function scr_debug_screen()
{
	/* Debug information should show up on pause screen and tite screen, so you can optimize those screens too */
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	var version_y = 32
	var fps_y = 64;
	var fps_real_y = 96;
	var instance_count_y = 128;
	
	var fps_real_target = 250; /* fps real should be above 250 on most devices */
	var instance_count_target = 200;
	
	if (keyboard_check_pressed(vk_f3))
	or (gamepad_button_check(0, gp_stickl))
	and (gamepad_button_check_pressed(0, gp_stickr))
	or (gamepad_button_check(0, gp_stickr))
	and (gamepad_button_check_pressed(0, gp_stickl))
	{
		if (global.debug_screen == true)
		{
			show_debug_overlay(false);
			global.debug_screen = false;
		}
		else
		{
			show_debug_overlay(true);
			global.debug_screen = true;
		}
	}
	
	if (global.debug_screen == true)
	{
		
		#region /* Click on FPS to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, fps_y - 15, 370, fps_y + 15))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, fps_y - 16, 370, fps_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			{
				if (global.show_fps == true)
				{
					global.show_fps = false;
				}
				else
				{
					global.show_fps = true;
				}
			}
		}
		#endregion /* Click on FPS to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on FPS Real to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, fps_real_y - 15, 370, fps_real_y + 15))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, fps_real_y - 16, 370, fps_real_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			{
				if (global.show_fps_real == true)
				{
					global.show_fps_real = false;
				}
				else
				{
					global.show_fps_real = true;
				}
			}
		}
		#endregion /* Click on FPS Real to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, instance_count_y - 15, 370, instance_count_y + 15))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, instance_count_y - 16, 370, instance_count_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			{
				if (global.show_instance_count == true)
				{
					global.show_instance_count = false;
				}
				else
				{
					global.show_instance_count = true;
				}
			}
		}
		#endregion /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen END */
		
	}
	
	if (global.debug_screen == true)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_text_outlined(display_get_gui_width() / 2, 32, l10n_text("Press both sticks to toggle debug screen"), global.default_text_size * 0.75, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() / 2, 32, l10n_text("Press F3 to toggle debug screen"), global.default_text_size * 0.75, c_black, c_white, 1);
		}
	}
	
	#region /* Version */
	if (global.debug_screen == true)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, version_y, string(global.game_name) + " v" + string(scr_get_build_date()), global.default_text_size, c_black, c_white, 1);
	}
	#endregion /* Version END */
	
	#region /* FPS */
	if (global.show_fps == true)
	or (global.debug_screen == true)
	{
		if (global.show_fps == true)
		and (global.debug_screen == true)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		if (fps >= global.max_fps)
		{
			scr_draw_text_outlined(32, fps_y, "FPS: " + string(fps) + " / " + string(global.max_fps), global.default_text_size, c_black, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(32, fps_y, "FPS: " + string(fps) + " / " + string(global.max_fps), global.default_text_size, c_black, make_color_hsv(50 / global.max_fps * fps, 255, 255), 1);
		}
	}
	#endregion /* FPS END */
	
	#region /* FPS Real */
	if (global.show_fps_real == true)
	or (global.debug_screen == true)
	{
		if (global.show_fps_real == true)
		and (global.debug_screen == true)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_real_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /* FPS Real Rating */
		if (fps_real >= fps_real_target)
		{
			scr_draw_text_outlined(320, fps_real_y + scr_wave(-3, +3, 0.5), "GOOD", global.default_text_size, c_black, c_lime, 1);
			scr_draw_text_outlined(420, fps_real_y + scr_wave(-3, +3, 0.5), ">" + string(fps_real_target), global.default_text_size * 0.5, c_black, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(320, fps_real_y, "BAD", global.default_text_size, c_black, make_color_hsv(50 / fps_real_target * fps_real, 255, 255), 1);
			scr_draw_text_outlined(420, fps_real_y, "<" + string(fps_real_target), global.default_text_size * 0.5, c_black, make_color_hsv(50 / fps_real_target * fps_real, 255, 255), 1);
		}
		#endregion /* FPS Real Rating END */
		
		if (fps_real >= fps_real_target)
		{
			scr_draw_text_outlined(32, fps_real_y, "FPS Real: " + string(fps_real), global.default_text_size, c_black, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(32, fps_real_y, "FPS Real: " + string(fps_real), global.default_text_size, c_black, make_color_hsv(50 / fps_real_target * fps_real, 255, 255), 1);
		}
	}
	#endregion /* FPS Real END */
	
	#region /* Instance Count */
	if (global.show_instance_count == true)
	or (global.debug_screen == true)
	{
		if (global.show_instance_count == true)
		and (global.debug_screen == true)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, instance_count_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, instance_count_y, l10n_text("Instance Count") + " : " + string(instance_count), global.default_text_size, c_black, c_white, 1);
		
		#region /* Show what objects are currently in the room */
		for (var i = 0; i < 100; ++i;)
		{
			if (instance_exists(i))
			and (instance_number(i) >= instance_count_target)
			{
				scr_draw_text_outlined(32, instance_count_y + 32 + (8 * i) + scr_wave(-3, +3, 0.5), string(object_get_name(i)) + ": " + string(instance_number(i)), global.default_text_size, c_black, make_color_hsv(instance_number(i), 255, 255), 1);
			}
			else
			if (instance_exists(i))
			{
				scr_draw_text_outlined(32, instance_count_y + 32 + (8 * i), string(object_get_name(i)) + ": " + string(instance_number(i)), global.default_text_size, c_black, make_color_hsv(instance_number(i), 255, 255), 1);
			}
		}
		#endregion /* Show what objects are currently in the room END */
		
	}
	#endregion /* Instance Count END */
	
	if (global.debug_screen == true)
	and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 32))
	and (global.controls_used_for_menu_navigation == "mouse")
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, 370, 32, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, display_get_gui_width(), 64 + (32 * 12), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(8, 64, l10n_text("This bar is split into sections, with each section being 1/60th of a second. As you can see, the bar is made up of various colours:"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(8, 64 + (32 * 3), l10n_text("Green - Input / Output processing (ie: keyboard, mouse, gamepad, networking etc...)"), global.default_text_size, c_black, c_lime, 1);
		scr_draw_text_outlined(8, 64 + (32 * 4), l10n_text("Red - The update speed of the step event"), global.default_text_size, c_black, c_red, 1);
		scr_draw_text_outlined(8, 64 + (32 * 5), l10n_text("Yellow - The time required for the draw event"), global.default_text_size, c_black, c_yellow, 1);
		scr_draw_text_outlined(8, 64 + (32 * 6), l10n_text("Orange - Debug update time, which is only normally visible when you use the debug module"), global.default_text_size, c_black, c_orange, 1);
		scr_draw_text_outlined(8, 64 + (32 * 7), l10n_text("White - GPU left over time, which is the time spent waiting for the GPU to finish the rendering of the frame before the next one can start"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(8, 64 + (32 * 8), l10n_text("Cyan - The text rendering time"), global.default_text_size, c_black, c_aqua, 1);
		scr_draw_text_outlined(8, 64 + (32 * 9), l10n_text("Grey - The time required to clear screen each draw step"), global.default_text_size, c_black, c_grey, 1);
		scr_draw_text_outlined(8, 64 + (32 * 10), l10n_text("Blue - The time required for the Garbage Collector to run"), global.default_text_size, c_black, c_blue, 1);
		scr_draw_text_outlined(8, 64 + (32 * 11), l10n_text("Dark Red - The GPU flush, which is how long the GPU takes to clear images from memory"), global.default_text_size, c_black, c_maroon, 1);
	}
	
}