/// @desc scr_make_color_hsv_transition(variablemin,variablemax,huemin,huemax,saturationmin,saturationmax,valuemin,valuemax)
/// @arg variablemin
/// @arg variablemax
/// @arg huemin
/// @arg huemax
/// @arg saturationmin
/// @arg saturationmax
/// @arg valuemin
/// @arg valuemax


function scr_make_color_hsv_transition(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
{
	var color = make_color_hsv(clamp(argument3/argument1*argument0, argument2, argument3), clamp(argument5/argument1*argument0, argument4, argument5), clamp(argument7/argument1*argument0, argument6, argument7));
	return color;
}
