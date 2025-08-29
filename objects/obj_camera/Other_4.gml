#region /* When changing file, you should restart the room so the right save data can load */
if (current_file != global.file)
|| (!file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false; /* Turn OFF Room Persistency */
	global.quit_level = true;
	global.quit_to_world = true;
}
#endregion /* When changing file, you should restart the room so the right save data can load END */

if (sprite_lives_icon != spr_1up)
{
	scr_delete_sprite_properly(sprite_lives_icon);
}
sprite_lives_icon = spr_1up;
scr_set_character_folder(camera_player, camera_selected_skin);
ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
sprite_lives_icon = scr_initialize_character_sprite("lives_icon", sprite_lives_icon);
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

set_controller_sprites_to_use();

scr_initialize_effects();

global.deactivate_timer = 999; /* Force update deactivate region */
