function scr_set_default_audio_settings()
{
	/* Make the volumes set to 0.7 by default */
	/* This number is then *10000 so it becomes 7000 in config.ini */
	/* Because Linux can't load decimal numbers from .ini files */
	/* By default volumes are 70% so it doesn't hurt ears first time playing the game */
	global.volume_main = 0.7;
	global.volume_music = 0.7;
	global.volume_melody = 0.7;
	global.volume_sound = 0.7;
	global.volume_ambient = 0.7;
	global.volume_footstep = 0.7;
	global.volume_voice = 0.7;
	global.verbosity_slider = 1;
	global.number_of_audio_channels = 3; /* How many audio channels there should be. Default: 3 = 128 audio channels */
}
