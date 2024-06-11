extends Control

signal scene_changed(scene: Game.Scene)

func _on_new_game_button_pressed() -> void:
	scene_changed.emit(Game.Scene.NEW_GAME_MENU)

func _on_load_game_button_pressed() -> void:
	scene_changed.emit(Game.Scene.LOAD_GAME_MENU)

func _on_settings_button_pressed() -> void:
	scene_changed.emit(Game.Scene.SETTINGS_MENU)

func _on_exit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
