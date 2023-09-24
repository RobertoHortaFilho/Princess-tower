/// @description

var _up = keyboard_check_pressed(keys.up)
var _down = keyboard_check_pressed(keys.down)

if _up {
	selected --;
} else if _down {
	selected ++
}
selected = clamp(selected, 0, max_selected -1)

//show_debug_message(selected)
for (var _i = 0; _i < max_selected; _i++) {
	draw_sprite(options[_i], selected == _i ? 1 : 0, 50, 30 + (50 * _i))
}












