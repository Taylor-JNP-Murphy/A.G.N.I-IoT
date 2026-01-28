extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://maps/testMap/Map.tscn")


func _on_info_button_pressed() -> void:
	get_tree().change_scene_to_file("res://GUI/menu/howtoplay.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://GUI/menu/mainmenu.tscn")
