function scr_draw_debug_movement_variables()
{
	draw_set_halign(fa_center);
	scr_draw_text_outlined(x, y - (32 * 13), "direction: " + string(direction));
	scr_draw_text_outlined(x, y - (32 * 12), "friction: " + string(friction));
	scr_draw_text_outlined(x, y - (32 * 11), "gravity: " + string(gravity));
	scr_draw_text_outlined(x, y - (32 * 10), "gravity_direction: " + string(gravity_direction));
	scr_draw_text_outlined(x, y - (32 * 9), "hspeed: " + string(hspeed));
	scr_draw_text_outlined(x, y - (32 * 8), "vspeed: " + string(vspeed));
	scr_draw_text_outlined(x, y - (32 * 7), "speed: " + string(speed));
	scr_draw_text_outlined(x, y - (32 * 6), "xstart: " + string(xstart));
	scr_draw_text_outlined(x, y - (32 * 5), "ystart: " + string(ystart));
	scr_draw_text_outlined(x, y - (32 * 4), "x: " + string(x));
	scr_draw_text_outlined(x, y - (32 * 3), "y: " + string(y));
	scr_draw_text_outlined(x, y - (32 * 2), "xprevious: " + string(xprevious));
	scr_draw_text_outlined(x, y - (32 * 1), "yprevious: " + string(yprevious));
}