depth = 12;

/*Add walls up outide view*/if!position_meeting(x, y-sprite_height, obj_wall) and y <= 0{instance_create_depth(x, y-sprite_height, 0, obj_wall); instance_create_depth(x, y-sprite_height* 2, 0, obj_wall);}
/*Add walls down outide view*/if!position_meeting(x, y+ sprite_height, obj_wall) and y >=room_height{instance_create_depth(x, y+ sprite_height, 0, obj_wall); instance_create_depth(x, y+ sprite_height* 2, 0, obj_wall);}
/*Add walls left outide view*/if!position_meeting(x -sprite_width, y, obj_wall) and x <= 0{instance_create_depth(x -sprite_width, y, 0, obj_wall); instance_create_depth(x -sprite_width* 2, y, 0, obj_wall);}
/*Add walls right outide view*/if!position_meeting(x + sprite_width, y, obj_wall) and x >=room_width{instance_create_depth(x + sprite_width, y, 0, obj_wall); instance_create_depth(x + sprite_width* 2, y, 0, obj_wall);}
mask_index = spr_wall;