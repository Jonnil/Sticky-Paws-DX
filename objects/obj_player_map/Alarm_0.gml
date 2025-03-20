#region /* Initialize Custom Character */

scr_set_character_folder();

/* The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config.ini file. This also means that x should be after y */

#region /* Play as Custom Character */

ini_open(string(character_folder) + "/data/character_config.ini");
default_xscale = ini_read_real("values", "default_xscale", 1);
default_yscale = ini_read_real("values", "default_yscale", 1);
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

#region /* Sprite variables */
ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
sprite_world = scr_initialize_character_sprite("map", sprite_world);
sprite_world_enter_level = scr_initialize_character_sprite("map_enter_level", sprite_world_enter_level);
sprite_world_enter_level = scr_initialize_character_sprite("map_enter", sprite_world_enter_level);
sprite_idle = scr_initialize_character_sprite("idle", sprite_idle);
sprite_idle = scr_initialize_character_sprite("stand", sprite_idle);
sprite_walk = scr_initialize_character_sprite("walk", sprite_walk);
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
#endregion /* Sprite variables END */

#endregion /* Play as Custom Character END */

if (sprite_world > noone)
{
	sprite_index = sprite_world;
}
else
if (sprite_idle > noone)
{
	sprite_index = sprite_idle;
}
else
if (sprite_walk > noone)
{
	sprite_index = sprite_walk;
}
#endregion /* Initialize Custom Character END */

#region /* Make sure you spawn on top of a level one last time before playing */
if (instance_exists(obj_level) && !position_meeting(x, y, obj_level))
{
	x = instance_nearest(x, y, obj_level).x;
	y = instance_nearest(x, y, obj_level).y;
	xx = instance_nearest(x, y, obj_level).x;
	yy = instance_nearest(x, y, obj_level).y;
}
#endregion /* Make sure you spawn on top of a level one last time before playing END */
