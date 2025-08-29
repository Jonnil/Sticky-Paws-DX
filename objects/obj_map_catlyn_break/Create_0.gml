seq = layer_sequence_create(layer_create(399), x, y, seq_catlyn_break);
layer_sequence_destroy(seq);
alarm_set(0, 60);
visible = false;
mask_index = spr_wall;
can_click = true;
