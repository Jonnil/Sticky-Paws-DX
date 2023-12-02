x = obj_camera.x;
y = obj_camera.y;

if (keyboard_check_pressed(vk_enter))
{
	if (whichGrayScaleMethod == "Noone")
	{
		whichGrayScaleMethod = "Max Color";
	}
	else
	if (whichGrayScaleMethod == "Max Color")
	{
		whichGrayScaleMethod = "Relative Luminance";
	}
	else
	if (whichGrayScaleMethod == "Relative Luminance")
	{
		whichGrayScaleMethod = "Average Color";
	}
	else
	if (whichGrayScaleMethod == "Average Color")
	{
		whichGrayScaleMethod = "Average of the Min and Max";
	}
	else
	if (whichGrayScaleMethod == "Average of the Min and Max")
	{
		whichGrayScaleMethod = "Noone";
	}
}

if (whichGrayScaleMethod != "Noone")
{
	application_surface_draw_enable(0);
	shader_set(shd_greyscale);
	switch (whichGrayScaleMethod)
	{
	    case "Max Color":
	        shader_set_uniform_f(iwhichShaderToUse,0);
	        break;
		case "Relative Luminance":
	        shader_set_uniform_f(iwhichShaderToUse,1);
	        break;
		case "Average Color":
	        shader_set_uniform_f(iwhichShaderToUse,2);
	        break;
		case "Average of the Min and Max":
	        shader_set_uniform_f(iwhichShaderToUse,3);
	        break;	
    
	}

	draw_surface(application_surface, 0, 0);
	shader_reset();
}
else
{
	application_surface_draw_enable(1);
}