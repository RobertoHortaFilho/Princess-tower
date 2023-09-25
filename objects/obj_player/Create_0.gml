/// @description 

keys = {
	up: vk_up,
	down: vk_down,
	left: vk_left,
	right: vk_right,
	shoot: mb_left
}

gp = global.gamepad.g1

sprites = {
	idle: spr_p1_idle,
	walk: spr_p1_walk,
	damage: spr_p1_damage,
	dead: spr_p1_dead,
}

number = 1
state = STATES.IDLE


life = 10
spd = 1
hspd = 0
vspd = 0
atkspd = 30
dmg = 1

imunity_timer = 0
life_animation = false
y_scale = 1
x_scale = 1
side = 1

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
gun_distance = 6
gun_direction = 0


function move_gun_mouse() {
	var _point_x = mouse_x
	var _point_y = mouse_y
	var _point_x_start = x
	var _point_y_start = y
	gun_direction = point_direction(_point_x_start, _point_y_start, _point_x, _point_y)
	
}

function move_gun_gamepad() {
	var _aixsv = global.gamepad.aim_v(gp)
	var _aixsh = global.gamepad.aim_h(gp)
	if (_aixsh != 0 or _aixsv != 0) {
		var _dir = point_direction(0,0, _aixsh, _aixsv)
		if (gun_direction < 45 and _dir > 315) { gun_direction = _dir }
		else if (gun_direction > 315 and _dir < 45) { gun_direction = _dir }
		gun_direction = lerp(gun_direction, _dir, .2)
	}
}

function move_gun() {
	if gp == noone {
		move_gun_mouse()
	} else {
		move_gun_gamepad()
	}
	gun_position.x = x + lengthdir_x(gun_distance, gun_direction)
	gun_position.y = y - 5 + lengthdir_y(gun_distance, gun_direction)
	gun_position.angle = gun_direction
	if gun_direction < 90 or gun_direction > 270 {
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
			direction: gun_position.angle,
			dmg: dmg,
		})
		gun_recoil.position = -3
		gun_recoil.scale = 1.3
		src_cam_shake(1)
	}
}

function levar_dano() {
	if (imunity_timer <= 0 and state != STATES.DEATH) {
		life -= 1
		// visual
		life_animation = true
		imunity_timer = game_get_speed(gamespeed_fps)
		x_scale = 1.5
		y_scale = .7
		src_cam_shake(3)
	}
}


take_damage = levar_dano
