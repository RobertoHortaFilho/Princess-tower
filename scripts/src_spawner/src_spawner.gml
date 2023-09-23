// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Spawner(_qtd, _max = 10) constructor {
		self.qtd = _qtd
		self.max_enemys = _max
		self.in_game = 0
		self.delay = 20
		
		self.reload_in_game = function() {
			self.in_game = instance_number(obj_enemy_body)
			if (self.qtd <= 0 and self.in_game == 0) {
				//show_message("passou")
			}
		}
		
		self.create_enemy = function(_obj) {
			var _xx = irandom_range(0, room_width)
			var _yy = irandom_range(0, room_height)
			var _top = choose(true, false)
			var _left = choose(true, false)
			var _x = _left ? -_xx : room_width + _xx
			var _y = _top ? -_yy : room_height + _yy
			instance_create_layer(_x, _y, "enemys", _obj)
			instance_create_layer(_x, _y, "enemys", obj_effect_danger)
			self.qtd --;
		}
		
		self.spawn_new_enemys = function() {
			self.reload_in_game()
			if self.in_game < self.max_enemys and self.qtd > 0 {
				self.create_enemy(obj_enemy_goblin_bow)
			}
		}	
}