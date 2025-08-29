depth = (-bbox_bottom) * 0.04 + 100;
tile = 0;

look_outward = 17;
same_object = obj_map_path;

image_speed = 0;
mask_index = spr_wall;
alarm_set(0, 1);

visible = false;

#region /* Set Sprite */
if (global.resource_pack_sprite_tileset_path > 0)
{
	sprite_index = global.resource_pack_sprite_tileset_path;
}
#endregion /* Set Sprite END */
