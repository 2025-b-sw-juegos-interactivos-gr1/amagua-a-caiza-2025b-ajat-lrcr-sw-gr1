extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ocultar el menú al inicio
	visible = false
	
	# Conectar los botones
	var btn_siguiente_nivel = $VBoxContainer/Button
	var btn_salir = $VBoxContainer/Button2
	
	if btn_siguiente_nivel:
		btn_siguiente_nivel.pressed.connect(_on_siguiente_nivel_pressed)
	
	if btn_salir:
		btn_salir.pressed.connect(_on_exit_pressed)

func show_menu() -> void:
	print("Mostrando menú de victoria...")
	visible = true
	get_tree().paused = true

func _on_siguiente_nivel_pressed() -> void:
	print("Reiniciando nivel...")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	print("Saliendo del juego...")
	get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
