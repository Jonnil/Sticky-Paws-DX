depth = -10;
time = 0;
mask_index = spr_small_mask;
cutscene = 0;
sprite_index = global.resource_pack_sprite_basic_enemy;
visible = false;
alarm_set(0, 1);

if (cutscene == 1) { /* When placed in level, use this cutscene value */
	if (global.character_select_in_this_menu == "main_game") {
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		if (ini_read_real("Player", "beat_last_level", false)) {
			instance_destroy();
		}
		ini_close();
	}
}