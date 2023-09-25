/// @description alarm create enemy

if global.spawner != noone {
	global.spawner.run()
	alarm[0] = global.spawner.delay
}

//