depth = 12;

brick_block = false;
item_inside = "noone";
bounceup = false;
empty = false;
draw_xscale = 1;
draw_yscale = 1;
hit = 0;
show_scoreup = false;

xx = x;
yy = y;
if (asset_get_type("spr_question_block")==asset_sprite)
{
	sprite_index=spr_question_block;
}
#region /*Mask*/
if (asset_get_type("spr_wall")==asset_sprite)
{
	mask_index=spr_wall;
}
#endregion /*Mask END*/