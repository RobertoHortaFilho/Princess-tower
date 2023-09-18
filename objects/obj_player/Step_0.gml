/// @description Insert description here
// You can write your code in this editor

var _up = keyboard_check(keys.up)
var _down = keyboard_check(keys.down)
var _left = keyboard_check(keys.left)
var _right = keyboard_check(keys.right)

depth = -y

gun_recoil.position = lerp(gun_recoil.position, 0, .05)
gun_recoil.scale = lerp(gun_recoil.scale, 1, .05)

if life <= 0 { state = STATES.DEATH }

switch state {
	case STATES.IDLE:
		hspd = 0;
		vspd = 0;
		
		if mouse_check_button(keys.shoot) { shoot() }
		move_gun_mouse()
		if (_up or _down or _left or _right) { state = STATES.RUN }
		break;
	case STATES.RUN:
		var _ang = point_direction(0, 0, (_right - _left), (_down - _up))
		hspd = lengthdir_x(spd, _ang)
		vspd = lengthdir_y(spd, _ang)
		
		if mouse_check_button(keys.shoot) { shoot() }
		move_gun_mouse()
		if (!_up and !_down and !_right and !_left) { state = STATES.IDLE }
		break;
	case STATES.DEATH:
		
		break;
}

