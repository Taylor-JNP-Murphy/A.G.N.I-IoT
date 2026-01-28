extends Area2D

var showInteractionLabel = false

@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = showInteractionLabel
	if Global.runesLevelOne != 0:
		showInteractionLabel = false
	else:
		showInteractionLabel = true
	

func _process(delta: float) -> void:
	$Label.visible = showInteractionLabel
	if Global.runesLevelOne == 0:
		sprite_2d.frame = 0
	else:
		sprite_2d.frame = 1
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		if Global.runesLevelOne == 0:
			get_tree().change_scene_to_file("res://maps/levelOne/Map.tscn")
		


func _on_body_entered(body: Node2D) -> void:
	if Global.runesLevelOne == 0:
		if body is Player: showInteractionLabel = true
	else:
		showInteractionLabel = false


func _on_body_exited(body: Node2D) -> void:
	if Global.runesLevelOne == 0:
		if body is Player: showInteractionLabel = false
	else:
		showInteractionLabel = false
