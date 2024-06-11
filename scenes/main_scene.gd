extends Control

var _current_scene: Control

@onready var main_menu: Control = %MainMenu
@onready var new_game_menu: Control = %NewGameMenu
@onready var load_game_menu: Control = %LoadGameMenu
@onready var settings_menu: Control = %SettingsMenu

func _ready() -> void:
	_current_scene = main_menu
	get_tree().set_auto_accept_quit(false)

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		Settings.save_settings()
		get_tree().quit()

func _change_scene(scene: Game.Scene) -> void:
	_current_scene.hide()

	match scene:
		Game.Scene.LOAD_GAME_MENU:
			_current_scene = load_game_menu
		Game.Scene.MAIN_MENU:
			_current_scene = main_menu
		Game.Scene.NEW_GAME_MENU:
			_current_scene = new_game_menu
		Game.Scene.SETTINGS_MENU:
			_current_scene = settings_menu
		_:
			return

	_current_scene.show()

func _start_new_game(companion: Game.Companion) -> void:
	Game.current_companion = companion

	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _return_to_main_menu() -> void:
	_change_scene(Game.Scene.MAIN_MENU)
