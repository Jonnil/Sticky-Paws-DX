event_inherited();

audio_stop_sound(global.music_boss);
global.music_boss = noone;

scr_update_all_music();

instance_create_depth(xstart, ystart, 0, obj_boss_defeated);
