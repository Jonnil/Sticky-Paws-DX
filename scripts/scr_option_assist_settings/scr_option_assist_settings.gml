function scr_option_assist_settings()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	#region /* Assist Settings */
	if (global.settings_sidebar_menu == "accessibility_settings")
	{
		global.assist_enable = draw_menu_checkmark(450, 50 + menu_y_offset, l10n_text("Enable Assist Mode"), "assist_enable", global.assist_enable, false, 
			"Enables various assist options to make the game easier"); 
		
		scr_draw_text_outlined(450, 100 + menu_y_offset, l10n_text("The game is meant to be played without Assist Mode"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(450, 132 + menu_y_offset, l10n_text("Only enable this if you cannot enjoy the game without extra help"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		
		global.assist_above_1_hp = draw_menu_checkmark(450, 332 + menu_y_offset, l10n_text("Always Above 1 HP"), "assist_above_1_hp", global.assist_above_1_hp, false, 
			"Prevents you from dropping below 1 HP. You'll still take damage but you won't be defeated");
		
		global.assist_invincibility = draw_menu_checkmark(450, 332 + (45) + menu_y_offset, l10n_text("Invincible"), "assist_invincibility", global.assist_invincibility, false, 
			"Makes you completely invincible. You won't take any damage");
		
		global.assist_moonjump = draw_menu_checkmark(450, 332 + (45 * 2) + menu_y_offset, l10n_text("Moonjump"), "assist_moonjump", global.assist_moonjump, false, 
			"Allows you to jump infinitely while in the air");
		
		global.assist_hover_when_holding_jump = draw_menu_checkmark(450, 332 + (45 * 3) + menu_y_offset, l10n_text("Hover When Holding Jump"), "assist_hover_when_holding_jump", global.assist_hover_when_holding_jump, false, 
			"Holding the jump button lets you hover in mid-air for better control");
		
		global.assist_floor_over_bottomless_pit = draw_menu_checkmark(450, 332 + (45 * 4) + menu_y_offset, l10n_text("Floor Over Bottomless Pit"), "assist_floor_over_bottomless_pit", global.assist_floor_over_bottomless_pit, false, 
			"Prevents falling into bottomless pits by placing an invisible floor");
		
		global.assist_breathe_underwater = draw_menu_checkmark(450, 332 + (45 * 5) + menu_y_offset, l10n_text("Breathe Underwater"), "assist_breathe_underwater", global.assist_breathe_underwater, false, 
			"Removes the need for air while underwater. Preventing drowning");
		
		global.assist_guiding_arrows = draw_menu_checkmark(450, 332 + (45 * 6) + menu_y_offset, l10n_text("Show Assist Arrows"), "assist_guiding_arrows", global.assist_guiding_arrows, false, 
			"Displays arrows to guide you towards objectives and exits");
		
		global.assist_normal_arrows = draw_menu_checkmark(450, 332 + (45 * 7) + menu_y_offset, l10n_text("Show Normal Arrows"), "assist_normal_arrows", global.assist_normal_arrows, true, 
			"Displays standard arrows for navigation without extra guidance");
		
		global.assist_enable_enemies = draw_menu_checkmark(450, 332 + (45 * 8) + menu_y_offset, l10n_text("Enable Enemies"), "assist_enable_enemies", global.assist_enable_enemies, true, 
			"Enables or disables enemy spawns in the game");
		
		global.assist_enable_spikes = draw_menu_checkmark(450, 332 + (45 * 9) + menu_y_offset, l10n_text("Enable Spikes"), "assist_enable_spikes", global.assist_enable_spikes, true, 
			"Enables or disables spikes as hazards in the game");
		
		menu_cursor_y_position_end = 332 + (45 * 9);
		
		#region /* Assist Extra HP */
		draw_menu_dropdown(450, 262 + menu_y_offset, l10n_text("Extra Health Points"), "assist_extra_hp", global.assist_extra_hp,
		l10n_text("None"),
		"+1",
		"+2",
		"+3",
		"+4",
		"+5",
		"+6",
		"+7",
		"+8",
		"+9");
		scr_set_default_dropdown_description("assist_extra_hp", "None");
		#endregion /* Assist Extra HP END */
		
		#region /* Assist item appear */
		draw_menu_dropdown(450, 182 + menu_y_offset, l10n_text("Assist Item"), "assist_item_appear", global.assist_item_appear,
		l10n_text("Always Appear"),
		l10n_text("Appear after 1 defeat on a level"),
		l10n_text("Appear after 2 defeats on a level"),
		l10n_text("Appear after 3 defeats on a level"),
		l10n_text("Appear after 4 defeats on a level"),
		l10n_text("Appear after 5 defeats on a level"),
		l10n_text("Appear after 6 defeats on a level"),
		l10n_text("Appear after 7 defeats on a level"),
		l10n_text("Appear after 8 defeats on a level"),
		l10n_text("Appear after 9 defeats on a level"),
		l10n_text("Never Appear"));
		scr_set_default_dropdown_description("assist_item_appear", "Never Appear");
		#endregion /* Assist item appear END */
		
		#region /* Make sure you can't navigate the assist menu unless you have enabled assist mode */
		if (!global.assist_enable)
		{
			if (in_settings)
			&& (!can_navigate_settings_sidebar)
			&& (menu != "assist_enable")
			{
				menu = "assist_enable";
			}
			open_dropdown = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(left_sidebar_x + 370, 157 + menu_y_offset, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		}
		#endregion /* Make sure you can't navigate the assist menu unless you have enabled assist mode END */
		
		#region /* Assist Enable Navigation */
		if (menu == "assist_enable")
		&& (global.assist_enable)
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_enable_spikes";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_item_appear";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Enable Navigation END */
	
		else
	
		#region /* Assist Item Appear Navigation */
		if (menu == "assist_item_appear")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_enable";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_extra_hp";
				menu_delay = 3;
			}
			else
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.assist_item_appear > 0)
			{
				global.assist_item_appear --;
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.assist_item_appear < 10)
			{
				global.assist_item_appear ++;
				menu_delay = 3;
			}
		}
		#endregion /* Assist Item Appear Navigation END */
			
		else
			
		#region /* Assist Extra HP Navigation */
		if (menu == "assist_extra_hp")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				menu = "assist_item_appear";
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				menu = "assist_above_1_hp";
			}
			else
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.assist_extra_hp > 0)
			{
				menu_delay = 3;
				global.assist_extra_hp --;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.assist_extra_hp < 9)
			{
				menu_delay = 3;
				global.assist_extra_hp ++;
			}
		}
		#endregion /* Assist Extra HP Navigation END */
			
		else
			
		#region /* Assist Above 1 HP Navigation */
		if (menu == "assist_above_1_hp")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_extra_hp";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_invincibility";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Above 1 HP Navigation END */
			
		else
			
		#region /* Assist Invincibility Navigation */
		if (menu == "assist_invincibility")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_above_1_hp";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_moonjump";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Invincibility Navigation END */
			
		else
			
		#region /* Assist Moonjump Navigation */
		if (menu == "assist_moonjump")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_invincibility";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_hover_when_holding_jump";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Moonjump Navigation END */
			
		else
			
		#region /* Assist Hover When Holding Jump Navigation */
		if (menu == "assist_hover_when_holding_jump")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_moonjump";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_floor_over_bottomless_pit";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Hover When Holding Jump Navigation END */
			
		else
			
		#region /* Assist Floor Over Bottomless Pit Navigation */
		if (menu == "assist_floor_over_bottomless_pit")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_hover_when_holding_jump";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_breathe_underwater";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Floor Over Bottomless Pit Navigation END */
			
		else
			
		#region /* Assist Breathe Underwater Navigation */
		if (menu == "assist_breathe_underwater")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_floor_over_bottomless_pit";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_guiding_arrows";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Breathe Underwater Navigation END */
	
		else
	
		#region /* Assist Guiding Arrows Navigation */
		if (menu == "assist_guiding_arrows")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_breathe_underwater";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_normal_arrows";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Guiding Arrows Navigation END */
	
		else
	
		#region /* Assist Normal Arrows Navigation */
		if (menu == "assist_normal_arrows")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_guiding_arrows";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "assist_enable_enemies";
				menu_delay = 3;
			}
		}
		#endregion /* Assist Normal Arrows Navigation END */
		
		else
		
		#region /* Assist Enable Enemies Navigation */
		if (menu == "assist_enable_enemies")
		{
			if (key_up)
			&& (!open_dropdown)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "assist_normal_arrows";
			}
			else
			if (key_down)
			&& (!open_dropdown)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "assist_enable_spikes";
			}
		}
		#endregion /* Assist Enable Enemies Navigation END */
		
		else
		
		#region /* Assist Enable Spikes Navigation */
		if (menu == "assist_enable_spikes")
		{
			if (key_up)
			&& (!open_dropdown)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "assist_enable_enemies";
			}
			else
			if (key_down)
			&& (!open_dropdown)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "assist_enable";
			}
		}
		#endregion /* Assist Enable Spikes Navigation END */
		
	}
	#endregion /* Assist Settings END */
	
}