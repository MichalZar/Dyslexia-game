extends Node

@onready var main_scene: Control = %MainScene
@onready var corrupted_settings_dialog: ConfirmationDialog = %CorruptedSettingsDialog

func _init():
	AudioManager.set_music_volume(Settings.music_volume)
	AudioManager.set_ui_volume(Settings.ui_volume)

func _ready():
	if Settings.has_load_error():
		corrupted_settings_dialog.show()
	else:
		main_scene.show()

func _on_corrupted_settings_dialog_confirmed():
	Settings.save_settings()
	main_scene.show()

func _on_corrupted_settings_dialog_canceled():
	get_tree().quit()
