/// @description
y_scale = lerp(y_scale, 1, 0.1)
x_scale = lerp(x_scale, 1, 0.1)

draw_sprite_ext(sprite_index, image_index, x, y, x_scale * side, y_scale, image_angle, image_blend, image_alpha)

if imunity_timer > 0 { imunity_timer -- }

if imunity_timer > 0 and imunity_timer % 5 == 0 
{
	gpu_set_fog(true, c_white, 0, 0)
	draw_sprite_ext(sprite_index, image_index, x, y, x_scale * side, y_scale, image_angle, image_blend, image_alpha)
	gpu_set_fog(false, c_white, 0, 0)
}


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




