depth = -20;

scr_set_arrays();

///Narrator Voice variable handeling

///No Narrator
if global.narrator>=0{
menuvoice_titlesplash=noone;
menuvoice_1player=noone;
menuvoice_2player=noone;
menuvoice_3player=noone;
menuvoice_4player=noone;
menuvoice_leveleditor=noone;
menuvoice_leveleditor_denied=noone;
menuvoice_options=noone;
}

can_remap_key=false;
pause_text_alpha=0;
pause_text_lerp=1;
menu="continue";
menu_delay=10;
lastkey=noone;
remapping_player=1;
input_key=false;
menu_joystick_delay=0;
can_navigate=true;
remap_y_pos=0;
menu_cursor_index=0;
in_settings=false;
can_navigate_settings_sidebar=true;
navigate_slider=false;
menu_remap_key_number=0;
menu_y_offset=0;/*This is the y offset that will have lerping to make the menu scrolling smooth*/
menu_y_offset_real=0;/*This is the real y offset for the menu, used for menu scrolling*/
menu_cursor_y_position=0;
background_brightness_menu_lerp = 0;

#region /*Customize look of Options Menu*/
c_menu_outline=c_black;
c_menu_fill=c_white;
#endregion /*Customize look of Options Menu END*/

/*Pause sound effects and music*/audio_pause_all();