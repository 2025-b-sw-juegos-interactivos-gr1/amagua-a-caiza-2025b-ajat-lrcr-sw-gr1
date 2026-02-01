extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ocultar el menú al inicio
	visible = false
	
	# Conectar los botones
	var btn_reintentar = $VBoxContainer/Button
	var btn_salir = $VBoxContainer/Button2
	
	if btn_reintentar:
		btn_reintentar.pressed.connect(_on_restart_pressed)
	
	if btn_salir:
		btn_salir.pressed.connect(_on_exit_pressed)

func show_menu() -> void:
	print("show_menu llamado")
	visible = true
	print("Menu visible ahora: ", visible)
	get_tree().paused = true
	print("Juego pausado: ", get_tree().paused)

func _on_restart_pressed() -> void:
	print("Reiniciando juego...")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	print("Saliendo del juego...")
	get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
