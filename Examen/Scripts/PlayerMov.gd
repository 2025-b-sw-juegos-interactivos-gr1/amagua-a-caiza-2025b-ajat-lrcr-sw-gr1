extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var animationPlayer = $AnimationPlayer
@onready var sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# Use built-in UI actions or define custom ones in Project Settings -> Input Map.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace canvasLayer actions with custom gameplay actions.
	# Use `ui_left`/`ui_right` (or your own InputMap actions) instead of non-existent names.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	animations(direction)
	# Use > / < checks to handle float axis values reliably.
	if direction > 0:
		sprite2D.flip_h = false
	elif direction < 0:
		sprite2D.flip_h = true

func animations(direction):
	if is_on_floor():
		if direction == 0:
			animationPlayer.play("Idle")
		else:
			animationPlayer.play("Run")
	else:
		if velocity.y < 0:
			animationPlayer.play("Salto")
		elif velocity.y > 0:
			animationPlayer.play("Caer")

func add_coin():
	# Find CanvasLayer in the scene tree
	var canvasLayer = get_tree().current_scene.get_node_or_null("CanvasLayer")
	if canvasLayer and canvasLayer.has_method("handle_coin_collected"):
		canvasLayer.handle_coin_collected()
	else:
		push_warning("CanvasLayer not found or missing handle_coin_collected method")
