/// @description
var _up, _down, _left, _right, _shoot

if gp != noone {
	_up = global.gamepad.on_press_up(gp)
	_down = global.gamepad.on_press_down(gp)
	_left = global.gamepad.on_press_left(gp)
	_right = global.gamepad.on_press_right(gp)
	_shoot = global.gamepad.shooting(gp)
} else {
	_up = keyboard_check(keys.up)
	_down = keyboard_check(keys.down)
	_left = keyboard_check(keys.left)
	_right = keyboard_check(keys.right)
	_shoot = mouse_check_button(keys.shoot)
}



if keyboard_check(ord("R")) {state = STATES.DEATH} // delete


depth = -y

gun_recoil.position = lerp(gun_recoil.position, 0, .05)
gun_recoil.scale = lerp(gun_recoil.scale, 1, .05)

if life <= 0 { state = STATES.DEATH }

switch state {
	case STATES.IDLE:
		sprite_index = sprites.idle
		hspd = 0;
		vspd = 0;
		
		if _shoot { shoot() }
		move_gun()
		if (_up or _down or _left or _right) { state = STATES.RUN }
		break;
	case STATES.RUN:
		sprite_index = sprites.walk
		var _ang = point_direction(0, 0, (_right - _left), (_down - _up))
		hspd = lengthdir_x(spd, _ang)
		vspd = lengthdir_y(spd, _ang)
		
		if _shoot { shoot() }
		move_gun()
		if (!_up and !_down and !_right and !_left) { state = STATES.IDLE }
		break;
	case STATES.DEATH:
		sprite_index = sprites.dead
		break;
}

if hspd !=0 {
	side = sign(hspd)
}

if hspd != 0 or vspd != 0 {
	var _part = part_system_create(pt_puf)
	part_system_position(_part, x, y -2)
}

if imunity_timer > 0 {
	sprite_index = sprites.damage
}
