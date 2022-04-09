#region /*Controls for level editor*/
gamepad_set_axis_deadzone(0, 0.5);
key_up = (keyboard_check_pressed(global.player1_key_up)) and (!keyboard_check_pressed(global.player1_key_down))or(keyboard_check_pressed(vk_up)) and (!keyboard_check_pressed(vk_down))or(keyboard_check_pressed(ord("W"))) and (!keyboard_check_pressed(ord("S")))or(gamepad_button_check_pressed(0, gp_padu)) and (!gamepad_button_check_pressed(0, gp_padd))or(gamepad_axis_value(0, gp_axislv) < 0);
key_left = (keyboard_check_pressed(global.player1_key_left)) and (!keyboard_check_pressed(global.player1_key_right))or(keyboard_check_pressed(vk_left)) and (!keyboard_check_pressed(vk_right))or(keyboard_check_pressed(ord("A"))) and (!keyboard_check_pressed(ord("D")))or(gamepad_button_check_pressed(0, gp_padl)) and (!gamepad_button_check_pressed(0, gp_padr))or(gamepad_axis_value(0, gp_axislh) < 0);
key_right = (keyboard_check_pressed(global.player1_key_right)) and (!keyboard_check_pressed(global.player1_key_left))or(keyboard_check_pressed(vk_right)) and (!keyboard_check_pressed(vk_left))or(keyboard_check_pressed(ord("D"))) and (!keyboard_check_pressed(ord("A")))or(gamepad_button_check_pressed(0, gp_padr)) and (!gamepad_button_check_pressed(0, gp_padl))or(gamepad_axis_value(0, gp_axislh) > 0);
key_down = (keyboard_check_pressed(global.player1_key_down)) and (!keyboard_check_pressed(global.player1_key_up))or(keyboard_check_pressed(vk_down)) and (!keyboard_check_pressed(vk_up))or(keyboard_check_pressed(ord("S"))) and (!keyboard_check_pressed(ord("W")))or(gamepad_button_check_pressed(0, gp_padd)) and (!gamepad_button_check_pressed(0, gp_padu))or(gamepad_axis_value(0, gp_axislv) > 0);
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))or(keyboard_check_pressed(global.player1_key_jump))or(keyboard_check_pressed(ord("Z")));
key_a_released = (gamepad_button_check_released(0, gp_face1))or(keyboard_check_released(global.player1_key_jump))or(keyboard_check_released(ord("Z")));
key_a_hold = (gamepad_button_check(0, gp_face1))or(keyboard_check(global.player1_key_jump))or(keyboard_check(ord("Z")));
key_b_hold = (gamepad_button_check(0, gp_face2))or(keyboard_check(global.player1_key_sprint))or(keyboard_check(ord("X")))or(keyboard_check(vk_backspace));
key_b_pressed = (gamepad_button_check_pressed(0, gp_face2))or(keyboard_check_pressed(global.player1_key_sprint))or(keyboard_check_pressed(ord("X")))or(keyboard_check_pressed(vk_backspace))or(mouse_check_button_pressed(mb_right))or(mouse_check_button_pressed(mb_side1));
key_b_released = (gamepad_button_check_released(0, gp_face2))or(keyboard_check_released(global.player1_key_sprint))or(keyboard_check_released(ord("X")))or(keyboard_check_released(vk_backspace));
#endregion /*Controls for level editor END*/

depth = -300;

global.player_has_entered_goal = false;
global.time_countdown_bonus = 500;

old_window_get_height = 0;
old_window_get_width = 0;

#region /*Mouse x and mouse y initializing*/
mx = mouse_x;
my = mouse_y;
#endregion /*Mouse x and mouse y initializing END*/

sprite_basic_enemy = global.resource_pack_sprite_basic_enemy;
sprite_basic_enemy_blind = global.resource_pack_sprite_basic_enemy_blind;
sprite_enemy_bowlingball = global.resource_pack_sprite_enemy_bowlingball_walk;
sprite_enemy_bowlingball_blind = global.resource_pack_sprite_enemy_bowlingball_blind_walk;
sprite_big_stationary_enemy = global.resource_pack_sprite_big_stationary_enemy;

#region /*Lives Icon*/
if (global.player1_can_play = true)
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player_1;
}
else
if (global.player2_can_play = true)
{
	camera_player = 1;
	camera_selected_skin = global.skin_for_player_2;
}
else
if (global.player3_can_play = true)
{
	camera_player = 2;
	camera_selected_skin = global.skin_for_player_3;
}
else
if (global.player4_can_play = true)
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
alarm[0] = 1; /*Initialize custom character timer. This code needs to be initialized later than create event, but not in step event, so only initialize in alarm*/
#endregion /*Lives Icon END*/

#region /*Create Foreground*/
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
#endregion /*Create Foreground END*/

#region /*Create Background Brightness in Gameplay*/
if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
and (!instance_exists(obj_background_brightness_gameplay))
{
	instance_create_depth(x, y, 0, obj_background_brightness_gameplay);
}
#endregion /*Create Background Brightness in Gameplay END*/

#region /*Create level height and level width objects*/
if (asset_get_type("obj_level_height") == asset_object)
and (!instance_exists(obj_level_height))
{
	instance_create_depth(0, 1104, 0, obj_level_height);
}
if (asset_get_type("obj_level_width") == asset_object)
and (!instance_exists(obj_level_width))
{
	instance_create_depth(2720, 0, 0, obj_level_width);
}
if (asset_get_type("obj_water_level_height") == asset_object)
and (instance_exists(obj_level_height))
and (!instance_exists(obj_water_level_height))
{
	instance_create_depth(0, obj_level_height.y + 32, 0, obj_water_level_height);
}
#endregion /*Create level height and level width objects END*/


audio_stop_all();
if (global.actually_play_edited_level = true)
{
	instance_destroy();
}
room_speed = global.max_fps; /*Set correct fps*/
x = mouse_x;
y = mouse_y;
view_hview_lerp = 0;
view_wview_lerp = 0;
controller_x = mouse_x;
controller_y = mouse_y;
controller_view_speed = 8;
drag_x = mouse_x;
drag_y = mouse_y;
cursor_x = x;
cursor_y = y;
place_brush_size = 0; /*The size of the brush when placeing objects*/
erase_brush_size = 0; /*The size of the brush when erasing*/
can_make_place_brush_size_bigger = true; /*If you can make the brush size bigger for certain objects*/
can_put_objects_above_other_objects = false; /*If you can put objects above other objects*/
mouse_sprite = spr_cursor; /*Sets what cursor sprite to use*/
undo_and_redo_buttons_enabled = false; /*If undo and redo buttons should appear or not*/
tooltip = "";
show_tooltip = 0;
show_grid = false; /*Grid should be false when you start level editor*/
grid_alpha = 0;
zoom_in = false; /*When this is true, zoom in*/
zoom_reset = false; /*When this is true, reset zoom*/
zoom_out = false; /*When this is true, zoom out*/
difficulty_layer = 0; /* 0 = All, 1 = Easy, 2 = Normal, 3 = Hard*/
set_difficulty_mode = false; /*Toggle so you get a pen that can select what object appear in what difficulty*/
place_object = noone;
wall_surface_selected = 0; /*What kind of wall you're putting down*/
show_icons_at_bottom = false;
show_icons_at_top = false;
icons_at_bottom_y = +100;
show_undo_redo_icons = false; /*If the undo and redo buttons should show*/
undo_redo_icons_y = +200; /*Undo and redo buttons y postition*/
current_undo_value = 0; /*Every time you place down items, this value increases. When you undo, this value decreases.*/
icons_at_top_y = - 100;
icons_at_left_x =- 64;
selected_object = 0;
selected_object_menu_x = 0;
selected_menu_alpha = 0;
total_number_of_objects = 0;
use_controller = false;
drag_object = false;
erase_mode = false; /*When erasing, this turns true*/
fill_mode = false; /*When filling, this turns true*/
fill_mode_type = "fill"; /*What type of filling you will do. Fill, Horizontal, Vertical*/
can_input_level_name = false;
quit_level_editor = false;
menu_joystick_delay = 0;
pause = false;
menu_cursor_index = 0;
in_settings = false;
old_selected_resource_pack = global.selected_resource_pack;
can_navigate_settings_sidebar = true;
navigate_slider = false;
menu = "continue";
open_dropdown = false;
name_enter_blink= 0;
menu_delay = 10;
startup_loading_timer = 0;
background_brightness_lerp = 0;
background_brightness_menu_lerp = 0;
language_index = global.language_localization + 1;
language_mouse_scroll = 0;
scroll_view = false; /*If you can scroll the view or not*/
create_level_from_template_save_delay = 0; /*Save the level before starting to edit the template level*/

darken_settings_alpha = 0;
darken_settings_sidebar_alpha = 0;
accessibility_settings_y = 40;
game_text_y = 40 * 2;
game_settings_y = 40 * 3;
multiplayer_settings_y = 40 * 4;
controls_text_y = 40 * 5;
keyboard_and_mouse_settings_y = 40 * 6;
controller_settings_y = 40 * 7;
touch_settings_y = 40 * 8;
general_text_y = 40 * 9;
profile_settings_y = 40 * 10;
video_settings_y = 40 * 11;
audio_settings_y = 40 * 12;
global_resources_settings_y = 40 * 13;
storage_settings_y = 40 * 14;
language_settings_y = 40 * 15;
broadcast_settings_y = 40 * 16;
how_to_play_y = 40 * 17;
left_sidebar_x =-400;

play_level_icon_x = 32;
place_brush_icon_x = 96;
erase_icon_x = 160;
fill_icon_x = 224;
always_show_level_editor_buttons_x = 288;
grid_button_x = display_get_gui_width() - 224;

#region /*Options*/
remapping_player = 0;
input_key = false;
can_remap_key = false;
can_navigate = false;
menu_y_offset_real = 0;
menu_cursor_y_position = 0;
menu_remap_key_number = 0;

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

#region /*Customize look of Options Menu*/
menu_y_offset = - 100;
c_menu_outline = c_black;
c_menu_fill = c_white;
#endregion /*Customize look of Options Menu END*/

#endregion /*Options END*/

room_speed = global.max_fps; /*Room Speed is Max FPS*/

image_speed = 0;
image_index = 0;

#region /*Initialize level_information.ini*/
if (global.character_select_in_this_menu = "main_game")
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

or(global.character_select_in_this_menu = "level_editor")
and (global.create_level_from_template = true)
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

or(global.character_select_in_this_menu = "level_editor")
and (global.select_level_index <= 0)
and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

or(global.character_select_in_this_menu = "level_editor")
and (global.create_level_from_template >= 2)
and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

or(global.character_select_in_this_menu = "level_editor")
and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu = "main_game")
	or(global.create_level_from_template = true)
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
	
	#region /*Custom Backgrounds*/
	
	#region /*Custom Background 4 x and y parallax points*/
	#region /*Custom Background 4 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_parallax"))
	{
		custom_background_4_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
		}
		custom_background_4_y_parallax = 9;
	}
	#endregion /*Custom Background 4 y parallax point END*/
	
	#region /*Custom Background 4 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_parallax"))
	{
		custom_background_4_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
		}
		custom_background_4_x_parallax = 9;
	}
	#endregion /*Custom Background 4 x parallax point END*/
	#endregion /*Custom Background 4 x and y parallax points END*/
	
	#region /*Custom Background 3 x and y parallax points*/
	#region /*Custom Background 3 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_parallax"))
	{
		custom_background_3_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
		}
		custom_background_3_y_parallax = 7;
	}
	#endregion /*Custom Background 3 y parallax point END*/
	
	#region /*Custom Background 3 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_parallax"))
	{
		custom_background_3_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
		}
		custom_background_3_x_parallax = 7;
	}
	#endregion /*Custom Background 3 x parallax point END*/
	#endregion /*Custom Background 3 x and y parallax points END*/
	
	#region /*Custom Background 2 x and y parallax points*/
	#region /*Custom Background 2 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_parallax"))
	{
		custom_background_2_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
		}
		custom_background_2_y_parallax = 5;
	}
	#endregion /*Custom Background 2 y parallax point END*/
	
	#region /*Custom Background 2 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_parallax"))
	{
		custom_background_2_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
		}
		custom_background_2_x_parallax = 5;
	}
	#endregion /*Custom Background 2 x parallax point END*/
	#endregion /*Custom Background 2 x and y parallax points END*/
	
	#region /*Custom Background 1 x and y parallax points*/
	#region /*Custom Background 1 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_parallax"))
	{
		custom_background_1_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
		}
		custom_background_1_y_parallax = 3;
	}
	#endregion /*Custom Background 1 y parallax point END*/
	
	#region /*Custom Background 1 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_parallax"))
	{
		custom_background_1_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
		}
		custom_background_1_x_parallax = 3;
	}
	#endregion /*Custom Background 1 x parallax point END*/
	#endregion /*Custom Background 1 x and y parallax points END*/
	
	#region /*Custom Background 4 x and y offset points*/
	#region /*Custom Background 4 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_offset"))
	{
		custom_background_4_y_offset = ini_read_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
		}
		custom_background_4_y_offset = 0;
	}
	#endregion /*Custom Background 4 y offset point END*/
	
	#region /*Custom Background 4 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_offset"))
	{
		custom_background_4_x_offset = ini_read_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
		}
		custom_background_4_x_offset = 0;
	}
	#endregion /*Custom Background 4 x offset point END*/
	#endregion /*Custom Background 4 x and y offset points END*/
	
	#region /*Custom Background 3 x and y offset points*/
	#region /*Custom Background 3 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_offset"))
	{
		custom_background_3_y_offset = ini_read_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
		}
		custom_background_3_y_offset = 0;
	}
	#endregion /*Custom Background 3 y offset point END*/
	
	#region /*Custom Background 3 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_offset"))
	{
		custom_background_3_x_offset = ini_read_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
		}
		custom_background_3_x_offset = 0;
	}
	#endregion /*Custom Background 3 x offset point END*/
	#endregion /*Custom Background 3 x and y offset points END*/
	
	#region /*Custom Background 2 x and y offset points*/
	#region /*Custom Background 2 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_offset"))
	{
		custom_background_2_y_offset = ini_read_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
		}
		custom_background_2_y_offset = 0;
	}
	#endregion /*Custom Background 2 y offset point END*/
	
	#region /*Custom Background 2 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_offset"))
	{
		custom_background_2_x_offset = ini_read_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
		}
		custom_background_2_x_offset = 0;
	}
	#endregion /*Custom Background 2 x offset point END*/
	#endregion /*Custom Background 2 x and y offset points END*/
	
	#region /*Custom Background 1 x and y offset points*/
	#region /*Custom Background 1 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_offset"))
	{
		custom_background_1_y_offset = ini_read_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
		}
		custom_background_1_y_offset = 0;
	}
	#endregion /*Custom Background 1 y offset point END*/
	
	#region /*Custom Background 1 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_offset"))
	{
		custom_background_1_x_offset = ini_read_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
		}
		custom_background_1_x_offset = 0;
	}
	#endregion /*Custom Background 1 x offset point END*/
	#endregion /*Custom Background 1 x and y offset points END*/
	
	#endregion /*Custom Backgrounds END*/
	
	if (ini_key_exists("info", "make_every_tileset_into_default_tileset"))
	{
		global.make_every_tileset_into_default_tileset = ini_read_real("info", "make_every_tileset_into_default_tileset", false);
	}
	else
	{
		if (global.make_every_tileset_into_default_tileset = "level_editor")
		{
			ini_write_string("info", "make_every_tileset_into_default_tileset", false);
		}
		global.make_every_tileset_into_default_tileset = false;
	}
	if (ini_key_exists("info", "enable_time_countdown"))
	{
		global.time_countdown = ini_read_real("info", "enable_time_countdown", false);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_string("info", "enable_time_countdown", false);
		}
		global.enable_time_countdown = false;
	}
	if (ini_key_exists("info", "time_countdown"))
	{
		global.time_countdown = ini_read_real("info", "time_countdown", 500); /*Set the countdown to whatever is stored in the level_information.ini file*/
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_string("info", "time_countdown", 500);
		}
		global.time_countdown = 500;
	}
	if(global.play_edited_level = false)
	and (global.actually_play_edited_level = false)
	{
		if (ini_key_exists("info", "view_xview"))
		and (ini_key_exists("info", "view_yview"))
		{
			camera_set_view_pos(view_camera[view_current], ini_read_real("info", "view_xview", 0), ini_read_real("info", "view_yview", 0));
			x = ini_read_real("info", "view_xview", 0);
			y = ini_read_real("info", "view_yview", 0);
		}
		else
		if (ini_key_exists("info", "view_xview"))
		{
			camera_set_view_pos(view_camera[view_current], ini_read_real("info", "view_xview", 0), 0);
			x = ini_read_real("info", "view_xview", 0);
		}
		else
		if (ini_key_exists("info", "view_yview"))
		{
			camera_set_view_pos(view_camera[view_current], 0, ini_read_real("info", "view_yview", 0));
			y = ini_read_real("info", "view_yview", 0);
		}
	}
	
	ini_close();
}
else
{
	custom_background_1_x_offset = 0;
	custom_background_1_y_offset = 0;
	custom_background_2_x_offset = 0;
	custom_background_2_y_offset = 0;
	custom_background_3_x_offset = 0;
	custom_background_3_y_offset = 0;
	custom_background_4_x_offset = 0;
	custom_background_4_y_offset = 0;
	custom_background_1_x_parallax = 3;
	custom_background_1_y_parallax = 3;
	custom_background_2_x_parallax = 5;
	custom_background_2_y_parallax = 5;
	custom_background_3_x_parallax = 7;
	custom_background_3_y_parallax = 7;
	custom_background_4_x_parallax = 9;
	custom_background_4_y_parallax = 9;
	global.enable_time_countdown = false;
	global.time_countdown = 500;
	global.time_countdown_bonus = 500;
	global.make_every_tileset_into_default_tileset = false;
}
#endregion /*Initialize level_information.ini END*/

#region /*View Size*/
view_wview = 1392;
view_hview = 736;
/*Default Views:   set_view_wview = 1024 + 400 -32   set_view_hview = 768-32  */
#endregion /*View Size END*/

#region /*Initialize Background*/
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
#endregion /*Initialize Background END*/

/*HUD Show Controls keys that have been pressed*/
player1_show_controls_timer = 0;
player1_show_controls_alpha = 0;

#region /*Load Level*/

#region /*Destory all placed objects before loading the level, just in case there is leftover placed objects*/
with(obj_leveleditor_placed_object)
{
	instance_destroy();
}
#endregion /*Destory all placed objects before loading the level, just in case there is leftover placed objects END*/

#region /*Load Main Game Level*/
if (global.character_select_in_this_menu = "main_game")
or(global.create_level_from_template = true)
{
	
	#region /*Object Placement*/
	var file, str, str_pos, str_temp, val, num;
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement.txt"))
	{
		file = file_text_open_read("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement.txt");
	}
	else
	{
		file = -1;
	}
	
	if (file != -1)
	{
		/*Next objects*/
		str = file_text_read_string(file);
		//file_text_readln(file);
		str_temp = "";
		num = 0;
		str_pos = 1;
		while(str_pos < string_length(str))
		{
			while (string_char_at(str, str_pos) != "|")
			{
				str_temp += string_char_at(str, str_pos);
				str_pos += 1;
			}
			val[num] = string(str_temp);
			str_temp = "";
			str_pos += 1;
			num += 1;
			if (num = 6) /*Number of variables to check for.
			val[0] = object,
			val[1] = x position,
			val[2] = y position,
			val[3] = easy,
			val[4] = normal,
			val[5] = hard*/
			{
				num = 0;
				with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
				{
					object = val[2];
					easy = val[3];
					normal = val[4];
					hard = val[5];
					placed_for_the_first_time = false;
				}
			}
		}
		file_text_close(file);
	}
	#endregion /*Object Placement END*/
	
	#region /*Object With Rotation Placement*/
	var file, str, str_pos, str_temp, val, num;
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_rotation_placement.txt"))
	{
		file = file_text_open_read("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_rotation_placement.txt");
	}
	else
	{
		file = -1;
	}
	
	if (file != -1)
	{
		/*Next objects*/
		str = file_text_read_string(file);
		//file_text_readln(file);
		str_temp = "";
		num = 0;
		str_pos = 1;
		while(str_pos < string_length(str))
		{
			while (string_char_at(str, str_pos) != "|")
			{
				str_temp += string_char_at(str, str_pos);
				str_pos += 1;
			}
			val[num] = string(str_temp);
			str_temp = "";
			str_pos += 1;
			num += 1;
			if (num = 8) /*Number of variables to check for.
			val[0] = object,
			val[1] = x position,
			val[2] = y position,
			val[3] = easy,
			val[4] = normal,
			val[5] = hard,
			val[6] = second_x,
			val[7] = second_y*/
			{
				num = 0;
				with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
				{
					object = val[2];
					easy = val[3];
					normal = val[4];
					hard = val[5];
					second_x = val[6];
					second_y = val[7];
					placed_for_the_first_time = false;
				}
			}
		}
		file_text_close(file);
	}
	#endregion /*Object With Rotation Placement END*/
	
}
#endregion /*Load Main Game Level END*/

else

#region /*Load Level Editor Level*/
if (global.character_select_in_this_menu = "level_editor")
{
	
	#region /*Create directories*/

	#region /*Create directory for saving custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name));
	}
	#endregion /*Create directory for saving custom levels END*/
	
	#region /*Create directory for backgrouns in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds");
	}
	#endregion /*Create directory for backgrounds in custom levels END*/
	
	#region /*Create directory for data in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/data");
	}
	#endregion /*Create directory for data in custom levels END*/
	
	#region /*Create directory for sounds in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds");
	}
	#endregion /*Create directory for sounds in custom levels END*/
	
	#region /*Create directory for melody in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/melody"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/melody");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/melody"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/melody");
	}
	#endregion /*Create directory for melody in custom levels END*/
	
	#region /*Create directory for music in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/music"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/music");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/music"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/music");
	}
	#endregion /*Create directory for music in custom levels END*/
	
	#region /*Create directory for sound effects in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/sound_effect"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/sound_effect");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/sound_effect"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/sound_effect");
	}
	#endregion /*Create directory for sound effects in custom levels END*/
	
	#region /*Create directory for ambience in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/ambience"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sounds/ambience");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/ambience"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sounds/ambience");
	}
	#endregion /*Create directory for ambience in custom levels END*/
	
	#region /*Create directory for tilesets in custom levels*/
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets"))
	{
		directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets");
	}
	else
	if (global.level_name != "")
	and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets"))
	{
		directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets");
	}
	#endregion /*Create directory for tilesets in custom levels END*/
	
	#endregion /*Create directories END*/
	
		#region /*Object Placement*/
		var file, str, str_pos, str_temp, val, num;
		if (global.select_level_index >= 1)
		and (global.create_level_from_template = false)
		and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_placement.txt"))
		{
			file = file_text_open_read(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_placement.txt");
		}
		else
		if (global.level_name != "")
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement.txt"))
		{
			file = file_text_open_read(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement.txt");
		}
		else
		{
			file = -1;
		}
	
		if (file != -1)
		{
			/*Next objects*/
			str = file_text_read_string(file);
			//file_text_readln(file);
			str_temp = "";
			num = 0;
			str_pos = 1;
			while(str_pos < string_length(str))
			{
				while (string_char_at(str, str_pos) != "|")
				{
					str_temp += string_char_at(str, str_pos);
					str_pos += 1;
				}
				val[num] = string(str_temp);
				str_temp = "";
				str_pos += 1;
				num += 1;
				if (num = 6) /*Number of variables to check for.
				val[0] = object,
				val[1] = x position,
				val[2] = y position,
				val[3] = easy,
				val[4] = normal,
				val[5] = hard*/
				{
					num = 0;
					with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
					{
						object = val[2];
						easy = val[3];
						normal = val[4];
						hard = val[5];
						placed_for_the_first_time = false;
					}
				}
			}
			file_text_close(file);
		}
		#endregion /*Object Placement END*/
		
		#region /*Object With Rotation Placement*/
		var file, str, str_pos, str_temp, val, num;
		if (global.select_level_index >= 1)
		and (global.create_level_from_template = false)
		and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_rotation_placement.txt"))
		{
			file = file_text_open_read(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_rotation_placement.txt");
		}
		else
		if (global.level_name != "")
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_rotation_placement.txt"))
		{
			file = file_text_open_read(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_rotation_placement.txt");
		}
		else
		{
			file = -1;
		}
	
		if (file != -1)
		{
			/*Next objects*/
			str = file_text_read_string(file);
			//file_text_readln(file);
			str_temp = "";
			num = 0;
			str_pos = 1;
			while(str_pos < string_length(str))
			{
				while (string_char_at(str, str_pos) != "|")
				{
					str_temp += string_char_at(str, str_pos);
					str_pos += 1;
				}
				val[num] = string(str_temp);
				str_temp = "";
				str_pos += 1;
				num += 1;
				if (num = 8) /*Number of variables to check for.
				val[0] = object,
				val[1] = x position,
				val[2] = y position,
				val[3] = easy,
				val[4] = normal,
				val[5] = hard,
				val[6] = second_x,
				val[7] = second_y*/
				{
					num = 0;
					with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
					{
						object = val[2];
						easy = val[3];
						normal = val[4];
						hard = val[5];
						second_x = val[6];
						second_y = val[7];
						placed_for_the_first_time = false;
					}
				}
			}
			file_text_close(file);
		}
		#endregion /*Object With Rotation Placement END*/
		
}
#endregion /*Load Level Editor Level END*/

#endregion /*Load Level END*/