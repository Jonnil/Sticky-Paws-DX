depth = 100;

#region /*Background Brightness Options*/
if (global.background_brightness < 0)
{
	draw_set_alpha(abs(global.background_brightness));
	draw_rectangle_color(-32,-32,room_width*2,room_height*2,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
}
else
if (global.background_brightness > 0)
{
	draw_set_alpha(abs(global.background_brightness));
	draw_rectangle_color(-32,-32,room_width*2,room_height*2,c_white,c_white,c_white,c_white,false);
	draw_set_alpha(1);
}
#endregion /*Background Brightness Options END*/