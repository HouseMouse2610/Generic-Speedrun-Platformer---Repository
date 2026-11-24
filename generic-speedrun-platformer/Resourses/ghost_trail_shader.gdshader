shader_type canvas_item;

uniform vec4 color : source_color;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    if (tex.a > 0.0) {
        COLOR = vec4(color.rgb, tex.a * color.a * COLOR.a);
    } else {
        COLOR = vec4(0.0);
    }
}