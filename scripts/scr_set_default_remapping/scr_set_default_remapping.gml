function scr_set_default_remapping()
{
	
	scr_set_default_remapping_player1_keyboard();
	scr_set_default_remapping_player1_gamepad();
	scr_set_default_remapping_player2_keyboard();
	scr_set_default_remapping_player2_gamepad();
	scr_set_default_remapping_player3_keyboard();
	scr_set_default_remapping_player3_gamepad();
	scr_set_default_remapping_player4_keyboard();
	scr_set_default_remapping_player4_gamepad();
	
	scr_save_default_controls_to_config(); /*Run this script after running every other script*/
	
}