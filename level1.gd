extends Node3D

@onready var dialog_box = $Area3D/AnimationPlayer
@onready var label = $Area3D/AnimationPlayer/MeshInstance3D2/Label3D
@onready var parti_slide = $Particles1/AnimationPlayer
@onready var parti_slide2 = $Particles2/AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	$Area3D/AnimationPlayer.play("dialog_slide")


func _on_area_3d_body_exited(body):
	$Area3D/AnimationPlayer.stop()


func set_interaction_text_visible(text_visible : bool):
	$Area3D/AnimationPlayer/MeshInstance3D2/Label3D.visible = text_visible
	#crosshair
	

func set_interaction_label_text(new_text : String):
	$Area3D/AnimationPlayer/MeshInstance3D2/Label3D.text = new_text
