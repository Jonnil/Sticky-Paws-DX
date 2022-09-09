depth = 12;
image_speed = 0.1;

block_type = "question_block"; /*question_block, brick_block, melon_block*/
item_inside = "none";
bounceup = false;
empty = false;
draw_xscale = 1;
draw_yscale = 1;
hit = 0;
show_scoreup = false;

xx = x;
yy = y;

alarm[0] = 1;

#region /*Mask*/
if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}
#endregion /*Mask END*/