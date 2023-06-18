#region /* If spikes are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_spikes == false)
{
	instance_destroy();
}
#endregion /* If spikes are disabled, destroy this object */






#region /* Normal timing */
if (global.spikes_emerge_time < room_speed * 1)
{
	if (timer_offset == false)
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
if (global.spikes_emerge_time < room_speed * 2)
&& (global.spikes_emerge_time > room_speed * 1)
{
	if (timer_offset == false)
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
if (global.spikes_emerge_time < room_speed * 3)
&& (global.spikes_emerge_time > room_speed * 2)
{
	if (timer_offset == false)
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
if (global.spikes_emerge_time > room_speed * 3)
{
	if (timer_offset == false)
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