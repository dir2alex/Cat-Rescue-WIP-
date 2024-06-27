extends Control


var dialog = [
	'sdighnsdpignksdgpisdgndspignsdgpsndg',
	'spdighsndpigksdgpidngpsdigsdgipsgnsgd',
	'fiphndibspignepi piogbnigknipfgsngdpsignsdpgnsdg'
]

var dialog_index = 0
var finished = false



func _ready():
	if Input.is_anything_pressed():
		load_dialog()
	
func _process(delta):
	$"clearly unusable".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.visible_ratio = 0
		var tween = create_tween()
		tween.tween_property($RichTextLabel, "visible_ratio", 1, 0.9)
		tween.set_trans(Tween.TRANS_LINEAR)
		
	else:
		queue_free()
	dialog_index += 1


func _on_animation_player_animation_finished(anim_name):
	finished = true
