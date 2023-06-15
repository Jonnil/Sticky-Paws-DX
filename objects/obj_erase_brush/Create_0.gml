erase_brush_size = obj_leveleditor.erase_brush_size;
visible = true;

if (erase_brush_size == 0)
{
	mask_index = spr_wall;
}
else
if (erase_brush_size == 1)
{
	mask_index = spr_erase_brush_size_2;
}
else
if (erase_brush_size == 2)
{
	mask_index = spr_erase_brush_size_3;
}
else
if (erase_brush_size == 3)
{
	mask_index = spr_erase_brush_size_4;
}
else
if (erase_brush_size == 4)
{
	mask_index = spr_erase_brush_size_5;
}
else
if (erase_brush_size == 5)
{
	mask_index = spr_erase_brush_size_6;
}
sprite_index = mask_index;

alarm[0] = 1;