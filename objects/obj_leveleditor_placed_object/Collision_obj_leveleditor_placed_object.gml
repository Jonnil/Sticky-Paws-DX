if (!global.actually_play_edited_level)
{
	if (id > other.id)
	&& (!drag_object)
	&& (!other.drag_object)
	&& (other.object == object)
	&& (other.x == x)
	&& (other.y == y)
	&& (position_meeting(x, y, other))
	{
		with(other)
		{
			instance_destroy();
		}
	}
	
	#region /* Insert objects into specific objects that can hold items */
	if (!drag_object)
	&& (!other.drag_object)
	&& (other.x == x)
	&& (other.y == y)
	&& (position_meeting(x, y, other))
	{
		if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK)
		|| (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK)
		|| (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK)
		|| (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND)
		{
			item_inside = other.object;
			with(other)
			{
				instance_destroy();
			}
		}
	}
	#endregion /* Insert objects into specific objects that can hold items END */
	
}