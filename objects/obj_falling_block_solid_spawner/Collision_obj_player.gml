var obj = instance_create_depth(x, y, 0, obj_falling_block_solid);
obj.sprite_index = sprite_index;
obj.image_index = image_index;
obj.mask_index = sprite_index;
instance_destroy();