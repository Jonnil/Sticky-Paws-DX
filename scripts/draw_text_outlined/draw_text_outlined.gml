/// @description draw_text_outlined(x,y,string,text_size,outline_color,text_color,image_alpha);
/// @param x
/// @param y
/// @param string
/// @param text_size
/// @param outline_color
/// @param text_color
/// @param image_alpha

function draw_text_outlined()
{
	var x_position=argument0;/*The texts x origin position*/
	var y_position=argument1;/*The texts y origin position*/
	
	var string_text=argument2;
	var text_size=argument3;
	var text_color=argument5;
	
	var outline_color=argument4;
	var y_offset=0;/*Y origin position offset for broken fonts*/
	var img_alpha=argument6;
	
	#region /*Arabic text offset, only used if you have arabic text*/
	if (asset_get_type("font_other_languages")==asset_font)
	and(global.language_localization=localization.ar_sa)
	{
		y_offset=5;
	}
	else
	{
		y_offset=0;
	}
	#endregion /*Arabic text offset, only used if you have arabic text END*/
	
	/*
	this is an "array", meaning a list, to get the first value in a list you ask for 
	"vector[0]" then add more [0] if the list has a list in it 
	example
	vector[0][0] gives us 1
	*/
	var vector = [ 
	[1,1],
	[-1,-1],
	[0,1],
	[1,0],
	[0,-1],
	[-1,0],
	[-1,1],
	[1,-1]
	]; 

	var i;
	for(i = 0; i < array_height_2d(vector) - 1; i+=1)
	{
		draw_text_transformed_color(x_position+vector[i][0],y_position+vector[i][1]+y_offset,string_text,text_size,text_size,0,outline_color,outline_color,outline_color,outline_color,img_alpha);
	}

/*Text*/ draw_text_transformed_color(x_position,y_position+y_offset,string_text,text_size,text_size,0,text_color,text_color,text_color,text_color,img_alpha);
}