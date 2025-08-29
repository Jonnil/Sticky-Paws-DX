/// @function rgb_to_hsv(r, g, b)
/// @param r The red component (0–255)
/// @param g The green component (0–255)
/// @param b The blue component (0–255)
/// @return An array [h, s, v] where h is in degrees (0–360) and s, v are 0–1
function rgb_to_hsv(r, g, b)
{
	var rd = r / 255;
	var gd = g / 255;
	var bd = b / 255;
	var max_val = max(rd, gd, bd);
	var min_val = min(rd, gd, bd);
	var delta = max_val - min_val;
	var h = 0;

	if (delta == 0) {
		h = 0;
	} else if (max_val == rd) {
		h = 60 * (((gd - bd) / delta) % 6);
	} else if (max_val == gd) {
		h = 60 * (((bd - rd) / delta) + 2);
	} else { // max_val == bd
		h = 60 * (((rd - gd) / delta) + 4);
	}
	if (h < 0) h += 360;

	var s = (max_val == 0) ? 0 : delta / max_val;
	var v = max_val;
	return [h, s, v];
}
