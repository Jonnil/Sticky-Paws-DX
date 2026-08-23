///////////////////////////////////////////////////////////////
// Debug Toggle
///////////////////////////////////////////////////////////////

enum DEBUG_VISIBILITY_MODE
{
	OFF = 0,
	IN_OVERLAY = 1,
	ALWAYS = 2
}

enum CAPTURE_MODE_PRESET
{
	OFF = 0,
	PC = 1,
	SWITCH_HANDHELD = 2
}

enum CAPTURE_MODE_WINDOW_STAGE
{
	RESIZE = 0,
	POSITION = 1
}

/// @function scr_debug_should_show_public_debug_controls()
/* Returns whether public debug controls should be visible in normal PC-facing menus. */
function scr_debug_should_show_public_debug_controls()
{
	return global.enable_option_for_pc
		|| (GM_build_type == "run");
}

/// @function scr_debug_is_hidden_debug_tab_visible()
/* Returns whether the hidden Debug tab should be visible in Options for the current session. */
function scr_debug_is_hidden_debug_tab_visible()
{
	return global.debug_menu_unlocked;
}

///////////////////////////////////////////////////////////////
// Capture Mode
///////////////////////////////////////////////////////////////

/// @function scr_capture_mode_initialize()
/* Ensures session-only Capture Mode state exists before any menu, draw, or config helper uses it. */
function scr_capture_mode_initialize()
{
	if (!variable_global_exists("capture_mode"))
	{
		global.capture_mode = CAPTURE_MODE_PRESET.OFF;
	}

	if (!variable_global_exists("capture_mode_snapshot"))
	{
		global.capture_mode_snapshot = undefined;
	}

	if (!variable_global_exists("capture_mode_audio_refresh_pending"))
	{
		global.capture_mode_audio_refresh_pending = false;
	}

	if (!variable_global_exists("capture_mode_audio_resume_pending"))
	{
		global.capture_mode_audio_resume_pending = false;
	}

	if (!variable_global_exists("capture_mode_window_transition"))
	{
		global.capture_mode_window_transition = undefined;
	}
}

/// @function scr_capture_mode_is_active()
/* Returns true while either Capture Mode preset is applying temporary overrides. */
function scr_capture_mode_is_active()
{
	scr_capture_mode_initialize();
	return global.capture_mode != CAPTURE_MODE_PRESET.OFF
		&& is_struct(global.capture_mode_snapshot);
}

/// @function scr_capture_mode_owns_window()
/* Keeps competing resolution/fullscreen controls locked through asynchronous restore. */
function scr_capture_mode_owns_window()
{
	scr_capture_mode_initialize();
	return scr_capture_mode_is_active()
		|| is_struct(global.capture_mode_window_transition);
}

/// @function scr_capture_mode_get_name(capture_mode)
/* Returns the user-facing name of a Capture Mode preset. */
function scr_capture_mode_get_name(capture_mode = -1)
{
	scr_capture_mode_initialize();

	if (capture_mode < 0)
	{
		capture_mode = global.capture_mode;
	}

	switch (capture_mode)
	{
		case CAPTURE_MODE_PRESET.PC:
			return l10n_text("PC (1080p)");

		case CAPTURE_MODE_PRESET.SWITCH_HANDHELD:
			return l10n_text("Switch Handheld (720p)");
	}

	return l10n_text("Off");
}

/// @function scr_capture_mode_take_snapshot()
/* Captures every setting that Capture Mode changes, plus the exact desktop window state. */
function scr_capture_mode_take_snapshot()
{
	var chosen_controller_snapshot = array_create(global.max_players + 1, 0);

	for (var i = 1; i <= global.max_players; i++)
	{
		chosen_controller_snapshot[i] = global.chosen_controller_used[i];
	}

	var fullscreen_snapshot = window_get_fullscreen();
	var window_width_snapshot = window_get_width();
	var window_height_snapshot = window_get_height();
	var window_x_snapshot = global.enable_option_for_pc ? window_get_x() : 0;
	var window_y_snapshot = global.enable_option_for_pc ? window_get_y() : 0;

	global.capture_mode_snapshot =
	{
		automatically_pause_when_window_is_unfocused: global.automatically_pause_when_window_is_unfocused,
		show_timer: global.show_timer,
		show_defeats_counter: global.show_defeats_counter,
		show_tutorial_signs: global.show_tutorial_signs,
		show_new_items_notification: global.show_new_items_notification,
		hud_hide_time: global.hud_hide_time,
		assist_guiding_arrows: global.assist_guiding_arrows,
		assist_normal_arrows: global.assist_normal_arrows,
		debug_screen: global.debug_screen,
		show_collision_mask: global.show_collision_mask,
		volume_music: global.volume_music,
		volume_melody: global.volume_melody,
		resolution_setting: global.resolution_setting,
		gui_scale_modifier: global.gui_scale_modifier,
		show_prompt_when_changing_to_gamepad: global.show_prompt_when_changing_to_gamepad,
		show_prompt_when_changing_to_keyboard_and_mouse: global.show_prompt_when_changing_to_keyboard_and_mouse,
		always_show_gamepad_buttons: global.always_show_gamepad_buttons,
		chosen_controller_used: chosen_controller_snapshot,
		fullscreen_mode: fullscreen_snapshot,
		window_width: window_width_snapshot,
		window_height: window_height_snapshot,
		window_x: window_x_snapshot,
		window_y: window_y_snapshot,
		/* Fullscreen hides the user's windowed rectangle. Capture it after the
		   documented fullscreen-to-windowed settling period, before resizing. */
		window_rectangle_pending: global.enable_option_for_pc && fullscreen_snapshot
	};
}

/// @function scr_capture_mode_refresh_music_gain()
/* Mutes every known music/melody source or restores the one canonical active mix. */
function scr_capture_mode_refresh_music_gain()
{
	var capture_muted = scr_capture_mode_is_active();
	if (room == rm_pause)
	{
		/* Persistent gameplay instances cannot be reached until the pause room closes. */
		global.capture_mode_audio_refresh_pending = true;
	}

	var music_gain = capture_muted ? 0 : global.volume_music * global.volume_main;
	var melody_gain = capture_muted ? 0 : global.volume_melody * global.volume_main;
	var invincible_music_active = false;

	for (var player_index = 0; player_index < instance_number(obj_player); player_index++)
	{
		var player_instance = instance_find(obj_player, player_index);
		var player_invincible = !capture_muted
			&& player_instance.invincible_timer >= 2
			&& player_instance.music_invincible != noone;

		if (player_instance.music_invincible != noone)
		{
			audio_sound_gain(player_instance.music_invincible, player_invincible ? music_gain : 0, 0);
		}

		if (variable_instance_exists(player_instance, "player_lose_melody")
		&& player_instance.player_lose_melody != noone)
		{
			audio_sound_gain(player_instance.player_lose_melody, melody_gain, 0);
		}

		invincible_music_active = invincible_music_active || player_invincible;
	}

	var boss_music_active = !capture_muted
		&& variable_global_exists("music_boss")
		&& global.music_boss != noone;
	var underwater_music_active = !capture_muted
		&& !boss_music_active
		&& !invincible_music_active
		&& variable_global_exists("underwater_music_active")
		&& global.underwater_music_active
		&& variable_global_exists("music_underwater")
		&& global.music_underwater != noone;
	var normal_music_gain = (!capture_muted && !boss_music_active && !underwater_music_active && !invincible_music_active) ? music_gain : 0;

	if (variable_global_exists("music")
	&& global.music != noone)
	{
		audio_sound_gain(global.music, normal_music_gain, 0);
	}

	if (variable_global_exists("music_underwater")
	&& global.music_underwater != noone)
	{
		audio_sound_gain(global.music_underwater, underwater_music_active ? music_gain : 0, 0);
	}

	if (variable_global_exists("music_boss")
	&& global.music_boss != noone)
	{
		audio_sound_gain(global.music_boss, (boss_music_active && !invincible_music_active) ? music_gain : 0, 0);
	}

	if (variable_global_exists("loading_music")
	&& global.loading_music != noone)
	{
		audio_sound_gain(global.loading_music, music_gain, 0);
	}

	if (variable_global_exists("level_clear_melody")
	&& global.level_clear_melody != noone)
	{
		audio_sound_gain(global.level_clear_melody, melody_gain, 0);
	}

	var title_instance = instance_find(obj_title, 0);
	if (title_instance != noone)
	{
		if (variable_instance_exists(title_instance, "title_music")
		&& title_instance.title_music != noone)
		{
			audio_sound_gain(title_instance.title_music, music_gain, 0);
		}

		if (variable_instance_exists(title_instance, "trailer_sound")
		&& title_instance.trailer_sound != noone)
		{
			audio_sound_gain(title_instance.trailer_sound, music_gain, 0);
		}
	}

	var level_editor_instance = instance_find(obj_leveleditor, 0);
	if (level_editor_instance != noone
	&& variable_instance_exists(level_editor_instance, "level_editing_music")
	&& level_editor_instance.level_editing_music != noone)
	{
		audio_sound_gain(level_editor_instance.level_editing_music, music_gain, 0);
	}

	for (var lose_index = 0; lose_index < instance_number(obj_player_lose); lose_index++)
	{
		var lose_instance = instance_find(obj_player_lose, lose_index);
		if (variable_instance_exists(lose_instance, "player_lose_melody")
		&& lose_instance.player_lose_melody != noone)
		{
			audio_sound_gain(lose_instance.player_lose_melody, melody_gain, 0);
		}
	}
}

/// @function scr_capture_mode_queue_window_transition(output_width, output_height, center_after_resize, output_x, output_y, fullscreen_after, requires_capture_mode)
/* Queues one bounded desktop resize. GameMaker requires ten Steps between
   fullscreen changes, resizing, and positioning/centering the window. */
function scr_capture_mode_queue_window_transition(output_width, output_height, center_after_resize, output_x = 0, output_y = 0, fullscreen_after = false, requires_capture_mode = true)
{
	scr_capture_mode_initialize();

	if (!global.enable_option_for_pc)
	{
		return false;
	}

	/* A rapid preset switch must not discard time still owed to an earlier
	   fullscreen exit or resize operation. The newest target replaces the old one. */
	var resize_wait_steps = 0;
	var fullscreen_exit_requested = false;
	if (is_struct(global.capture_mode_window_transition))
	{
		resize_wait_steps = global.capture_mode_window_transition.steps_remaining;
		fullscreen_exit_requested = global.capture_mode_window_transition.fullscreen_exit_requested;
	}

	if (window_get_fullscreen()
	&& !fullscreen_exit_requested)
	{
		window_set_fullscreen(false);
		fullscreen_exit_requested = true;
		resize_wait_steps = max(resize_wait_steps, 10);
	}

	/* Replacing this struct also cancels any resize/center left by a superseded preset. */
	global.capture_mode_window_transition =
	{
		stage: CAPTURE_MODE_WINDOW_STAGE.RESIZE,
		steps_remaining: resize_wait_steps,
		width: output_width,
		height: output_height,
		center_after_resize: center_after_resize,
		x: output_x,
		y: output_y,
		fullscreen_after: fullscreen_after,
		fullscreen_exit_requested: fullscreen_exit_requested,
		resize_window: true,
		requires_capture_mode: requires_capture_mode
	};

	return true;
}

/// @function scr_capture_mode_update_window_transition()
/* Advances at most one stage per Step and never retries a rejected or clamped size. */
function scr_capture_mode_update_window_transition()
{
	scr_capture_mode_initialize();

	if (!is_struct(global.capture_mode_window_transition))
	{
		return false;
	}

	var transition = global.capture_mode_window_transition;
	if (transition.requires_capture_mode
	&& !scr_capture_mode_is_active())
	{
		global.capture_mode_window_transition = undefined;
		return false;
	}

	/* Wait until a minimized desktop window has valid dimensions again. */
	if (window_get_width() <= 0 || window_get_height() <= 0)
	{
		return false;
	}

	if (transition.steps_remaining > 0)
	{
		transition.steps_remaining--;
		return false;
	}

	if (transition.stage == CAPTURE_MODE_WINDOW_STAGE.RESIZE)
	{
		/* If fullscreen changed outside Capture Mode while this job was waiting,
		   restart the documented fullscreen-to-windowed settling period once. */
		if (window_get_fullscreen())
		{
			if (!transition.fullscreen_exit_requested)
			{
				window_set_fullscreen(false);
				transition.fullscreen_exit_requested = true;
				transition.steps_remaining = 10;
				return true;
			}

			/* The one requested fullscreen exit did not settle. Abandon this
			   transition instead of creating another retry loop. */
			global.capture_mode_window_transition = undefined;
			return false;
		}

		/* A fullscreen window only exposes its prior windowed rectangle after the
		   fullscreen transition has settled. Save it before the preset replaces it. */
		if (scr_capture_mode_is_active()
		&& variable_struct_exists(global.capture_mode_snapshot, "window_rectangle_pending")
		&& global.capture_mode_snapshot.window_rectangle_pending)
		{
			global.capture_mode_snapshot.window_width = window_get_width();
			global.capture_mode_snapshot.window_height = window_get_height();
			global.capture_mode_snapshot.window_x = window_get_x();
			global.capture_mode_snapshot.window_y = window_get_y();
			global.capture_mode_snapshot.window_rectangle_pending = false;
		}

		if (!transition.resize_window)
		{
			if (transition.fullscreen_after)
			{
				window_set_fullscreen(true);
			}

			global.capture_mode_window_transition = undefined;
			return true;
		}

		window_set_size(transition.width, transition.height);
		transition.stage = CAPTURE_MODE_WINDOW_STAGE.POSITION;
		transition.steps_remaining = 10;
		transition.fullscreen_exit_requested = false;
		return true;
	}

	if (transition.center_after_resize)
	{
		window_center();
	}
	else
	{
		window_set_position(transition.x, transition.y);
	}

	if (transition.fullscreen_after)
	{
		window_set_fullscreen(true);
	}

	global.capture_mode_window_transition = undefined;
	return true;
}

/// @function scr_capture_mode_set_output(resolution_setting, output_width, output_height, resize_output_window)
/* Applies Capture Mode's logical output settings. Only an explicit preset action
   may queue a window resize; recurring maintenance must never resize the window. */
function scr_capture_mode_set_output(resolution_setting, output_width, output_height, resize_output_window = false)
{
	global.resolution_setting = resolution_setting;

	if (global.enable_option_for_pc)
	{
		if (resize_output_window)
		{
			scr_capture_mode_queue_window_transition(output_width, output_height, true);
		}

		display_set_gui_size(output_width, output_height);
	}
}

/// @function scr_capture_mode_apply_overrides(capture_mode, resize_output_window)
/* Reapplies temporary values without replacing the original snapshot or saving the overrides. */
function scr_capture_mode_apply_overrides(capture_mode, resize_output_window = false)
{
	if (capture_mode != CAPTURE_MODE_PRESET.PC
	&& capture_mode != CAPTURE_MODE_PRESET.SWITCH_HANDHELD)
	|| (capture_mode == CAPTURE_MODE_PRESET.PC
	&& !global.enable_option_for_pc)
	{
		return false;
	}

	global.capture_mode = capture_mode;
	global.automatically_pause_when_window_is_unfocused = false;
	global.show_timer = false;
	global.show_defeats_counter = false;
	global.show_tutorial_signs = false;
	global.show_new_items_notification = false;
	global.hud_hide_time = 0;
	global.assist_guiding_arrows = false;
	global.assist_normal_arrows = false;
	global.debug_screen = false;
	global.show_collision_mask = false;
	global.volume_music = 0;
	global.volume_melody = 0;
	global.gui_scale_modifier = 0;
	global.show_prompt_when_changing_to_gamepad = false;
	global.show_prompt_when_changing_to_keyboard_and_mouse = false;

	var use_switch_prompts = capture_mode == CAPTURE_MODE_PRESET.SWITCH_HANDHELD;
	global.always_show_gamepad_buttons = use_switch_prompts;

	for (var i = 1; i <= global.max_players; i++)
	{
		global.chosen_controller_used[i] = use_switch_prompts ? 3 : 0;
	}

	set_controller_sprites_to_use();

	if (capture_mode == CAPTURE_MODE_PRESET.SWITCH_HANDHELD)
	{
		scr_capture_mode_set_output(3, 1280, 720, resize_output_window);
	}
	else
	{
		scr_capture_mode_set_output(1, 1920, 1080, resize_output_window);
	}

	scr_capture_mode_refresh_music_gain();
	return true;
}

/// @function scr_capture_mode_apply(capture_mode)
/* Snapshots once, protects that snapshot on disk, and applies or switches the temporary preset. */
function scr_capture_mode_apply(capture_mode)
{
	scr_capture_mode_initialize();

	/* Keep the original window snapshot atomic until a queued restore finishes. */
	if (!scr_capture_mode_is_active()
	&& is_struct(global.capture_mode_window_transition))
	{
		return false;
	}

	if (capture_mode != CAPTURE_MODE_PRESET.PC
	&& capture_mode != CAPTURE_MODE_PRESET.SWITCH_HANDHELD)
	|| (capture_mode == CAPTURE_MODE_PRESET.PC
	&& !global.enable_option_for_pc)
	{
		return false;
	}

	if (!scr_capture_mode_is_active())
	{
		scr_capture_mode_take_snapshot();
		global.capture_mode = capture_mode;
		/* Persist unsaved pre-capture option changes so a crash or restart still returns to them. */
		scr_config_save();
	}

	return scr_capture_mode_apply_overrides(capture_mode, true);
}

/// @function scr_capture_mode_maintain()
/* Repairs accidental changes to settings owned by the active preset without doing expensive work every frame. */
function scr_capture_mode_maintain()
{
	scr_capture_mode_initialize();

	/* The paused gameplay room is persistent but inaccessible until it becomes current again. */
	if (global.capture_mode_audio_refresh_pending
	&& room != rm_pause)
	{
		var resume_audio_after_refresh = global.capture_mode_audio_resume_pending;
		global.capture_mode_audio_refresh_pending = false;
		scr_capture_mode_refresh_music_gain();

		if (resume_audio_after_refresh)
		{
			audio_resume_all();
			global.capture_mode_audio_resume_pending = false;
		}
	}

	if (!scr_capture_mode_is_active())
	{
		return false;
	}

	/* Do not fight the operating system while the desktop window is minimized. */
	if (global.enable_option_for_pc
	&& (window_get_width() <= 0 || window_get_height() <= 0))
	{
		return false;
	}

	var use_switch_prompts = global.capture_mode == CAPTURE_MODE_PRESET.SWITCH_HANDHELD;
	var target_resolution = use_switch_prompts ? 3 : 1;
	var preset_changed = global.automatically_pause_when_window_is_unfocused
		|| global.show_timer
		|| global.show_defeats_counter
		|| global.show_tutorial_signs
		|| global.show_new_items_notification
		|| global.hud_hide_time != 0
		|| global.assist_guiding_arrows
		|| global.assist_normal_arrows
		|| global.debug_screen
		|| global.show_collision_mask
		|| global.volume_music != 0
		|| global.volume_melody != 0
		|| global.gui_scale_modifier != 0
		|| global.resolution_setting != target_resolution
		|| global.show_prompt_when_changing_to_gamepad
		|| global.show_prompt_when_changing_to_keyboard_and_mouse
		|| global.always_show_gamepad_buttons != use_switch_prompts;

	if (!preset_changed)
	{
		for (var i = 1; i <= global.max_players; i++)
		{
			if (global.chosen_controller_used[i] != (use_switch_prompts ? 3 : 0))
			{
				preset_changed = true;
				break;
			}
		}
	}

	if (preset_changed)
	{
		/* Repair logical values only. Window output is a bounded, explicit action;
		   comparing an OS-clamped size here would recreate the per-Step resize loop. */
		return scr_capture_mode_apply_overrides(global.capture_mode, false);
	}

	return false;
}

/// @function scr_capture_mode_reapply()
/* Keeps Capture Mode active when normal room startup code reloads config.ini. */
function scr_capture_mode_reapply()
{
	scr_capture_mode_initialize();

	if (scr_capture_mode_is_active())
	{
		return scr_capture_mode_apply_overrides(global.capture_mode, false);
	}

	return false;
}

/// @function scr_capture_mode_restore()
/* Restores the exact pre-capture snapshot and ends the temporary mode. */
function scr_capture_mode_restore()
{
	scr_capture_mode_initialize();

	if (!scr_capture_mode_is_active())
	{
		global.capture_mode = CAPTURE_MODE_PRESET.OFF;
		global.capture_mode_snapshot = undefined;
		return false;
	}

	var snapshot = global.capture_mode_snapshot;
	var window_rectangle_pending = variable_struct_exists(snapshot, "window_rectangle_pending")
		&& snapshot.window_rectangle_pending;

	global.automatically_pause_when_window_is_unfocused = snapshot.automatically_pause_when_window_is_unfocused;
	global.show_timer = snapshot.show_timer;
	global.show_defeats_counter = snapshot.show_defeats_counter;
	global.show_tutorial_signs = snapshot.show_tutorial_signs;
	global.show_new_items_notification = snapshot.show_new_items_notification;
	global.hud_hide_time = snapshot.hud_hide_time;
	global.assist_guiding_arrows = snapshot.assist_guiding_arrows;
	global.assist_normal_arrows = snapshot.assist_normal_arrows;
	global.debug_screen = snapshot.debug_screen;
	global.show_collision_mask = snapshot.show_collision_mask;
	global.volume_music = snapshot.volume_music;
	global.volume_melody = snapshot.volume_melody;
	global.resolution_setting = snapshot.resolution_setting;
	global.gui_scale_modifier = snapshot.gui_scale_modifier;
	global.show_prompt_when_changing_to_gamepad = snapshot.show_prompt_when_changing_to_gamepad;
	global.show_prompt_when_changing_to_keyboard_and_mouse = snapshot.show_prompt_when_changing_to_keyboard_and_mouse;
	global.always_show_gamepad_buttons = snapshot.always_show_gamepad_buttons;

	for (var i = 1; i <= global.max_players; i++)
	{
		if (i < array_length(snapshot.chosen_controller_used))
		{
			global.chosen_controller_used[i] = snapshot.chosen_controller_used[i];
		}
	}

	set_controller_sprites_to_use();

	if (global.enable_option_for_pc)
	{
		if (window_rectangle_pending)
		{
			/* Capture Mode was turned off before the original fullscreen exit had
			   settled. Cancel the preset resize and return to fullscreen after the
			   remaining wait; the untouched windowed rectangle stays preserved. */
			var restore_wait_steps = 10;
			if (is_struct(global.capture_mode_window_transition)
			&& global.capture_mode_window_transition.stage == CAPTURE_MODE_WINDOW_STAGE.RESIZE)
			{
				restore_wait_steps = max(0, global.capture_mode_window_transition.steps_remaining);
			}

			global.capture_mode_window_transition =
			{
				stage: CAPTURE_MODE_WINDOW_STAGE.RESIZE,
				steps_remaining: restore_wait_steps,
				width: 0,
				height: 0,
				center_after_resize: false,
				x: 0,
				y: 0,
				fullscreen_after: snapshot.fullscreen_mode,
				fullscreen_exit_requested: true,
				resize_window: false,
				requires_capture_mode: false
			};
		}
		else
		{
			/* Restore size once, then restore position/fullscreen ten Steps later. */
			scr_capture_mode_queue_window_transition(
				snapshot.window_width,
				snapshot.window_height,
				false,
				snapshot.window_x,
				snapshot.window_y,
				snapshot.fullscreen_mode,
				false
			);
		}
	}

	/* Save while the snapshot is still active so an asynchronous fullscreen
	   restore writes the original mode rather than the temporary windowed mode. */
	scr_config_save();
	global.capture_mode = CAPTURE_MODE_PRESET.OFF;
	scr_capture_mode_refresh_music_gain();
	global.capture_mode_snapshot = undefined;
	return true;
}

/// @function scr_capture_mode_get_persistent_value(setting_name, runtime_value)
/* Prevents temporary capture overrides from leaking into config.ini. */
function scr_capture_mode_get_persistent_value(setting_name, runtime_value)
{
	scr_capture_mode_initialize();

	if (scr_capture_mode_is_active()
	&& variable_struct_exists(global.capture_mode_snapshot, setting_name))
	{
		return variable_struct_get(global.capture_mode_snapshot, setting_name);
	}

	return runtime_value;
}

/// @function scr_debug_toggle_screen()
/* Toggles the debug screen visibility based on keyboard/gamepad input */
function scr_debug_toggle_screen()
{
	if (scr_capture_mode_is_active())
	{
		global.debug_screen = false;
		return;
	}

	/* Use parentheses to group conditions for clarity */
	if (keyboard_check_pressed(vk_f3))
	|| (GM_build_type == "run"
	&& gamepad_button_check(global.player_slot[1], gp_stickl)
	&& gamepad_button_check_pressed(global.player_slot[1], gp_stickr))
	{
		global.debug_screen = !global.debug_screen;
		show_debug_message("[scr_debug_toggle_screen] 'debug screen' is set to: " + string(global.debug_screen));
	}

	//if (GM_build_type == "run"
	//&& keyboard_check_pressed(vk_f4))
	//{
	//    global.intentionally_crash = intentionally_crash; /* Will intentionally crash the game */
	//}
}

///////////////////////////////////////////////////////////////
// FPS Display
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_fps()
/* Draws the FPS and "real" FPS information on screen */
function scr_debug_draw_fps()
{
	if (scr_debug_should_draw_registry_item("fps")
	&& !scr_debug_should_use_compact_overlay())
	{
		scr_debug_draw_registry_item_lines("fps", 32, 64, fa_left, fa_middle);
	}
}


///////////////////////////////////////////////////////////////
// Instance Count Display
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_instance_count()
/* Draws a simple instance count on screen */
function scr_debug_draw_instance_count()
{
	if (scr_debug_should_draw_registry_item("instance_count")
	&& !scr_debug_should_use_compact_overlay())
	{
		scr_debug_draw_registry_item_lines("instance_count", 32, 96, fa_left, fa_middle);
	}
}

/// @function scr_debug_draw_all_instance_count()
/* Draws detailed instance counts for each object type. Iterates through a fixed range */
function scr_debug_draw_all_instance_count()
{
	if (scr_debug_should_draw_registry_item("all_instance_count")
	&& !scr_debug_should_use_compact_overlay())
	{
		scr_debug_draw_registry_item_lines("all_instance_count", 32, 128, fa_left, fa_top, global.default_text_size, 8);
	}
}


///////////////////////////////////////////////////////////////
// Controller Ports Handling
///////////////////////////////////////////////////////////////

/// @function scr_debug_handle_controller_ports()
/* Assigns gamepad indices to players based on platform and input */
function scr_debug_handle_controller_ports()
{
	/* Count how many players are active based on the "player_can_play" flags */
	global.playergame = 0;

	for (var i = 1; i <= global.max_players; i += 1)
	{
		if (global.player_can_play[i])
		{
			global.playergame += 1;
		}
	}

	/* Platform-specific handling for Switch */
	if (os_type == os_switch)
	{
		/* If gamepad 0 is "Handheld", then assign gamepad 0 as player 1 */
		if (gamepad_get_description(0) == "Handheld")
		{
			global.player_slot[0] = 1;

			/* Check which gamepad is active and assign it to player 1 */
			if (global.player_slot[1] != 0)
			{
				if (gamepad_button_check(0, gp_face1)
				|| gamepad_button_check(0, gp_face2)
				|| gamepad_button_check(0, gp_face3)
				|| gamepad_button_check(0, gp_face4)
				|| gamepad_button_check(0, gp_padd)
				|| gamepad_button_check(0, gp_padl)
				|| gamepad_button_check(0, gp_padr)
				|| gamepad_button_check(0, gp_padu)
				|| gamepad_button_check(0, gp_select)
				|| gamepad_button_check(0, gp_shoulderl)
				|| gamepad_button_check(0, gp_shoulderlb)
				|| gamepad_button_check(0, gp_shoulderr)
				|| gamepad_button_check(0, gp_shoulderrb)
				|| gamepad_button_check(0, gp_start)
				|| gamepad_button_check(0, gp_stickl)
				|| gamepad_button_check(0, gp_stickr)
				|| (gamepad_axis_value(0, gp_axislh) < -0.3)
				|| (gamepad_axis_value(0, gp_axislv) < -0.3)
				|| (gamepad_axis_value(0, gp_axisrh) < -0.3)
				|| (gamepad_axis_value(0, gp_axisrv) < -0.3)
				|| (gamepad_axis_value(0, gp_axislh) > 0.3)
				|| (gamepad_axis_value(0, gp_axislv) > 0.3)
				|| (gamepad_axis_value(0, gp_axisrh) > 0.3)
				|| (gamepad_axis_value(0, gp_axisrv) > 0.3))
				{
					global.player_slot[1] = 0;
				}
			}
			else
			if (global.player_slot[1] != 1)
			{
				if (gamepad_button_check(1, gp_face1)
				|| gamepad_button_check(1, gp_face2)
				|| gamepad_button_check(1, gp_face3)
				|| gamepad_button_check(1, gp_face4)
				|| gamepad_button_check(1, gp_padd)
				|| gamepad_button_check(1, gp_padl)
				|| gamepad_button_check(1, gp_padr)
				|| gamepad_button_check(1, gp_padu)
				|| gamepad_button_check(1, gp_select)
				|| gamepad_button_check(1, gp_shoulderl)
				|| gamepad_button_check(1, gp_shoulderlb)
				|| gamepad_button_check(1, gp_shoulderr)
				|| gamepad_button_check(1, gp_shoulderrb)
				|| gamepad_button_check(1, gp_start)
				|| gamepad_button_check(1, gp_stickl)
				|| gamepad_button_check(1, gp_stickr)
				|| (gamepad_axis_value(1, gp_axislh) < -0.3)
				|| (gamepad_axis_value(1, gp_axislv) < -0.3)
				|| (gamepad_axis_value(1, gp_axisrh) < -0.3)
				|| (gamepad_axis_value(1, gp_axisrv) < -0.3)
				|| (gamepad_axis_value(1, gp_axislh) > 0.3)
				|| (gamepad_axis_value(1, gp_axislv) > 0.3)
				|| (gamepad_axis_value(1, gp_axisrh) > 0.3)
				|| (gamepad_axis_value(1, gp_axisrv) > 0.3))
				{
					global.player_slot[1] = 1;
				}
			}
		}
	}
	else
	{
		/* For non-Switch platforms, assign gamepad indices sequentially */
		for (var i = 1; i <= global.max_players; i += 1)
		{
			global.player_slot[i] = i - 1;
		}
	}
}


///////////////////////////////////////////////////////////////
// Controller Connection/Disconnection Detection
///////////////////////////////////////////////////////////////

/// @function scr_debug_detect_controller_disconnections()
/* Checks for changes in gamepad connection status and updates debug info accordingly */
function scr_debug_detect_controller_disconnections()
{
	for (var i = 0; i < gamepad_get_device_count(); i++)
	{
		var connected = gamepad_is_connected(i);

		/* If a gamepad that was not connected is now connected... */
		if (!global.initial_gamepad_status[i]
		&& connected)
		{
			show_debug_message("Gamepad " + string(i) + " connected!");
			global.initial_gamepad_status[i] = true;

			if (!gamepad_is_connected(0)
			|| (gamepad_get_description(0) == "Handheld"))
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j;
				}
			}
			else
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j - 1;
				}
			}
		}
		/* If a gamepad that was connected is now disconnected... */
		else
		if (global.initial_gamepad_status[i]
		&& !connected)
		{
			show_debug_message("Gamepad " + string(i) + " disconnected!");
			global.initial_gamepad_status[i] = false;

			if (os_type == os_switch)
			{
				switch_controller_support_show();
			}

			var time_source = time_source_create(time_source_game, 2, time_source_units_frames, function()
			{
				set_controller_sprites_to_use();
			}, [], 1);
			time_source_start(time_source);

			if (!gamepad_is_connected(0)
			|| (gamepad_get_description(0) == "Handheld"))
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j;
				}
			}
			else
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j - 1;
				}
			}
		}
	}
}


///////////////////////////////////////////////////////////////
// Debug Screen Logic & Additional Debug Info
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_debug_logic()
/* Handles additional debug screen logic such as debug logging, mode toggling, */
/* mouse-based toggles, player info, and drawing extra debug sections */
function scr_debug_draw_debug_logic()
{
	if (global.debug_screen)
	{
		/* Hide on-screen controls when debug info is displayed */
		if (variable_instance_exists(self, "player_show_controls_alpha"))
		{
			for (var i = 1; i <= global.max_players; i += 1)
			{
				player_show_controls_alpha[i] = -10;
			}
		}

		#region /* Save debug info when F2 is pressed */
		if (keyboard_check_pressed(vk_f2))
		{
			scr_debug_save_manual_debug_info_dump();
		}
		#endregion /* Save debug info when F2 is pressed END */

		/* Toggle detailed/simplified debug mode when F4 is pressed */
		if (keyboard_check_pressed(vk_f4))
		{
			global.debug_detailed_mode = !global.debug_detailed_mode;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("config", "debug_detailed_mode", global.debug_detailed_mode);
			ini_close();
		}

		if (global.enable_option_for_pc
		&& keyboard_check_pressed(vk_f6))
		{
			scr_debug_unlock_debug_menu();
		}

		if (scr_debug_should_use_compact_overlay())
		{
			scr_debug_draw_compact_overlay();
			return;
		}

		var version_y = 32;
		var display_y = 32;
		var d3d11_y = 64;

		#region /* --- On-Screen Instructions (for PC) --- */
		if (global.enable_option_for_pc
		&& global.controls_used_for_navigation != "gamepad")
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);

			/* Determine the starting Y position for instructions */
			var instructions_y = 8;

			/* Draw the header for the Instructions section */
			instructions_y = scr_draw_debug_header("Instructions", display_get_gui_width() * 0.5 - 100, instructions_y);

				/* Only display the instructions if the section is expanded */
				var _inst_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Instructions") ? variable_struct_get(global.debug_collapsed_sections, "Instructions") : false;
				if (!_inst_collapsed)
			{
				/* Set larger text size if you prefer, multiply your default size */
				var instr_text_size = global.default_text_size * 1.0; /* Adjust as needed */
				draw_set_halign(fa_center);

				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Press the F2 key to save debug information",
					instr_text_size, c_black, c_white, 1);
				instructions_y += 25;

				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Press the F3 key to toggle debug screen",
					instr_text_size, c_black, c_white, 1);
				instructions_y += 25;

				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Press the F4 key to toggle debug detailed mode",
					instr_text_size, c_black, c_white, 1);
				instructions_y += 25;

				if (!global.debug_menu_unlocked)
				{
					scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
						"Press the F6 key to unlock the hidden Debug tab in Options",
						instr_text_size, c_black, c_yellow, 1);
					instructions_y += 25;
				}
				else
				{
					scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
						"Debug tab unlocked in Options for this session",
						instr_text_size, c_black, c_lime, 1);
					instructions_y += 25;
				}

				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Click on the debug headers to collapse sections",
					instr_text_size, c_black, c_white, 1);
			}
		}

		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_debug_draw_registry_item_lines("game_version", 32, version_y, fa_left, fa_middle);
		#endregion /* --- On-Screen Instructions (for PC) --- END */

		/* --- Top-right Display Info --- */
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_debug_draw_registry_item_lines("display_info", display_get_gui_width() - 32, display_y, fa_right, fa_middle, global.default_text_size, 25, max(280, floor(display_get_gui_width() * 0.42)));
		scr_debug_draw_registry_item_lines("video_adapter", display_get_gui_width() - 32, d3d11_y, fa_right, fa_middle, global.default_text_size, 25, max(280, floor(display_get_gui_width() * 0.42)));

		/* --- Current Room Info at Bottom --- */
		scr_debug_draw_registry_item_lines("room_info", display_get_gui_width() * 0.5, display_get_gui_height() - 32, fa_center, fa_middle, global.default_text_size, 25, display_get_gui_width() - 64);

		/* --- Optimized Debug Text Sections --- */
		scr_debug_draw_optimized_text();
	}
}

///////////////////////////////////////////////////////////////
// Optimized Debug Text Sections
///////////////////////////////////////////////////////////////

/// @function scr_get_debug_level_loading_mode()
/* Returns a readable label for the current level-loading mode. */
function scr_get_debug_level_loading_mode()
{
	if (variable_global_exists("create_level_from_template")
	&& global.create_level_from_template)
	{
		return "template_official";
	}

	if (scr_is_loading_official_level())
	{
		return "official";
	}

	return "custom";
}

/// @function scr_debug_reset_level_load_snapshot()
/* Reset the stored load-time snapshot so each level load starts from a clean state. */
function scr_debug_reset_level_load_snapshot()
{
	global.debug_level_load_snapshot =
	{
		capture_reason: "uninitialized",
		load_mode: "",
		select_level_index: "",
		level_name: "",
		selected_official_level_id: "",
		active_official_level_id: "",
		object_placement_path: "",
		object_placement_exists: false,
		json_entry_count: 0,
		loaded_placed_object_count: 0,
		loaded_player1_start_count: 0,
		loaded_level_end_count: 0,
		room_name: "",
		timestamp: ""
	};

	scr_debug_reset_level_load_monitor();

	return global.debug_level_load_snapshot;
}

/// @function scr_debug_should_monitor_level_load()
/* Returns true only for gameplay entries that should auto-validate level loading. */
function scr_debug_should_monitor_level_load()
{
	return room == rm_leveleditor
		&& ((variable_global_exists("character_select_in_this_menu")
		&& global.character_select_in_this_menu == "main_game")
		|| (variable_global_exists("actually_play_edited_level")
		&& global.actually_play_edited_level));
}

/// @function scr_debug_reset_level_load_monitor()
/* Reset per-load validation state while preserving the short-term duplicate suppression window. */
function scr_debug_reset_level_load_monitor()
{
	var previous_signature = "";
	var previous_time = -30000;

	if (variable_global_exists("debug_level_load_monitor")
	&& is_struct(global.debug_level_load_monitor))
	{
		if (variable_struct_exists(global.debug_level_load_monitor, "last_error_signature"))
		{
			previous_signature = string(global.debug_level_load_monitor.last_error_signature);
		}

		if (variable_struct_exists(global.debug_level_load_monitor, "last_error_time"))
		{
			previous_time = real(global.debug_level_load_monitor.last_error_time);
		}
	}

	var validation_active = scr_debug_should_monitor_level_load();

	global.debug_level_load_monitor =
	{
		session_id: scr_format_timestamp(date_current_datetime()) + "_" + string(current_time),
		validation_pending: validation_active,
		validated: false,
		auto_log_saved: false,
		runtime_spawn_calls: 0,
		runtime_instances_created_total: 0,
		last_error_signature: previous_signature,
		last_error_time: previous_time,
		validation_result: validation_active ? "PENDING" : "INACTIVE",
		validation_delay_frames: 10,
		failure_reason: "",
		failure_signature: "",
		warning_reason: ""
	};

	if (validation_active)
	{
		scr_log("INFO", "LEVEL.LOAD", "load_begin",
			"session_id=" + string(global.debug_level_load_monitor.session_id)
			+ ", mode=" + scr_get_debug_level_loading_mode()
			+ ", level_name=" + (variable_global_exists("level_name") ? string(global.level_name) : ""));
	}

	return global.debug_level_load_monitor;
}

/// @function scr_debug_get_level_load_monitor()
/* Return the current level-load validation monitor, creating it on demand. */
function scr_debug_get_level_load_monitor()
{
	if (!variable_global_exists("debug_level_load_monitor")
	|| !is_struct(global.debug_level_load_monitor))
	{
		return scr_debug_reset_level_load_monitor();
	}

	return global.debug_level_load_monitor;
}

/// @function scr_debug_record_runtime_spawn_pass(created_instance_count)
/* Record how many gameplay instances a single placeholder spawn pass created. */
function scr_debug_record_runtime_spawn_pass(created_instance_count)
{
	var monitor = scr_debug_get_level_load_monitor();

	if (!scr_debug_should_monitor_level_load())
	{
		return monitor;
	}

	monitor.runtime_spawn_calls += 1;
	monitor.runtime_instances_created_total += max(0, floor(real(created_instance_count)));
	global.debug_level_load_monitor = monitor;

	return monitor;
}

/// @function scr_debug_get_level_identifier(level_loading_debug)
/* Resolve the best available level identifier for debug output and log naming. */
function scr_debug_get_level_identifier(level_loading_debug)
{
	var level_identifier = string(level_loading_debug.active_official_level_id);

	if (level_identifier == "")
	{
		level_identifier = string(level_loading_debug.level_name);
	}

	if (level_identifier == "")
	{
		level_identifier = string(level_loading_debug.custom_folder_name);
	}

	if (level_identifier == "")
	{
		level_identifier = "unknown_level";
	}

	return level_identifier;
}

/// @function scr_debug_get_recent_level_load_history()
/* Return the newest-first in-memory level-load validation history. */
function scr_debug_get_recent_level_load_history()
{
	if (!variable_global_exists("debug_recent_level_load_history")
	|| !is_array(global.debug_recent_level_load_history))
	{
		global.debug_recent_level_load_history = [];
	}

	return global.debug_recent_level_load_history;
}

/// @function scr_debug_record_level_load_history_entry(level_loading_debug, monitor)
/* Record one finished validation result for later viewing in the debug menu. */
function scr_debug_record_level_load_history_entry(level_loading_debug, monitor)
{
	var previous_history = scr_debug_get_recent_level_load_history();
	var updated_history = [];
	var history_limit = 5;

	updated_history[0] =
	{
		timestamp: scr_format_timestamp(date_current_datetime()),
		load_mode: string(level_loading_debug.load_mode),
		level_identifier: scr_debug_get_level_identifier(level_loading_debug),
		validation_result: string(monitor.validation_result),
		validation_summary: scr_debug_format_validation_summary(monitor.validation_result),
		auto_log_saved: monitor.auto_log_saved,
		session_id: string(monitor.session_id)
	};

	var entries_to_copy = min(history_limit - 1, array_length(previous_history));

	for (var history_index = 0; history_index < entries_to_copy; history_index++)
	{
		updated_history[history_index + 1] = previous_history[history_index];
	}

	global.debug_recent_level_load_history = updated_history;

	return updated_history;
}

/// @function scr_debug_cache_latest_level_load_error_log(log_file_path, level_identifier, failure_reason, validation_result, session_id, timestamp)
/* Cache the newest automatic level-load error log so the menu can display it without repeated folder scans. */
function scr_debug_cache_latest_level_load_error_log(log_file_path, level_identifier = "", failure_reason = "", validation_result = "", session_id = "", timestamp = "")
{
	var cached_path = string(log_file_path);

	if (cached_path == "")
	{
		global.debug_latest_level_load_error_log = undefined;
		global.debug_level_load_error_log_scan_complete = true;
		return undefined;
	}

	var cached_level_identifier = string(level_identifier);
	if (cached_level_identifier == "")
	{
		cached_level_identifier = "unknown_level";
	}

	var cached_timestamp = string(timestamp);
	if (cached_timestamp == "")
	{
		cached_timestamp = scr_format_timestamp(date_current_datetime());
	}

	global.debug_latest_level_load_error_log =
	{
		path: cached_path,
		display_path: scr_censor_game_save_id_for_display(cached_path),
		level_identifier: cached_level_identifier,
		failure_reason: string(failure_reason),
		validation_result: string(validation_result),
		session_id: string(session_id),
		saved_at: cached_timestamp
	};

	global.debug_level_load_error_log_scan_complete = true;

	return global.debug_latest_level_load_error_log;
}

/// @function scr_debug_read_level_load_error_log_metadata(log_file_path)
/* Read the minimum metadata needed to summarize a saved automatic level-load error log in the debug menu. */
function scr_debug_read_level_load_error_log_metadata(log_file_path)
{
	var cached_path = string(log_file_path);

	if (cached_path == ""
	|| !file_exists(cached_path))
	{
		return undefined;
	}

	ini_open(cached_path);

	var cached_timestamp = ini_read_string("Log Metadata", "Timestamp", "");
	var level_identifier = ini_read_string("Level Loading", "active_official_level_id", "");
	if (level_identifier == "")
	{
		level_identifier = ini_read_string("Level Loading", "global.level_name", "");
	}
	if (level_identifier == "")
	{
		level_identifier = ini_read_string("Level Loading", "custom_folder_name", "");
	}
	if (level_identifier == "")
	{
		level_identifier = "unknown_level";
	}

	var failure_reason = ini_read_string("Auto Level Load Error", "failure_reason", "");
	var validation_result = ini_read_string("Auto Level Load Error", "validation_result", "");
	if (validation_result == "")
	{
		validation_result = ini_read_string("Level Loading", "validation_result", "");
	}

	var session_id = ini_read_string("Auto Level Load Error", "session_id", "");
	if (session_id == "")
	{
		session_id = ini_read_string("Level Loading", "monitor_session_id", "");
	}

	ini_close();

	return scr_debug_cache_latest_level_load_error_log(cached_path, level_identifier, failure_reason, validation_result, session_id, cached_timestamp);
}

/// @function scr_debug_get_latest_level_load_error_log(force_refresh)
/* Return cached automatic level-load error metadata, performing a single fallback folder scan when needed. */
function scr_debug_get_latest_level_load_error_log(force_refresh = false)
{
	if (force_refresh)
	{
		global.debug_latest_level_load_error_log = undefined;
		global.debug_level_load_error_log_scan_complete = false;
	}

	if (variable_global_exists("debug_latest_level_load_error_log")
	&& is_struct(global.debug_latest_level_load_error_log)
	&& string(global.debug_latest_level_load_error_log.path) != "")
	{
		return global.debug_latest_level_load_error_log;
	}

	if (variable_global_exists("debug_level_load_error_log_scan_complete")
	&& global.debug_level_load_error_log_scan_complete)
	{
		return undefined;
	}

	global.debug_level_load_error_log_scan_complete = true;

	var logs_folder = game_save_id + "debug_logs/level_load_error/";
	if (!directory_exists(logs_folder))
	{
		return undefined;
	}

	var latest_log_name = "";
	var latest_log_path = "";
	var found_file = file_find_first(logs_folder + "*.ini", 0);

	if (found_file != "")
	{
		while (found_file != "")
		{
			var candidate_name = string(found_file);
			var candidate_path = logs_folder + candidate_name;

			if (file_exists(candidate_path)
			&& (latest_log_name == ""
			|| candidate_name > latest_log_name))
			{
				latest_log_name = candidate_name;
				latest_log_path = candidate_path;
			}

			found_file = file_find_next();
		}

		file_find_close();
	}

	if (latest_log_path == "")
	{
		return undefined;
	}

	return scr_debug_read_level_load_error_log_metadata(latest_log_path);
}

/// @function scr_debug_save_manual_debug_info_dump()
/* Save a manual debug dump to the dedicated manual_debug_info folder. */
function scr_debug_get_manual_debug_info_folder(create_if_missing = false)
{
	var logs_root = game_save_id + "debug_logs/";
	var logs_folder = logs_root + "manual_debug_info/";

	if (create_if_missing
	&& !directory_exists(logs_root))
	{
		directory_create(logs_root);
	}

	if (create_if_missing
	&& !directory_exists(logs_folder))
	{
		directory_create(logs_folder);
	}

	return logs_folder;
}

/// @function scr_debug_open_manual_debug_info_folder()
/* Open the folder that stores manual debug dumps, creating it if needed first. */
function scr_debug_open_manual_debug_info_folder()
{
	var logs_folder = scr_debug_get_manual_debug_info_folder(true);
	scr_open_folder(logs_folder);

	return logs_folder;
}

/// @function scr_debug_save_manual_debug_info_dump()
/* Save a manual debug dump to the dedicated manual_debug_info folder. */
function scr_debug_save_manual_debug_info_dump()
{
	var logs_folder = scr_debug_get_manual_debug_info_folder(true);
	var log_timestamp = scr_format_timestamp(date_current_datetime());

	var log_file_path = logs_folder + "debug_info-" + string(global.game_name) + "_v" + string(scr_get_build_date()) + "_" + log_timestamp + "_" + string(scr_os_type_to_string(true, true)) + ".ini";

	ini_open(log_file_path);
	scr_write_debug_info();
	ini_close();

	global.debug_latest_manual_debug_dump_path = log_file_path;
	global.debug_latest_manual_debug_dump_saved_at = log_timestamp;

	show_debug_message("Debug information saved to: " + scr_censor_game_save_id_for_display(log_file_path));

	return log_file_path;
}

/// @function scr_debug_join_string_array(string_array)
/* Join a flat array of strings with "; " for compact debug output. */
function scr_debug_join_string_array(string_array)
{
	var output = "";

	for (var i = 0; i < array_length(string_array); i++)
	{
		if (i > 0)
		{
			output += "; ";
		}

		output += string(string_array[i]);
	}

	return output;
}

/// @function scr_debug_build_level_load_failure_signature(level_loading_debug, failure_reason)
/* Build a stable signature so rapid retries suppress duplicate auto-log files. */
function scr_debug_build_level_load_failure_signature(level_loading_debug, failure_reason)
{
	var level_identifier = scr_debug_get_level_identifier(level_loading_debug);

	return string(level_loading_debug.load_mode)
		+ "|"
		+ level_identifier
		+ "|"
		+ string(level_loading_debug.selected_official_level_id)
		+ "|"
		+ string(level_loading_debug.active_official_level_id)
		+ "|"
		+ string(failure_reason);
}

/// @function scr_debug_save_level_load_error_log(failure_reason, failure_signature)
/* Save a one-shot automatic level-load error dump without affecting normal gameplay flow. */
function scr_debug_save_level_load_error_log(failure_reason, failure_signature)
{
	var monitor = scr_debug_get_level_load_monitor();
	var level_loading_debug = scr_get_level_loading_debug_data();
	var logs_root = game_save_id + "debug_logs/";
	var logs_folder = logs_root + "level_load_error/";
	var level_identifier = scr_debug_get_level_identifier(level_loading_debug);
	var log_timestamp = scr_format_timestamp(date_current_datetime());

	if (!directory_exists(logs_root))
	{
		directory_create(logs_root);
	}

	if (!directory_exists(logs_folder))
	{
		directory_create(logs_folder);
	}

	var log_file_path = logs_folder
		+ "level_load_error_"
		+ log_timestamp
		+ "_"
		+ scr_sanitize_filename(level_loading_debug.load_mode, 32)
		+ "_"
		+ scr_sanitize_filename(level_identifier, 64)
		+ ".ini";

	global.debug_auto_level_load_log_context =
	{
		auto_generated: true,
		session_id: monitor.session_id,
		failure_reason: string(failure_reason),
		failure_signature: string(failure_signature),
		validation_delay_frames: monitor.validation_delay_frames
	};

	ini_open(log_file_path);
	scr_write_debug_info();
	ini_close();

	scr_debug_cache_latest_level_load_error_log(log_file_path, level_identifier, failure_reason, monitor.validation_result, monitor.session_id, log_timestamp);

	global.debug_auto_level_load_log_context = undefined;

	scr_log("ERROR", "LEVEL.LOAD", "auto_log_saved",
		"session_id=" + string(monitor.session_id)
		+ ", path="
		+ scr_censor_game_save_id_for_display(log_file_path));

	return log_file_path;
}

/// @function scr_debug_validate_level_load_after_stabilization(validation_delay_frames)
/* Run a one-shot conservative validation pass after gameplay objects have had time to spawn. */
function scr_debug_validate_level_load_after_stabilization(validation_delay_frames = 10)
{
	var monitor = scr_debug_get_level_load_monitor();

	monitor.validation_delay_frames = max(0, floor(real(validation_delay_frames)));

	if (!scr_debug_should_monitor_level_load())
	{
		monitor.validation_pending = false;
		monitor.validation_result = "INACTIVE";
		global.debug_level_load_monitor = monitor;
		return false;
	}

	if (monitor.validated)
	{
		global.debug_level_load_monitor = monitor;
		return string_pos(string(monitor.validation_result), "FAILED") == 1;
	}

	monitor.validation_pending = false;
	monitor.validated = true;

	var level_loading_debug = scr_get_level_loading_debug_data();
	var failure_messages = [];
	var warning_messages = [];

	if (level_loading_debug.expect_level_files
	&& !level_loading_debug.level_information_exists)
	{
		failure_messages[array_length(failure_messages)] = "missing level_information.ini";
	}

	if (level_loading_debug.expect_level_files
	&& !level_loading_debug.object_placement_exists)
	{
		failure_messages[array_length(failure_messages)] = "missing object_placement_all.json";
	}

	if (level_loading_debug.expect_level_files
	&& !level_loading_debug.background_path_exists)
	{
		failure_messages[array_length(failure_messages)] = "missing background directory";
	}

	if (level_loading_debug.expect_level_files
	&& level_loading_debug.object_placement_exists
	&& level_loading_debug.loaded_placed_object_count <= 0)
	{
		failure_messages[array_length(failure_messages)] = "0 objects loaded from object_placement_all.json";
	}

	if (level_loading_debug.expect_level_files
	&& level_loading_debug.loaded_player1_start_count <= 0)
	{
		failure_messages[array_length(failure_messages)] = "missing player1 start placeholder at load time";
	}

	if (level_loading_debug.expect_level_files
	&& level_loading_debug.loaded_level_end_count <= 0)
	{
		failure_messages[array_length(failure_messages)] = "missing level end placeholder at load time";
	}

	if (instance_number(obj_player) <= 0)
	{
		failure_messages[array_length(failure_messages)] = "no player instance after stabilization";
	}

	if (level_loading_debug.loaded_placed_object_count >= 25
	&& monitor.runtime_instances_created_total <= 0)
	{
		failure_messages[array_length(failure_messages)] = "25+ placed objects loaded but runtime spawn count stayed at 0";
	}

	if (string(level_loading_debug.selected_official_level_id) != ""
	&& string(level_loading_debug.active_official_level_id) != ""
	&& string(level_loading_debug.selected_official_level_id) != string(level_loading_debug.active_official_level_id))
	{
		warning_messages[array_length(warning_messages)] = "selected official ID and active official ID differ after stabilization";
	}

	if (level_loading_debug.loaded_placed_object_count >= 1
	&& level_loading_debug.loaded_placed_object_count <= 24
	&& monitor.runtime_instances_created_total <= 0)
	{
		warning_messages[array_length(warning_messages)] = "1-24 placed objects loaded but runtime spawn count stayed at 0";
	}

	var failure_reason = scr_debug_join_string_array(failure_messages);
	var warning_reason = scr_debug_join_string_array(warning_messages);

	monitor.failure_reason = failure_reason;
	monitor.warning_reason = warning_reason;
	monitor.failure_signature = "";

	var log_prefix = "session_id=" + string(monitor.session_id)
		+ ", selected_official_level_id=" + string(level_loading_debug.selected_official_level_id)
		+ ", active_official_level_id=" + string(level_loading_debug.active_official_level_id)
		+ ", loaded_placed_object_count=" + string(level_loading_debug.loaded_placed_object_count)
		+ ", runtime_spawn_calls=" + string(monitor.runtime_spawn_calls)
		+ ", runtime_instances_created_total=" + string(monitor.runtime_instances_created_total);

	if (array_length(failure_messages) > 0)
	{
		var failure_signature = scr_debug_build_level_load_failure_signature(level_loading_debug, failure_reason);
		var duplicate_error = false;

		monitor.failure_signature = failure_signature;
		monitor.validation_result = "FAILED: " + failure_reason;

		scr_log("ERROR", "LEVEL.LOAD", "validation_failed",
			log_prefix + ", reason=" + failure_reason);

		if (string(monitor.last_error_signature) == failure_signature
		&& (current_time - real(monitor.last_error_time)) < 30000)
		{
			duplicate_error = true;
		}

		if (duplicate_error)
		{
			scr_log("WARN", "LEVEL.LOAD", "duplicate_error_suppressed",
				"session_id=" + string(monitor.session_id)
				+ ", failure_signature="
				+ failure_signature);
		}
		else
		if (!monitor.auto_log_saved)
		{
			scr_debug_save_level_load_error_log(failure_reason, failure_signature);
			monitor.auto_log_saved = true;
			monitor.last_error_signature = failure_signature;
			monitor.last_error_time = current_time;
		}
	}
	else
	if (array_length(warning_messages) > 0)
	{
		monitor.validation_result = "WARNING: " + warning_reason;

		scr_log("WARN", "LEVEL.LOAD", "validation_warning",
			log_prefix + ", reason=" + warning_reason);
	}
	else
	{
		monitor.validation_result = "OK";

		scr_log("INFO", "LEVEL.LOAD", "validation_ok",
			log_prefix + ", result=OK");
	}

	global.debug_level_load_monitor = monitor;
	scr_debug_record_level_load_history_entry(level_loading_debug, monitor);

	return array_length(failure_messages) > 0;
}

/// @function scr_debug_get_level_load_snapshot()
/* Return the current snapshot, lazily creating it when needed. */
function scr_debug_get_level_load_snapshot()
{
	if (!variable_global_exists("debug_level_load_snapshot")
	|| !is_struct(global.debug_level_load_snapshot))
	{
		return scr_debug_reset_level_load_snapshot();
	}

	return global.debug_level_load_snapshot;
}

/// @function scr_debug_refresh_level_load_snapshot()
/* Refresh marker counts after room instances finish creating, without losing the earlier JSON snapshot. */
function scr_debug_refresh_level_load_snapshot()
{
	var snapshot = scr_debug_get_level_load_snapshot();

	snapshot.load_mode = scr_get_debug_level_loading_mode();
	snapshot.select_level_index = variable_global_exists("select_level_index") ? string(global.select_level_index) : "";
	snapshot.level_name = variable_global_exists("level_name") ? string(global.level_name) : "";
	snapshot.selected_official_level_id = scr_get_selected_official_level_id();
	snapshot.active_official_level_id = scr_get_active_official_level_id();
	snapshot.loaded_player1_start_count = instance_number(obj_level_player1_start);
	snapshot.loaded_level_end_count = instance_number(obj_level_end);
	snapshot.room_name = room_get_name(room);
	snapshot.timestamp = scr_format_timestamp(date_current_datetime());

	global.debug_level_load_snapshot = snapshot;

	return snapshot;
}

/// @function scr_debug_capture_level_load_snapshot(capture_reason, object_placement_path, object_placement_exists, json_entry_count, loaded_placed_object_count)
/* Capture the load-time object counts before gameplay cleanup or deactivation changes what is live on screen. */
function scr_debug_capture_level_load_snapshot(capture_reason = "", object_placement_path = undefined, object_placement_exists = undefined, json_entry_count = undefined, loaded_placed_object_count = undefined)
{
	var snapshot = scr_debug_get_level_load_snapshot();
	var monitor = scr_debug_get_level_load_monitor();

	if (string(capture_reason) != "")
	{
		snapshot.capture_reason = string(capture_reason);
	}

	if (!is_undefined(object_placement_path))
	{
		snapshot.object_placement_path = string(object_placement_path);
	}

	if (!is_undefined(object_placement_exists))
	{
		snapshot.object_placement_exists = object_placement_exists;
	}

	if (!is_undefined(json_entry_count))
	{
		snapshot.json_entry_count = max(0, floor(real(json_entry_count)));
	}

	if (!is_undefined(loaded_placed_object_count))
	{
		snapshot.loaded_placed_object_count = max(0, floor(real(loaded_placed_object_count)));
	}

	global.debug_level_load_snapshot = snapshot;

	if (scr_debug_should_monitor_level_load())
	{
		var capture_details = "session_id=" + string(monitor.session_id)
			+ ", object_placement_exists=" + string(snapshot.object_placement_exists)
			+ ", json_entry_count=" + string(snapshot.json_entry_count)
			+ ", loaded_placed_object_count=" + string(snapshot.loaded_placed_object_count)
			+ ", object_placement_path="
			+ scr_censor_game_save_id_for_display(snapshot.object_placement_path);

		switch (string(snapshot.capture_reason))
		{
			case "json_loaded":
				scr_log("INFO", "LEVEL.LOAD", "json_loaded", capture_details);
				break;

			case "json_missing":
				scr_log("ERROR", "LEVEL.LOAD", "json_missing", capture_details);
				break;
		}
	}

	return scr_debug_refresh_level_load_snapshot();
}

/// @function scr_get_level_loading_debug_data()
/* Collects the current level-loading state and resolved file paths for the debug screen/logs. */
function scr_get_level_loading_debug_data()
{
	var is_official_level = scr_is_loading_official_level();
	var custom_folder_name = scr_get_custom_level_folder_name();
	var level_information_path = "";
	var object_placement_path = "";
	var background_path = "";
	var load_snapshot = scr_debug_get_level_load_snapshot();
	var load_monitor = scr_debug_get_level_load_monitor();
	var expect_level_files = instance_exists(obj_camera);

	if (is_official_level)
	{
		level_information_path = scr_get_official_level_file_path("", "data", "level_information.ini");
		object_placement_path = scr_get_official_level_file_path("", "data", "object_placement_all.json");
		background_path = scr_get_official_level_directory("", "background");
	}
	else
	{
		level_information_path = global.use_temp_or_working + "custom_levels/" + custom_folder_name + "/data/level_information.ini";
		object_placement_path = global.use_temp_or_working + "custom_levels/" + custom_folder_name + "/data/object_placement_all.json";
		background_path = global.use_temp_or_working + "custom_levels/" + custom_folder_name + "/background/";
	}

	var after_goal_value = "n/a";
	var level_information_exists = file_exists(level_information_path);
	var object_placement_exists = file_exists(object_placement_path);
	var background_path_exists = directory_exists(background_path);
	var load_snapshot_status = "OK";

	if (instance_exists(obj_camera)
	&& variable_instance_exists(obj_camera, "after_goal_go_to_this_level"))
	{
		after_goal_value = string(obj_camera.after_goal_go_to_this_level);
	}

	if (expect_level_files
	&& (!level_information_exists
	|| !object_placement_exists
	|| !background_path_exists))
	{
		load_snapshot_status = "FAILED: missing files";
	}
	else
	if (expect_level_files
	&& object_placement_exists
	&& load_snapshot.loaded_placed_object_count <= 0)
	{
		load_snapshot_status = "FAILED: 0 objects loaded";
	}

	return {
		load_mode: scr_get_debug_level_loading_mode(),
		character_select_menu: variable_global_exists("character_select_in_this_menu") ? string(global.character_select_in_this_menu) : "",
		create_level_from_template: variable_global_exists("create_level_from_template") ? string(global.create_level_from_template) : "",
		select_level_index: variable_global_exists("select_level_index") ? string(global.select_level_index) : "",
		level_name: variable_global_exists("level_name") ? string(global.level_name) : "",
		level_folder_name: variable_global_exists("level_folder_name") ? string(global.level_folder_name) : "",
		level_description: variable_global_exists("level_description") ? string(global.level_description) : "",
		selected_official_level_id: scr_get_selected_official_level_id(),
		active_official_level_id: scr_get_active_official_level_id(),
		custom_folder_name: custom_folder_name,
		level_information_path: level_information_path,
		level_information_exists: level_information_exists,
		object_placement_path: object_placement_path,
		object_placement_exists: object_placement_exists,
		background_path: background_path,
		background_path_exists: background_path_exists,
		path_to_use: variable_global_exists("path_to_use") ? string(global.path_to_use) : "",
		load_snapshot_reason: load_snapshot.capture_reason,
		load_snapshot_status: load_snapshot_status,
		load_snapshot_timestamp: load_snapshot.timestamp,
		load_snapshot_json_entry_count: load_snapshot.json_entry_count,
		monitor_session_id: load_monitor.session_id,
		monitor_active: scr_debug_should_monitor_level_load(),
		validation_pending: load_monitor.validation_pending,
		validation_result: load_monitor.validation_result,
		validation_delay_frames: load_monitor.validation_delay_frames,
		auto_log_saved: load_monitor.auto_log_saved,
		runtime_spawn_calls: load_monitor.runtime_spawn_calls,
		runtime_instances_created_total: load_monitor.runtime_instances_created_total,
		failure_reason: load_monitor.failure_reason,
		failure_signature: load_monitor.failure_signature,
		warning_reason: load_monitor.warning_reason,
		loaded_player1_start_count: load_snapshot.loaded_player1_start_count,
		current_live_player1_start_count: instance_number(obj_level_player1_start),
		loaded_level_end_count: load_snapshot.loaded_level_end_count,
		current_live_level_end_count: instance_number(obj_level_end),
		loaded_placed_object_count: load_snapshot.loaded_placed_object_count,
		current_live_placed_object_count: instance_number(obj_leveleditor_placed_object),
		player1_start_count: instance_number(obj_level_player1_start),
		level_end_count: instance_number(obj_level_end),
		placed_object_count: instance_number(obj_leveleditor_placed_object),
		after_goal_go_to_this_level: after_goal_value,
		expect_level_files: expect_level_files
	};
}

/// @function scr_debug_format_resolved_path_summary(resolved_path, path_exists)
/* Formats a resolved path as a concise "found/missing" summary for on-screen debug text. */
function scr_debug_format_resolved_path_summary(resolved_path, path_exists)
{
	var display_path = scr_censor_game_save_id_for_display(string(resolved_path));

	if (display_path == "")
	{
		return "n/a";
	}

	if (path_exists)
	{
		return "found - " + display_path;
	}

	return "missing - expected at " + display_path;
}

/// @function scr_debug_format_snapshot_summary(load_snapshot_status, load_snapshot_reason)
/* Combines the high-level snapshot status and capture reason into one readable line. */
function scr_debug_format_snapshot_summary(load_snapshot_status, load_snapshot_reason)
{
	var snapshot_status = string(load_snapshot_status);
	var snapshot_reason = string(load_snapshot_reason);

	if (snapshot_reason == "")
	{
		return snapshot_status;
	}

	return snapshot_status + " - " + snapshot_reason;
}

/// @function scr_debug_format_validation_summary(validation_result)
/* Convert internal validation states into direct, human-readable on-screen wording. */
function scr_debug_format_validation_summary(validation_result)
{
	var summary = string(validation_result);

	if (summary == "OK")
	{
		return "PASS";
	}

	if (summary == "PENDING")
	{
		return "WAITING FOR POST-LOAD CHECK";
	}

	if (summary == "INACTIVE")
	{
		return "NOT ACTIVE IN THIS MODE";
	}

	if (string_pos(summary, "FAILED: ") == 1)
	{
		return "FAIL: " + string_delete(summary, 1, string_length("FAILED: "));
	}

	return summary;
}

/// @function scr_debug_format_loaded_live_summary(loaded_count, live_count)
/* Shows the load-time snapshot and the current live count in one compact string. */
function scr_debug_format_loaded_live_summary(loaded_count, live_count)
{
	return "loaded " + string(loaded_count) + ", still present now " + string(live_count);
}

/// @function scr_debug_format_runtime_spawn_pass_summary(spawn_pass_count)
/* Describe how many placed-object placeholders finished their spawn pass. */
function scr_debug_format_runtime_spawn_pass_summary(spawn_pass_count)
{
	return string(spawn_pass_count) + " placed-object placeholders processed";
}

/// @function scr_debug_format_runtime_instances_created_summary(created_count)
/* Describe how many gameplay instances were created from placed-object placeholders. */
function scr_debug_format_runtime_instances_created_summary(created_count)
{
	return string(created_count) + " created from placed-object placeholders";
}

/// @function scr_debug_format_latest_level_load_error_summary(level_load_error_log)
/* Build the one-line summary shown for the newest saved automatic level-load error log. */
function scr_debug_format_latest_level_load_error_summary(level_load_error_log)
{
	if (!is_struct(level_load_error_log))
	{
		return "";
	}

	return string(level_load_error_log.saved_at)
		+ " - "
		+ string(level_load_error_log.level_identifier)
		+ " - "
		+ string(level_load_error_log.display_path);
}

/// @function scr_debug_format_recent_level_load_history_entry(history_entry)
/* Build the one-line summary shown for each recent validation result in the debug menu. */
function scr_debug_format_recent_level_load_history_entry(history_entry)
{
	if (!is_struct(history_entry))
	{
		return "";
	}

	return string(history_entry.timestamp)
		+ " | "
		+ string(history_entry.load_mode)
		+ " | "
		+ string(history_entry.level_identifier)
		+ " | "
		+ string(history_entry.validation_summary);
}

/// @function scr_debug_is_integer_string(value_to_check)
/* Returns true when the supplied string is a signed integer. */
function scr_debug_is_integer_string(value_to_check)
{
	var value_string = string(value_to_check);
	var string_length_value = string_length(value_string);

	if (string_length_value <= 0)
	{
		return false;
	}

	var first_index = 1;

	if (string_copy(value_string, 1, 1) == "-")
	{
		if (string_length_value == 1)
		{
			return false;
		}

		first_index = 2;
	}

	for (var i = first_index; i <= string_length_value; i++)
	{
		var character = string_copy(value_string, i, 1);

		if (character < "0"
		|| character > "9")
		{
			return false;
		}
	}

	return true;
}

/// @function scr_debug_format_level_folder_display(is_official_level, tracked_level_folder_name, custom_folder_name)
/* Formats the folder line so official loads do not look like missing custom-folder data. */
function scr_debug_format_level_folder_display(is_official_level, tracked_level_folder_name, custom_folder_name)
{
	var tracked_folder_name = string(tracked_level_folder_name);

	if (tracked_folder_name != "")
	{
		return tracked_folder_name;
	}

	if (!is_official_level)
	{
		var active_custom_folder_name = string(custom_folder_name);

		if (active_custom_folder_name != "")
		{
			return active_custom_folder_name;
		}
	}

	return "n/a";
}

/// @function scr_debug_format_after_goal_display(after_goal_value)
/* Converts sentinel after-goal values into readable text for screenshots and reports. */
function scr_debug_format_after_goal_display(after_goal_value)
{
	var display_value = string(after_goal_value);

	if (display_value == ""
	|| display_value == "n/a")
	{
		return "n/a";
	}

	if (!scr_debug_is_integer_string(display_value))
	{
		return display_value;
	}

	var numeric_value = real(display_value);

	if (numeric_value == noone)
	{
		return "none (" + display_value + ")";
	}

	if (numeric_value >= 0)
	{
		return "level index " + display_value;
	}

	return "sentinel (" + display_value + ")";
}

/// @function scr_debug_draw_optimized_text()
/* Draws a series of collapsible debug text sections. System, Player, Menu, Gamepad, and Switch info */
function scr_debug_draw_optimized_text()
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var debug_text_y = 170;
	var section_spacing = 30;
	var system_items = ["current_datetime", "current_level_clear_rate", "doing_clear_check_character", "doing_clear_check_level"];
	var player_items = ["player_position", "player_speed", "player_image_index", "player_image_speed", "player_on_ground", "player_cutscene_time", "player_can_play", "player_slots", "controller_slot"];
	var menu_items = ["current_menu", "level_editor_menu", "in_character_select_menu", "in_settings_menu", "in_online_download_list_menu", "can_navigate_settings_sidebar", "controls_used_for_navigation", "scrolling_menu_with_mousewheel", "menu_navigation_speed", "menu_cursor_y_position", "menu_y_offset", "menu_y_offset_real", "menu_delay", "menu_joystick_delay"];
	var online_items = ["online_token_status", "thumbnail_sprite", "info_queue_index", "content_type", "online_content_data_level", "online_content_data_character", "selected_online_download_index", "automatically_play_downloaded_level"];

	#region /* Section 1: System Information */
	if (scr_debug_any_visible_registry_lines(system_items))
	{
		debug_text_y = scr_draw_debug_header("System Information", 32, debug_text_y);

		var _sys_collapsed = variable_struct_exists(global.debug_collapsed_sections, "System Information") ? variable_struct_get(global.debug_collapsed_sections, "System Information") : false;
		if (!_sys_collapsed)
		{
			for (var system_index = 0; system_index < array_length(system_items); system_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(system_items[system_index], 32, debug_text_y);
			}
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 1: System Information END */

	#region /* Section 2: Level Loading */
	if (scr_debug_item_has_overlay_lines("level_loading_summary"))
	{
		debug_text_y = scr_draw_debug_header("Level Loading", 32, debug_text_y);

		var _level_loading_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Level Loading") ? variable_struct_get(global.debug_collapsed_sections, "Level Loading") : false;
		if (!_level_loading_collapsed)
		{
			debug_text_y = scr_debug_draw_registry_item_lines("level_loading_summary", 32, debug_text_y);
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 2: Level Loading END */

	#region /* Section 3: Player Information */
	if (instance_exists(obj_camera)
	&& scr_debug_any_visible_registry_lines(player_items))
	{
		debug_text_y = scr_draw_debug_header("Player Information", 32, debug_text_y);

		var _player_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Player Information") ? variable_struct_get(global.debug_collapsed_sections, "Player Information") : false;
		if (!_player_collapsed)
		{
			for (var player_item_index = 0; player_item_index < array_length(player_items); player_item_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(player_items[player_item_index], 32, debug_text_y);
			}
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 3: Player Information END */

	#region /* Section 4: Menu Information */
	if (scr_debug_any_visible_registry_lines(menu_items))
	{
		debug_text_y = scr_draw_debug_header("Menu Information", 32, debug_text_y);

		var _menu_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Menu Information") ? variable_struct_get(global.debug_collapsed_sections, "Menu Information") : false;
		if (!_menu_collapsed)
		{
			for (var menu_item_index = 0; menu_item_index < array_length(menu_items); menu_item_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(menu_items[menu_item_index], 32, debug_text_y);
			}
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 4: Menu Information END */

	#region /* Section 5: Gamepad Information */
	if (scr_debug_item_has_overlay_lines("gamepad_descriptions"))
	{
		debug_text_y = scr_draw_debug_header("Gamepad Information", 32, debug_text_y);

		var _gamepad_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Gamepad Information") ? variable_struct_get(global.debug_collapsed_sections, "Gamepad Information") : false;
		if (!_gamepad_collapsed)
		{
			debug_text_y = scr_debug_draw_registry_item_lines("gamepad_descriptions", 32, debug_text_y);
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 5: Gamepad Information END */

	#region /* Section 6: Switch Information (only for Switch) */
	if (os_type == os_switch
	&& scr_debug_item_has_overlay_lines("switch_account_status"))
	{
		debug_text_y = scr_draw_debug_header("Switch Information", 32, debug_text_y);

		var _switch_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Switch Information") ? variable_struct_get(global.debug_collapsed_sections, "Switch Information") : false;
		if (!_switch_collapsed)
		{
			debug_text_y = scr_debug_draw_registry_item_lines("switch_account_status", 32, debug_text_y);
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 6: Switch Information (only for Switch) END */

	#region /* Section 7: Online Download Info */
	if (scr_debug_any_visible_registry_lines(online_items))
	{
		debug_text_y = scr_draw_debug_header("Online Download Info", 32, debug_text_y);

		var _odl_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Online Download Info") ? variable_struct_get(global.debug_collapsed_sections, "Online Download Info") : false;
		if (!_odl_collapsed)
		{
			for (var online_item_index = 0; online_item_index < array_length(online_items); online_item_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(online_items[online_item_index], 32, debug_text_y);
			}
		}
	}
	#endregion /* Section 7: Online Download Info END */
}

/// @function scr_draw_debug_header(section_name, xx, yy)
/* Draws a clickable header for a debug section that can be collapsed/expanded */
function scr_draw_debug_header(section_name, xx, yy)
{
	var line_spacing = 25;
	var debug_header_outline_color = c_black;
	var debug_header_text_color = c_yellow;

	if (global.controls_used_for_navigation == "mouse"
	&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy, xx + 400, yy + line_spacing + 10))
	{
		/* Highlight the header when the mouse is over it */
		debug_header_outline_color = c_yellow;
		debug_header_text_color = c_black;

		if (mouse_check_button_released(mb_left))
		{
				/* Toggle collapse state for this section using struct accessors */
				var _prev = variable_struct_exists(global.debug_collapsed_sections, section_name) ? variable_struct_get(global.debug_collapsed_sections, section_name) : false;
				var _cur = !_prev;
				variable_struct_set(global.debug_collapsed_sections, section_name, _cur);

				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("debug_collapsed_sections", string(section_name), _cur);
				ini_close();
			}
		}

		var _isCollapsed = variable_struct_exists(global.debug_collapsed_sections, string(section_name)) ? variable_struct_get(global.debug_collapsed_sections, string(section_name)) : false;
		var debug_header_icon = (!_isCollapsed) ? "[+]" : "[-]";
		scr_draw_text_outlined(xx, yy, section_name + " " + string(debug_header_icon), global.default_text_size, debug_header_outline_color, debug_header_text_color);
	return yy + line_spacing;
}

/// @function scr_get_player_positions()
/* Returns an array of player positions from obj_camera, if available */
function scr_get_player_positions()
{
	var positions = [];

	if (instance_exists(obj_camera)
	&& is_array(obj_camera.player))
	{
		for (var i = 1; i <= global.max_players; i++)
		{
			if (array_length(obj_camera.player) > i
			&& instance_exists(obj_camera.player[i])
			&& obj_camera.player[i] > 0)
			{
				array_push(positions,
				{
					player_pos_id: i,
					player_pos_x: obj_camera.player[i].x,
					player_pos_y: obj_camera.player[i].y,
					player_speed: obj_camera.player[i].speed,
					player_image_index: obj_camera.player[i].image_index,
					player_image_speed: obj_camera.player[i].image_speed,
					player_on_ground: obj_camera.player[i].on_ground,
					player_cutscene_time: obj_camera.player[i].cutscene_time
				});
			}
		}
	}

	return positions;
}
