move_snap(global.grid_hsnap, global.grid_vsnap);
delay++;

// If overlapping a player start or if x is out-of-bounds, destroy self:
if (
    (instance_exists(obj_level_player1_start) && place_meeting(x, y, obj_level_player1_start)) ||
    (instance_exists(obj_level_player2_start) && place_meeting(x, y, obj_level_player2_start)) ||
    (instance_exists(obj_level_player3_start) && place_meeting(x, y, obj_level_player3_start)) ||
    (instance_exists(obj_level_player4_start) && place_meeting(x, y, obj_level_player4_start)) ||
    (x < camera_get_view_x(view_camera[view_current])) ||
    (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])) ||
	(y < camera_get_view_y(view_camera[view_current])) ||
    (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
)
{
    instance_destroy();
}
else
{
    if (delay > 1)
    {
        // Spawn new fill instances based on the fill_mode_type and delay value:
        if (fill_mode_type == "fill")
        {
            if (free_down && (delay == 2))
            {
                with (instance_create_depth(x, y + 32, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "fill";
                }
            }
            else
			if (free_left && (delay == 3))
            {
                with (instance_create_depth(x - 32, y, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "horizontal";
                }
            }
            else
			if (free_right && (delay == 4))
            {
                with (instance_create_depth(x + 32, y, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "horizontal";
                }
            }
            else
			if (free_up && (delay == 5))
            {
                with (instance_create_depth(x, y - 32, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "fill";
                }
            }
        }
        else
		if (fill_mode_type == "horizontal")
        {
            if (free_left)
            {
                with (instance_create_depth(x - 32, y, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "horizontal";
                }
            }
            if (free_right)
            {
                with (instance_create_depth(x + 32, y, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "horizontal";
                }
            }
        }
        else
		if (fill_mode_type == "vertical")
        {
            if (free_up)
            {
                with (instance_create_depth(x, y - 32, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "vertical";
                }
            }
            if (free_down)
            {
                with (instance_create_depth(x, y + 32, 0, obj_leveleditor_fill))
                {
                    fill_mode_type = "vertical";
                }
            }
        }

        // Before placing the actual object, check if this is an enemy-type that counts toward the entity limit.
        if (
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_VENGEFUL_SPIRIT) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BOSS) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING) ||
            (obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING)
        )
        {
            if (global.part_limit_entity >= 100)
            {
                // Prevent placement by destroying this fill instance.
                instance_destroy();
                exit;
            }
            else
            {
                global.part_limit_entity++;
                global.part_limit_entity_text_alpha = 3;
            }
        }

        // Place the object
        with (instance_create_depth(x, y, 0, obj_leveleditor_placed_object))
        {
            if (instance_exists(obj_leveleditor))
            {
                object = obj_leveleditor.place_object;
                placed_for_the_first_time = false;
            }
        }

        // Destroy this fill object when the delay threshold is met.
        if ((fill_mode_type == "fill"
		&& delay >= 5)
		|| (fill_mode_type != "fill"
		&& delay >= 1))
        {
            instance_destroy();
        }
    }
}
