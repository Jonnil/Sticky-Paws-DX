time = 2;
can_break_other_blocks = false;
visible = true; /*Make this mask invisible*/

#region /*Mask*/
if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}
#endregion /*Mask END*/