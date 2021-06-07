if (sprite_used = "stand")
and (global.resourcepack_sprite_basic_enemy > 0)
{
	draw_sprite_ext(global.resourcepack_sprite_basic_enemy,image_index,x,y,draw_xscale*image_xscale,draw_yscale,image_angle,image_blend,image_alpha);
}
else
if (sprite_used = "angry")
and (global.resourcepack_sprite_basic_enemy_angry > 0)
{
	draw_sprite_ext(global.resourcepack_sprite_basic_enemy_angry,image_index,x,y,draw_xscale*image_xscale,draw_yscale,image_angle,image_blend,image_alpha);
}
else
if (sprite_used = "flattened")
and (global.resourcepack_sprite_basic_enemy_flattened > 0)
{
	draw_sprite_ext(global.resourcepack_sprite_basic_enemy_flattened,image_index,x,y,draw_xscale*image_xscale,draw_yscale,image_angle,image_blend,image_alpha);
}