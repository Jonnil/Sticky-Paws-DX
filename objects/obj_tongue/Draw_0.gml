if asset_get_type("obj_player") == asset_object and instance_number(obj_player) > 0{
if asset_get_type("spr_wall") == asset_sprite{mask_index=spr_wall;}
timer += 1;
//if timer<3{if place_meeting(x, y, obj_wall){with(instance_nearest(x, y, obj_player)){can_tongue = true;}instance_destroy();}}
if timer > 10{if place_meeting(x, y, obj_player) and instance_nearest(x, y, obj_player).rope_swing = false{with(instance_nearest(x, y, obj_player)){can_tongue = true;}instance_destroy();}}
if timer = 15{speed = 0;}
if timer>25{move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);obj_player.rope_swing = false}

/*Make tongue homing toward closest object*/
if timer<25{
if instance_exists(obj_ring){if distance_to_object(instance_nearest(mouse_x, mouse_y, obj_ring))<64{move_towards_point(instance_nearest(x, y, obj_ring).x, instance_nearest(x, y, obj_ring).y,speed);}}
}

/*Match movement with player movement*/
if obj_player.rope_swing = false{hspeed+=obj_player.hspeed/8;vspeed+=obj_player.vspeed/8;}

/*Stick to wall*/

if timer<25{
/*Can't interact with black wall*/if asset_get_type("obj_black_wall") == asset_object and position_meeting(x, y, obj_black_wall){if timer<15{timer = 15;speed = 0;}timer += 1;}/*Can't interact with black wall END*/
else
/*rope_swing on things*/
if position_meeting(x, y, obj_wall)
or position_meeting(x, y, obj_ring)
{speed = 0;timer = 15;with(instance_nearest(x, y, obj_player)){rope_swing = true;}}/*rope_swing on things END*/
else
/*Fly toward object*/if asset_get_type("obj_enemy") == asset_object and instance_number(obj_enemy) > 0 and place_meeting(x, y, obj_enemy){if!collision_line(x, y,instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true) and timer<35{speed = 0;}
move_towards_point(instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y,8)
with(instance_nearest(x, y, obj_player)){move_towards_point(instance_nearest(x, y, obj_tongue).x, instance_nearest(x, y, obj_tongue).y,16)}
with(instance_nearest(x, y, obj_enemy)){hspeed = 0;vspeed = 0;speed = 0;}
}/*Fly toward object END*/
}

//if collision_line(x, y,instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true){move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);with(instance_nearest(x, y, obj_player)){rope_swing = false;}}

if instance_nearest(x, y, obj_player).climb= true or instance_nearest(x, y, obj_player).horizontal_rope_climb= true{move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);obj_player.rope_swing = false;}

draw_line_width_color (x, y,instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 3,c_red,c_red);
draw_self();}