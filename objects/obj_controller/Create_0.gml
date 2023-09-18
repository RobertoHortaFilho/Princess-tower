/// @description Insert description here
// You can write your code in this editor

qtd_players = 1


if qtd_players == 1 {
	var _p = instance_create_depth(room_width / 2, room_height/4 * 3, 0,obj_player)
	_p.keys.up = ord("W")
	_p.keys.down = ord("S")
	_p.keys.left = ord("A")
	_p.keys.right = ord("D")
} else if qtd_players == 2 {
	instance_create_depth(room_width / 3, room_height/4, 0,obj_player)
	var _p2 = instance_create_depth((room_width / 3) * 2, room_height/4, 0,obj_player)
	_p2.keys.up = ord("W")
	_p2.keys.down = ord("S")
	_p2.keys.left = ord("A")
	_p2.keys.right = ord("D")
}






