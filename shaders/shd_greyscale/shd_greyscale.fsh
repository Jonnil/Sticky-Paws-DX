//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColor;

uniform float whichShaderToUse ;

void main()
{
	if(whichShaderToUse == 0. ){
		vec4 this_colour = v_vColor * texture2D( gm_BaseTexture, v_vTexcoord ); 
		float new_colour = max(this_colour.r,max(this_colour.g,this_colour.b));
		gl_FragColor = vec4(new_colour,new_colour,new_colour,1.0);
	}
	
	if(whichShaderToUse == 1. ){
		vec4 this_colour = v_vColor * texture2D( gm_BaseTexture, v_vTexcoord ); 
		float new_colour = dot(this_colour.rgb, vec3(0.2126, 0.7152, 0.0722 ));
		gl_FragColor = vec4(new_colour,new_colour,new_colour,1.0);
	}
	
	if(whichShaderToUse == 2. ){
		vec4 this_colour = v_vColor * texture2D( gm_BaseTexture, v_vTexcoord ); 
		float new_colour = (this_colour.r+this_colour.g+this_colour.b)/3.0;
		gl_FragColor = vec4(new_colour,new_colour,new_colour,1.0);
	}
	
	if(whichShaderToUse == 3. ){
		vec4 this_colour = v_vColor * texture2D( gm_BaseTexture, v_vTexcoord ); 
		float new_colour = (max(this_colour.r, max(this_colour.g, this_colour.b)) 
				  + min(this_colour.r, min(this_colour.g, this_colour.b)) ) / 2.0 ;
		gl_FragColor = vec4(new_colour,new_colour,new_colour,1.0);
	}
    
}
