/// @description Insert description here
// You can write your code in this editor

draw_self()


draw_sprite_ext(
	spr_player_gun,
	image_index,
	gun_position.x,
	gun_position.y + gun_recoil.position,
	1 * gun_recoil.scale,
	1 * gun_position.side * gun_recoil.scale,
	gun_position.angle,
	image_blend,
	image_alpha
)




