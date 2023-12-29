erase_size = obj_leveleditor.erase_size;
visible = false;

if (erase_size == 0)
{
	mask_index = spr_wall;
}
else
if (erase_size == 1)
{
	mask_index = spr_erase_size_2;
}
else
if (erase_size == 2)
{
	mask_index = spr_erase_size_3;
}
else
if (erase_size == 3)
{
	mask_index = spr_erase_size_4;
}
else
if (erase_size == 4)
{
	mask_index = spr_erase_size_5;
}
else
if (erase_size == 5)
{
	mask_index = spr_erase_size_6;
}
sprite_index = mask_index;

alarm[0] = 1;