/* Seperate world map camera object from the normal level camera */
/* Exclusively used on the world map */
/* So no conflicting code from the normal camera is running */

scr_initialize_camera();

menu_delay = 0; /* When on world map, set menu delay to 0 */
menu_joystick_delay = 0;
menu_cursor_index = 0;
menu = "";
open_dropdown = false;

for(var i = 1; i <= global.max_players; i += 1)
{
	key_player_zoom_in_hold[i] = noone;
	key_player_zoom_out_hold[i] = noone;
	key_player_zoom_in_release[i] = noone;
	key_player_zoom_out_release[i] = noone;
}

reset_game_if_no_interactivity = 0;
reset_game_if_no_interactivity_second_countdown_timer = 0;
reset_game_if_no_interactivity_second_countdown = 60;

if (instance_exists(obj_player_map))
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

zoom_lerp = global.zoom_world_map;
zoom_border_lerp = 0;
show_zoom_value = 0;

instance_create_depth(0, 0, 0, obj_background_brightness_gameplay); /* Create Background Brightness in Gameplay */

set_controller_sprites_to_use();