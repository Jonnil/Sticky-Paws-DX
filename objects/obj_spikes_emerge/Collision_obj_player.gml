#region /* Touching player */
if (image_angle == 0)
&& (position_meeting(x, y, other))
&& (sprite_index = spr_spikes_emerge)
{
	with(other)
	{
		y -= 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 90)
&& (position_meeting(x, y, other))
&& (sprite_index = spr_spikes_emerge)
{
	with(other)
	{
		x -= 22;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 180)
&& (position_meeting(x, y, other))
&& (sprite_index = spr_spikes_emerge)
{
	with(other)
	{
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 270)
&& (position_meeting(x, y, other))
&& (sprite_index = spr_spikes_emerge)
{
	with(other)
	{
		x += 22;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle == 0)
&& (sprite_index = spr_spikes_emerge)
&& (position_meeting(x, y - 4, other))
&& (other.dive)
{
	with(other)
	{
		dive = false;
		y -= 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 90)
&& (sprite_index = spr_spikes_emerge)
&& (position_meeting(x - 4, y, other))
&& (other.dive)
{
	with(other)
	{
		dive = false;
		x -= 22;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 180)
&& (sprite_index = spr_spikes_emerge)
&& (position_meeting(x, y + 4, other))
&& (other.dive)
{
	with(other)
	{
		dive = false;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 270)
&& (sprite_index = spr_spikes_emerge)
&& (position_meeting(x + 4, y, other))
&& (other.dive)
{
	with(other)
	{
		dive = false;
		x += 22;
		y += 22;
		smooth_teleport = 0;
	}
}
#endregion /* Touching player END */
