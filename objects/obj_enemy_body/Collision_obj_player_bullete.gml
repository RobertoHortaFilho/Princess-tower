/// @description Insert description here
// You can write your code in this editor
if state != STATES.KNOCKBACK {
	knockback(other.direction)
	instance_destroy(other)
	life -= other.dmg
}
