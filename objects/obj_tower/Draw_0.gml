/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y, obj_enemy_body) or place_meeting(x, y, obj_player) {
	image_alpha = lerp(image_alpha, .6, .05)
} else {
	image_alpha = lerp(image_alpha, 1, .1)
}

angle_variance = lerp(angle_variance, 0, .05)
angle = angle_variance * choose(1, -1)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha)

draw_text(x + 30, y, life)
