scr_menu_navigation_with_joystick_delay();

if (!global.pause) /* If you are no longer pausing */
{
	show_debug_message("Unpause the game");
	
	scr_config_save(); /* Save Config */
	audio_resume_all();
	
	if (global.music != noone)
	{
		audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
	}
	
	if (global.music_underwater != noone)
	{
		audio_sound_gain(global.music_underwater, 0, 0);
	}
	
	if (global.ambience != noone)
	{
		audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
	}
	
	if (global.ambience_underwater != noone)
	{
		audio_sound_gain(global.ambience_underwater, 0, 0);
	}
	
	scr_delete_sprite_properly(global.pause_screenshot);
	room_goto(global.pause_room); /* Go back to room where you paused. You want to use "room goto", not room = global.pause_room, as that makes it go to incorrect rooms */
}
