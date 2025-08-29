#region /* When changing file, you should restart the room so the right save data can load */
if (current_file != global.file)
|| (!file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false; /* Turn OFF Room Persistency */
	room_restart();
}
#endregion /* When changing file, you should restart the room so the right save data can load END */

#region /* Reload character if it doesn't match the saved character variables */
if (global.character_for_player[player] != custom_character)
|| (global.voicepack_for_player[player] != selected_voicepack)
|| (global.skin_for_player[player] != selected_skin)
{
	custom_character = global.character_for_player[player];
	selected_voicepack = global.voicepack_for_player[player];
	selected_skin = global.skin_for_player[player];

	default_xscale = 1;
	default_yscale = 1;
	sprite_world = noone;
	sprite_world_enter_level = noone;
	sprite_idle = noone;
	sprite_walk = noone;
	alarm[0] = 1;
}
#endregion /* Reload character if it doesn't match the saved character variables END */
