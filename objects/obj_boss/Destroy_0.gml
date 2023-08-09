event_inherited();

audio_stop_sound(snd_music_boss);

scr_update_all_music();

instance_create_depth(xstart, ystart, 0, obj_boss_defeated);