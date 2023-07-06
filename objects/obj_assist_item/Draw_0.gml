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

if (instance_number(obj_player) == 1)
{
	if (obj_player.assist_invincible)
	{
		effect_create_above(ef_ring, x, y, 1, c_white);
		instance_destroy();
	}
}