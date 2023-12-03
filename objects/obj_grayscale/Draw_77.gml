x = obj_camera.x;
y = obj_camera.y;

if (keyboard_check_pressed(vk_enter))
{
	if (which_grayscale_method == "Noone")
	{
		which_grayscale_method = "Max Color";
	}
	else
	if (which_grayscale_method == "Max Color")
	{
		which_grayscale_method = "Relative Luminance";
	}
	else
	if (which_grayscale_method == "Relative Luminance")
	{
		which_grayscale_method = "Average Color";
	}
	else
	if (which_grayscale_method == "Average Color")
	{
		which_grayscale_method = "Average of the Min and Max";
	}
	else
	if (which_grayscale_method == "Average of the Min and Max")
	{
		which_grayscale_method = "Noone";
	}
}

if (which_grayscale_method != "Noone")
{
	application_surface_draw_enable(0);
	shader_set(shd_greyscale);
	switch (which_grayscale_method)
	{
	    case "Max Color":
	        shader_set_uniform_f(which_shader_to_use,0);
	        break;
		case "Relative Luminance":
	        shader_set_uniform_f(which_shader_to_use,1);
	        break;
		case "Average Color":
	        shader_set_uniform_f(which_shader_to_use,2);
	        break;
		case "Average of the Min and Max":
	        shader_set_uniform_f(which_shader_to_use,3);
	        break;	
    
	}

	draw_surface(application_surface, 0, 0);
	shader_reset();
}
else
{
	application_surface_draw_enable(1);
}