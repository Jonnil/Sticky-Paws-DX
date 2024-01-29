scr_menu_navigation_with_joystick_delay();

if (!global.pause) /* If you are no longer pausing */
{
	scr_delete_sprite_properly(global.pause_screenshot);
	room_goto(global.pause_room); /* Go back to room where you paused. You want to use "room goto", not room = global.pause_room, as that makes it go to incorrect rooms */
}