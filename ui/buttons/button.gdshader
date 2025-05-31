shader_type canvas_item;
uniform vec4 color: source_color;
uniform vec4 to_color: source_color;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
	vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	if (distance(screen_color, color) < 0.3) {
        COLOR = to_color;
    }
	COLOR = screen_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
