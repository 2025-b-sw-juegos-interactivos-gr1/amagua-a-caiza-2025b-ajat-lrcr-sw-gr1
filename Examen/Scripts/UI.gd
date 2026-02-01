extends CanvasLayer

@export var coin: int = 0
@export var coins_required: int = 6

func _ready() -> void:
	add_to_group("ui") # Añadir al grupo para que UI_Time pueda encontrarlo
	
	var coins = get_tree().get_nodes_in_group("coins")
	for c in coins:
		if c is Node:
			c.connect("coin_collected", Callable(self , "handle_coin_collected"))

	# If coins are instantiated after the UI, listen for new nodes being added
	# and connect to any that join the "coins" group.
	get_tree().connect("node_added", Callable(self , "_on_node_added"))

	$Puntos.text = str(coin)
	
	# Ocultar mensaje de victoria al inicio
	if has_node("VictoryMessage"):
		$VictoryMessage.visible = false

func _on_node_added(node: Node) -> void:
	if node.is_in_group("coins"):
		if not node.is_connected("coin_collected", Callable(self , "handle_coin_collected")):
			node.connect("coin_collected", Callable(self , "handle_coin_collected"))

func handle_coin_collected() -> void:
	print("Coin collected!")
	coin += 1
	$Puntos.text = str(coin)
	
	# Verificar si se alcanzó el objetivo
	if coin >= coins_required:
		show_victory()

func show_victory() -> void:
	print("¡Felicidades! Has recolectado todas las monedas.")
	
	# Pausar el cronómetro
	var ui_time = get_parent().get_node_or_null("CanvasLayerTime")
	if ui_time:
		ui_time.is_running = false
	
	# Mostrar el menú de victoria (está en CanvasMenu)
	var canvas_menu = get_parent().get_node_or_null("CanvasMenu")
	if canvas_menu:
		var menu_victoria = canvas_menu.get_node_or_null("menu_victoria")
		if menu_victoria:
			menu_victoria.show_menu()
		else:
			print("ERROR: No se encontró el nodo menu_victoria en CanvasMenu")
			get_tree().paused = true
	else:
		print("ERROR: No se encontró el nodo CanvasMenu")
		get_tree().paused = true
