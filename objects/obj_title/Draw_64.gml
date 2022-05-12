#region /*Play Attract Demo*/
if (global.play_attract_demo = false)
and (global.enable_attract_demo = true)
{
	if (file_exists("video/trailer.mp4"))
	{
		play_attract_demo_time += 1;
	}
	if (menu = "main_game")
	or (menu = "leveleditor")
	or (menu = "options")
	or (menu = "language_shortcut")
	or (menu = "accessibility_shortcut")
	or (menu = "profile_shortcut")
	or (menu = "credits")
	or (menu = "quit")
	{
		if (play_attract_demo_time >= 960)
		and (file_exists("video/trailer.mp4"))
		{
			in_settings = false;
			video_seek_to(0);
			global.play_attract_demo = true;
		}
	}
	else
	{
		if (play_attract_demo_time >= 3600)
		and (global.convention_mode = true)
		and (file_exists("video/trailer.mp4"))
		{
			in_settings = false;
			menu = "main_game";
			video_seek_to(0);
			global.play_attract_demo = true;
		}
	}
}
if (keyboard_check(vk_anykey))
or (mouse_check_button(mb_any))
or (mouse_wheel_down())
or (mouse_wheel_up())
or (instance_exists(obj_camera))
and (obj_camera.mouse_moving)
and (global.play_attract_demo = false)

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
	video_pause();
	play_attract_demo_time = 0;
	global.play_attract_demo = false;
}

if (global.play_attract_demo = true)
{
	video_open("video/trailer.mp4");
	video_resume()
	global.play_attract_demo = 2;
}
if (global.play_attract_demo = 2)
{
	menu_delay = 3;
	video_set_volume(global.music_volume * global.main_volume);
	var trailer_video = video_draw();
	if (trailer_video[0] == 0)
	{
		draw_surface_ext(trailer_video[1], 0, 0, 1.5, 1.47, 0, c_white, 1);
	}
	if (video_get_position() >= video_get_duration() - 2000)
	{
		play_attract_demo_time = 0;
		global.play_attract_demo = false;
		video_pause();
	}
}
#endregion /*Play Attract Demo END*/

#region /*Enable convention mode via cheat code, type "conventionmode" on your keyboard*/
if (keyboard_check_pressed(ord("C")))
and (keyboard_string != "arc")
and (can_input_level_name = false)
and (can_input_player1_name = false)
and (can_input_player2_name = false)
and (can_input_player3_name = false)
and (can_input_player4_name = false)
{
	keyboard_string = "c";
}

if (keyboard_string = "conventionmode")
or (keyboard_string = "convention mode")
{
	if (can_input_level_name = false)
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		if (global.convention_mode = false)
		{
			global.arcade_mode = false;
			global.convention_mode = true;
			if (menu = "options")
			or (menu = "quit")
			or (menu = "quit_game_no")
			or (menu = "quit_game_yes")
			or (in_settings = true)
			{
				menu = "main_game";
				in_settings = false;
			}
			keyboard_string = "";
			show_convention_mode_enable_text = 180;
		}
		else
		{
			global.arcade_mode = false;
			global.convention_mode = false;
			keyboard_string = "";
			show_convention_mode_enable_text = 180;
		}
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "convention_mode", global.convention_mode);
		ini_close();
	}
}

draw_set_halign(fa_left);
draw_set_valign(fa_center);
if (global.convention_mode = true)
and (show_convention_mode_enable_text > 0)
{
	show_convention_mode_enable_text -= 1;
	draw_text_outlined(64, 32, Text("Convention mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, true, 32, 32, 0.5, 0.5, 0, c_white, 1);
}
else
if (global.convention_mode = false)
and (show_convention_mode_enable_text > 0)
{
	show_convention_mode_enable_text -= 1;
	draw_text_outlined(64, 32, Text("Convention mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, false, 32, 32, 0.5, 0.5, 0, c_white, 1);
}
#endregion /*Enable convention mode via cheat code, type "conventionmode" on your keyboard END*/

#region /*Enable arcade mode via cheat code, type "arcademode" on your keyboard*/
if (keyboard_check_pressed(ord("A")))
and (keyboard_string != "arca")
and (can_input_level_name = false)
and (can_input_player1_name = false)
and (can_input_player2_name = false)
and (can_input_player3_name = false)
and (can_input_player4_name = false)
{
	keyboard_string = "a";
}

if (keyboard_string = "arcademode")
or (keyboard_string = "arcade mode")
{
	if (can_input_level_name = false)
	and (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		if (global.arcade_mode = false)
		{
			global.arcade_mode = true;
			global.convention_mode = false;
			if (menu = "options")
			or (menu = "quit")
			or (menu = "quit_game_no")
			or (menu = "quit_game_yes")
			or (in_settings = true)
			{
				menu = "main_game";
				in_settings = false;
			}
			keyboard_string = "";
			show_arcade_mode_enable_text = 180;
		}
		else
		{
			global.arcade_mode = false;
			global.convention_mode = false;
			keyboard_string = "";
			show_arcade_mode_enable_text = 180;
		}
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "arcade_mode", global.arcade_mode);
		ini_close();
	}
}

draw_set_halign(fa_left);
draw_set_valign(fa_center);
if (global.arcade_mode = true)
and (show_arcade_mode_enable_text > 0)
{
	show_arcade_mode_enable_text -= 1;
	draw_text_outlined(64, 32, Text("Arcade mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, true, 32, 32, 0.5, 0.5, 0, c_white, 1);
}
else
if (global.arcade_mode = false)
and (show_arcade_mode_enable_text > 0)
{
	show_arcade_mode_enable_text -= 1;
	draw_text_outlined(64, 32, Text("Arcade mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, false, 32, 32, 0.5, 0.5, 0, c_white, 1);
}
#endregion /*Enable arcade mode via cheat code, type "arcademode" on your keyboard END*/

#region /*Reset keys to noone if they happen to be 0, having a key at 0 means it's pressed every frame, and glitches the menus*/

#region /*Player 1 reset keys to noone if they happen to be 0*/
if (global.player1_key_dive = 0){global.player1_key_dive = noone;}
if (global.player1_key_jump = 0){global.player1_key_jump = noone;}
if (global.player1_key_crouch = 0){global.player1_key_crouch = noone;}
if (global.player1_key_crouch_toggle = 0){global.player1_key_crouch_toggle = noone;}
if (global.player1_key_sprint = 0){global.player1_key_sprint = noone;}
if (global.player1_key_sprint_toggle = 0){global.player1_key_sprint_toggle = noone;}
if (global.player1_key_left = 0){global.player1_key_left = noone;}
if (global.player1_key_right = 0){global.player1_key_right = noone;}
if (global.player1_key_down = 0){global.player1_key_down = noone;}
if (global.player1_key_up = 0){global.player1_key_up = noone;}
if (global.player1_key_tongue = 0){global.player1_key_tongue = noone;}
if (global.player1_key2_dive = 0){global.player1_key2_dive = noone;}
if (global.player1_key2_jump = 0){global.player1_key2_jump = noone;}
if (global.player1_key2_crouch = 0){global.player1_key2_crouch = noone;}
if (global.player1_key2_crouch_toggle = 0){global.player1_key2_crouch_toggle = noone;}
if (global.player1_key2_sprint = 0){global.player1_key2_sprint = noone;}
if (global.player1_key2_sprint_toggle = 0){global.player1_key2_sprint_toggle = noone;}
if (global.player1_key2_left = 0){global.player1_key2_left = noone;}
if (global.player1_key2_right = 0){global.player1_key2_right = noone;}
if (global.player1_key2_down = 0){global.player1_key2_down = noone;}
if (global.player1_key2_up = 0){global.player1_key2_up = noone;}
if (global.player1_key2_tongue = 0){global.player1_key2_tongue = noone;}
#endregion /*Player 1 reset keys to noone if they happen to be 0 END*/

#region /*Player 2 reset keys to noone if they happen to be 0*/
if (global.player2_key_dive = 0){global.player2_key_dive = noone;}
if (global.player2_key_jump = 0){global.player2_key_jump = noone;}
if (global.player2_key_crouch = 0){global.player2_key_crouch = noone;}
if (global.player2_key_crouch_toggle = 0){global.player2_key_crouch_toggle = noone;}
if (global.player2_key_sprint = 0){global.player2_key_sprint = noone;}
if (global.player2_key_sprint_toggle = 0){global.player2_key_sprint_toggle = noone;}
if (global.player2_key_left = 0){global.player2_key_left = noone;}
if (global.player2_key_right = 0){global.player2_key_right = noone;}
if (global.player2_key_down = 0){global.player2_key_down = noone;}
if (global.player2_key_up = 0){global.player2_key_up = noone;}
if (global.player2_key_tongue = 0){global.player2_key_tongue = noone;}
if (global.player2_key2_dive = 0){global.player2_key2_dive = noone;}
if (global.player2_key2_jump = 0){global.player2_key2_jump = noone;}
if (global.player2_key2_crouch = 0){global.player2_key2_crouch = noone;}
if (global.player2_key2_crouch_toggle = 0){global.player2_key2_crouch_toggle = noone;}
if (global.player2_key2_sprint = 0){global.player2_key2_sprint = noone;}
if (global.player2_key2_sprint_toggle = 0){global.player2_key2_sprint_toggle = noone;}
if (global.player2_key2_left = 0){global.player2_key2_left = noone;}
if (global.player2_key2_right = 0){global.player2_key2_right = noone;}
if (global.player2_key2_down = 0){global.player2_key2_down = noone;}
if (global.player2_key2_up = 0){global.player2_key2_up = noone;}
if (global.player2_key2_tongue = 0){global.player2_key2_tongue = noone;}
#endregion /*Player 2 reset keys to noone if they happen to be 0 END*/

#region /*Player 3 reset keys to noone if they happen to be 0*/
if (global.player3_key_dive = 0){global.player3_key_dive = noone;}
if (global.player3_key_jump = 0){global.player3_key_jump = noone;}
if (global.player3_key_crouch = 0){global.player3_key_crouch = noone;}
if (global.player3_key_crouch_toggle = 0){global.player3_key_crouch_toggle = noone;}
if (global.player3_key_sprint = 0){global.player3_key_sprint = noone;}
if (global.player3_key_sprint_toggle = 0){global.player3_key_sprint_toggle = noone;}
if (global.player3_key_left = 0){global.player3_key_left = noone;}
if (global.player3_key_right = 0){global.player3_key_right = noone;}
if (global.player3_key_down = 0){global.player3_key_down = noone;}
if (global.player3_key_up = 0){global.player3_key_up = noone;}
if (global.player3_key_tongue = 0){global.player3_key_tongue = noone;}
if (global.player3_key2_dive = 0){global.player3_key2_dive = noone;}
if (global.player3_key2_jump = 0){global.player3_key2_jump = noone;}
if (global.player3_key2_crouch = 0){global.player3_key2_crouch = noone;}
if (global.player3_key2_crouch_toggle = 0){global.player3_key2_crouch_toggle = noone;}
if (global.player3_key2_sprint = 0){global.player3_key2_sprint = noone;}
if (global.player3_key2_sprint_toggle = 0){global.player3_key2_sprint_toggle = noone;}
if (global.player3_key2_left = 0){global.player3_key2_left = noone;}
if (global.player3_key2_right = 0){global.player3_key2_right = noone;}
if (global.player3_key2_down = 0){global.player3_key2_down = noone;}
if (global.player3_key2_up = 0){global.player3_key2_up = noone;}
if (global.player3_key2_tongue = 0){global.player3_key2_tongue = noone;}
#endregion /*Player 3 reset keys to noone if they happen to be 0 END*/

#region /*Player 4 reset keys to noone if they happen to be 0*/
if (global.player4_key_dive = 0){global.player4_key_dive = noone;}
if (global.player4_key_jump = 0){global.player4_key_jump = noone;}
if (global.player4_key_crouch = 0){global.player4_key_crouch = noone;}
if (global.player4_key_crouch_toggle = 0){global.player4_key_crouch_toggle = noone;}
if (global.player4_key_sprint = 0){global.player4_key_sprint = noone;}
if (global.player4_key_sprint_toggle = 0){global.player4_key_sprint_toggle = noone;}
if (global.player4_key_left = 0){global.player4_key_left = noone;}
if (global.player4_key_right = 0){global.player4_key_right = noone;}
if (global.player4_key_down = 0){global.player4_key_down = noone;}
if (global.player4_key_up = 0){global.player4_key_up = noone;}
if (global.player4_key_tongue = 0){global.player4_key_tongue = noone;}
if (global.player4_key2_dive = 0){global.player4_key2_dive = noone;}
if (global.player4_key2_jump = 0){global.player4_key2_jump = noone;}
if (global.player4_key2_crouch = 0){global.player4_key2_crouch = noone;}
if (global.player4_key2_crouch_toggle = 0){global.player4_key2_crouch_toggle = noone;}
if (global.player4_key2_sprint = 0){global.player4_key2_sprint = noone;}
if (global.player4_key2_sprint_toggle = 0){global.player4_key2_sprint_toggle = noone;}
if (global.player4_key2_left = 0){global.player4_key2_left = noone;}
if (global.player4_key2_right = 0){global.player4_key2_right = noone;}
if (global.player4_key2_down = 0){global.player4_key2_down = noone;}
if (global.player4_key2_up = 0){global.player4_key2_up = noone;}
if (global.player4_key2_tongue = 0){global.player4_key2_tongue = noone;}
#endregion /*Player 4 reset keys to noone if they happen to be 0 END*/

#endregion /*Reset keys to noone if they happen to be 0, having a key at 0 means it's pressed every frame, and glitches the menus END*/

if (global.background_brightness_menu>-0.001)
{
	c_menu_outline = c_white;
	c_menu_fill = c_black;
}
else
{
	c_menu_outline = c_black;
	c_menu_fill = c_white;
}

/*Title Screen*/

room_speed = global.max_fps; /*Room Speed END*/

#region /*Change the logo to different designs during specific times and dates*/
if (current_month = 12)
{
	if (current_day >= 24)
	and (current_day <= 26)
	{
		effect_create_below(ef_snow, 0, 0, 2, c_white); /*Make the title screen snow when it's between 24th and 26th December*/
	}
	if (global.resource_pack_sprite_title_logo_christmas > noone)
	{
		title_logo_index = global.resource_pack_sprite_title_logo_christmas;
	}
	else
	if (global.title_logo_index > noone)
	{
		title_logo_index = global.title_logo_index;
	}
	else
	{
		title_logo_index = spr_wall;
	}
}
else
{
	if (global.title_logo_index > noone)
	{
		title_logo_index = global.title_logo_index;
	}
	else
	{
		title_logo_index = spr_wall;
	}
}
#endregion /*Change the logo to different designs during specific times and dates END*/

#region /*Volumes stay between 0 and 1*/
if (global.music_volume < 0)
{
	global.music_volume = 0;
}
else
if (global.music_volume > 1)
{
	global.music_volume = 1;
}
if (global.sound_volume < 0)
{
	global.sound_volume = 0;
}
else
if (global.sound_volume > 1)
{
	global.sound_volume = 1;
}
if (global.ambient_volume < 0)
{
	global.ambient_volume = 0;
}
else
if (global.ambient_volume > 1)
{
	global.ambient_volume = 1;
}
if (global.voices_volume < 0)
{
	global.voices_volume = 0;
}
else
if (global.voices_volume > 1)
{
	global.voices_volume = 1;
}
#endregion /*Volumes stay between 0 and 1 END*/

/*Keyboard Controls*/
gamepad_set_axis_deadzone(0, 0.50);
key_up = (keyboard_check_pressed(vk_up)) and (!keyboard_check_pressed(vk_down))or(keyboard_check_pressed(ord("W"))) and (!keyboard_check_pressed(ord("S")))or(gamepad_button_check_pressed(0, gp_padu)) and (!gamepad_button_check_pressed(0, gp_padd))or(gamepad_axis_value(0, gp_axislv) < 0) or mouse_wheel_up();
key_left = (keyboard_check_pressed(vk_left)) and (!keyboard_check_pressed(vk_right))or(keyboard_check_pressed(ord("A"))) and (!keyboard_check_pressed(ord("D")))or(gamepad_button_check_pressed(0, gp_padl)) and (!gamepad_button_check_pressed(0, gp_padr))or(gamepad_axis_value(0, gp_axislh) < 0);
key_right = (keyboard_check_pressed(vk_right)) and (!keyboard_check_pressed(vk_left))or(keyboard_check_pressed(ord("D"))) and (!keyboard_check_pressed(ord("A")))or(gamepad_button_check_pressed(0, gp_padr)) and (!gamepad_button_check_pressed(0, gp_padl))or(gamepad_axis_value(0, gp_axislh) > 0);
key_down = (keyboard_check_pressed(vk_down)) and (!keyboard_check_pressed(vk_up))or(keyboard_check_pressed(ord("S"))) and (!keyboard_check_pressed(ord("W")))or(gamepad_button_check_pressed(0, gp_padd)) and (!gamepad_button_check_pressed(0, gp_padu))or(gamepad_axis_value(0, gp_axislv) > 0) or mouse_wheel_down();
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))or(keyboard_check_pressed(ord("Z")))or(keyboard_check_pressed(vk_enter))or(keyboard_check_pressed(vk_space));
key_b_pressed = (gamepad_button_check_pressed(0, gp_face2))or(keyboard_check_pressed(ord("X")))or(keyboard_check_pressed(vk_escape))or(keyboard_check_pressed(vk_backspace))or(mouse_check_button_pressed(mb_right))or(mouse_check_button_pressed(mb_side1));
/*Keyboard Controls END*/

#region /*Quit Game trough pause menu*/
if (global.convention_mode = false)
and (can_remap_key = false)
and (input_key = false)
and (menu_delay = 0)
{
	if (menu = "main_game")
	or(menu = "leveleditor")
	or(menu = "options")
	or(menu = "credits")
	or(menu = "quit")
	{
		if (keyboard_check_pressed(vk_escape))
		{
			menu_delay = 3;
			menu = "quit_game_no";
		}
		else
		{
			room_persistent = false;
		}
		if (global.quit_level = true)
		{
			game_end();
		}
	}
}
#endregion /*Quit Game trough pause menu END*/

/*Draw Event*/

#region /*Fullscreen toggle*/
if (os_type!= os_ios)
and (os_type!= os_android)
and (global.controls_used_for_menu_navigation != "controller")
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	if (window_get_fullscreen())
	{
		draw_text_outlined(+ 52, display_get_gui_height() - 55 + version_y_pos, Text("Fullscreen"), global.default_text_size, c_white, c_black, 1);
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 25, display_get_gui_height() - 74 + version_y_pos + 16, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	{
		draw_text_outlined(+ 52, display_get_gui_height() - 55 + version_y_pos, Text("Fullscreen"), global.default_text_size, c_white, c_black, 1);
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 25, display_get_gui_height() - 74 + version_y_pos + 16, 0.5, 0.5, 0, c_white, 1);
		}
	}
}
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() + version_y_pos - 85, 370, display_get_gui_height() + version_y_pos - 75 + 42))
and (global.controls_used_for_menu_navigation = "mouse")
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, display_get_gui_height() + version_y_pos - 85, 370, display_get_gui_height() + version_y_pos - 75 + 42, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() + version_y_pos - 85, 370, display_get_gui_height() + version_y_pos - 75 + 42))
and (mouse_check_button_pressed(mb_left))
and (global.controls_used_for_menu_navigation = "mouse")
and (menu != "quit_game_no")
and (menu != "quit_game_yes")
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	menu_delay = 3;
}
#endregion /*Fullscreen toggle END*/

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera") == asset_object)
and (!instance_exists(obj_camera))
and (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/

#region /*Build Date and Version*/
draw_set_halign(fa_left);
draw_set_valign(fa_center);
if (global.demo = false)
{
	draw_text_outlined(0 + 16, display_get_gui_height() - 16 + version_y_pos, "v" + GM_version, global.default_text_size, c_menu_outline, c_menu_fill, 1);
}
else
{
	draw_text_outlined(0 + 16, display_get_gui_height() - 16 + version_y_pos, "v" + GM_version + " " + Text("Demo"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
}
draw_set_halign(fa_center);
draw_set_valign(fa_center);
#endregion /*Build Date and Version END*/

#region /*Hide Fullscreen and Version text / Set certain variables to default value*/
if (menu = "main_game")
and (global.play_attract_demo = false)
or (menu = "leveleditor")
and (global.play_attract_demo = false)
or (menu = "options")
and (global.play_attract_demo = false)
or (menu = "language_shortcut")
and (global.play_attract_demo = false)
or (menu = "accessibility_shortcut")
and (global.play_attract_demo = false)
or (menu = "profile_shortcut")
and (global.play_attract_demo = false)
or (menu = "credits")
and (global.play_attract_demo = false)
or (menu = "quit")
and (global.play_attract_demo = false)
{
	#region /*Character select Accept Selection*/
	player1_accept_selection = - 1;
	player2_accept_selection = - 1;
	player3_accept_selection = - 1;
	player4_accept_selection = - 1;
	player_start_game = false;
	#endregion /*Character select Accept Selection END*/

	#region /*What player can enter a name*/
	can_input_player1_name = false;
	can_input_player2_name = false;
	can_input_player3_name = false;
	can_input_player4_name = false;
	#endregion /*What player can enter a name END*/
	
	show_title_logo = true;
	version_y_pos = lerp(version_y_pos, 0, 0.1);
}
else
{
	show_title_logo = false;
	version_y_pos = lerp(version_y_pos, 128, 0.1);
}
#endregion /*Hide Fullscreen and Version text / Set certain variables to default value END*/

#region /*Draw Title Screen*/
if (global.title_logo_index >= 0)
or(global.resource_pack_sprite_title_logo_christmas > 0)
{
	if (global.title_logo_index >= 0)
	and (global.title_logo_index != undefined)
	and (global.title_logo_index != "")
	{
		draw_sprite_ext(title_logo_index, image_index, display_get_gui_width() / 2 + title_x, display_get_gui_height() / 2 - 100 + title_y, 402 / sprite_get_height(global.title_logo_index) * title_xscale, 402 / sprite_get_height(global.title_logo_index) * title_yscale, 0, c_white, title_alpha);
	}
}

if (menu!= "select_custom_level")
and (menu!= "level_editor_play")
and (menu!= "level_editor_make")
and (menu!= "import_export_level")
and (menu!= "delete_level")
and (show_title_logo = true)
{
	title_x = lerp(title_x, 0, 0.1);
	title_y = lerp(title_y, scr_wave(0, 40, 4.5, 0), 0.1);
	title_alpha = lerp(title_alpha, 1, 0.1);
	title_xscale = lerp(title_xscale, 1, 0.1);
	title_yscale = lerp(title_yscale, 1, 0.1);
}
else
if (global.play_attract_demo = false)
{
	title_x = lerp(title_x, 0, 0.1);
	title_y = lerp(title_y, - 800, 0.1);
	title_alpha = lerp(title_alpha, 0, 0.1);
	title_xscale = lerp(title_xscale, 1, 0.1);
	title_yscale = lerp(title_yscale, 1, 0.1);
}
else
{
	title_x = lerp(title_x, - 800, 0.1);
	title_y = lerp(title_y, scr_wave(-200, -240, 4.5, 0), 0.1);
	title_alpha = lerp(title_alpha, 0.5, 0.1);
	title_xscale = lerp(title_xscale, 0.5, 0.1);
	title_yscale = lerp(title_yscale, 0.5, 0.1);
}
#endregion /*Draw Title Screen END*/

#region /*Create Camera*/
if (asset_get_type("obj_camera") == asset_object)
{
	if (!instance_exists(obj_camera))
	{
		instance_create_depth(x, y, 0, obj_camera);
	}
	if (instance_exists(obj_camera))
	{
		x = obj_camera.x;
		y = obj_camera.y;
	}
}
#endregion /*Create Camera END*/

#region /*Arcade Mode Menu*/
if (global.arcade_mode = true)
{
	if (menu != "load_characters")
	and (menu != "select_character")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2 + 100 + 80, Text("Insert Coin"), global.default_text_size * 2, c_black, c_white, scr_wave(1, 0, 1, 0));
	}
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, Text("Credit") + " " + string(global.arcade_credit), global.default_text_size * 2, c_black, c_white, 1);
	if (global.arcade_credit >= 1)
	and (menu != "load_characters")
	and (menu != "select_character")
	{
		global.player1_can_play = false;
		global.player2_can_play = false;
		global.player3_can_play = false;
		global.player4_can_play = false;
		player1_accept_selection = - 1;
		player2_accept_selection = - 1;
		player3_accept_selection = - 1;
		player4_accept_selection = - 1;
		global.character_select_in_this_menu = "main_game";
		in_settings = false;
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		scr_load_character_initializing();
		menu = "load_characters";
		menu_delay = 3;
	}
}
#endregion /*Arcade Mode Menu END*/

#region /*Main Menu*/
if (menu = "main_game")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu = "leveleditor")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu = "options")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu = "language_shortcut")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu = "accessibility_shortcut")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu = "profile_shortcut")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu = "credits")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu = "quit")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
{
	select_custom_level_menu_open = false;
	can_input_level_name = false;
	
	#region /*Click on menu buttons*/
	
	#region /*Click Main Game*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 - 185, display_get_gui_height() / 2 + 100 + 40, display_get_gui_width() / 2 + 185, display_get_gui_height() / 2 + 100 + 60 + 19))
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (in_settings = false)
	or(menu = "main_game")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (in_settings = false)
	{
		global.player1_can_play = false;
		global.player2_can_play = false;
		global.player3_can_play = false;
		global.player4_can_play = false;
		player1_accept_selection = - 1;
		player2_accept_selection = - 1;
		player3_accept_selection = - 1;
		player4_accept_selection = - 1;
		global.character_select_in_this_menu = "main_game";
		in_settings = false;
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		scr_load_character_initializing();
		menu = "load_characters";
		menu_delay = 3;
	}
	#endregion /*Click Main Game END*/
	
	else
	
	#region /*Click Level Editor*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 - 185, display_get_gui_height() / 2 + 100 +80 + 1, display_get_gui_width() / 2 + 185, display_get_gui_height() / 2 + 100 + 100 + 19))
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (in_settings = false)
	and (global.demo = false)
	or(menu = "leveleditor")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (in_settings = false)
	and (global.demo = false)
	{
		global.player1_can_play = false;
		global.player2_can_play = false;
		global.player3_can_play = false;
		global.player4_can_play = false;
		player1_accept_selection = - 1;
		player2_accept_selection = - 1;
		player3_accept_selection = - 1;
		player4_accept_selection = - 1;
		in_settings = false;
		
		#region /*Select Level Editor*/
		if (asset_get_type("room_leveleditor") == asset_room)
		and (menu = "leveleditor")
		and (menu_delay = 0)
		and (global.demo = false)
		{
			if (!audio_is_playing(menuvoice_leveleditor))
			{
				audio_play_sound(menuvoice_leveleditor, 0, 0);
				audio_sound_gain(menuvoice_leveleditor, global.voices_volume * global.main_volume, 0);
			}
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			global.character_select_in_this_menu = "level_editor";
			scr_load_character_initializing();
			menu = "load_characters";
			menu_delay = 3;
			global.level_editor_level = 1;
		}
		#endregion /*Select Level Editor END*/
	
	}
	#endregion /*Click Level Editor END*/
	
	else
	
	#region /*Click Options*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	display_get_gui_width() / 2 - 185,
	options_and_quit_y + 2,
	display_get_gui_width() / 2,
	options_and_quit_y + 42))
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (in_settings = false)
	or(menu = "options")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (in_settings = false)
	{
		
		#region /*Play Options Voice*/
		if (voice_options > noone)
		{
			audio_stop_sound(voice_game_title);
			audio_stop_sound(voice_options);
			audio_play_sound(voice_options, 0, 0);
			audio_sound_gain(voice_options, global.voices_volume * global.main_volume, 0);
		}
		#endregion /*Play Options Voice END*/
		
		in_settings = true;
		can_navigate_settings_sidebar = true;
		menu = noone;
		menu_delay = 3;
	}
	#endregion /*Click Options END*/
	
	else

	#region /*Click Language Shortcut*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	display_get_gui_width() / 2 - 250,
	display_get_gui_height() / 2 + 100 + 140 - 20,
	display_get_gui_width() / 2 - 208,
	display_get_gui_height() / 2 + 100 + 140 + 19))
	and (menu = "language_shortcut")
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (global.show_language_shortcut = true)
	and (in_settings = false)
	or(menu = "language_shortcut")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (global.show_language_shortcut = true)
	and (in_settings = false)
	{
		menu_delay = 3;
		in_settings = true;
		can_navigate_settings_sidebar = false;
		global.settings_sidebar_menu = "language_settings";
		menu = "Language" + string(global.language_localization);
	}
	#endregion /*Click Language Shortcut END*/
	
	else
	
	#region /*Language Shortcut*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	display_get_gui_width() / 2 - 250,
	display_get_gui_height() / 2 + 100 + 140 - 20,
	display_get_gui_width() / 2 - 208,
	display_get_gui_height() / 2 + 100 + 140 + 19))
	and (mouse_check_button(mb_left))
	and (global.show_language_shortcut = true)
	{
		menu = "language_shortcut";
	}
	#endregion /*Language Shortcut END*/
	
	else

	#region /*Click Accessibility Shortcut*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	display_get_gui_width() / 2 + 208,
	display_get_gui_height() / 2 + 100 + 140 - 20,
	display_get_gui_width() / 2 + 250,
	display_get_gui_height() / 2 + 100 + 140 + 19))
	and (menu = "accessibility_shortcut")
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (global.show_accessibility_shortcut = true)
	
	or(menu = "accessibility_shortcut")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (global.show_accessibility_shortcut = true)
	{
		menu_delay = 3;
		in_settings = true;
		can_navigate_settings_sidebar = false;
		global.settings_sidebar_menu = "accessibility_settings";
		menu = noone;
	}
	#endregion /*Click Accessibility Shortcut END*/
	
	else
	
	#region /*Accessibility Shortcut*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	display_get_gui_width() / 2 + 208,
	display_get_gui_height() / 2 + 100 + 140 - 20,
	display_get_gui_width() / 2 + 250,
	display_get_gui_height() / 2 + 100 + 140 + 19))
	and (mouse_check_button(mb_left))
	and (global.show_accessibility_shortcut = true)
	{
		menu = "accessibility_shortcut";
	}
	#endregion /*Accessibility Shortcut END*/
	
	else

	#region /*Click Profile Shortcut*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	display_get_gui_width() / 2 + 208+ 50,
	display_get_gui_height() / 2 + 100 + 140 - 20,
	display_get_gui_width() / 2 + 250 + 50,
	display_get_gui_height() / 2 + 100 + 140 + 19))
	and (menu = "profile_shortcut")
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (global.show_profile_shortcut = true)
	and (in_settings = false)
	or(menu = "profile_shortcut")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (global.show_profile_shortcut = true)
	and (in_settings = false)
	{
		menu_delay = 3;
		in_settings = true;
		can_navigate_settings_sidebar = false;
		global.settings_sidebar_menu = "profile_settings";
		menu = noone;
	}
	#endregion /*Click Profile Shortcut END*/
	
	else
	
	#region /*Profile Shortcut*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	display_get_gui_width() / 2 + 208+ 50,
	display_get_gui_height() / 2 + 100 + 140 - 20,
	display_get_gui_width() / 2 + 250 + 50,
	display_get_gui_height() / 2 + 100 + 140 + 19))
	and (mouse_check_button(mb_left))
	and (global.show_profile_shortcut = true)
	{
		menu = "profile_shortcut";
	}
	#endregion /*Profile Shortcut END*/
	
	else
	
	#region /*Click Credits*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 370, display_get_gui_height() - 42, display_get_gui_width(), display_get_gui_height()))
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (in_settings = false)
	or(menu = "credits")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (in_settings = false)
	{
		if (!instance_exists(obj_credits))
		{
			instance_create_depth(x, y, 0, obj_credits);
		}
		in_settings = false;
		menu = "play_credits";
		menu_delay = 3;
		can_navigate_settings_sidebar = false;
	}
	#endregion /*Click Credits END*/
	
	else
	
	#region /*Click Quit*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2, options_and_quit_y + 2, display_get_gui_width() / 2 + 185, options_and_quit_y + 42))
	and (mouse_check_button_released(mb_left))
	and (menu_delay = 0)
	and (in_settings = false)
	and (global.convention_mode = false)
	or(menu = "quit")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (in_settings = false)
	and (global.convention_mode = false)
	{
		in_settings = false;
		menu = "quit_game_no";
		menu_delay = 3;
	}
	#endregion /*Click Quit END*/
	
	#endregion /*Click on menu buttons END*/
	
	if (menu = "main_game")
	{
		global.character_select_in_this_menu = "main_game";
	}
	
	if (asset_get_type("room_leveleditor") == asset_room)
	and (menu = "leveleditor")
	{
		if (global.level_editor_level > 0)
		{
			global.level_editor_level = 0;
		}
		global.character_select_in_this_menu = "level_editor"; /*No custom level is selected before you go into the level editor*/
	}
	
	if (global.demo = false)
	{
		draw_menu_button(display_get_gui_width() / 2 - 185, display_get_gui_height() / 2 + 100 + 40, Text("Main Game"), "main_game", "main_game");
		draw_menu_button(display_get_gui_width() / 2 - 185, display_get_gui_height() / 2 + 100 +80, Text("Level Editor"), "leveleditor", "leveleditor");
		options_and_quit_y = display_get_gui_height() / 2 + 100 + 120 + 1;
	}
	else
	{
		draw_menu_button(display_get_gui_width() / 2 - 185, display_get_gui_height() / 2 + 100 + 40, Text("Play Demo"), "main_game", "main_game");
		options_and_quit_y = display_get_gui_height() / 2 + 100 + 120 - 42 + 1;
	}
	
	if (global.convention_mode = false)
	{
		draw_menu_button_sprite(spr_menu_button_short, display_get_gui_width() / 2 - 185, options_and_quit_y, 185, 42, Text("Options"), "options", "options");
		draw_sprite_ext(spr_icons_cogwheel, 0, display_get_gui_width() / 2 - 185 + 8, options_and_quit_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button_sprite(spr_menu_button_short, display_get_gui_width() / 2      , options_and_quit_y, 185, 42, Text("Quit"), "quit", "quit");
		if (menu = "quit")
		{
			draw_menu_button_sprite(spr_menu_button_short, display_get_gui_width() / 2 - 185, options_and_quit_y, 185, 42, Text("Options"), "options", "options");
			draw_sprite_ext(spr_icons_cogwheel, 0, display_get_gui_width() / 2 - 185 + 8, options_and_quit_y + 21, 1, 1, 0, c_white, 1);
		}
	}
	
	draw_menu_button_sprite(spr_noone, display_get_gui_width() - 370, display_get_gui_height() - 42, 370, 42, Text("Made by") + " " + (global.company_name), "credits", "play_credits");
	
	if (global.show_language_shortcut = true)
	and (global.convention_mode = false)
	{
		if (menu = "language_shortcut")
		{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 - 250, display_get_gui_height() / 2 + 100 + 140 - 20, display_get_gui_width() / 2 - 208, display_get_gui_height() / 2 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 - 250, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_green, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 - 250, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_gray, 1);}
		draw_sprite_ext(spr_settings_icons, 12, display_get_gui_width() / 2 - 230, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
		else{if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 - 250, display_get_gui_height() / 2 + 100 + 140 - 20, display_get_gui_width() / 2 - 208, display_get_gui_height() / 2 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 - 250, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_lime, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 - 250, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
		draw_sprite_ext(spr_settings_icons, 12, display_get_gui_width() / 2 - 230, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
	}

	if (global.show_accessibility_shortcut = true)
	and (global.convention_mode = false)
	{
		if (menu = "accessibility_shortcut")
		{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 + 208, display_get_gui_height() / 2 + 100 + 140 - 20, display_get_gui_width() / 2 + 250, display_get_gui_height() / 2 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_green, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_gray, 1);}
		draw_sprite_ext(spr_settings_icons, 1, display_get_gui_width() / 2 + 230, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
		else{if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 + 208, display_get_gui_height() / 2 + 100 + 140 - 20, display_get_gui_width() / 2 + 250, display_get_gui_height() / 2 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_lime, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
		draw_sprite_ext(spr_settings_icons, 1, display_get_gui_width() / 2 + 230, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
	}

	if (global.show_profile_shortcut = true)
	and (global.convention_mode = false)
	{
		if (menu = "profile_shortcut")
		{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 + 208+ 50, display_get_gui_height() / 2 + 100 + 140 - 20, display_get_gui_width() / 2 + 250 + 50, display_get_gui_height() / 2 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208+ 50, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_green, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208+ 50, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_gray, 1);}
		draw_sprite_ext(spr_settings_icons, 7, display_get_gui_width() / 2 + 230 + 50, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
		else{if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() / 2 + 208+ 50, display_get_gui_height() / 2 + 100 + 140 - 20, display_get_gui_width() / 2 + 250 + 50, display_get_gui_height() / 2 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208+ 50, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_lime, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() / 2 + 208+ 50, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
		draw_sprite_ext(spr_settings_icons, 7, display_get_gui_width() / 2 + 230 + 50, display_get_gui_height() / 2 + 100 + 140, 1, 1, 0, c_white, 1);}
	}
}
#endregion /*Main Menu END*/

scr_options_menu(); /*Options*/

scr_quit_to_desktop_menu("quit");

#region /*Select Custom Level Menu*/
if (level_editor_template_select = true)
and (global.play_attract_demo = false)
{
	select_custom_level_menu_open = false;
	scr_select_official_level_menu();
	
	if (window_get_width() >= 1670)
	{
		R = 4;
	}
	else
	if (window_get_width() >= 1276)
	{
		R = 3;
	}
	else
	if (window_get_width() >= 882)
	{
		R = 2;
	}
	else
	if (window_get_width() >= 488)
	{
		R = 1;
	}
	
	C = clamp(floor(global.select_level_index / R), 0, floor(ds_list_size(global.all_loaded_main_levels)))
	if (global.controls_used_for_menu_navigation = "mouse")
	and (can_input_level_name = false)
	and (can_navigate = true)
	{
		for(i = 0;
		i < ds_list_size(global.thumbnail_sprite);
		i += 1)
		{
			C = floor(i / R);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(i-C*R) + 100 - 3, 226*(C-scroll) + 250 - 3, 394 *(i-C*R) + 100 + 384 + 3, 226*(C-scroll) + 250 + 216 + 3))
			{
				if (menu != "level_editor_play")
				and (menu_delay = 0)
				{
					menu = "level_editor_play";
				}
				global.select_level_index = i;
			}
		}
	}
}
else
if (select_custom_level_menu_open = true)
and (global.play_attract_demo = false)
{
	level_editor_template_select = false;
	scr_select_custom_level_menu();
	scr_custom_level_select_with_the_mouse()
}
#endregion /*Select Custom Level Menu END*/

scr_character_select_menu(); /*Character select*/

#region /*Menu Navigation*/
if (menu_joystick_delay <= 0)
and (input_key = false)
and (can_navigate = true)
and (menu_delay = 0)
{

	/*Level Editor Menu*/
	if (global.level_editor_level<= 0)
	{
		global.level_editor_level = 1;
	}

	#region /*Navigate Main Menu*/
	if (menu = "main_game")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "credits";
		}
		else
		if (key_down)
		and (global.demo = false)
		{
			menu_delay = 3;
			menu = "leveleditor";
		}
		else
		if (key_down)
		and (global.convention_mode = false)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_down)
		and (global.convention_mode = true)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu = "leveleditor")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_down)
		and (global.convention_mode = false)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_down)
		and (global.convention_mode = true)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu = "options")
	{
		if (key_left)
		and (global.show_language_shortcut = true)
		and (global.convention_mode = false)
		{
			menu_delay = 3;
			menu = "language_shortcut";
		}
		else
		if (key_right)
		or (key_left)
		and (global.show_language_shortcut = false)
		{
			menu_delay = 3;
			if (global.convention_mode = false)
			{
				menu = "quit";
			}
			else
			{
				menu = "main_game";
			}
		}
		else
		if (key_up)
		and (global.demo = false)
		{
			menu_delay = 3;
			menu = "leveleditor";
		}
		else
		if (key_up)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu = "language_shortcut")
	{
		if (key_right)
		{
			menu_delay = 3;
			menu = "options";
		}
	}
	else
	if (menu = "accessibility_shortcut")
	{
		if (key_left)
		{
			menu_delay = 3;
			if (global.convention_mode = false)
			{
				menu = "quit";
			}
			else
			{
				menu = "main_game";
			}
		}
		else
		if (key_right)
		and (global.show_profile_shortcut = true)
		and (global.convention_mode = false)
		{
			menu_delay = 3;
			menu = "profile_shortcut";
		}
	}
	else
	if (menu = "profile_shortcut")
	{
		if (key_left)
		{
			menu_delay = 3;
			menu = "accessibility_shortcut";
		}
	}
	else
	if (menu = "quit")
	{
		if (key_left)
		and (global.convention_mode = false)
		or (key_right)
		and (global.show_accessibility_shortcut = false)
		and (global.convention_mode = false)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_right)
		and (global.show_accessibility_shortcut = true)
		and (global.convention_mode = false)
		{
			menu_delay = 3;
			menu = "accessibility_shortcut";
		}
		else
		if (key_up)
		and (global.demo = false)
		{
			menu_delay = 3;
			menu = "leveleditor";
		}
		else
		if (key_up)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu = "credits")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode = false)
			{
				menu = "quit";
			}
			else
			{
				menu = "leveleditor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
	}
	#endregion /*Navigate Main Menu END*/

}
#endregion /*Menu Navigation END*/

#region /*Accept*/

#region /*Select Quit*/
if (menu = "quit")
and (key_a_pressed)
and (menu_delay = 0)
and (global.convention_mode = false)
{
	menu = "quit_game_no";
	menu_delay = 3;
}
#endregion /*Select Quit END*/

#endregion /*Accept END*/

#region /*Start Game*/
if (asset_get_type("obj_camera") == asset_object)
and (instance_exists(obj_camera))
and (iris_xscale <= 0.001)
{
	
	#region /*Play Level Editor*/
	if (menu = "level_editor_play")
	and (global.character_select_in_this_menu = "level_editor")
	and (global.create_level_from_template = false)
	{
		if (title_music > noone)
		{
			if (audio_is_playing(title_music))
			{
				audio_stop_sound(title_music);
			}
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			sprite_delete(title_screen_background);
			
			#region /*Update All Backgrounds*/
			
			sprite_delete(global.custom_background1);
			sprite_delete(global.custom_background2);
			sprite_delete(global.custom_background3);
			sprite_delete(global.custom_background4);
			sprite_delete(global.custom_foreground1);
			sprite_delete(global.custom_foreground_above_static_objects);
			sprite_delete(global.custom_foreground2);
			sprite_delete(global.custom_foreground_secret);
			
			#region /*Update Background1*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background1 = noone;
			}
			#endregion /*Update Background1 END*/
			
			#region /*Update Background2*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background2 = noone;
			}
			#endregion /*Update Background2 END*/
			
			#region /*Update Background3*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background3 = noone;
			}
			#endregion /*Update Background3 END*/
			
			#region /*Update Background4 */
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background4 = noone;
			}
			#endregion /*Update Background4 END*/
			
			#region /*Update Foreground1*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /*Update Foreround1 END*/
			
			#region /*Update Foreground above static objects custom level*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground_above_static_objects = noone;
			}
			
			#endregion /*Update Foreround above static objects custom level END*/
			
			#region /*Update Foreground2*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground2 = noone;
			}
			
			#endregion /*Update Foreround2 END*/
			
			#region /*Update Foreground secret custom level*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground_secret = noone;
			}
			
			#endregion /*Update Foreround secret custom level END*/
			
			#endregion /*Update All Backgrounds END*/
			
			#region /*Custom Level Tileset File*/
			sprite_delete(global.custom_tileset);
			
			if (global.character_select_in_this_menu = "main_game")
			and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
			{
				global.custom_tileset = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
			}
			else
			if (global.character_select_in_this_menu = "level_editor")
			and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
			{
				global.custom_tileset = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
			}
			else
			{
				global.custom_tileset = noone;
			}
			#endregion /*Custom Level Tileset File END*/
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level = true;
		global.play_edited_level = true;
	}
	#endregion /*Play Level Editor END*/
	
	else
	
	#region /*Make Level Editor*/
	if (menu = "level_editor_make")
	and (global.character_select_in_this_menu = "level_editor")
	{
		if (title_music > noone)
		{
			if (audio_is_playing(title_music))
			{
				audio_stop_sound(title_music);
			}
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			sprite_delete(title_screen_background);
			
			#region /*Update All Backgrounds*/
			
			sprite_delete(global.custom_background1);
			sprite_delete(global.custom_background2);
			sprite_delete(global.custom_background3);
			sprite_delete(global.custom_background4);
			sprite_delete(global.custom_foreground1);
			sprite_delete(global.custom_foreground_above_static_objects);
			sprite_delete(global.custom_foreground2);
			sprite_delete(global.custom_foreground_secret);
			
			#region /*Update Background1*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background1 = noone;
			}
			#endregion /*Update Background1 END*/
			
			#region /*Update Background2*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background2 = noone;
			}
			#endregion /*Update Background2 END*/
			
			#region /*Update Background3*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background3 = noone;
			}
			#endregion /*Update Background3 END*/
			
			#region /*Update Background4 */
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_vtiled[0] = true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg", 0, false, false, 0, 0);layer_background_htiled[0] = true;layer_background_htiled[0] = true;}else
			{
				global.custom_background4 = noone;
			}
			#endregion /*Update Background4 END*/
						
			#region /*Update Foreground1*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /*Update Foreround1 END*/
			
			#region /*Update Foreground above static objects custom level*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground_above_static_objects = noone;
			}
	
			#endregion /*Update Foreround above static objects custom level END*/
			
			#region /*Update Foreground2*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground2 = noone;
			}
			
			#endregion /*Update Foreround2 END*/
			
			#region /*Update Foreground secret custom level*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground_secret = noone;
			}
			
			#endregion /*Update Foreround secret custom level END*/
			
			#endregion /*Update All Backgrounds END*/
			
			#region /*Custom Level Tileset File*/
			sprite_delete(global.custom_tileset);
			
			if (global.character_select_in_this_menu = "main_game")
			and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
			{
				global.custom_tileset = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
			}
			else
			if (global.character_select_in_this_menu = "level_editor")
			and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
			{
				global.custom_tileset = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
			}
			else
			{
				global.custom_tileset = noone;
			}
			#endregion /*Custom Level Tileset File END*/
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
	}
	#endregion /*Make Level Editor END*/
	
	else
	
	#region /*Load File*/
	if (menu = "select_character")
	or(menu = "back_from_character_select")
	{
		if (title_music > noone)
		{
			if (audio_is_playing(title_music))
			{
				audio_stop_sound(title_music);
			}
		}
		if (asset_get_type("room_world_map") == asset_room)
		{
			sprite_delete(title_screen_background);
			scr_config_save();
			room_goto(room_world_map);
		}
	}
	#endregion /*Load File END*/

}
#endregion /*Start Game END*/

else

#region /*Back*/
if (key_b_pressed)
{
	if (menu = "1player")
	or(menu = "2player")
	or(menu = "3player")
	or(menu = "4player")
	{
		if (menu_delay = 0)
		{
			if (global.character_select_in_this_menu = "main_game")
			{
				menu = "main_game";
				menu_delay = 3;
			}
			else
			{
				menu = "leveleditor";
				menu_delay = 3;
			}
		}
	}
}
#endregion /*Back END*/

#region /*Menu Navigation Delay*/
if (menu_delay > 0)
{
	menu_delay -= 1;
}
if (menu_delay < 0)
{
	menu_delay = 0;
}
#endregion /*Menu Navigation Delay END*/

#region /*If player object is present, destroy the player object*/
if (instance_exists(obj_player))
{
	with(obj_player)
	{
		instance_destroy();
	}
}
#endregion /*If player object is present, destroy the player object END*/

#region /*Menu navigation with joystick (This code must come after all menu navigation code)*/
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
#endregion /*Menu navigation with joystick (This code must come after all menu navigation code) END*/

#region /*Have a black screen at the first frame so transitions look natural*/
if (black_screen_at_start_delay < 1)
{
	draw_rectangle_color(0, 0, display_get_gui_width()* 3, display_get_gui_height()* 3, c_black, c_black, c_black, c_black, false);
	black_screen_at_start_delay += 1;
}
#endregion /*Have a black screen at the first frame so transitions look natural END*/

#region /*If Window is unfocused, darken the screen*/
if (!window_has_focus())
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, display_get_gui_width()* 3, display_get_gui_height()* 3, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /*If Window is unfocused, darken the screen END*/

#region /*Draw Iris Transitions*/

#region /*Iris Zooming*/
if (menu_delay > 999)
{
	if (iris_zoom = 1)
	{
		iris_xscale = lerp(iris_xscale, 1, 0.15);
		iris_yscale = lerp(iris_yscale, 1, 0.15);
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
	else
	{
		iris_xscale = lerp(iris_xscale, 0, 0.15);
		iris_yscale = lerp(iris_yscale, 0, 0.15);
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
}

else

#region /*Zoom Out*/
if (iris_zoom = 0)
{
	iris_xscale = lerp(iris_xscale, 1, 0.15);
	iris_yscale = lerp(iris_yscale, 1, 0.15);
	if (iris_xscale >= 0.99)
	{
		iris_zoom = 1;
	}
}
else
{
	iris_xscale = lerp(iris_xscale, 32, 0.015);
	iris_yscale = lerp(iris_yscale, 32, 0.015);
	if (iris_xscale >= 0.99)
	{
		iris_zoom = 1;
	}
}
#endregion /*Zoom Out END*/

#endregion /*Iris Zooming END*/

#region /*Loading Screen*/
if (menu = "load_custom_level")
or (menu = "load_characters")
or (menu = "load_official_level_template")
{
	loading_spinning_angle -= 10;
	draw_sprite_ext(spr_loading, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, 1, 1, loading_spinning_angle, c_white, 1);
	draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2 +64, Text("Loading"), global.default_text_size, c_white, c_black, 1);
	draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2 +64 + 32, string(file_found), global.default_text_size, c_white, c_black, 1);
}
#endregion /*Loading Screen END*/

if (global.enable_transitions = true)
{
	if (iris_xscale < 15)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, iris_xscale, iris_yscale, 0, c_black, 1);
		}
		draw_rectangle_color(0, 0, display_get_gui_width()* 2, display_get_gui_height() / 2 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, display_get_gui_width() / 2 - iris_xscale * 128, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(display_get_gui_width() / 2 + iris_xscale * 128 - 1, 0, display_get_gui_width()* 2, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, display_get_gui_height() / 2 + iris_yscale * 128, display_get_gui_width()* 2, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /*Draw Iris Transitions END*/