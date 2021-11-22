draw_self();

draw_text_outlined(x-64,y-64,"distance_to_point(x, second_x) / sprite_width: "+string(distance_to_point(x, second_x) / sprite_width),global.default_text_size,c_white,c_black,1);
draw_text_outlined(x-64,y-32,"distance_to_point(y, second_y) / sprite_height: "+string(distance_to_point(y, second_y) / sprite_height),global.default_text_size,c_white,c_black,1);
draw_text_outlined(x-64,y-128,"image_xscale: "+string(image_xscale),global.default_text_size,c_white,c_black,1);
draw_text_outlined(x-64,y-96,"image_yscale: "+string(image_yscale),global.default_text_size,c_white,c_black,1);