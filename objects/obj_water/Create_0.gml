if (room = room_leveleditor)
{
	image_alpha = 0.5;
	depth = -10;
}
image_speed = 0.1;
second_x = x+16;
second_y = y+16;

image_xscale = distance_to_point(x, second_x) / sprite_width;
image_yscale = distance_to_point(y, second_y) / sprite_height;

x = (x+second_x)/2;
y = (y+second_x)/2;