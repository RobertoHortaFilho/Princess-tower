/// @description
var _x = room_width / 2
if state == "players" {
	var _up = keyboard_check_pressed(keys.up)
	var _down = keyboard_check_pressed(keys.down)
	var _confirm = keyboard_check_pressed(keys.confirm)
	var _back = keyboard_check_pressed(keys.back)
	
	if _confirm {
		global.qtd_players = selected + 1
		room_goto(rm_tower)
	}
	
	if (_back) { state = "start" }

	if _up {
		selected --;
	} else if _down {
		selected ++
	}
	selected = clamp(selected, 0, max_selected -1)

	//show_debug_message(selected)
	for (var _i = 0; _i < max_selected; _i++) {
		draw_sprite(options[_i], selected == _i ? 1 : 0, _x, 40 + (50 * _i))
	}
} else if (state == "start") {
	draw_sprite(spr_start, 0, _x, room_height / 4 * 3)
	if keyboard_check_pressed(vk_anykey) { state = "players" }
}












