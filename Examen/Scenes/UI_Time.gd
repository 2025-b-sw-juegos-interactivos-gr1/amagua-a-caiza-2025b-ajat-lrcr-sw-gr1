extends CanvasLayer

@export var time = 30 # Tiempo en segundos
@export var coins_required = 6 # Monedas necesarias para ganar

var current_time: float = 0.0
var is_running: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_time = time
	is_running = true
	update_time_display()

func _process(delta: float) -> void:
	if is_running:
		current_time -= delta
		
		if current_time <= 0:
			current_time = 0
			is_running = false
			time_up()
		
		update_time_display()

func update_time_display() -> void:
	var seconds = int(current_time) % 60
	$Tiempo.text = "%02d" % [seconds]

func time_up() -> void:
	# Verificar si el jugador tiene suficientes monedas
	var ui = get_tree().get_first_node_in_group("ui")
	print("Verificando monedas...")
	if ui:
		print("UI encontrado. Monedas recolectadas: ", ui.coin, " / ", coins_required)
		if ui.coin < coins_required:
			print("¡Tiempo agotado! No recogiste suficientes monedas.")
			show_game_over_menu()
		else:
			print("¡Felicidades! Recogiste todas las monedas a tiempo.")
			is_running = false
	else:
		print("ERROR: No se encontró el nodo UI en el grupo 'ui'")
		show_game_over_menu()

func show_game_over_menu() -> void:
	# Buscar el menú en la escena
	print("Buscando menú en grupo 'game_over'...")
	var menu = get_tree().get_first_node_in_group("game_over")
	print("Menu encontrado: ", menu)
	
	if menu:
		print("Menu tiene método show_menu: ", menu.has_method("show_menu"))
		if menu.has_method("show_menu"):
			print("Llamando a show_menu...")
			menu.show_menu()
			return
	
	print("No se encontró el menú, reiniciando directamente...")
	restart_game()

func restart_game() -> void:
	get_tree().reload_current_scene()
