#region /* When changing file, you should restart the room so the right save data can load */
if (current_file != global.file)
|| (!file_exists(working_directory + "save_file/file" + string(global.file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false; /* Turn OFF Room Persistency */
	room_restart();
}
#endregion /* When changing file, you should restart the room so the right save data can load END */

#region /* Reload character if it doesn't match the saved character variables */
if (global.character_for_player[player] != custom_character)
|| (global.voicepack_for_player[player] != selected_voice_pack)
|| (global.skin_for_player[player] != selected_skin)
{
	default_xscale = 1;
	default_yscale = 1;
	sprite_map = noone;
	sprite_map_enter_level = noone;
	sprite_stand = noone;
	sprite_walk = noone;
	alarm[0] = 1;
}
#endregion /* Reload character if it doesn't match the saved character variables END */