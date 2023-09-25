/// @description Insert description here
// You can write your code in this editor
var _reset = true;
for (var _i = 0; _i < instance_number(obj_player); _i ++) {
	if instance_find(obj_player, _i).state != STATES.DEATH {
		_reset = false
	}
}
if _reset and alarm[1] == -1 {
	alarm[1] = 180
}

var _disconnected = global.gamepad.who_is_disconnected()
if (_disconnected) {
	show_message(_disconnected)
}


