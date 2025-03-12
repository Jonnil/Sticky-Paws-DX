function scr_option_challenge_mode_settings()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	/* Only run if we're in the challenge mode settings sidebar */
	if (global.settings_sidebar_menu == "challenge_mode_settings")
	{
		/* Use a local offset variable instead of hard-coded Y values */
		var offset = menu_y_offset;
		
		/* Main enable toggle and instructions */
		global.challenge_mode_enable = draw_menu_checkmark(450, 50 + offset, l10n_text("Enable Challenge Mode"), "challenge_mode_enable", global.challenge_mode_enable, false, 
			"Enables various challenge options to make the game harder");
		offset += 50;
		
		scr_draw_text_outlined(450, 50 + offset, l10n_text("The game is meant to be played without Challenge Mode"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		offset += 35;
		
		scr_draw_text_outlined(450, 50 + offset, l10n_text("Only enable this if you want extra difficulty"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		offset += 55;
		
		/* --- Survivability & Damage Increases --- */
		scr_draw_text_outlined(450, 50 + offset, l10n_text("Survivability & Damage Increases"), global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
		offset += 40;
		
		global.challenge_one_hit_defeat = draw_menu_checkmark(450, 50 + offset, l10n_text("One-Hit Defeat"), "challenge_one_hit_defeat", global.challenge_one_hit_defeat, false, 
			"Player dies instantly when hit");
		offset += 45;
		
		global.challenge_no_health_pickups = draw_menu_checkmark(450, 50 + offset, l10n_text("No Health Pickups"), "challenge_no_health_pickups", global.challenge_no_health_pickups, false, 
			"Healing items do not spawn");
		offset += 45;
		
		global.challenge_no_checkpoints = draw_menu_checkmark(450, 50 + offset, l10n_text("No Checkpoints"), "challenge_no_checkpoints", global.challenge_no_checkpoints, false, 
			"Levels must be completed in one go without mid-level respawns");
		offset += 55;
		
		draw_menu_dropdown(450, 50 + offset, l10n_text("Limited Lives"), "challenge_limited_lives", global.challenge_limited_lives,
			l10n_text("Default"),
			"3",
			"5",
			"7",
			"10");
		scr_set_default_dropdown_description("challenge_limited_lives", "Default");
		offset += 55;
		
		draw_menu_dropdown(450, 50 + offset, l10n_text("Lower HP"), "challenge_lower_hp", global.challenge_lower_hp,
			l10n_text("Normal"),
			"-1",
			"-2",
			"-3",
			"-4");
		scr_set_default_dropdown_description("challenge_lower_hp", "Normal");
		offset += 50;
		
		global.challenge_no_post_hit_invincibility = draw_menu_checkmark(450, 50 + offset, l10n_text("No Post-Hit Invincibility"), "challenge_no_post_hit_invincibility", global.challenge_no_post_hit_invincibility, false,
			"No invincibility frames after taking damage");
		offset += 55;
		
		/* --- Harder Platforming --- */
		scr_draw_text_outlined(450, 50 + offset, l10n_text("Harder Platforming"), global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
		offset += 40;
		
		global.challenge_stronger_gravity = draw_menu_checkmark(450, 50 + offset, l10n_text("Stronger Gravity"), "challenge_stronger_gravity", global.challenge_stronger_gravity, false,
			"Shorter, faster jumps with less airtime");
		offset += 45;
		
		global.challenge_no_coyote_time = draw_menu_checkmark(450, 50 + offset, l10n_text("No Coyote Time"), "challenge_no_coyote_time", global.challenge_no_coyote_time, false,
			"Removes extra time for jumping after leaving a platform");
		offset += 45;
		
		global.challenge_slippery_physics = draw_menu_checkmark(450, 50 + offset, l10n_text("Slippery Physics"), "challenge_slippery_physics", global.challenge_slippery_physics, false,
			"Adds ice-like movement to surfaces");
		offset += 45;
		
		global.challenge_smaller_ledge = draw_menu_checkmark(450, 50 + offset, l10n_text("Smaller Ledge Grab Zone"), "challenge_smaller_ledge", global.challenge_smaller_ledge, false,
			"Reduces the area for ledge grabs");
		offset += 45;
		
		global.challenge_no_midair_control = draw_menu_checkmark(450, 50 + offset, l10n_text("No Midair Control"), "challenge_no_midair_control", global.challenge_no_midair_control, false,
			"Locks movement after jumping");
		offset += 45;
		
		global.challenge_faster_autoscroll = draw_menu_checkmark(450, 50 + offset, l10n_text("Faster Auto-Scrolling"), "challenge_faster_autoscroll", global.challenge_faster_autoscroll, false,
			"Levels scroll at a higher speed");
		offset += 55;
		
		/* --- More Hazardous Environment --- */
		scr_draw_text_outlined(450, 50 + offset, l10n_text("More Hazardous Environment"), global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
		offset += 40;
		
		global.challenge_spikes_always_kill = draw_menu_checkmark(450, 50 + offset, l10n_text("Spikes Always Kill"), "challenge_spikes_always_kill", global.challenge_spikes_always_kill, false,
			"Spikes instantly defeat the player");
		offset += 45;
		
		global.challenge_more_bottomless_pits = draw_menu_checkmark(450, 50 + offset, l10n_text("More Bottomless Pits"), "challenge_more_bottomless_pits", global.challenge_more_bottomless_pits, false,
			"Expands pits to increase risk");
		offset += 45;
		
		global.challenge_platforms_crumble = draw_menu_checkmark(450, 50 + offset, l10n_text("Falling Platforms Crumble Faster"), "challenge_platforms_crumble", global.challenge_platforms_crumble, false,
			"Temporary platforms break quicker");
		offset += 45;
		
		global.challenge_extra_enemy_spawns = draw_menu_checkmark(450, 50 + offset, l10n_text("Enemies Appear More"), "challenge_extra_enemy_spawns", global.challenge_extra_enemy_spawns, false,
			"Extra enemy spawns throughout levels");
		offset += 45;
		
		global.challenge_larger_hazard_hitboxes = draw_menu_checkmark(450, 50 + offset, l10n_text("Larger Hazard Hitboxes"), "challenge_larger_hazard_hitboxes", global.challenge_larger_hazard_hitboxes, false,
			"Increases the area for hazards to hit the player");
		offset += 55;
		
		/* --- Enemy & Combat Enhancements --- */
		scr_draw_text_outlined(450, 50 + offset, l10n_text("Enemy & Combat Enhancements"), global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
		offset += 40;
		
		global.challenge_stronger_enemies = draw_menu_checkmark(450, 50 + offset, l10n_text("Stronger Enemies"), "challenge_stronger_enemies", global.challenge_stronger_enemies, false,
			"Enemies have more health and require extra hits");
		offset += 45;
		
		global.challenge_faster_enemies = draw_menu_checkmark(450, 50 + offset, l10n_text("Faster Enemies"), "challenge_faster_enemies", global.challenge_faster_enemies, false,
			"Increases enemy movement speed");
		offset += 45;
		
		global.challenge_more_aggressive_enemies = draw_menu_checkmark(450, 50 + offset, l10n_text("More Aggressive Enemies"), "challenge_more_aggressive_enemies", global.challenge_more_aggressive_enemies, false,
			"Enemies react quicker and aim better");
		offset += 45;
		
		global.challenge_enemies_respawn_quickly = draw_menu_checkmark(450, 50 + offset, l10n_text("Enemies Respawn Quickly"), "challenge_enemies_respawn_quickly", global.challenge_enemies_respawn_quickly, false,
			"Defeated enemies return after a few seconds");
		offset += 45;
		
		global.challenge_enemies_double_damage = draw_menu_checkmark(450, 50 + offset, l10n_text("Enemies Deal Double Damage"), "challenge_enemies_double_damage", global.challenge_enemies_double_damage, false,
			"Each hit is more punishing");
		offset += 45;
		
		global.challenge_enemy_projectiles_faster = draw_menu_checkmark(450, 50 + offset, l10n_text("Enemy Projectiles Faster"), "challenge_enemy_projectiles_faster", global.challenge_enemy_projectiles_faster, false,
			"Projectiles move at a higher speed");
		offset += 45;
		
		global.challenge_enemies_no_stun = draw_menu_checkmark(450, 50 + offset, l10n_text("Enemies Can't Be Stunned"), "challenge_enemies_no_stun", global.challenge_enemies_no_stun, false,
			"Prevents enemies from being stunned");
		offset += 55;
		
		/* --- Extra Difficulty Modifiers --- */
		scr_draw_text_outlined(450, 50 + offset, l10n_text("Extra Difficulty Modifiers"), global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
		offset += 40;
		
		global.challenge_permanent_darkness = draw_menu_checkmark(450, 50 + offset, l10n_text("Permanent Darkness"), "challenge_permanent_darkness", global.challenge_permanent_darkness, false,
			"Level is always dark, requiring a flashlight");
		offset += 45;
		
		global.challenge_limited_air = draw_menu_checkmark(450, 50 + offset, l10n_text("Limited Air Supply"), "challenge_limited_air", global.challenge_limited_air, false,
			"Adds an oxygen meter for above-ground areas");
		offset += 45;
		
		global.challenge_no_pause = draw_menu_checkmark(450, 50 + offset, l10n_text("No Pause Feature"), "challenge_no_pause", global.challenge_no_pause, false,
			"Game cannot be paused");
		offset += 55;
		
		draw_menu_dropdown(450, 50 + offset, l10n_text("Faster Game Speed"), "challenge_game_speed", global.challenge_game_speed,
			l10n_text("Normal"),
			"1.5x",
			"2x",
			"3x");
		scr_set_default_dropdown_description("challenge_game_speed", "Normal");
		offset += 45;
		
		global.challenge_randomized_controls = draw_menu_checkmark(450, 50 + offset, l10n_text("Randomized Controls"), "challenge_randomized_controls", global.challenge_randomized_controls, false,
			"Occasionally swaps control inputs");
		offset += 45;
		
		global.challenge_invisible_elements = draw_menu_checkmark(450, 50 + offset, l10n_text("Invisible Enemies/Platforms"), "challenge_invisible_elements", global.challenge_invisible_elements, false,
			"Some elements are hidden until close");
		offset += 45;
		
		global.challenge_strict_time_limits = draw_menu_checkmark(450, 50 + offset, l10n_text("Strict Time Limits"), "challenge_strict_time_limits", global.challenge_strict_time_limits, false,
			"Reduces available time for levels");
		offset += 55;
		
		/* --- Bonus Challenge Ideas --- */
		scr_draw_text_outlined(450, 50 + offset, l10n_text("Bonus Challenge Ideas"), global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
		offset += 40;
		
		global.challenge_iron_paw_mode = draw_menu_checkmark(450, 50 + offset, l10n_text("Iron Paw Mode"), "challenge_iron_paw_mode", global.challenge_iron_paw_mode, false,
			"Complete the game without dying once");
		offset += 45;
		
		global.challenge_limited_inputs = draw_menu_checkmark(450, 50 + offset, l10n_text("Limited Inputs Mode"), "challenge_limited_inputs", global.challenge_limited_inputs, false,
			"Only a set number of jumps per level");
		offset += 45;
		
		global.challenge_pacifist_mode = draw_menu_checkmark(450, 50 + offset, l10n_text("Pacifist Mode"), "challenge_pacifist_mode", global.challenge_pacifist_mode, false,
			"Players cannot attack enemies");
		offset += 45;
		
		global.challenge_speedrun_mode = draw_menu_checkmark(450, 50 + offset, l10n_text("Speedrun Mode"), "challenge_speedrun_mode", global.challenge_speedrun_mode, false,
			"Must complete levels within strict time limits");
		offset += 45;
		
		global.challenge_no_hud_mode = draw_menu_checkmark(450, 50 + offset, l10n_text("No HUD Mode"), "challenge_no_hud_mode", global.challenge_no_hud_mode, false,
			"Removes on-screen indicators like health and collectibles");
		offset += 45;
		
		global.challenge_perma_death_mode = draw_menu_checkmark(450, 50 + offset, l10n_text("Perma-Death Mode"), "challenge_perma_death_mode", global.challenge_perma_death_mode, false,
			"Dying resets the entire game");
		offset += 45;
		
		global.challenge_roguelike_mode = draw_menu_checkmark(450, 50 + offset, l10n_text("Roguelike Mode"), "challenge_roguelike_mode", global.challenge_roguelike_mode, false,
			"Levels and enemy placements are randomized each time");
		offset += 45;
		
		menu_cursor_y_position_end = 2100;
		
		#region /* Disable navigation if Challenge Mode is not enabled */
		if (in_settings)
		&& (!can_navigate_settings_sidebar)
		&& (!global.challenge_mode_enable)
		{
			menu = "challenge_mode_enable";
			open_dropdown = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(left_sidebar_x + 370, 157 + menu_y_offset, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		}
		#endregion /* Disable navigation if Challenge Mode is not enabled END */
		
		/* --- Navigation Code --- */
		/* Define a local array of selectable menu IDs (in order) */
		var navIDs = [
			"challenge_mode_enable",
			"challenge_one_hit_defeat",
			"challenge_no_health_pickups",
			"challenge_no_checkpoints",
			"challenge_limited_lives",
			"challenge_lower_hp",
			"challenge_no_post_hit_invincibility",
			"challenge_stronger_gravity",
			"challenge_no_coyote_time",
			"challenge_slippery_physics",
			"challenge_smaller_ledge",
			"challenge_no_midair_control",
			"challenge_faster_autoscroll",
			"challenge_spikes_always_kill",
			"challenge_more_bottomless_pits",
			"challenge_platforms_crumble",
			"challenge_extra_enemy_spawns",
			"challenge_larger_hazard_hitboxes",
			"challenge_stronger_enemies",
			"challenge_faster_enemies",
			"challenge_more_aggressive_enemies",
			"challenge_enemies_respawn_quickly",
			"challenge_enemies_double_damage",
			"challenge_enemy_projectiles_faster",
			"challenge_enemies_no_stun",
			"challenge_permanent_darkness",
			"challenge_limited_air",
			"challenge_no_pause",
			"challenge_game_speed",
			"challenge_randomized_controls",
			"challenge_invisible_elements",
			"challenge_strict_time_limits",
			"challenge_iron_paw_mode",
			"challenge_limited_inputs",
			"challenge_pacifist_mode",
			"challenge_speedrun_mode",
			"challenge_no_hud_mode",
			"challenge_perma_death_mode",
			"challenge_roguelike_mode"
		];
		/* (If you want to temporarily disable a menu item, comment it out here) */
		
		/* Find the current index in navIDs from the current global 'menu' */
		var currentIndex = 0;
		for (var k = 0; k < array_length(navIDs); k++)
		{
			if (menu == navIDs[k])
			{
				currentIndex = k;
				break;
			}
		}
		
		/* Handle input navigation using the navIDs array */
		if (key_up
		&& (menu_delay == 0
		&& menu_joystick_delay == 0))
		{
			currentIndex = max(currentIndex - 1, 0);
			menu_delay = 3;
		}
		else
		if (key_down
		&& (menu_delay == 0
		&& menu_joystick_delay == 0))
		{
			currentIndex = min(currentIndex + 1, array_length(navIDs) - 1);
			menu_delay = 3;
		}
		
		/* Set 'menu' to the currently selected item */
		if (in_settings)
		&& (!can_navigate_settings_sidebar)
		{
			menu = navIDs[currentIndex];
		}
		
		/* --- Score Multiplier Calculation and Display --- */
		/* Start with a base multiplier of 1.0 */
		var score_multiplier = 1.0;
		
		/* Only add challenge modifiers if Challenge Mode is enabled */
		if (global.challenge_mode_enable)
		{
			var challenge_count = 0;
			
			/* For checkboxes (true/false challenges) */
			if (global.challenge_one_hit_defeat)		 challenge_count++;
			if (global.challenge_no_health_pickups)	   challenge_count++;
			if (global.challenge_no_checkpoints)		  challenge_count++;
			if (global.challenge_no_post_hit_invincibility) challenge_count++;
			if (global.challenge_stronger_gravity)		  challenge_count++;
			if (global.challenge_no_coyote_time)			challenge_count++;
			if (global.challenge_slippery_physics)		  challenge_count++;
			if (global.challenge_smaller_ledge)			 challenge_count++;
			if (global.challenge_no_midair_control)		 challenge_count++;
			if (global.challenge_faster_autoscroll)		 challenge_count++;
			if (global.challenge_spikes_always_kill)		challenge_count++;
			if (global.challenge_more_bottomless_pits)	  challenge_count++;
			if (global.challenge_platforms_crumble)		 challenge_count++;
			if (global.challenge_extra_enemy_spawns)		challenge_count++;
			if (global.challenge_larger_hazard_hitboxes)	challenge_count++;
			if (global.challenge_stronger_enemies)		  challenge_count++;
			if (global.challenge_faster_enemies)			challenge_count++;
			if (global.challenge_more_aggressive_enemies)   challenge_count++;
			if (global.challenge_enemies_respawn_quickly)	 challenge_count++;
			if (global.challenge_enemies_double_damage)	   challenge_count++;
			if (global.challenge_enemy_projectiles_faster)	challenge_count++;
			if (global.challenge_enemies_no_stun)			 challenge_count++;
			if (global.challenge_permanent_darkness)		  challenge_count++;
			if (global.challenge_limited_air)				 challenge_count++;
			if (global.challenge_no_pause)					challenge_count++;
			if (global.challenge_randomized_controls)		 challenge_count++;
			if (global.challenge_invisible_elements)		  challenge_count++;
			if (global.challenge_strict_time_limits)		  challenge_count++;
			if (global.challenge_iron_paw_mode)			   challenge_count++;
			if (global.challenge_limited_inputs)			  challenge_count++;
			if (global.challenge_pacifist_mode)			   challenge_count++;
			if (global.challenge_speedrun_mode)			   challenge_count++;
			if (global.challenge_no_hud_mode)				 challenge_count++;
			if (global.challenge_perma_death_mode)			challenge_count++;
			if (global.challenge_roguelike_mode)			  challenge_count++;
			
			/* For dropdowns, count as enabled if not set to the default option */
			if (global.challenge_limited_lives != 0) challenge_count++;
			if (global.challenge_lower_hp != 0)		 challenge_count++;
			if (global.challenge_game_speed != 0)		 challenge_count++;
			
			/* Each enabled challenge modifier adds 0.1× to the score multiplier */
			score_multiplier += challenge_count * 0.1;
		}
		
		global.challenge_mode_score_multiplier = score_multiplier;
		
		/* Display the current score multiplier on the sidebar */
		draw_set_halign(fa_right);
		scr_draw_text_outlined(display_get_gui_width() - 32, 32, l10n_text("Score Multiplier") + ":", global.default_text_size * 0.9, c_menu_outline, c_menu_fill, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		scr_draw_text_outlined(display_get_gui_width() - 132, 42, string_format(score_multiplier, 1, 1) + "x", global.default_text_size * score_multiplier, c_menu_outline, c_menu_fill, 1);
	}
}