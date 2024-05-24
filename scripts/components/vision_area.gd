extends Area2D
signal player_entered
signal player_left


func _on_body_entered(body: Player):
	if body:
		player_entered.emit(body.position.x)
		print("entered")


func _on_body_exited(body: Player):
	if body:
		player_left.emit()
		print("left")
