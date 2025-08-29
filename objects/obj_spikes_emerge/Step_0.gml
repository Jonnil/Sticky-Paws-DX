#region /* If spikes are disabled, destroy this object */
if (global.assist_enable)
&& (!global.assist_enable_spikes)
{
	instance_destroy();
}
#endregion /* If spikes are disabled, destroy this object */






#region /* Normal timing */
if (global.spikes_emerge_time < 60)
{
	if (!timer_offset)
	{
		sprite_index = spr_spikes_emerge;
		mask_index = spr_spikes_emerge;
		image_speed = 1;
	}
	else
	if (timer_offset)
	{
		sprite_index = spr_spikes_emerge_in;
		image_speed = 1;
		mask_index = noone;
	}
}
else
if (global.spikes_emerge_time < 60 * 2)
&& (global.spikes_emerge_time > 60)
{
	if (!timer_offset)
	{
		sprite_index = spr_spikes_emerge_in;
		image_speed = 1;
		mask_index = noone;
	}
	else
	if (timer_offset)
	{
		sprite_index = spr_spikes_emerge_half_out;
		image_speed = 1;
		mask_index = noone;
	}
}
else
if (global.spikes_emerge_time < 60 * 3)
&& (global.spikes_emerge_time > 60 * 2)
{
	if (!timer_offset)
	{
		sprite_index = spr_spikes_emerge_in;
		image_speed = 1;
		mask_index = noone;
	}
	else
	if (timer_offset)
	{
		sprite_index = spr_spikes_emerge;
		mask_index = spr_spikes_emerge;
		image_speed = 1;
	}
}
else
if (global.spikes_emerge_time > 60 * 3)
{
	if (!timer_offset)
	{
		sprite_index = spr_spikes_emerge_half_out;
		image_speed = 1;
		mask_index = noone;
	}
	else
	if (timer_offset)
	{
		sprite_index = spr_spikes_emerge_in;
		image_speed = 1;
		mask_index = noone;
	}
}
#endregion /* Normal timing END */





else
{
	sprite_index = spr_spikes_emerge_in;
	image_speed = 1;
	mask_index = noone;
}
