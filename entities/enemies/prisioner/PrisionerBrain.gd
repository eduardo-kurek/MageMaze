class_name PrisionerBrain
extends EnemyBrain

func think(_delta: float) -> void:
	if not is_instance_valid(player):
		return

	var dir := global_position.direction_to(player.global_position)
	walk_behaviour.walk(dir)
 
