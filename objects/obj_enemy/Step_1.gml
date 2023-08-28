if (stomped_delay > 0)
{
	stomped_delay --;
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

var wall_below = place_meeting(x, y + 1, obj_wall)
	|| place_meeting(x, y + 1, obj_enemy_only_wall);
var semisolid_platform_below = position_meeting(x, bbox_bottom + 1, obj_semisolid_platform);

on_ground = wall_below || semisolid_platform_below;

/* If you are not blind, then turn around when seeing pit */
if (!blind && !coil_spring && on_ground)
{
    var wall_right = !place_meeting(x + 5, y + 1, obj_wall) && !place_meeting(x + 5, y + 1, obj_enemy_only_wall) && !position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform);
    var wall_left = !place_meeting(x - 5, y + 1, obj_wall) && !place_meeting(x - 5, y + 1, obj_enemy_only_wall) && !position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform);
    if (wall_right)
    {
        image_xscale = -1;
    }
    else if (wall_left)
    {
        image_xscale = 1;
    }
}