x = x + random_range(-4, + 4);
y = y + random_range(-4, + 4);
depth = (-bbox_bottom) * 0.04 + 100;
image_index = random(10);
image_speed = 0.1;
image_xscale = irandom(1);if (image_xscale == 0){image_xscale = -1;}
mask_index = spr_wall;