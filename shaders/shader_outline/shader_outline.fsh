varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelH;
uniform float pixelW;

void main()
{
	vec2 offsetX;
	offsetX.x = pixelW;
	vec2 offsetY;
	offsetY.y = pixelH;
 
	vec3 outlineCol = vec3(1.0,1.0,1.0);
	vec3 pixelColAdd = vec3(0.0,0.0,0.0);
 
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord).a;
 
	if (alpha == 0.0) {
		pixelColAdd += outlineCol;
	}
 
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetX).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetY).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetY).a);
 
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
	gl_FragColor.rgb += pixelColAdd;
}
