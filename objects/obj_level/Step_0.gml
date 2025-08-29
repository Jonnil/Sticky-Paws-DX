enter_blink = (enter_blink + 1) % 61;
scale = lerp(scale, 1, 0.1);

if (clear_rate == "enter") {
	image_alpha = 1;
	level_color = (enter_blink > 60 / 4) ? c_red : c_white;
}
