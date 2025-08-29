if (sprite_index == spr_bucket)
{
	sprite_index = spr_bucket_clothes;
	scr_different_items_inside(bbox_top);
}
with(other)
{
	instance_destroy();
}
