function scr_load_object_placement_old()
{
	/* This is the old .txt level loading method. To make the levels load much faster, this function should not run. This is just here for compatiblity in case you need it for older .txt levels */
	/* If you need to play a old .txt level, simply add this function after calling the new "scr load object placement" function */
	
	#region /* Old level loading method */
	
	#region /* Load Level Editor Level */
	if (global.character_select_in_this_menu == "level_editor")
	{
			
			#region /* Object Placement */
			var file, str, str_pos, str_temp, val, num;
			if (global.level_name != "")
			&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/object_placement.txt"))
			{
				file = file_text_open_read(working_directory + "custom_levels/" + string(global.level_name) + "/data/object_placement.txt");
			}
			else
			{
				file = -1;
			}
			
			if (file != -1)
			{
				/* Next objects */
				str = file_text_read_string(file);
				//file_text_readln(file);
				str_temp = "";
				num = 0;
				str_pos = 1;
				while(str_pos < string_length(str))
				{
					/* | = chr("124") */
					/* } = chr("125") */
					while (string_char_at(str, str_pos) != "|")
					{
						str_temp += string_char_at(str, str_pos);
						str_pos ++;
					}
					val[num] = string(str_temp);
					str_temp = "";
					str_pos ++;
					num ++;
					if (num == 6)
					/* Number of variables to check for.
					val[0] = object,
					val[1] = x position,
					val[2] = y position,
					val[3] = easy,
					val[4] = normal,
					val[5] = hard */
					{
						num = 0;
						with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
						{
							object = val[2];
							easy = val[3];
							normal = val[4];
							hard = val[5];
							placed_for_the_first_time = false;
						}
					}
				}
				file_text_close(file);
			}
			#endregion /* Object Placement END */
		
			#region /* Object With Rotation Placement */
			var file, str, str_pos, str_temp, val, num;
			if (global.level_name != "")
			&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/object_rotation_placement.txt"))
			{
				file = file_text_open_read(working_directory + "custom_levels/" + string(global.level_name) + "/data/object_rotation_placement.txt");
			}
			else
			{
				file = -1;
			}
	
			if (file != -1)
			{
				/* Next objects */
				str = file_text_read_string(file);
				//file_text_readln(file);
				str_temp = "";
				num = 0;
				str_pos = 1;
				while(str_pos < string_length(str))
				{
					/* | = chr("124") */
					/* } = chr("125") */
					while (string_char_at(str, str_pos) != "|")
					{
						str_temp += string_char_at(str, str_pos);
						str_pos ++;
					}
					val[num] = string(str_temp);
					str_temp = "";
					str_pos ++;
					num ++;
					if (num == 8) /* Number of variables to check for.
					val[0] = object,
					val[1] = x position,
					val[2] = y position,
					val[3] = easy,
					val[4] = normal,
					val[5] = hard,
					val[6] = second_x,
					val[7] = second_y */
					{
						num = 0;
						with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
						{
							object = val[2];
							easy = val[3];
							normal = val[4];
							hard = val[5];
							second_x = val[6];
							second_y = val[7];
							placed_for_the_first_time = false;
						}
					}
				}
				file_text_close(file);
			}
			#endregion /* Object With Rotation Placement END */
		
	}
	#endregion /* Load Level Editor Level END */
	
	#endregion /* Old level loading method END */
	
}