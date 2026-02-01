extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "CatPlayer":
		print("Zona de Caida")
		show_game_over_menu()

func show_game_over_menu() -> void:
	# Buscar el menú en la escena
	print("ZonaCaida: Buscando menú en grupo 'game_over'...")
	var menu = get_tree().get_first_node_in_group("game_over")
	print("ZonaCaida: Menu encontrado: ", menu)
	
	if menu:
		print("ZonaCaida: Menu tiene método show_menu: ", menu.has_method("show_menu"))
		if menu.has_method("show_menu"):
			print("ZonaCaida: Llamando a show_menu...")
			menu.show_menu()
			return
	
	print("ZonaCaida: No se encontró el menú, reiniciando directamente...")
	get_tree().reload_current_scene()
