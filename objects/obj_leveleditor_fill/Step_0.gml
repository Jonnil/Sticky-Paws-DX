delay+=1;
if delay>1{
if (place_meeting(x,y,obj_level_start))or(place_meeting(x,y,obj_level_end))or(x<camera_get_view_x(view_camera[view_current]))or(x>camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])){instance_destroy();}else{
if!place_meeting(x-32,y,obj_leveleditor_placed_object)and!place_meeting(x-32,y,obj_leveleditor_fill)and!place_meeting(x-32,y,obj_level_start)and!place_meeting(x-32,y,obj_level_end)and(x>camera_get_view_x(view_camera[view_current])){instance_create_depth(x-32,y,0,obj_leveleditor_fill);}
if!place_meeting(x+32,y,obj_leveleditor_placed_object)and!place_meeting(x+32,y,obj_leveleditor_fill)and!place_meeting(x+32,y,obj_level_start)and!place_meeting(x+32,y,obj_level_end)and(x<camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])){instance_create_depth(x+32,y,0,obj_leveleditor_fill);}
move_snap(initialize_hsnap,initialize_vsnap);
obj=instance_create_depth(x,y,0,obj_leveleditor_placed_object);with(obj){object=obj_leveleditor.place_object;}
instance_destroy();}}