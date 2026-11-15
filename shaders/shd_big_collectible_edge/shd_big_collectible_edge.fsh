varying vec2 v_vTexcoord;
varying vec4 v_vColor;

void main()
{
    float source_alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
    gl_FragColor = vec4(v_vColor.rgb, source_alpha * v_vColor.a);
}
