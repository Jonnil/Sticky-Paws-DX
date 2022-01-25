if (show_text = true){draw_set_alpha(0.5);
if (!string(text_row6= "")){draw_rectangle_color (32, 32+64,684, 256+64,c_white,c_white,c_white,c_white,false);}else
if (!string(text_row5 = "")){draw_rectangle_color (32, 32+64,684, 224+64,c_white,c_white,c_white,c_white,false);}else
if (!string(text_row4 = "")){draw_rectangle_color (32, 32+64,684, 192+64,c_white,c_white,c_white,c_white,false);}else
if (!string(text_row3 = "")){draw_rectangle_color (32, 32+64,684, 160 +64,c_white,c_white,c_white,c_white,false);}else
if (!string(text_row2 = "")){draw_rectangle_color (32, 32+64,684, 128+64,c_white,c_white,c_white,c_white,false);}else
if (!string(text_row1 = "")){draw_rectangle_color (32, 32+64,684,96+64,c_white,c_white,c_white,c_white,false);}
draw_set_alpha(1);
if (!string(text_row1 = "")){draw_text_transformed_color (64, 128+ textrow_y,string(text_row1), global.default_text_size, global.default_text_size, 0, c_black,c_black,c_black,c_black, 1);}
if (!string(text_row2 = "")){draw_text_transformed_color (64, 160 + textrow_y,string(text_row2), global.default_text_size, global.default_text_size, 0, c_black,c_black,c_black,c_black, 1);}
if (!string(text_row3 = "")){draw_text_transformed_color (64, 192+ textrow_y,string(text_row3), global.default_text_size, global.default_text_size, 0, c_black,c_black,c_black,c_black, 1);}
if (!string(text_row4 = "")){draw_text_transformed_color (64, 224+ textrow_y,string(text_row4), global.default_text_size, global.default_text_size, 0, c_black,c_black,c_black,c_black, 1);}
if (!string(text_row5 = "")){draw_text_transformed_color (64, 256+ textrow_y,string(text_row5), global.default_text_size, global.default_text_size, 0, c_black,c_black,c_black,c_black, 1);}
if (!string(text_row6= "")){draw_text_transformed_color (64, 288+ textrow_y,string(text_row6), global.default_text_size, global.default_text_size, 0, c_black,c_black,c_black,c_black, 1);}
}