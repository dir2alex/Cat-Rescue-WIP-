extends Control

@onready var label = $"."

@onready var parti_slide = $Particles1/AnimationPlayer
@onready var parti_slide2 = $Particles2/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Particles1/AnimationPlayer.play("parti_slide")
	$Particles2/AnimationPlayer.play("parti_slide")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quest_completed():
	# Show the victory scene
	var victory_scene = preload("res://victory_scene.tscn")
	var victory_instance = victory_scene.instance()
	add_child(victory_instance)
