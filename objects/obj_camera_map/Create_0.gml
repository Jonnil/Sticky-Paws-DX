/* Seperate world map camera object from the normal level camera */
/* Exclusively used on the world map */
/* So no conflicting code from the normal camera is running */

scr_initialize_camera();

menu_delay = 0; /* When on world map, set menu delay to 0 */
menu_joystick_delay = 0;
menu_cursor_index = 0;
menu = "";
open_dropdown = false;

key_player1_zoom_in_hold = noone;
key_player2_zoom_in_hold = noone;
key_player3_zoom_in_hold = noone;
key_player4_zoom_in_hold = noone;
key_player1_zoom_out_hold = noone;
key_player2_zoom_out_hold = noone;
key_player3_zoom_out_hold = noone;
key_player4_zoom_out_hold = noone;
key_player1_zoom_in_release = noone;
key_player2_zoom_in_release = noone;
key_player3_zoom_in_release = noone;
key_player4_zoom_in_release = noone;
key_player1_zoom_out_release = noone;
key_player2_zoom_out_release = noone;
key_player3_zoom_out_release = noone;
key_player4_zoom_out_release = noone;

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

#region /* Smooth the camera out even more */
view_wview_lerp = 0;
view_hview_lerp = 0;
#endregion /* Smooth the camera out even more END */

zoom_lerp = global.zoom_world_map;
zoom_border_lerp = 0;

instance_create_depth(0, 0, 0, obj_background_brightness_gameplay); /* Create Background Brightness in Gameplay */