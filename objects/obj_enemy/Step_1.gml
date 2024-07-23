if (stomped_delay > 0)
{
	stomped_delay --;
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

var wall_below = place_meeting(x, y + 1, obj_wall) || place_meeting(x, y + 1, obj_enemy_only_wall);
var semisolid_platform_below = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_semisolid_platform, false, true) /* If there is semisolid platform underneath */

if (wall_below || semisolid_platform_below)
{
	on_ground = true;
}
else
{
	on_ground = false;
}

/* If you are not blind, then turn around when seeing pit */
if (!blind && !coil_spring && on_ground)
{
    var wall_right = !place_meeting(x + 5, y + 1, obj_wall) && !place_meeting(x + 5, y + 1, obj_enemy_only_wall) && !position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform);
    var wall_left = !place_meeting(x - 5, y + 1, obj_wall) && !place_meeting(x - 5, y + 1, obj_enemy_only_wall) && !position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform);
    if (wall_right)
    {
        image_xscale = -1;
    }
    else
	if (wall_left)
    {
        image_xscale = 1;
    }
}

if (die)
&& (!empty)
{
	scr_different_items_inside(bbox_top);
}

scr_dont_move_outside_view();

scr_coil_spring_bouncing();

if (invincibility_when_spawned > 0)
{
	invincibility_when_spawned--;
}

if (die_volting == -1 || die_volting == 1)
{
	depth = -1000;
	if (die_volting == -1)
	{
		image_angle -= 20;
		hspeed = +4;
	}
	else
	{
		image_angle += 20;
		hspeed = -4;
	}
	
	gravity_direction = 270; /* Direction of the gravity */
	gravity = 0.5; /* The gravity */
}