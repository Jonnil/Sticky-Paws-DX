black_screen_gui_alpha = 1;

key_player1_sprint_toggle_pressed = noone;
key_player2_sprint_toggle_pressed = noone;
key_player3_sprint_toggle_pressed = noone;
key_player4_sprint_toggle_pressed = noone;
key_player1_zoom_in_hold = noone;
key_player2_zoom_in_hold = noone;
key_player3_zoom_in_hold = noone;
key_player4_zoom_in_hold = noone;
key_player1_zoom_out_hold = noone;
key_player2_zoom_out_hold = noone;
key_player3_zoom_out_hold = noone;
key_player4_zoom_out_hold = noone;

player1_motor_speed = 0;
player2_motor_speed = 0;
player3_motor_speed = 0;
player4_motor_speed = 0;
player1_vibration_active = false;
player2_vibration_active = false;
player3_vibration_active = false;
player4_vibration_active = false;

reset_game_if_no_interactivity = 0;
reset_game_if_no_interactivity_second_countdown_timer = 0;
reset_game_if_no_interactivity_second_countdown = 60;

saved_file_exists = false;
can_save_to_character_config = false; /* Only turn true when playing as custom character */
unused_x_origin_point = noone;
unused_y_origin_point = noone;

display_xscale = 1.5
display_yscale = 1.5
display_xoffset = 0
display_yoffset = 0

depth = -9000;

sprite_index = global.resource_pack_sprite_basic_collectible;
image_speed = 0.25;

global.pause_room = noone;

show_controller_input_change_prompt = 0;
show_keyboard_and_mouse_input_change_prompt = 0;
show_controller_input_change_prompt_y = 0;
show_keyboard_and_mouse_input_change_prompt_y = 0;

delay = 0;

big_collectible1_already_collected = false;
big_collectible2_already_collected = false;
big_collectible3_already_collected = false;
big_collectible4_already_collected = false;
big_collectible5_already_collected = false;

if (global.character_select_in_this_menu == "main_game")
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

or (global.character_select_in_this_menu == "level_editor")
and (global.create_level_from_template == true)
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

or (global.character_select_in_this_menu == "level_editor")
and (global.select_level_index <= 0)
and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

or (global.character_select_in_this_menu == "level_editor")
and (global.create_level_from_template >= 2)
and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

or (global.character_select_in_this_menu == "level_editor")
and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu == "main_game")
	or (global.create_level_from_template = true)
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	and (global.select_level_index <= 0)
	or (global.character_select_in_this_menu == "level_editor")
	and (global.create_level_from_template >= 2)
	{
		ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	
	if (ini_key_exists("info", "make_every_tileset_into_default_tileset"))
	{
		global.make_every_tileset_into_default_tileset = ini_read_real("info", "make_every_tileset_into_default_tileset", false);
	}
	else
	{
		global.make_every_tileset_into_default_tileset = false;
	}
	ini_close();
}
else
{
	global.make_every_tileset_into_default_tileset = false;
}

#region /* Lives Icon */
if (global.player1_can_play == true)
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player_1;
}
else
if (global.player2_can_play == true)
{
	camera_player = 1;
	camera_selected_skin = global.skin_for_player_2;
}
else
if (global.player3_can_play == true)
{
	camera_player = 2;
	camera_selected_skin = global.skin_for_player_3;
}
else
if (global.player4_can_play == true)
{
	camera_player = 3;
	camera_selected_skin = global.skin_for_player_4;
}
else
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player_1;
}

if (asset_get_type("spr_1up") == asset_sprite)
{
	sprite_lives_icon = spr_1up;
}
else
{
	sprite_lives_icon = noone;
}
alarm[0] = 1; /* Initialize custom character timer. This code needs to be initialized later than create event, but not in step event, so only initialize in alarm */
#endregion /* Lives Icon END */

#region /* Create Foreground and Background Brightness Layer */
if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
and (!instance_exists(obj_background_brightness_gameplay))
{
	instance_create_depth(0, 0, 0, obj_background_brightness_gameplay);
}
if (asset_get_type("obj_foreground1") == asset_object)
and (!instance_exists(obj_foreground1))
{
	instance_create_depth(0, 0, 0, obj_foreground1);
}
if (asset_get_type("obj_foreground_above_static_objects") == asset_object)
and (!instance_exists(obj_foreground_above_static_objects))
{
	instance_create_depth(0, 0, 0, obj_foreground_above_static_objects);
}
if (asset_get_type("obj_foreground2") == asset_object)
and (!instance_exists(obj_foreground2))
{
	instance_create_depth(0, 0, 0, obj_foreground2);
}
if (asset_get_type("obj_foreground_secret") == asset_object)
and (!instance_exists(obj_foreground_secret))
{
	instance_create_depth(0, 0, 0, obj_foreground_secret);
}
#endregion /* Create Foreground and Background Brightness Layer END */

save_level_as_png = false;
can_spawn_player1 = true;
can_spawn_player2 = true;
can_spawn_player3 = true;
can_spawn_player4 = true;
show_player1_controls_y = +32;
show_player2_controls_y = +32;
show_player3_controls_y = +32;
show_player4_controls_y = +32;

#region /* Smooth the camera out even more */
view_wview_lerp = 0;
view_hview_lerp = 0;
#endregion /* Smooth the camera out even more END */

view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) / 2);
view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) / 2);

#region /* Hud Variables */
global.hud_show_lives = true;
global.hud_show_deaths = true;
hud_show_lives = - 32;
hud_show_lives_timer = global.hud_hide_time * 60;
hud_show_deaths = - 32;
hud_show_deaths_timer = global.hud_hide_time * 60;
hud_show_basic_collectibles = - 32;
hud_show_basic_collectibles_timer = 0;
hud_show_big_collectibles = - 32;
hud_show_big_collectibles_timer = 0;
hud_show_score = -64;
hud_show_score_timer = 0;
time_countup_y = 32; /* What y position the countup timer should be at */
hurry_up_message_timer = 0; /* How long the hurry up message should stay on screen */
#endregion /* Hud Variables END */

player_has_spawned = false;

#region /* Checkpoint */
if (global.actually_play_edited_level = true)
and (global.play_edited_level = true)
{
	if (global.checkpoint_x > 0)
	or (global.checkpoint_y > 0)
	{
		camera_set_view_pos(view_camera[view_current], global.checkpoint_x, global.checkpoint_y)
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		{
			obj_player.x = global.checkpoint_x;
			obj_player.y = global.checkpoint_y;
		}
		x = global.checkpoint_x;
		y = global.checkpoint_y;
		xx = global.checkpoint_x;
		yy = global.checkpoint_y;
	}
}
#endregion /* Checkpoint END */

scr_initialize_level_information_ini();

#region /* Spawn Players */
player1 = noone;
player2 = noone;
player3 = noone;
player4 = noone;
if (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	if (global.player1_can_play == true)
	{
		if (global.checkpoint_x > 0)
		and (global.actually_play_edited_level == true)
		or (global.checkpoint_y > 0)
		and (global.actually_play_edited_level == true)
		{
			player1 = instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_1_start))
		{
			player1 = instance_create_depth(obj_level_player_1_start.x, obj_level_player_1_start.y, 0, obj_player);
		}
		else
		{
			player1 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player1)
		{
			custom_character = global.character_for_player_1;
			selected_voice_pack = global.voicepack_for_player_1;
			selected_skin = global.skin_for_player_1;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 1;
		}
	}
	if (global.player2_can_play == true)
	{
		if (global.checkpoint_x > 0)
		and (global.actually_play_edited_level == true)
		or (global.checkpoint_y > 0)
		and (global.actually_play_edited_level == true)
		{
			player2 = instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_2_start))
		{
			player2 = instance_create_depth(obj_level_player_2_start.x, obj_level_player_2_start.y, 0, obj_player);
		}
		else
		{
			player2 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player2)
		{
			custom_character = global.character_for_player_2;
			selected_voice_pack = global.voicepack_for_player_2;
			selected_skin = global.skin_for_player_2;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 2;
		}
	}
	if (global.player3_can_play == true)
	{
		if (global.checkpoint_x > 0)
		and (global.actually_play_edited_level == true)
		or (global.checkpoint_y > 0)
		and (global.actually_play_edited_level == true)
		{
			player3 = instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_3_start))
		{
			player3 = instance_create_depth(obj_level_player_3_start.x, obj_level_player_3_start.y, 0, obj_player);
		}
		else
		{
			player3 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player3)
		{
			custom_character = global.character_for_player_3;
			selected_voice_pack = global.voicepack_for_player_3;
			selected_skin = global.skin_for_player_3;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 3;
		}
	}
	if (global.player4_can_play == true)
	{
		if (global.checkpoint_x > 0)
		and (global.actually_play_edited_level == true)
		or (global.checkpoint_y > 0)
		and (global.actually_play_edited_level == true)
		{
			player4 = instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_4_start))
		{
			player4 = instance_create_depth(obj_level_player_4_start.x, obj_level_player_4_start.y, 0, obj_player);
		}
		else
		{
			player4 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player4)
		{
			custom_character = global.character_for_player_4;
			selected_voice_pack = global.voicepack_for_player_4;
			selected_skin = global.skin_for_player_4;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 4;
		}
	}
	if (asset_get_type("room_leveleditor") == asset_room)
	and (room == room_leveleditor)
	and (global.actually_play_edited_level == true)
	{
		player_has_spawned = true;
	}
}
#endregion /* Spawn Players END */

#region /* HUD Show Controls keys that have been pressed */
player1_show_controls_timer = 0;
player2_show_controls_timer = 0;
player3_show_controls_timer = 0;
player4_show_controls_timer = 0;

player1_show_controls_alpha = 0;
player2_show_controls_alpha = 0;
player3_show_controls_alpha = 0;
player4_show_controls_alpha = 0;

show_sprint_toggle_for_player1 = 0;
show_sprint_toggle_for_player2 = 0;
show_sprint_toggle_for_player3 = 0;
show_sprint_toggle_for_player4 = 0;
#endregion /* HUD Show Controls keys that have been pressed END */

if (asset_get_type("obj_player_map") == asset_object)
and (instance_exists(obj_player_map))
{
	x = obj_player_map.x;
	y = obj_player_map.y;
	xx = obj_player_map.x;
	yy = obj_player_map.y;
}
else
{
	xx = x;
	yy = y;
}
letterbox_top_y = 0;
letterbox_bottom_y = room_height;
show_letterbox = 0;
iris_xscale = 0;
iris_yscale = 0;
allow_iris = true;
iris_zoom = 0;
timer_blinking_alpha = 0;

/* Initialize the view in the create event, if you do that in any other event the HTML5 version will result in a black screen */
#region /* Initialize View */

/* View Size */
view_wview= 1024 + 400 - 32;
view_hview= 768- 32;
/* View Size END */

#region /* View Size */
if (os_type == os_ios)or(os_type == os_android){
if (view_wport > 1920){view_wport = 1920;}if (view_wview> 1920 - 64){view_wview= 1920 - 64;}if (view_hport > 1080){view_hport = 1080;}if (view_hview> 1080 - 64){view_hview= 1080 - 64;}
if (view_wport <640 - 320){view_wport = 640;}if (view_wview<640){view_wview= 640;}if (view_hport <480){view_hport = 480;}if (view_hview<480){view_hview= 480;}
}else{
if (view_wport > 1920){view_wport = 1920;}if (view_wview> 1920){view_wview= 1920;}if (view_hport > 1080){view_hport = 1080;}if (view_hview> 1080){view_hview= 1080;}
if (view_wport <640){view_wport = 640;}if (view_wview<640){view_wview= 640;}if (view_hport <480){view_hport = 480;}if (view_hview<480){view_hview= 480;}}
#endregion /* View Size END */

#endregion /* Initialize View END */

#region /* Custom Music */
if (asset_get_type("room_title") == asset_room)
and (room != room_title)
{
	
	#region /* Update Music */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg"))
	and (global.character_select_in_this_menu == "main_game")
	or(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	and (global.create_level_from_template >= true)
	{
		global.music = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/music.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	{
		global.music = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/music.ogg");
	}
	else
	{
		global.music = noone;
	}
	#endregion /* Update Music END */
	
	#region /* Update Music Underwater */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg"))
	and (global.character_select_in_this_menu == "main_game")
	or(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	and (global.create_level_from_template >= true)
	{
		global.music_underwater = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/music_underwater.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	{
		global.music_underwater = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/music_underwater.ogg");
	}
	else
	{
		global.music_underwater = noone;
	}
	#endregion /* Update Music Underwater END */
	
	#region /* Update Ambience */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg"))
	and (global.character_select_in_this_menu == "main_game")
	or(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	and (global.create_level_from_template >= true)
	{
		global.ambience = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/ambience.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	{
		global.ambience = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/ambience.ogg");
	}
	else
	{
		global.ambience = noone;
	}
	#endregion /* Update Ambience END */
	
	#region /* Update Ambience Underwater */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg"))
	and (global.character_select_in_this_menu == "main_game")
	or(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	and (global.create_level_from_template >= true)
	{
		global.ambience_underwater = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg"))
	and (global.character_select_in_this_menu == "level_editor")
	{
		global.ambience_underwater = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg");
	}
	else
	{
		global.ambience_underwater = noone;
	}
	#endregion /* Update Ambience Underwater END */
	
}
else
{
	global.music = noone;
	global.music_underwater = noone;
	global.ambience = noone;
	global.ambience_underwater = noone;
}
#endregion /* Custom Music END */

shake = false;
scrolling_left = 0;

#region /* Assist Item */
if (asset_get_type("obj_assist_item") == asset_object)
and (asset_get_type("obj_player") == asset_object)
and (global.assist_enable = true)
{
	if (global.assist_item_appear < 10)
	{
		if (global.lives_until_assist >= global.assist_item_appear)
		or (global.assist_item_appear <= 0)
		{
			if (!instance_exists(obj_assist_item))
			and (instance_exists(obj_player))
			{
				with(instance_nearest(x, y, obj_player))
				{
					instance_create_depth(x - 32, y - 128, 0, obj_assist_item);
				}
			}
		}
	}
}
#endregion /* Assist Item END */

#region /* Start Timer */
time_second = 0;
if (instance_exists(obj_player))
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
{
	if (global.trigger_ending = false)
	{
		if (global.actually_play_edited_level = true)
		and (global.play_edited_level = true)
		and (global.checkpoint_x > 0)
		or (global.actually_play_edited_level = true)
		and (global.play_edited_level = true)
		and (global.checkpoint_y > 0)
		{
			global.timeattack_realmillisecond = global.checkpoint_realmillisecond;
			global.timeattack_millisecond = global.checkpoint_millisecond;
			global.timeattack_second = global.checkpoint_second;
			global.timeattack_minute = global.checkpoint_minute;
		}
		else
		{
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
		}
	}
}
#endregion /* Start Timer END */

#region /* Limit the number of sound channels, should be on 128 for best performance as default, but let the player change this in Audio Settings. From 32 to 256, 128 is default */
if (global.number_of_audio_channels = 0)
{
	audio_channel_num(32);
}
else
if (global.number_of_audio_channels = 1)
{
	audio_channel_num(64);
}
else
if (global.number_of_audio_channels = 2)
{
	audio_channel_num(96);
}
else
if (global.number_of_audio_channels = 3)
{
	audio_channel_num(128);
}
else
if (global.number_of_audio_channels = 4)
{
	audio_channel_num(160);
}
else
if (global.number_of_audio_channels = 5)
{
	audio_channel_num(192);
}
else
if (global.number_of_audio_channels = 6)
{
	audio_channel_num(224);
}
else
if (global.number_of_audio_channels = 7)
{
	audio_channel_num(256);
}
#endregion /* Limit the number of sound channels, should be on 128 for best performance as default, but let the player change this in Audio Settings. From 32 to 256, 128 is default END */

zoom_lerp = global.zoom_level;
zoom_border_lerp = 0;