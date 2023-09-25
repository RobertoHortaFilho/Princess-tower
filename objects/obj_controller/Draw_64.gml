/// @description Insert description here
// You can write your code in this editor

if (global.p1 != noone) {
	if global.p1.life_animation {
		global.p1.life_animation = false
		var _x =  (sprite_get_width(spr_hearth) - 10) * global.p1.life
		instance_create_layer(20 + _x,20,"wall",obj_effect_gui, {sprite_index: spr_hearth})
	}
	for (var _i = 0; _i < global.p1.life; _i ++) {
		var _xx = (sprite_get_width(spr_hearth) - 10) * _i
		draw_sprite(spr_hearth, 0, 20 + _xx, 20)
	}
}


if (global.p2 != noone) {
	if global.p2.life_animation {
		global.p2.life_animation = false
		var _x =  (sprite_get_width(spr_hearth) - 10) * global.p2.life
		instance_create_layer(700 + _x,20,"wall",obj_effect_gui, {sprite_index: spr_hearth})
	}
	for (var _i = 0; _i < global.p2.life; _i ++) {
		var _xx = (sprite_get_width(spr_hearth) - 10) * _i
		draw_sprite(spr_hearth, 0, 700 + _xx, 20)
	}
}

var _middle_x = camera_get_view_width(0) / 2
show_debug_message(_middle_x)
draw_text(_middle_x, 20, (wave + 1))








