if (position_meeting(mouse_x, mouse_y, self))
and (visible = true)
{
	if (instance_exists(obj_menu_dropdown_item))
	{
		with (obj_menu_dropdown_item)
		{
			instance_destroy();
		}
	}
	else
	{
		var y_increment = sprite_get_height(spr_menu_dropdown_item);
		var yy = y + y_increment /*- 2*/ - sprite_get_height(spr_menu_dropdown_item);
		for (var i = 0; i < ds_list_size(my_list); i++)
		{
			var item = instance_create_depth(x, yy, 0, obj_menu_dropdown_item);
			item.text = ds_list_find_value(my_list, i);
			yy += y_increment /*- 2*/;
		}
		visible = false;
	}
}
else
{
	if (!position_meeting(mouse_x, mouse_y, obj_menu_dropdown_item))
	and (instance_exists(obj_menu_dropdown_item))
	{
		visible = true;
		with (obj_menu_dropdown_item)
		{
			instance_destroy();
		}
	}
}