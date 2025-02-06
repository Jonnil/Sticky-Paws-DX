/* This script creates the necessary directories for the game. 
It uses the "game_save_id" variable to ensure all directories are created in the reserved save area for the game.

About "game_save_id":
- This read-only built-in variable points to the local storage area reserved for your game on the target device.
- It provides the base path for saving files or creating directories.
- Note: On HTML5 targets, "game_save_id" will return an empty string, as local storage isn't used in the same way.

For example, "game_save_id" might resolve to:
- Windows: "C:\Users\[User]\AppData\Local\[GameName]\"
- macOS: "~/Library/Application Support/[GameName]/"
- Linux: "~/.local/share/[GameName]/"

You don't need to prepend "game_save_id" when reading/writing files, as GameMaker automatically resolves the paths, but it is useful when explicitly creating directories */

function scr_create_game_directories() 
{
	/* Define directory paths relative to the save area */
	var directories = [
		"custom_characters", 
		"custom_levels", 
		"custom_resource_pack", 
		"custom_title_background", 
		"custom_title_logo", 
		"save_file",
		"mods"
	];
	
	/* Iterate over each directory and create it if it doesn't exist */
	for (var i = 0; i < array_length(directories); i++) 
	{
		var dir_path = game_save_id + directories[i];
		if (!directory_exists(dir_path)) 
		{
			directory_create(dir_path); /* Create the directory if it doesn't exist */
		}
	}
}