var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

open_dropdown = false;
depth = -10000;
image_speed = 0;
image_index = 0;
image_alpha = 0;
x = get_window_width * 0.5;
y = get_window_height * 0.5;
end_credits = false;
time = 0;
yy = get_window_height;
alpha = 0;
black_background_alpha = 0;
skip = 0;
credits_y = get_window_height + 400;

iris_xscale = 32;
iris_yscale = 32;
iris_zoom = 0;
menu = "";
menu_delay = 3;
menu_cursor_index = 0;

alarm[0] = 3;

#region /* Retrieve Credits Text */
/* Initialize an empty string to store the text */
credits_text = "";

/* Check if the file exists */
if (file_exists("credits.txt"))
{
	/* Open the file for reading */
	var file = file_text_open_read("credits.txt");
	
	/* Loop through each line until the end of the file */
	while (!file_text_eof(file))
	{
		/* Read a line and append it to the "credits_text" variable */
		credits_text += file_text_read_string(file) + "\n";
		
		/* Move to the next line */
		file_text_readln(file);
	}
	
	/* Close the file */
	file_text_close(file);
}
#endregion /* Retrieve Credits Text END */