shader_type canvas_item;

uniform float intensity : hint_range(0.0, 5.0) = 1.0;
uniform float smoothness : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    // Calculate distance from the center (0.5, 0.5)
    float dist = distance(UV, vec2(0.5));
    // Apply smoothness and intensity
    float vignette = smoothstep(0.7, 0.7 - smoothness, dist * intensity);
    COLOR = vec4(0.0, 0.0, 0.0, 1.0 - vignette);
}
