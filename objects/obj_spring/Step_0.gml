image_angle = point_direction(x, y, second_x, second_y) -90;

if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index=spr_wall;
}

if (can_bounce > 0)
{
	can_bounce -= 1;
}

#region /*Make player spring*/
if (asset_get_type("obj_player") == asset_object)
and (place_meeting(x, y, instance_nearest(x, y, obj_player)))
and (instance_exists(obj_player))
and (can_bounce = 0)
{
	if (asset_get_type("snd_spring") == asset_sound)
	{
		audio_play_sound(snd_spring, 0, 0);
		audio_sound_pitch(snd_spring, 1);
		audio_sound_gain(snd_spring, global.sfx_volume, 0);
	}
	if (instance_nearest(x, y, obj_player).horizontal_rope_climb = false)
	{
		image_index = 1;
		image_speed = 1;
		with(instance_nearest(x, y, obj_player))
		{
			can_climb_horizontal_rope_cooldown = 10;
			midair_jumps_left = number_of_jumps;
			can_ground_pound = false;
			chain_reaction = 0;
			dive = false;
			draw_xscale = 0.5;
			draw_yscale = 1.5;
			horizontal_rope_climb = false;
			ledge_grab_jump = false;
			speed_max = 4;
			spring = true;
			stick_to_wall = false;
			climb = false;
		}
	}
}
#endregion /*Make player spring END*/

#region /*Stop animation when animation is finished, don't loop*/
if (image_index > image_number - 1)
{
	image_index= 0;
	image_speed = 0;
}
#endregion /*Stop animation when animation is finished, don't loop END*/