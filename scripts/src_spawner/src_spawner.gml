// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Stages () constructor {
	self.struct = ds_list_create()
	
	self.add_maps = function () {
		ds_list_add(self.struct, [4, 2],
		[1, 3],
		//[8, 2],
		//[4, 4],
		//[8, 3],
		//[7, 4],
		)
	}
	// fazer com q a lista em vez de ser qtd e max 
	// vai ser o numero de cada tipo que vai aparecer na sala ex [10= total, 3= normal, 5=bow, 2=wolf ]
	self.add_maps()
	
	self.get_map = function (_n) {
		if _n > ds_list_size(self.struct) -1 {
			return self.struct[| (ds_list_size(self.struct) -1)]
		}
		return self.struct[| _n]
	}
}

function Spawner() constructor {
		self.stage = new Stages()
		self.qtd = self.stage.get_map(0)[0]
		self.max_enemys = self.stage.get_map(0)[1]
		self.in_game = 0
		self.delay = 20
		self.pass = false

		self.wave = 0
		self.dificult = 0
		
		self.reload_in_game = function() { //atualiza quantos inimigos vivos;
			self.in_game = instance_number(obj_enemy_body)
			if (self.qtd <= 0 and self.in_game == 0) {
				self.pass = true
			}
		}
		
		self.create_enemy = function(_obj) {
			// 1 = right 2 = top 3 = left 4 = botton 
			var _choice = choose(1,2,3,4)
			var _xx, _yy
			if _choice == 1 or _choice == 3 {
				//side 
				_yy = irandom_range(0, room_height)
				_xx = _choice == 1 ? room_width + 40 : -40
			} else {
				//top / botton
				_xx = irandom_range(0, room_width)
				_yy = _choice == 4 ? room_height + 40 : -40 
			
			}
			instance_create_layer(_xx, _yy, "enemys", _obj)
			instance_create_layer(_xx, _yy, "effects", obj_effect_danger)
			self.qtd --;
		}
		
		self.spawn_new_enemys = function() {
			self.reload_in_game()
			if self.in_game < self.max_enemys and self.qtd > 0 {
				self.create_enemy(obj_enemy_goblin_bow)
			}
		}
		
		self.next_wave_reset = function () {
			var _map = self.stage.get_map(self.wave)
			self.qtd = _map[0]
			self.max_enemys = _map[1]
		}
		
		self.next_wave = function () {
			self.pass = false
			self.wave += 1
			self.dificult = self.wave div 5
			self.next_wave_reset()
		}
		
		self.run = function () {
			self.spawn_new_enemys()
			if self.pass {
				self.next_wave()
			}
		}
}
	

function src_get_all_maps () {
	return [
	[1, 10],
	[2, 10],
	[10, 4],
	[3, 10],
	[2, 10],
	]
}