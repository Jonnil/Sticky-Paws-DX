function scr_make_background_visible()
{
	if (!global.full_level_map_screenshot)
	{
		layer_background_visible(layer_background_get_id("Background_1"), global.custom_background1 > noone && global.enable_background_layer1);
		layer_background_visible(layer_background_get_id("Background_2"), global.custom_background2 > noone && global.enable_background_layer2);
		layer_background_visible(layer_background_get_id("Background_3"), global.custom_background3 > noone && global.enable_background_layer3);
		layer_background_visible(layer_background_get_id("Background_4"), global.custom_background4 > noone && global.enable_background_layer4);
	}
}
