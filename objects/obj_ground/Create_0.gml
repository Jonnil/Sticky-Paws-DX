depth = 12;
tile = 0;

look_outward=17;
same_object = obj_ground;

ground_surface = 0;
/*
0 = default
1 = dirt
2 = glass
3 = grass
4 = gravel
5 = metal
6 = stone
7 = wood*/

image_speed=0;

#region /*Set Tile*/
tile=44;
if (position_meeting(x,y-look_outward,same_object))
{
 tile=0;
 if (position_meeting(x+look_outward,y,same_object))
 {
  tile=4;
  if (position_meeting(x,y+look_outward,same_object))
  {
   tile=12;
   if (position_meeting(x-look_outward,y,same_object))
   {
    tile=28;
    if (position_meeting(x+look_outward,y-look_outward,same_object))
    {
     tile=29;
     if (position_meeting(x+look_outward,y+look_outward,same_object))
     {
      tile=33;
      if (position_meeting(x-look_outward,y+look_outward,same_object))
      {
       tile=39;
       if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=43;}
      }
      else if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=40;}
     }
     else if (position_meeting(x-look_outward,y+look_outward,same_object))
     {
      tile=37;
      if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=41;}
     }
     else if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=36;}
    }
    else if (position_meeting(x+look_outward,y+look_outward,same_object))
    {
     tile=30;
     if (position_meeting(x-look_outward,y+look_outward,same_object))
     {
      tile=34;
      if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=42;}
     }
     else if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=38;}
    }
    else if (position_meeting(x-look_outward,y+look_outward,same_object))
    {
     tile=31;
     if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=35;}
    }
    else if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=32;}
   }
   else if (position_meeting(x+look_outward,y-look_outward,same_object))
   {
    tile=16;
    if (position_meeting(x+look_outward,y+look_outward,same_object)){tile=18;}
   }
   else if (position_meeting(x+look_outward,y+look_outward,same_object)){tile=17;}
  }
  else if (position_meeting(x-look_outward,y,same_object))
  {
   tile=15;
   if (position_meeting(x+look_outward,y-look_outward,same_object))
   {
    tile=25;
    if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=27;}
   }
   else if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=26;}
  }
  else if (position_meeting(x+look_outward,y-look_outward,same_object)){tile=8;}
 }
 else if (position_meeting(x,y+look_outward,same_object))
 {
  tile=45;
  if (position_meeting(x-look_outward,y,same_object))
  {
   tile=14;
   if (position_meeting(x-look_outward,y+look_outward,same_object))
   {
    tile=22;
    if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=24;}
   }
   else if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=23;}
  }
 }
 else if (position_meeting(x-look_outward,y,same_object))
 {
  tile=7;
  if (position_meeting(x-look_outward,y-look_outward,same_object)){tile=11;}
 }
}
else if (position_meeting(x+look_outward,y,same_object))
{
 tile=1;
 if (position_meeting(x,y+look_outward,same_object))
 {
  tile=5;
  if (position_meeting(x-look_outward,y,same_object))
  {
   tile=13;
   if (position_meeting(x+look_outward,y+look_outward,same_object))
   {
   tile=19;
    if (position_meeting(x-look_outward,y+look_outward,same_object)){tile=21;}
   }
   else if (position_meeting(x-look_outward,y+look_outward,same_object)){tile=20;}
  }
  else if (position_meeting(x+look_outward,y+look_outward,same_object)){tile=9;}
 }
 else if (position_meeting(x-look_outward,y,same_object))
 {
  tile=46;
 }
}
else if (position_meeting(x,y+look_outward,same_object))
{
 tile=2;
 if (position_meeting(x-look_outward,y,same_object))
 {
  tile=6;
  if (position_meeting(x-look_outward,y+look_outward,same_object)){tile=10;}
 }
}
else if (position_meeting(x-look_outward,y,same_object))
{
 tile=3;
}
#endregion /*Set Tile END*/