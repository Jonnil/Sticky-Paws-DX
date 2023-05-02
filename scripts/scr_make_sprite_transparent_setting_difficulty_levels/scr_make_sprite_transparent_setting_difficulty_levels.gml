function scr_make_sprite_transparent_setting_difficulty_levels() {
	if (!global.actually_play_edited_level) {
		var default_blend = c_white;
		for (i = 0; i < ds_grid_height(global.object_grid) - 1; i++) {
			if (object == ds_grid_get(global.object_grid, 0, i)) {
				default_blend = ds_grid_get(global.object_grid, 6, i);
				break;
			}
		}
	}
	
	if (global.character_select_in_this_menu == "level_editor") {
	    
		if (obj_leveleditor.quit_level_editor >= true &&
		    normal == true) {
		    
			image_alpha = 1;
			image_blend = default_blend;
			
		} else if (obj_leveleditor.quit_level_editor == false) {
			
			if (easy && !normal && !hard) {
				image_alpha = 0.1;
				image_blend = c_lime;
			} else if (easy && normal && !hard) {
				image_alpha = 0.1;
				image_blend = default_blend;
			} else if (!easy && normal && !hard) {
				image_alpha = 0.1;
				image_blend = c_yellow;
			} else if (!easy && normal && hard) {
				image_alpha = 0.1;
				image_blend = default_blend;
			} else if (!easy && !normal && hard) {
				image_alpha = 0.1;
				image_blend = c_red;
			} else if (easy && !normal && hard) {
				image_alpha = 0.1;
				image_blend = default_blend;
			} else if (easy && normal && hard) {
				image_alpha = 1;
				image_blend = default_blend;
			}
			
			switch (obj_leveleditor.difficulty_layer) {
				case 1:
					if (easy) {
						image_alpha = 1;
						image_blend = c_lime;
					}
					break;
				case 2:
					if (normal) {
						image_alpha = 1;
						image_blend = c_yellow;
					}
					break;
				case 3:
					if (hard) {
						image_alpha = 1;
						image_blend = c_red;
					}
					break;
			}
		}
	}
}