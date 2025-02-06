/* obj_sync_missing_translation Alarm 0 Event */
show_debug_message("object_translation_key is currently holding: " + string(object_translation_key));

/* Validate the translation key before proceeding */
if (object_translation_key == "" || object_translation_key == undefined)
{
	show_debug_message("[Error] Invalid object_translation_key in obj_sync_missing_translation.");
	instance_destroy(); /* Destroy the object if the key is invalid */
}
else
{
	request_id = scr_initialize_sync_translation(object_translation_key);
	if (request_id == false)
	{
		instance_destroy();
	}
}