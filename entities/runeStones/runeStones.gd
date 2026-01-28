extends Area2D

var showInteractionLabel = false

@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug(Global.runesLevelOne)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.visible = showInteractionLabel
	var i = 0
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		if sprite_2d.frame == 0:
			sprite_2d.frame = 1
			Global.runesLevelOne -= 1
			print_debug(Global.runesLevelOne)
		elif sprite_2d.frame == 1:
			sprite_2d.frame = 0
			Global.runesLevelOne += 1
			print_debug(Global.runesLevelOne)


func _on_body_entered(body):
	if body is Player: showInteractionLabel = true


func _on_body_exited(body):
	if body is Player: showInteractionLabel = false
