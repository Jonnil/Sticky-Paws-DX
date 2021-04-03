depth = 12;
tile = 0;

#region /*Custom Level Tileset File*/
if (global.character_select_in_this_menu="game")
and(file_exists("Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png"))
{
	custom_tileset = sprite_add("Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png",0,false,false,0,0);
}
else
if (global.character_select_in_this_menu="level_editor")
and(file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png"))
{
	custom_tileset = sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png",0,false,false,0,0);
}
else
{
	custom_tileset = noone;
}
#endregion /*Custom Level Tileset File END*/

look_outward=17;
same_object = obj_ground;

image_speed=0;