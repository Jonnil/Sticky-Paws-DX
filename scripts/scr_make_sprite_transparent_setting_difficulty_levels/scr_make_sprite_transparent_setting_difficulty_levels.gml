function scr_make_sprite_transparent_setting_difficulty_levels()
{
	if (obj_leveleditor.quit_level_editor >= 1 && normal)
	{
		image_alpha = 1;
		image_blend = default_blend;
	}
	else
	if (obj_leveleditor.quit_level_editor == 0)
	{
		image_alpha = 0.1;
		switch (obj_leveleditor.difficulty_layer)
		{
			case 1:
				if (easy)
				{
					image_blend = c_lime;
					image_alpha = 1;
				}
				break;
			case 2:
				if (normal)
				{
					image_blend = c_yellow;
					image_alpha = 1
				}
				break;
			case 3:
				if (hard)
				{
					image_blend = c_red;
					image_alpha = 1;
				}
				break;
			default:
				if (easy && !hard)
				{
					if (normal) image_blend = default_blend;
					else image_blend = c_lime;
				}
				else
				if (!easy && hard)
				{
					if (normal) image_blend = default_blend;
					else image_blend = c_red;
				}
				else
				if (easy && normal && hard)
				{
					image_alpha = 1;
					image_blend = default_blend;
				}
				break;
		}
	}
}
