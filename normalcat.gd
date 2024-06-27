extends Node3D

@onready var idle = $AnimationPlayer
@onready var meow = $meow

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_cat_area_body_entered(body):
	$meow.play()
	await meow.finished
	queue_free()
	get_tree().change_scene_to_file("res://victory_scene.tscn")

