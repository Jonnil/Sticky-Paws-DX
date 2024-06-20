function scr_draw_list_of_placable_objects()
{
	
	#region /* List of Placable Objects */
	if (selected_menu_alpha > 0)
	|| (initialize_recent_object_selected)
	{
		if (quit_level_editor <= 0)
		{
			draw_set_alpha(selected_menu_alpha);
			draw_rectangle_color(0, 0, display_get_gui_width(), 128 + 64, c_black, c_black, c_black, c_black, false);
		}
		if (!global.world_editor)
		&& (quit_level_editor <= 0)
		{
			order_index = 0;
			unlock_index = 0;
			
			/* Daily Build Standard Objects use this category: "daily_build_standard" */
			/* Daily Build Featured Objects use this category: "daily_build_featured" */
			
			/*
			o_id							=	The ID of the object
			o_can_make_bigger				=	If you can place objects with bigger brush tool or not
			sprite							=	Sprite the object uses
			mask							=	Mask the object uses
			scroll_x						=	Scroll X
			o_scale							=	Scale of the object sprite
			o_rotation						=	Rotation of the object sprite
			o_color							=	Color of the object sprite
			o_scroll_y						=	Y offset the sprite
			o_x_offset						=	X offset the sprite
			o_alpha							=	Alpha of the object sprite
			o_add_order_index				=	Add order index
			o_name							=	Name of the object
			o_description					=	Description of the object
			o_image_index					=	Image index of the object sprite
			o_category						=	What category this object shows up in level editor
			o_daily_build_category			=	What category this object shows up in Daily Build
			*/
			
			#region /* Object Array */
			var objects = [
				/* Defaults for each variable: o_id = 0, o_can_make_bigger: true, o_sprite: spr_wall, o_mask: spr_wall, scroll_x = +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "", o_description: "", o_image_index: 0, o_category: "", o_daily_build_category: "" */
				
				/* Category: Terrain */
				{ o_id: LEVEL_OBJECT_ID.ID_WALL_DIRT, o_can_make_bigger: true, o_sprite: spr_wall_dirt, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Dirt", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: "https://youtu.be/1Bw2dTY3SsQ?si=54af9UphL1LOPJiX"},
			    { o_id: LEVEL_OBJECT_ID.ID_WALL_GLASS, o_can_make_bigger: true, o_sprite: spr_wall_glass, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Glass", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_WALL_GRASS, o_can_make_bigger: true, o_sprite: spr_wall_grass, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Grass", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_WALL_GRAVEL, o_can_make_bigger: true, o_sprite: spr_wall_gravel, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Gravel", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_WALL_METAL, o_can_make_bigger: true, o_sprite: spr_wall_metal, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Metal", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_WALL_STONE, o_can_make_bigger: true, o_sprite: spr_wall_stone, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Stone", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_WALL_WOOD, o_can_make_bigger: true, o_sprite: spr_wall_wood, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Wood", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_BLACK_WALL, o_can_make_bigger: true, o_sprite: spr_black_wall, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Black Wall", o_description: "Can't interact with the sides of black walls", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_SPIKES, o_can_make_bigger: true, o_sprite: spr_spikes, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Spikes", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM, o_can_make_bigger: true, o_sprite: spr_semisolid_platform, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Semisolid Platform", o_description: "" , o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
			    { o_id: LEVEL_OBJECT_ID.ID_BRICK_BLOCK, o_can_make_bigger: true, o_sprite: spr_brick_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Lamp Block", o_description: "Can be destroyed by player jumping underneath them if there is no items inside\nClick on a placed Lamp Block to set its item!", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_QUESTION_BLOCK, o_can_make_bigger: true, o_sprite: spr_question_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "? Block", o_description: "Can't be destroyed by player jumping underneath them\nClick on a placed ? Block to set its item!", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_HARD_BLOCK, o_can_make_bigger: true, o_sprite: spr_hard_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Hard Block", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_FALLING_BLOCK, o_can_make_bigger: true, o_sprite: spr_falling_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Falling Block", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG, o_can_make_bigger: true, o_sprite: spr_falling_block_long, o_mask: spr_cardboard, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: -24, o_alpha: 1, o_add_order_index: 1, o_name: "Falling Block Long", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK, o_can_make_bigger: true, o_sprite: spr_instant_falling_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Instant Falling Block", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG, o_can_make_bigger: true, o_sprite: spr_instant_falling_block_long, o_mask: spr_cardboard, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: -24, o_alpha: 1, o_add_order_index: 1, o_name: "Instant Falling Block Long", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK, o_can_make_bigger: true, o_sprite: spr_wood_falling_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Wood Falling Block", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG, o_can_make_bigger: true, o_sprite: spr_wood_falling_block_long, o_mask: spr_cardboard, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: -24, o_alpha: 1, o_add_order_index: 1, o_name: "Wood Falling Block Long", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK, o_can_make_bigger: true, o_sprite: spr_stone_falling_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Stone Falling Block", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG, o_can_make_bigger: true, o_sprite: spr_stone_falling_block_long, o_mask: spr_cardboard, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: -24, o_alpha: 1, o_add_order_index: 1, o_name: "Stone Falling Block Long", o_description: "Falls shortly after you stand on them for too long", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_CLOUD_BLOCK, o_can_make_bigger: true, o_sprite: spr_cloud_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Cloud Block", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_ICE_BLOCK, o_can_make_bigger: true, o_sprite: spr_ice_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Ice Block", o_description: "", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL, o_can_make_bigger: true, o_sprite: spr_enemy_only_wall, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Enemy Only Wall", o_description: "Only enemies can collide with this wall. Player will pass through", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK, o_can_make_bigger: true, o_sprite: spr_cardboard_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Cardboard Block", o_description: "Can be destroyed and will fall over if nothing is supporting them underneath", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_CARDBOARD, o_can_make_bigger: true, o_sprite: spr_cardboard, o_mask: spr_cardboard, o_scroll_x: +100, o_scale: 0.75, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: -16, o_alpha: 1, o_add_order_index: 1, o_name: "Cardboard", o_description: "Can be destroyed and will fall over if nothing is supporting them underneath", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_CARDBOARD_LONG, o_can_make_bigger: true, o_sprite: spr_cardboard_long, o_mask: spr_cardboard_long, o_scroll_x: +100, o_scale: 0.5, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: -24, o_alpha: 1, o_add_order_index: 1, o_name: "Long Cardboard", o_description: "Can be destroyed and will fall over if nothing is supporting them underneath", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_MELON_BLOCK, o_can_make_bigger: true, o_sprite: spr_melon_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Melon Block", o_description: "Can only be destroyed with a ground-pound", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BOSS_BARRIER, o_can_make_bigger: true, o_sprite: spr_boss_barrier, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Boss Barrier", o_description: "This block disappears when Mousette is defeated", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_EYE_BLOCK, o_can_make_bigger: true, o_sprite: global.resource_pack_sprite_eye_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Eye Block", o_description: "This block is only solid when it can see its prey", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1, o_can_make_bigger: true, o_sprite: spr_appear_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_yellow, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Appear Block 1", o_description: "This block appears and disappears in cycles", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2, o_can_make_bigger: true, o_sprite: spr_appear_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_aqua, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Appear Block 2", o_description: "This block appears and disappears in cycles", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3, o_can_make_bigger: true, o_sprite: spr_appear_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_red, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Appear Block 3", o_description: "This block appears and disappears in cycles", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4, o_can_make_bigger: true, o_sprite: spr_appear_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_purple, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Appear Block 4", o_description: "This block appears and disappears in cycles", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5, o_can_make_bigger: true, o_sprite: spr_appear_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_lime, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Appear Block 5", o_description: "This block appears and disappears in cycles", o_image_index: 0, o_category: "terrain", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				
				/* Category: Decoration */
				{ o_id: LEVEL_OBJECT_ID.ID_ARROW_SIGN, o_can_make_bigger: false, o_sprite: spr_arrow_sign, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Arrow Sign", o_description: "", o_image_index: 0, o_category: "decoration", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_SIGN_READABLE, o_can_make_bigger: false, o_sprite: spr_sign_readable, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Readable Sign", o_description: "Click on the placed sign in the editor to edit what it should say!", o_image_index: 0, o_category: "decoration", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BIRD, o_can_make_bigger: true, o_sprite: spr_bird, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Bird", o_description: "", o_image_index: 0, o_category: "decoration", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BUSH, o_can_make_bigger: true, o_sprite: spr_bush, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Bush", o_description: "", o_image_index: 0, o_category: "decoration", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_SIGN_CROUCH, o_can_make_bigger: true, o_sprite: spr_sign_crouch, o_mask: spr_wall, o_scroll_x: +100, o_scale: 0.5, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Tutorial Signs", o_description: "Teach the player what abilities they have", o_image_index: 0, o_category: "decoration", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY, o_can_make_bigger: false, o_sprite: global.resource_pack_sprite_cake, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Cake Rat", o_description: "This rat stole your cake! Let the player try to catch them before the end of the level\nThe player will chase this rat until the very end of the game", o_image_index: 0, o_category: "decoration", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				
				/* Category: Item */
				{ o_id: LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE, o_can_make_bigger: true, o_sprite: global.resource_pack_sprite_basic_collectible, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Fish", o_description: "One of the most fundamental objects to include in a level!\nFish usually come in small groups and can also be used to indicate a path", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_10_BULK_COLLECTIBLE, o_can_make_bigger: false, o_sprite: global.resource_pack_sprite_bulk_collectible, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "10-Fish", o_description: "A large Fish worth 10 regular Fish", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "10", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_30_BULK_COLLECTIBLE, o_can_make_bigger: false, o_sprite: global.resource_pack_sprite_bulk_collectible, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "30-Fish", o_description: "A large Fish worth 30 regular Fish", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "30", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_50_BULK_COLLECTIBLE, o_can_make_bigger: false, o_sprite: global.resource_pack_sprite_bulk_collectible, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "50-Fish", o_description: "A large Fish worth 50 regular Fish", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "50", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE, o_can_make_bigger: false, o_sprite: global.resource_pack_sprite_big_collectible, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Big Fish", o_description: "A collectible that can be a good way to make your level more fun", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_KEY_FRAGMENT, o_can_make_bigger: true, o_sprite: spr_key_fragment, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Key Fragment", o_description: "If all Key Fragments in the area are collected a key appears", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_HEART, o_can_make_bigger: true, o_sprite: spr_heart, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Heart Balloon", o_description: "Gives you one extra hit", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP, o_can_make_bigger: true, o_sprite: global.resource_pack_sprite_invincibility_powerup, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Invincibility", o_description: "Temporarily turns you invincible.\nDuring the power-up's duration you become invulnerable to enemy attacks\nand will defeat almost any enemy you collide with!", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_ONE_UP, o_can_make_bigger: true, o_sprite: sprite_lives_icon, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Extra Life", o_description: "Adds 1 extra life to the life counter", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "1-UP", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_TWO_UP, o_can_make_bigger: true, o_sprite: sprite_lives_icon, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_lime, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "2 Extra Lives", o_description: "Adds 2 extra lives to the life counter", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "2-UP", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_THREE_UP, o_can_make_bigger: true, o_sprite: sprite_lives_icon, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_blue, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "3 Extra Lives", o_description: "Adds 3 extra lives to the life counter", o_image_index: 0, o_category: "item", o_daily_build_category: "daily_build_featured", o_text: "3-UP", o_video_tutorial: ""},
				
				/* Category: Enemy */
				{ o_id: LEVEL_OBJECT_ID.ID_BASIC_ENEMY, o_can_make_bigger: true, o_sprite: sprite_basic_enemy, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Rat", o_description: "", o_image_index: 0, o_category: "enemy", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL, o_can_make_bigger: true, o_sprite: sprite_enemy_bowlingball, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Bowlingball Rat", o_description: "", o_image_index: 0, o_category: "enemy", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY, o_can_make_bigger: true, o_sprite: sprite_big_stationary_enemy, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Big Rat", o_description: "", o_image_index: 0, o_category: "enemy", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BOSS, o_can_make_bigger: false, o_sprite: spr_boss_stand, o_mask: spr_wall, o_scroll_x: +100, o_scale: 0.5, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Mousette", o_description: "", o_image_index: 0, o_category: "enemy", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				
				/* Category: Gizmo */
				{ o_id: LEVEL_OBJECT_ID.ID_BLASTER, o_can_make_bigger: true, o_sprite: global.resource_pack_sprite_blaster, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Rat Blaster", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_KEY, o_can_make_bigger: true, o_sprite: spr_key, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Key", o_description: "A key is required to open Locked Doors or Locked Warp Boxes\nIt also appears after collecting every Key Fragment in a level", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_DOOR, o_can_make_bigger: false, o_sprite: spr_door, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Door", o_description: "Teleports you to another area when player enters door", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_DOOR_LOCKED, o_can_make_bigger: false, o_sprite: spr_door_locked, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Locked Door", o_description: "Teleports you to another area when player unlocks door with a key", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WARP_BOX, o_can_make_bigger: false, o_sprite: spr_warp_box, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Warp Box", o_description: "Instantly teleports you to another area\nRegular Warp Boxes can be used many times\nBroken Warp Boxes disappears after one use", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WARP_BOX_LOCKED, o_can_make_bigger: false, o_sprite: spr_warp_box_locked, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Locked Warp Box", o_description: "Instantly teleports you to another area when unlocked with a key\nRegular Warp Boxes can be used many times\nBroken Warp Boxes disappears after one use", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_SPRING, o_can_make_bigger: false, o_sprite: spr_spring, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Spring", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_LADDER, o_can_make_bigger: true, o_sprite: spr_ladder, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Ladder", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_CHECKPOINT, o_can_make_bigger: false, o_sprite: spr_checkpoint_activated, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Checkpoint", o_description: "If a player passes a Checkpoint they can restart from that point if they lose a life", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK, o_can_make_bigger: true, o_sprite: spr_spikes_emerge_block, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Emerging Spikes", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_ONEWAY, o_can_make_bigger: false, o_sprite: spr_oneway, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: -16, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "One-Way Wall", o_description: "Walls that players can pass through via a certain direction but not the opposite direction\nTheir direction can be changed", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND, o_can_make_bigger: true, o_sprite: spr_bump_in_ground, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Bump in Ground", o_description: "Uncover items hidden in the ground when you ground-pound this bump", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL, o_can_make_bigger: true, o_sprite: spr_wall_jump_panel, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1.5, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: +16, o_alpha: 1, o_add_order_index: 1, o_name: "Wall Jump Panel", o_description: "When a character doesn't have the wall jump ability lets even these characters wall jump", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL, o_can_make_bigger: true, o_sprite: spr_wall_climb_panel, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1.5, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: +16, o_alpha: 1, o_add_order_index: 1, o_name: "Wall Climb Panel", o_description: "When a character doesn't have the wall climb ability lets even these characters wall climb", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE, o_can_make_bigger: true, o_sprite: spr_horizontal_rope, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Horizontal Rope", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WATER, o_can_make_bigger: false, o_sprite: spr_water_surface, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Water", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_LAVA, o_can_make_bigger: false, o_sprite: spr_lava_surface, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Lava", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER, o_can_make_bigger: true, o_sprite: spr_air_bubbles_spawner, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Air Bubbles", o_description: "Some characters needs air when swimming underwater", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW, o_can_make_bigger: false, o_sprite: spr_water_level_change_slow, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Change Water Level Slow", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST, o_can_make_bigger: false, o_sprite: spr_water_level_change_fast, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Change Water Level Fast", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER, o_can_make_bigger: false, o_sprite: spr_water_level_change_faster, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Change Water Level Faster", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT, o_can_make_bigger: true, o_sprite: spr_clipped_shirt, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Clipped Clothes", o_description: "Players can knock these clothes down to fall into buckets to uncover items", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_BUCKET, o_can_make_bigger: true, o_sprite: spr_bucket, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Bucket", o_description: "Let clothes drop into the bucket to get rewards", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION, o_can_make_bigger: false, o_sprite: spr_artwork_collection, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Artwork Collection", o_description: "", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_standard", o_text: "", o_video_tutorial: ""},
				{ o_id: LEVEL_OBJECT_ID.ID_RING, o_can_make_bigger: false, o_sprite: spr_ring, o_mask: spr_wall, o_scroll_x: +100, o_scale: 1, o_rotation: 0, o_color: c_white, o_scroll_y: 0, o_x_offset: 0, o_alpha: 1, o_add_order_index: 1, o_name: "Ring", o_description: "Swing with long tongue on this ring", o_image_index: 0, o_category: "gizmo", o_daily_build_category: "daily_build_featured", o_text: "", o_video_tutorial: ""}
				
				/* Add more objects here... */
			];
			#endregion /* Object Array END */
			
			for (var i = 0; i < array_length(objects); i++)
			{
				var obj = objects[i];
				if (!if_daily_build /* If you are in the regular level editor, then use the regular object categories */
				&& obj.o_category == current_object_category)
				|| (if_daily_build /* If you are in the Daily Build mode in level editor, then use the Daily Build object categories */
				&& obj.o_daily_build_category == current_object_category)
				{
					object_text = obj.o_text;
					object_video_tutorial = obj.o_video_tutorial;
					scr_draw_level_editor_placable_object(order_index, obj.o_id, obj.o_can_make_bigger, obj.o_sprite, obj.o_mask, obj.o_scroll_x, obj.o_scale, obj.o_rotation, obj.o_color, obj.o_scroll_y, obj.o_x_offset, obj.o_alpha, obj.o_add_order_index, obj.o_name, obj.o_description, obj.o_image_index);
				}
			}
			
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 114 + 64, l10n_text(current_object_name), global.default_text_size * 0.75, noone, c_white, selected_menu_alpha);
			
			total_number_of_objects = order_index - 1; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
			if (selected_object > total_number_of_objects)
			{
				selected_object = total_number_of_objects;
				select_object_menu_actual_x =- 100 * total_number_of_objects;
			}
		}
		else
		if (global.world_editor)
		&& (quit_level_editor <= 0)
		{
			total_number_of_objects = 6; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
			if (selected_object == 0)
			{
				place_object = WORLD_OBJECT_ID.ID_WALL;
				can_make_place_size_bigger = true;
				sprite_index = spr_wall;
				mask_index = spr_wall;
			}
			if (selected_object == 1)
			{
				place_object = WORLD_OBJECT_ID.ID_LEVEL;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_level_ring, 0, x, y, 1, 1, 0, c_yellow, 0.5);
				draw_sprite_ext(spr_level, 0, x, y, 1, 1, 0, c_black, 0.5);
				sprite_index = spr_noone; 
				mask_index = spr_wall;
			}
			if (selected_object == 2)
			{
				place_object = WORLD_OBJECT_ID.ID_EXIT;
				can_make_place_size_bigger = false;
				sprite_index = spr_map_exit;
				mask_index = spr_wall;
			}
			if (selected_object == 3)
			{
				place_object = WORLD_OBJECT_ID.ID_RIGHT_DOWN;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 0, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 4)
			{
				place_object = WORLD_OBJECT_ID.ID_UP_RIGHT;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 90, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 5)
			{
				place_object = WORLD_OBJECT_ID.ID_UP_LEFT;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 180, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 6)
			{
				place_object = WORLD_OBJECT_ID.ID_LEFT_DOWN;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 270, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
		}
		
		/* Draw an arrow pointing to currently selected object */
		if (level_editor_menu == "select_object_menu")
		|| (level_editor_menu == "")
		{
			draw_set_alpha(selected_menu_alpha);
			draw_set_color(c_white);
			draw_arrow(display_get_gui_width() * 0.5, 16 - 8 + 64 + scr_wave(0, -8, 1), display_get_gui_width() * 0.5, 16 + 8 + 64 + scr_wave(0, -8, 1), 30);
			draw_arrow(display_get_gui_width() * 0.5, 110 - 16 + 8 + 64 + scr_wave(0, 8, 1), display_get_gui_width() * 0.5, 110 - 16 - 8 + 64 + scr_wave(0, 8, 1), 30);
		}
		draw_set_alpha(1);
	}
	#endregion /* List of Placable Objects END */
	
}