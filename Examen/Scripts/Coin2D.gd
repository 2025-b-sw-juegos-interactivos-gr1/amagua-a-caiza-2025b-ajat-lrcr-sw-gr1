extends Area2D

signal coin_collected

func _ready() -> void:
	add_to_group("coins")

func _on_body_entered(_body: Node2D) -> void:
	if _body.get_name() == "CatPlayer":
		coin_collected.emit() # Emitir señal antes de destruir
		_body.add_coin()
		queue_free()