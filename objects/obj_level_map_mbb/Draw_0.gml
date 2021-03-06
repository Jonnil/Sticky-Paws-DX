#region /*Destroy this object if it ever appears in the wrong room*/
if (asset_get_type("room_title") == asset_room)
and(room = room_title)
{
	instance_destroy();
}
#endregion /*Destroy this object if it ever appears in the wrong room END*/

x = 0;
y = 0;
draw_set_alpha(image_alpha);
if (global.enable_foreground_layer1 = true)
{
	visible = true;
}
else
{
	visible = false;
}
instance_activate_object(self);

#region /*Update Foreground1*/
if (global.custom_foreground1 > noone)
{
	draw_sprite(global.custom_foreground1, image_index, 0, 0);
}
#endregion /*Update Foreground1 END*/