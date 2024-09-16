#region /* Set the correct mask index, depending on if the custom foreground secret variable has any value */
if (mask_index != spr_noone)
&& (global.custom_foreground_secret < 0)
{
	mask_index = spr_noone;
	sprite_index = spr_noone;
	sprite_collision_mask(spr_noone, true, 1, 0, 0, 0, 0, bboxkind_precise, 254); /* bboxmode needs to be 1 for this to work */
}
else
if (mask_index != global.custom_foreground_secret)
&& (global.custom_foreground_secret >= 0)
{
	mask_index = global.custom_foreground_secret;
	sprite_index = global.custom_foreground_secret;
	sprite_collision_mask(global.custom_foreground_secret, true, 1, 0, 0, 0, 0, bboxkind_precise, 254); /* bboxmode needs to be 1 for this to work */
}
#endregion /* Set the correct mask index, depending on if the custom foreground secret variable has any value END */

#region /* When editing a level, make the foreground transparent */
if (!global.play_edited_level)
{
	image_alpha = 0.5;
}
else
{
	if (place_meeting(x, y, obj_player))
	{
		image_alpha = lerp(image_alpha, 0, 0.1);
	}
	else
	{
		image_alpha = lerp(image_alpha, 1, 0.1);
	}
}
#endregion /* When editing a level, make the foreground transparent END */

#region /* When Foreground secret should be visible */
if (global.custom_foreground_secret >= 0)
&& (global.enable_foreground_layer_secret)
&& (!global.full_level_map_screenshot)
{
	visible = true;
}
else
{
	visible = false;
}
#endregion /* When Foreground secret should be visible END */