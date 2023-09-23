/// @description Insert description here
// You can write your code in this editor

qtd_players = 1
global.p1 = noone
global.p2 = noone


if qtd_players == 1 {
	global.p1 = instance_create_depth(room_width / 2, room_height/4 * 3, 0,obj_player)
	global.p1.keys.up = ord("W")
	global.p1.keys.down = ord("S")
	global.p1.keys.left = ord("A")
	global.p1.keys.right = ord("D")
} else if qtd_players == 2 {
	global.p1 = instance_create_depth(room_width / 3, room_height/4, 0,obj_player)
	global.p2 = instance_create_depth((room_width / 3) * 2, room_height/4, 0,obj_player)
	global.p2.keys.up = ord("W")
	global.p2.keys.down = ord("S")
	global.p2.keys.left = ord("A")
	global.p2.keys.right = ord("D")
}


global.spawner = new Spawner(15, 5)
alarm[0] = 1





