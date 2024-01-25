for(var i = 1; i <= global.max_big_collectible; i += 1)
{
	if (big_collectible == i && global.big_collectible[i])
	{
		image_alpha = 0.5;
		image_blend = c_gray;
		break;
	}
}