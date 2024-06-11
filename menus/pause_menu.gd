extends Control

signal unpaused
signal scene_changed(scene: Game.Scene)

func _on_unpause_button_pressed() -> void:
	unpaused.emit()

func _on_settings_button_pressed() -> void:
	scene_changed.emit(Game.Scene.SETTINGS_MENU)

func _on_challenges_button_pressed():
	scene_changed.emit(Game.Scene.CHALLENGE_PICK_MENU)

func _on_main_menu_button_pressed() -> void:
	scene_changed.emit(Game.Scene.MAIN_MENU)

func _on_quit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
