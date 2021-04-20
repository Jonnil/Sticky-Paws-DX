#region /*Allow moves on world map*/
allow_free_movement = false; /*Turn this to true to move freely on the map instead of moving on paths, should be false by default*/
#endregion /*Allow moves on world map END*/

global.pause_room = noone;

#region /*Mouse x and mouse y initializing*/
mouse_x_position = mouse_x;
mouse_y_position = mouse_y;
#endregion /*Mouse x and mouse y initializing END*/

if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}
global.time_countdown = 500;
global.player_has_entered_goal = false;
global.quit_level = false;
global.quit_to_map = false;

#region /*Reset timer back to zero*/
global.timeattack_realmillisecond = 0;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
#endregion /*Reset timer back to zero END*/

image_speed = 0.3;
can_move = true;
can_enter = true;
entering_level = false;
delay = 0;
transfer_data = false;
fastest_time = 0;
move_delay = 0;
stop_at_level = false;
can_enter_level = 0;
game_saved_message = 256;
if (asset_get_type("obj_player_map_overlay") == asset_object)
and(!instance_exists(obj_player_map_overlay))
{
	instance_create_depth(x, y, 0, obj_player_map_overlay);
}
draw_xscale = 1;
draw_yscale = 1;

#region /*Load Game*/
if (file_exists("File" + string(global.file) + ".ini"))
{
	ini_open("File" + string(global.file) + ".ini");
	
	#region /*Load Player Position*/
	if (ini_read_real("Player", "player_x", 0) > 0)
	and(ini_read_real("Player", "player_y", 0) > 0)
	{
		x = ini_read_real("Player", "player_x", 0);
		y = ini_read_real("Player", "player_y", 0);
	}
	#endregion /*Load Player Position END*/
	
	ini_close();
	move_snap(32, 32);
}
#endregion /*Load Game END*/

xx = x;
yy = y;

iris_xscale = 0;
iris_yscale = 0;
iris_zoom = 0;

#region /*Play as custom character*/
initialize_custom_character_timer = 0;
custom_character = global.character_for_player_1;

sprite_map_xorig = 0;
sprite_map_yorig = 0;
sprite_map_enter_level_xorig = 0;
sprite_map_enter_level_yorig = 0;

index=0
sprite_map = noone;
sprite_map_enter_level = noone;
#endregion /*Play as custom character END*/

scr_loadconfig(); /*Load Config only once in create event, or it will mess up the options menu navigation*/