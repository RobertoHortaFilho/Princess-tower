/// @description Insert description here
// You can write your code in this editor


keys = {
	up: vk_up,
	down: vk_down,
	left: vk_left,
	right: vk_right,
	shoot: mb_left
}

state = STATES.IDLE

spd = 1
hspd = 0
vspd = 0
atkspd = 30


gun_position = {
	x: x, 
	y: y,
	angle: 0,
	side: 1,
}

gun_recoil = {
	position: 0,
	scale: 1,
}

function move_gun_mouse() {
	var _distance = 6
	var _point_x = mouse_x
	var _point_y = mouse_y
	var _point_x_start = x
	var _point_y_start = y
	var _direction = point_direction(_point_x_start, _point_y_start, _point_x, _point_y)
	gun_position.x = x + lengthdir_x(_distance, _direction)
	gun_position.y = y - 5 + lengthdir_y(_distance, _direction)
	gun_position.angle = _direction
	if _direction < 90 or _direction > 270 {
		gun_position.side = 1
	} else {
		gun_position.side = -1
	}
}

function shoot() {
	if alarm[0] == -1 {
		alarm[0] = atkspd
		// create shoot
		var _bullet = instance_create_layer(gun_position.x, gun_position.y + gun_recoil.position, "bullets", obj_player_bullete, {
			direction: gun_position.angle
		})
		gun_recoil.position = -3
		gun_recoil.scale = 1.3
	}
}

function levar_dano() {
	//show_message("take_damage")
}

take_damage = levar_dano
