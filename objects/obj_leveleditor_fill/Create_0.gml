delay = 0;
fill_mode_type = "fill";
move_snap(global.grid_hsnap, global.grid_vsnap);
mask_index = spr_wall;

free_left = (!place_meeting(x - 32, y, obj_leveleditor_placed_object))
and (!place_meeting(x - 32, y, obj_leveleditor_fill))
and (!place_meeting(x - 32, y, obj_level_player_1_start))
and (!place_meeting(x - 32, y, obj_level_player_2_start))
and (!place_meeting(x - 32, y, obj_level_player_3_start))
and (!place_meeting(x - 32, y, obj_level_player_4_start))
and (x > camera_get_view_x(view_camera[view_current]));

free_right = (!place_meeting(x + 32, y, obj_leveleditor_placed_object))
and (!place_meeting(x + 32, y, obj_leveleditor_fill))
and (!place_meeting(x + 32, y, obj_level_player_1_start))
and (!place_meeting(x + 32, y, obj_level_player_2_start))
and (!place_meeting(x + 32, y, obj_level_player_3_start))
and (!place_meeting(x + 32, y, obj_level_player_4_start))
and (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))

free_up = (!place_meeting(x, y - 32, obj_leveleditor_placed_object))
and (!place_meeting(x, y - 32, obj_leveleditor_fill))
and (!place_meeting(x, y - 32, obj_level_player_1_start))
and (!place_meeting(x, y - 32, obj_level_player_2_start))
and (!place_meeting(x, y - 32, obj_level_player_3_start))
and (!place_meeting(x, y - 32, obj_level_player_4_start))
and (y > camera_get_view_y(view_camera[view_current]))

free_down = (!place_meeting(x, y + 32, obj_leveleditor_placed_object))
and (!place_meeting(x, y + 32, obj_leveleditor_fill))
and (!place_meeting(x, y + 32, obj_level_player_1_start))
and (!place_meeting(x, y + 32, obj_level_player_2_start))
and (!place_meeting(x, y + 32, obj_level_player_3_start))
and (!place_meeting(x, y + 32, obj_level_player_4_start))
and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))