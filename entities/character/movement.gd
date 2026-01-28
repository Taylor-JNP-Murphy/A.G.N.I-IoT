extends CharacterBody2D
class_name Player

@export var move_speed: float = 200.0

var input_vector := Vector2.ZERO
@onready var anim := $Sprite

func _process(delta: float) -> void:
	get_input()
	move()
	update_animation()

func get_input() -> void:
	input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	input_vector = input_vector.normalized()

func move() -> void:
	velocity = input_vector * move_speed
	move_and_slide()

func update_animation() -> void:
	if input_vector == Vector2.ZERO:
		anim.play("idle")
		return

	# Horizontal movement takes priority if stronger
	if abs(input_vector.x) > abs(input_vector.y):
		if input_vector.x > 0:
			anim.play("walk_right")
		else:
			anim.play("walk_left")
	else:
		if input_vector.y > 0:
			anim.play("walk_down")
		else:
			anim.play("walk_up")
