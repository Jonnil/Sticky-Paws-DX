global.part_limit --;
global.part_limit_text_alpha = 3;
switch(object)
{
	case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL:
	case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND:
	case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING:
	case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING:
	case LEVEL_OBJECT_ID.ID_BASIC_ENEMY:
	case LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND:
	case LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING:
	case LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING:
	case LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY:
	case LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING:
	case LEVEL_OBJECT_ID.ID_ENEMY_VENGEFUL_SPIRIT:
	case LEVEL_OBJECT_ID.ID_BOSS:
	case LEVEL_OBJECT_ID.ID_WARP_BOX:
	case LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE:
	case LEVEL_OBJECT_ID.ID_WARP_BOX_LOCKED:
	case LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE_LOCKED:
		global.part_limit_entity = clamp(global.part_limit_entity -1, 0, 100);
		global.part_limit_entity_text_alpha = 3;
		break;
}