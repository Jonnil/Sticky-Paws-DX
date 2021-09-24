/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

audio_stop_sound(snd_music_boss);

#region /*Update Music*/
/*OGG small letter File*/
if (file_exists("levels/"+string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music.ogg"))
and(global.character_select_in_this_menu = "main_game")
{
	global.music = audio_create_stream("levels/"+string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music.ogg");
}
else
/*OGG small letter File*/
if (file_exists(working_directory + "/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music.ogg"))
{
	global.music = audio_create_stream(working_directory + "/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music.ogg");
}
else
{
	global.music = noone;
}
#endregion /*Update Music END*/
	
#region /*Update Music Underwater*/
/*OGG small letter File*/
if (file_exists("levels/"+string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg"))
and(global.character_select_in_this_menu = "main_game")
{
	global.music_underwater = audio_create_stream("levels/"+string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg");
}
else
/*OGG small letter File*/
if (file_exists(working_directory + "/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg"))
{
	global.music_underwater = audio_create_stream(working_directory + "/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg");
}
else
{
	global.music_underwater = noone;
}
#endregion /*Update Music Underwater END*/