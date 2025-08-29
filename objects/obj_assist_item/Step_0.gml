#region /* Expanding Ring Effect */
effect_time++;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_above(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */

if (instance_number(obj_player) == 1 && obj_player.assist_item)
{
	effect_create_above(ef_ring, x, y, 1, c_white);
	instance_destroy();
}
