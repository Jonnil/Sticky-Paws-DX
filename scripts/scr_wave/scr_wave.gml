// Returns a value that will scr_wave back and forth between [from-to] over [duration] seconds
// Examples
//		image_angle = scr_wave(-45, 45, 1, 0)  -> rock back and forth 90 degrees in a second
//		x = scr_wave(- 10, 10, 0.25, 0)         -> move left and right quickly

// Or here is a fun one! Make an object be all squishy!! ^u^
//		image_xscale = scr_wave(0.5, 2.0, 1.0, 0.0)
//		image_yscale = scr_wave(2.0, 0.5, 1.0, 0.0)

function scr_wave(from = 100, to = 140, duration = 4.5, offset = 0)
{
	var _wave = (to - from) * 0.5;
	return from + _wave + sin((((current_time * 0.001) + duration * offset) / duration) * (pi* 2)) * _wave;
}
