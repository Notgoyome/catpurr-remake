shader_type canvas_item;
uniform vec4 color: source_color;
uniform vec4 to_color: source_color;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if (COLOR == color) {
		COLOR = to_color;
	}

	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
