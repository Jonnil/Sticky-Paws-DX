var player_exists = instance_exists(obj_player);
var chair_exists = instance_exists(obj_chair_and_table);

if (player_exists)
{
    if (obj_player.intro_animation == "ending_chair")
    {
        if (chair_exists)
        {
            var nearest_chair = instance_nearest(x, y, obj_chair_and_table);
            x = nearest_chair.x + 23;
            y = nearest_chair.y - 16;
        }
    }
    else
    {
        if (attach_player)
        {
            var nearest_player = instance_nearest(x, y, obj_player);
            x = nearest_player.x;
            y = nearest_player.bbox_top - 32;
        }
    }
}

if (room == room_world_map)
{
    visible = (global.win == true);
}