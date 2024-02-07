#region /* When changing file, you should restart the room so the right save data can load */
if (current_file != global.file)
|| (!file_exists(working_directory + "save_file/file" + string(global.file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false; /* Turn OFF Room Persistency */
	global.quit_level = true;
	global.quit_to_map = true;
}
#endregion /* When changing file, you should restart the room so the right save data can load END */

if (sprite_lives_icon != spr_1up)
{
	scr_delete_sprite_properly(sprite_lives_icon);
}
sprite_lives_icon = spr_1up;
scr_set_character_folder(camera_player, camera_selected_skin);
sprite_lives_icon = scr_initialize_character_sprite("lives_icon", sprite_lives_icon);

set_controller_sprites_to_use();

scr_initialize_effects();