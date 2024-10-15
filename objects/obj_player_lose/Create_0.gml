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
menu_joystick_delay = 0;
open_dropdown = false;
burnt = false;
controller_connected = false;
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
	var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
	
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	ini_write_real(level_name, "number_of_defeats", ini_read_real(level_name, "number_of_defeats", 0) + 1);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
else
if (global.character_select_in_this_menu == "level_editor")
{
	var level_name = global.level_name;
	
	ini_open(game_save_id + "save_file/custom_level_save.ini");
	ini_write_real(level_name, "number_of_defeats", ini_read_real(level_name, "number_of_defeats", 0) + 1);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
#endregion /* Save how many times you have died END */

if (lives > 0)
&& (!global.doing_clear_check_level) /* If you are doing a clear check for uploading level or character, then don't lose lives, you should get infinite tries */
&& (!global.doing_clear_check_character)
{
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		ini_write_real("Player", "lives", lives - 1);
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	var time_source = time_source_create(time_source_game, 30, time_source_units_frames, function()
	{
		if (lives > 0)
		{
			lives --;
		}
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_lives_y = 42; /* Make the lives counter in HUD shake downward when you lose */
		}
	}
	, [], 1);
	time_source_start(time_source);
	var time_source = time_source_create(time_source_game, 40, time_source_units_frames, function()
	{
		global.lives_until_assist ++;
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_defeats_y = 80; /* Make the defeats counter in HUD shake downward when you lose */
		}
	}
	, [], 1);
	time_source_start(time_source);
}
player = 1;

voice_damage = noone;
voice_burned_die = noone;
player_lose_melody = noone;

alarm[0] = 1;