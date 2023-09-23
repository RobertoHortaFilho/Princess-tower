/// @description alarm create enemy

if global.spawner != noone {
	global.spawner.spawn_new_enemys()
	alarm[0] = global.spawner.delay
}

//