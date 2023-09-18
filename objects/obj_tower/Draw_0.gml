/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y, obj_enemy_body) or place_meeting(x, y, obj_player) {
	image_alpha = lerp(image_alpha, .7, .05)
} else {
	image_alpha = lerp(image_alpha, 1, .1)
}

draw_self()


