extends Control

@onready var full_screen = $"Label2/Full screen"
@onready var windowed = $Label2/windowed
@onready var h_slider = $Label3/HSlider
@onready var button = $Label4/Button


# Called when the node enters the scene tree for the first time.
func _ready():
	var video_settings = ConfigFileHandler.load_video_settings()
	full_screen.button_pressed = video_settings.fullscreen
	windowed.button_pressed = video_settings.windowed
	
	var audio_settings = ConfigFileHandler.load_audio_settings()
	h_slider.value = min(audio_settings.master_volume, 1.0) * 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_full_screen_toggled(toggled_on):
	ConfigFileHandler.save_video_settings("fullscreen", toggled_on)


func _on_windowed_toggled(toggled_on):
	ConfigFileHandler.save_video_settings("windowed", toggled_on)


func _on_h_slider_drag_ended(value_changed):
	if value_changed:
		ConfigFileHandler.save_audio_settings("master_volume", h_slider.value / 100)
