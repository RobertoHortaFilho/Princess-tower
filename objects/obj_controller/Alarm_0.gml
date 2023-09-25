/// @description alarm create enemy

if global.spawner != noone {
	global.spawner.spawn_new_enemys()
	alarm[0] = global.spawner.delay
	
	if global.spawner.pass {
		wave ++
		global.spawner = new Spawner(maps[| wave][0], maps[| wave][1]);
	}
}

//