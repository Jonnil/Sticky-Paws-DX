what_player_navigate = 1;
menu = "";
open_dropdown = false;
menu_cursor_index = 0;
menu_delay = 3;
image_alpha = 0;
sprite_index = global.resource_pack_sprite_artwork_collection;
max_artwork = 50; /* The number of artworks corresponds with the total amount of big collectibles in the game */
can_navigate = false;
current_comment = "";
xx = window_get_width() * 0.5;
yy = y;
gamepad_stick = false;

scr_get_each_big_collectible_from_main_game();