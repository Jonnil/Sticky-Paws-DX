#region /* Touching player */
if (image_angle == 0)
&& (place_meeting(x, y - 2, other))
&& (!place_meeting(x - 1, y, other))
&& (!place_meeting(x + 1, y, other))
|| (image_angle = 90)
&& (place_meeting(x - 2, y, other))
&& (!place_meeting(x, y - 1, other))
&& (!place_meeting(x, y + 1, other))
|| (image_angle = 180)
&& (place_meeting(x, y + 2, other))
&& (!place_meeting(x - 1, y, other))
&& (!place_meeting(x + 1, y, other))
|| (image_angle = 270)
&& (place_meeting(x + 2, y, other))
&& (!place_meeting(x, y - 1, other))
&& (!place_meeting(x, y + 1, other))
{
	if (sprite_index = spr_spikes_emerge)
	{
		with(other)
		{
			if (invincible_timer == false)
			{
				if (have_heart_balloon)
				{
					have_heart_balloon = false;
					
					#region /* Save heart balloon to be false */
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player" + string(player) + "_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					#endregion /* Save heart balloon to be false END */
					
				}
				else
				{
					hp --;
				}
				taken_damage = 100;
			}
		}
	}
}

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