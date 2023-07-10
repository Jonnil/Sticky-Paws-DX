depth = 12;
image_speed = 0.1;

block_type = "question_block"; /* question_block, brick_block, melon_block */
item_inside = "none"; /* What item is currently inside the block */
can_break_this_block = false; /* When this variable is true, then this block is able to be broken */
break_this_block = false; /* When this variable is true, the block will break itself */
bounce_up = false; /* When hitting the block, it should bounce up a bit */
empty = false; /* If the block is empty or not */
draw_xscale = 1;
draw_yscale = 1;
hit = 0; /* How many times you've hit the block */
show_score_up = false; /* If breaking a block should show that you get score or not */
can_be_ground_pounded = true;
can_be_hit_from_below = true;

xx = x;
yy = y;

alarm[0] = 1; /* Needs to initialize some more things in alarm event, one frame after spawning */
mask_index = spr_wall;