if (block_type = "brick_block")
&& (empty == false)
{
	sprite_index = spr_brick_block;
	can_break_this_block = false; /* If there are items inside this brick block, then don't destroy this block when it's hit */
}
else
if (block_type = "question_block")
&& (empty == false)
{
	sprite_index = spr_question_block;
	can_break_this_block = false; /* Question blocks never break */
}
else
if (block_type = "melon_block")
&& (empty == false)
{
	sprite_index = spr_melon_block;
	can_break_this_block = true; /* Melon blocks always break, even if there are items inside */
}