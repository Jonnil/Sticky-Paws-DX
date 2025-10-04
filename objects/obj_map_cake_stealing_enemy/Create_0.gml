sprite_index = global.resource_pack_sprite_basic_enemy;
mask_index = spr_wall;
move_speed = 4; /* Slower than player, so that they're noticable when traveling */
delay = 1;
delay_amount = 0;
enter_level_delay = 0;
enter_level_y = 0;
come_from_level = -1;
xx = x;
yy = y;
gravity = 0;
alarm[0] = 1;
depth = -10;

if (global.demo_enable)
{
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	
	if (ini_read_real("Player", "number_of_levels_cleared", 0) >= global.demo_number_of_levels + 1)
	{
		instance_destroy();
	}
	
	ini_close();
}