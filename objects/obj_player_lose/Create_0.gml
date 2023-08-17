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
menu_delay = 3;
open_dropdown = false;
if (bbox_top >= room_height)
{
	continue_falling = true;
}
else
{
	continue_falling = false;
}

#region /* Game Over variables */
game_over_sprite_y = - 300;
game_over_text_y = - 300;
sprite_game_over_character_portrait = noone;
#endregion /* Game Over variables END */

default_voice_pitch = 1;
default_xscale = 1;
default_yscale = 1;

#region /* Save how many times you have died */
if (global.character_select_in_this_menu == "main_game")
{
	var level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
	
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	ini_write_real(level_name, "number_of_deaths", ini_read_real(level_name, "number_of_deaths", 0) + 1);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
if (global.character_select_in_this_menu == "level_editor")
{
	var level_name = string(global.level_name);
	
	ini_open(working_directory + "save_files/custom_level_save.ini");
	ini_write_real(level_name, "number_of_deaths", ini_read_real(level_name, "number_of_deaths", 0) + 1);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
#endregion /* Save how many times you have died END */

if (lives > 0)
{
	lives --;
	global.lives_until_assist ++;
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		ini_write_real("Player", "lives", lives);
		ini_close();
	}
}
player = 1;

voice_damage = noone;
voice_burned_die = noone;
player_lose_melody = noone;

if (instance_exists(obj_camera))
{
	obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
	obj_camera.hud_show_deaths_timer = global.hud_hide_time * 60;
	
	#region /* Disable the players for the camera */
	if (player == 1) /* Disable player 1 */
	{
		obj_camera.player1 = noone;
		obj_camera.can_spawn_player1 = false;
	}
	if (player == 2) /* Disable player 2 */
	{
		obj_camera.player2 = noone;
		obj_camera.can_spawn_player2 = false;
	}
	if (player == 3) /* Disable player 3 */
	{
		obj_camera.player3 = noone;
		obj_camera.can_spawn_player3 = false;
	}
	if (player == 4) /* Disable player 4 */
	{
		obj_camera.player4 = noone;
		obj_camera.can_spawn_player4 = false;
	}
	#endregion /* Disable the players for the camera END */
	
}