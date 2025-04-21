/// @function scr_clear_thumbnail_sprites()
/// @description Deletes every sprite stored in global.thumbnail_sprite and then clears the list
function scr_clear_thumbnail_sprites()
{
	/* 1. Delete every sprite in the list */
	var count = ds_list_size(global.thumbnail_sprite);
	
	/* Need to fix this, because it does delete the thumbnails, but suddenly all of my actual levels also dissapeared, and even the "Create New Level" sprite dissapeared! */
	
	//for (var i = 0; i < count; i++)
	//{
	//	var spr = ds_list_find_value(global.thumbnail_sprite, i);
		
	//	if (sprite_exists(spr))
	//	{
	//		scr_delete_sprite_properly(spr);
	//		show_debug_message(
	//			"[scr_clear_thumbnail_sprites] Deleted thumbnail sprite ID: " 
	//			+ string(spr)
	//		);
	//	}
	//	else
	//	{
	//		show_debug_message(
	//			"[scr_clear_thumbnail_sprites] Skipped invalid sprite ID: " 
	//			+ string(spr)
	//		);
	//	}
	//}
	
	/* 2. Clear the ds_list itself */
	ds_list_clear(global.thumbnail_sprite);
	show_debug_message(
		"[scr_clear_thumbnail_sprites] Cleared 'global thumbnail sprite' list"
	);
}