function scr_draw_level_tags(draw_tags_x = display_get_gui_width() * 0.5, draw_tags_y = display_get_gui_height() * 0.5, show_if_no_tags = true, halign = fa_center, one_line = true, text_size = global.default_text_size, alpha = 1) {

	var text_prefix = "";
	var new_line = "\n";
	
	if (one_line)
	{
		text_prefix = l10n_text("Tags") + ": ";
		new_line = "";
	}

	#region /* How many tags */
	var tag_art_text = "";
	var tag_boss_battle_text = "";
	var tag_dont_move_text = "";
	var tag_kaizo_text = "";
	var tag_multiplayer_text = "";
	var tag_music_text = "";
	var tag_puzzle_solving_text = "";
	var tag_short_and_sweet_text = "";
	var tag_singleplayer_text = "";
	var tag_speedrun_text = "";
	var tag_standard_text = "";
	var tag_technical_text = "";
	var tag_themed_text = "";
	var tag_glitch_showcase_text = "";
	
	how_many_tags = 0;
	if (tag_art){tag_art_text = "Art" + " " + new_line;how_many_tags++;}
	if (tag_boss_battle){tag_boss_battle_text = "Boss Battle" + " " + new_line;how_many_tags++;}
	if (tag_dont_move){tag_dont_move_text = "Don't Move" + " " + new_line;how_many_tags++;}
	if (tag_kaizo){tag_kaizo_text = "Kaizo" + " " + new_line;how_many_tags++;}
	if (tag_multiplayer){tag_multiplayer_text = "Multiplayer Only" + " " + new_line;how_many_tags++;}
	if (tag_music){tag_music_text = "Music" + " " + new_line;how_many_tags++;}
	if (tag_puzzle_solving){tag_puzzle_solving_text = "Puzzle-solving" + " " + new_line;how_many_tags++;}
	if (tag_short_and_sweet){tag_short_and_sweet_text = "Short and Sweet" + " " + new_line;how_many_tags++;}
	if (tag_singleplayer){tag_singleplayer_text = "Singleplayer Only" + " " + new_line;how_many_tags++;}
	if (tag_speedrun){tag_speedrun_text = "Speedrun" + " " + new_line;how_many_tags++;}
	if (tag_standard){tag_standard_text = "Standard" + " " + new_line;how_many_tags++;}
	if (tag_technical){tag_technical_text = "Technical" + " " + new_line;how_many_tags++;}
	if (tag_themed){tag_themed_text = "Themed" + " " + new_line;how_many_tags++;}
	if (tag_glitch_showcase){tag_glitch_showcase_text = "Glitch Showcase" + " " + new_line;how_many_tags++;}
	#endregion /* How many tags END */

	#region /* Draw Level Tags */
	draw_set_halign(halign);
	draw_set_valign(fa_top);
	
	if (show_if_no_tags
	&& how_many_tags == 0)
	{
		scr_draw_text_outlined(draw_tags_x, draw_tags_y, l10n_text("Tags") + ": " + l10n_text("None"), text_size, c_black, c_white, 1);
		scr_draw_text_outlined(draw_tags_x, draw_tags_y, l10n_text("Tags") + ": " + l10n_text("None"), text_size, c_black, c_red, scr_wave(0, 1, 1, 0));
	}
	else
	if (how_many_tags >= 1
	&& how_many_tags <= 3)
	{
		scr_draw_text_outlined(draw_tags_x, draw_tags_y, text_prefix +
		string(tag_art_text) +
		string(tag_boss_battle_text) +
		string(tag_dont_move_text) +
		string(tag_kaizo_text) +
		string(tag_multiplayer_text) +
		string(tag_music_text) +
		string(tag_puzzle_solving_text) +
		string(tag_short_and_sweet_text) +
		string(tag_singleplayer_text) +
		string(tag_speedrun_text) +
		string(tag_standard_text) +
		string(tag_technical_text) +
		string(tag_themed_text) +
		string(tag_glitch_showcase_text)
		, text_size, c_black, c_white, 1 * alpha);
	}
	else if (show_if_no_tags && how_many_tags >= 4) {
		/* If you have more than 3 tags, show message that you can only have 3 tags max */
		scr_draw_text_outlined(draw_tags_x, draw_tags_y, string("A level can only have three tags!"), text_size, c_black, c_white, 1 * alpha);
		scr_draw_text_outlined(draw_tags_x, draw_tags_y, string("A level can only have three tags!"), text_size, c_black, c_red, scr_wave(0, 1, 1, 0) * alpha);
	}
	#endregion /* Draw Level Tags END */

}

function scr_load_level_tags(level_path) {

	#region /* loads tags from level_information.ini */
	ini_open(level_path + "/data/level_information.ini");
	tag_art = ini_read_real("tags", "tag_art", false);
	tag_boss_battle = ini_read_real("tags", "tag_boss_battle", false);
	tag_dont_move = ini_read_real("tags", "tag_dont_move", false);
	tag_kaizo = ini_read_real("tags", "tag_kaizo", false);
	tag_multiplayer = ini_read_real("tags", "tag_multiplayer", false);
	tag_music = ini_read_real("tags", "tag_music", false);
	tag_puzzle_solving = ini_read_real("tags", "tag_puzzle_solving", false);
	tag_short_and_sweet = ini_read_real("tags", "tag_short_and_sweet", false);
	tag_singleplayer = ini_read_real("tags", "tag_singleplayer", false);
	tag_speedrun = ini_read_real("tags", "tag_speedrun", false);
	tag_standard = ini_read_real("tags", "tag_standard", false);
	tag_technical = ini_read_real("tags", "tag_technical", false);
	tag_themed = ini_read_real("tags", "tag_themed", false);
	tag_glitch_showcase = ini_read_real("tags", "glitch_showcase", false);
	intended_level_difficulty = ini_read_real("info", "intended_level_difficulty", 1);
	ini_close();
	#endregion /* loads tags from level_information.ini END */

}
