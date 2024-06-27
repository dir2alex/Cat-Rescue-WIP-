extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print("game is ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	print("entering game")
	get_tree().change_scene_to_file("res://main_world.tscn")


func _on_quit_pressed():
	print("bye bye!")
	get_tree().quit()


