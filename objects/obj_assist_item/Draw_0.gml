draw_set_halign(fa_center);
scr_draw_text_outlined(x, y - 32, "Assist Item", global.default_text_size, c_black, c_lime, 1);

image_alpha = 1;
visible = true;
draw_self();

#region /* Expanding Ring Effect */
effect_time ++;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_above(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */

if (instance_number(obj_player)= 1)
{
	if (obj_player.assist_invincible)
	{
		effect_create_above(ef_ring, x, y, 1, c_white);
		instance_destroy();
	}
}

#region /* Destroy Assist Item if appearing in rooms it's not meant to be in */
if (asset_get_type("room_title") == asset_room)
{
	if (room == room_title)
	{
		instance_destroy();
	}
}
else
if (asset_get_type("room_world_map") == asset_room)
{
	if (room == room_world_map)
	{
		instance_destroy();
	}
}
#endregion /* Destroy Assist Item if appearing in rooms it's not meant to be in END */