depth = -9999;
count = 0;
last_player = false;
iris_xscale = 16;
iris_yscale = 16;
iris_zoom = 0;
xx = x;
yy = y;
menu = "continue";
menu_cursor_index = 0;
game_over_menu_y = 64;
game_over_menu_seperation_distance = 64;
menu_delay = 0;

#region /*Game Over variables*/
game_over_sprite_y = - 300;
game_over_text_y = - 300;
sprite_game_over_character_portrait = noone;
#endregion /*Game Over variables END*/

default_voice_pitch = 1;
default_xscale = 1;
default_yscale = 1;

#region /*Save how many times you have died*/
if (global.character_select_in_this_menu = "main_game")
{
	var uppercase_level_name;
	uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
	uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
	var level_name = string(uppercase_level_name);
	
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	ini_write_real(level_name, "number_of_deaths", ini_read_real(level_name, "number_of_deaths", 0) + 1);
	ini_close();
}
else
if (global.character_select_in_this_menu = "level_editor")
{
	var uppercase_level_name;
	uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
	uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
	var level_name = string(uppercase_level_name);
	
	ini_open(working_directory + "save_files/custom_level_save.ini");
	ini_write_real(level_name, "number_of_deaths", ini_read_real(level_name, "number_of_deaths", 0) + 1);
	ini_close();
}
#endregion /*Save how many times you have died END*/

bubble = false;
if (bubble = false)
{
	lives -= 1;
	global.lives_until_assist += 1;
}
player = 1;
global.hud_show_lives = true;
if (asset_get_type("obj_camera") == asset_object)
and (instance_exists(obj_camera))
{
	with(obj_camera)
	{
		hud_show_lives_timer = global.hud_hide_time * 60;
	}
}
global.hud_show_deaths = true;
if (asset_get_type("obj_camera") == asset_object)
and (instance_exists(obj_camera))
{
	with(obj_camera)
	{
		hud_show_deaths_timer = global.hud_hide_time * 60;
	}
}

voice_damage = noone;
voice_burned_die = noone;

#region /*Disable the players for the camera*/

#region /*Disable player 1*/
if (player = 1)
{
	with(obj_camera)
	{
		can_spawn_player1 = false;
	}
}
#endregion /*Disable player 1 END*/

#region /*Disable player 2*/
if (player = 2)
{
	with(obj_camera)
	{
		can_spawn_player2 = false;
	}
}
#endregion /*Disable player 2 END*/

#region /*Disable player 3*/
if (player = 3)
{
	with(obj_camera)
	{
		can_spawn_player3 = false;
	}
}
#endregion /*Disable player 3 END*/

#region /*Disable player 4 */
if (player = 4)
{
	with(obj_camera)
	{
		can_spawn_player4 = false;
	}
}
#endregion /*Disable player 4 END*/

#endregion /*Disable the players for the camera END*/