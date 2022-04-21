if ( raycast_info == noone) return;


if (raycast_info.type != rc_type.nothing){
	draw_set_color( c_red );
	draw_circle( raycast_info.x, raycast_info.y, 2, false );
	draw_set_color( c_green );
}
else draw_set_color( c_yellow );

draw_line_width( x, y, raycast_info.x, raycast_info.y, 2 );

