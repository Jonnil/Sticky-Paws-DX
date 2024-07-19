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
	
	&& (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK
	|| object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK
	|| object == LEVEL_OBJECT_ID.ID_MELON_BLOCK
	|| object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND
	|| object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND
	|| object == LEVEL_OBJECT_ID.ID_BUCKET
	|| object == LEVEL_OBJECT_ID.ID_CHECKPOINT
	
	|| object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY
	|| object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING
	|| object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND
	|| object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING
	|| object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL
	|| object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING
	|| object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND
	|| object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING
	|| object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY
	|| object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING
	|| object == LEVEL_OBJECT_ID.ID_BOSS)
	{
		if (instance_exists(obj_leveleditor))
		{
			obj_leveleditor.menu_delay = 3;
		}
		item_inside = other.object;
		with(other)
		{
			instance_destroy();
		}
		alarm[0] = 1;
	}
	#endregion /* Insert objects into specific objects that can hold items END */
	
}