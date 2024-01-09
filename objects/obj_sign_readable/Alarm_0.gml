with(instance_create_depth(x, y, 0, obj_textbox))
{
	textbox_text = instance_nearest(x, y, obj_sign_readable).sign_text;
}