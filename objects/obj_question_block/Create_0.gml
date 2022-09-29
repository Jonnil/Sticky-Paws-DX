depth = 12;
image_speed = 0.1;

block_type = "question_block"; /* question_block, brick_block, melon_block */
item_inside = "none";
can_break_this_block = false; /* When this variable is true, then this block is able to be broken */
break_this_block = false; /* When this variable is true, the block will break itself */
bounceup = false;
empty = false;
draw_xscale = 1;
draw_yscale = 1;
hit = 0;
show_scoreup = false;
can_be_ground_pounded = true;
can_be_hit_from_below = true;

xx = x;
yy = y;

alarm[0] = 1;

#region /* Mask */
if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}
#endregion /* Mask END */