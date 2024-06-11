extends Control

const LETTER_JIGSAW := preload("res://challenges/letter_jigsaw/letter_jigsaw.tscn")
const MEMO := preload("res://challenges/memo/memo.tscn")
const ORTHOGRAPHY := preload("res://challenges/orthography/orthography.tscn")
const SYLLABLES_AND_SOUNDS := preload("res://challenges/syllables_and_sounds/syllables_and_sounds.tscn")
const WORD_JIGSAW := preload("res://challenges/word_jigsaw/word_jigsaw.tscn")
const CHALLENGE_AMBIENCE := {
	Game.Challenge.LETTER_JIGSAW: {
		"background": preload("res://assets/images/backgrounds/background1.png"),
		"music": preload("res://assets/audio/music/frost_mountain_area.ogg"),
	},
	Game.Challenge.MEMO: {
		"background": preload("res://assets/images/backgrounds/background6.png"),
		"music": preload("res://assets/audio/music/cosmic_star.ogg"),
	},
	Game.Challenge.ORTHOGRAPHY: {
		"background": preload("res://assets/images/backgrounds/background4.png"),
		"music": preload("res://assets/audio/music/swamp_of_digeridoos.ogg"),
	},
	Game.Challenge.SYLLABLES_AND_SOUNDS: {
		"background": preload("res://assets/images/backgrounds/background5.jpg"),
		"music": preload("res://assets/audio/music/underwater_city.ogg"),
	},
	Game.Challenge.WORD_JIGSAW: {
		"background": preload("res://assets/images/backgrounds/background3.png"),
		"music": preload("res://assets/audio/music/dark_dark_woods.ogg"),
	},
}

var _current_scene: Control
var _current_challenge_scene = null
var _notification_queue: Array[CompanionNotification] = []
var _processing_notifications := false

@onready var background_image: TextureRect = %Background
@onready var default_background := background_image.texture
@onready var challenge_pick_menu: Control = %ChallengePickMenu
@onready var challenge: Control = %Challenge
@onready var pause_menu: Control = %PauseMenu
@onready var settings_menu: Control = %SettingsMenu
@onready var challenge_layer: Control = %ChallengeLayer
@onready var companion_layer: Control = %CompanionLayer
@onready var companion: TextureRect = %Companion
@onready var companion_message: Label = %CompanionMessage
@onready var confirm_button: Button = %ConfirmButton
@onready var finished_notification: Control = %FinishedNotification

func _ready() -> void:
	_current_scene = challenge_pick_menu
	get_tree().set_auto_accept_quit(false)

	match Game.current_companion:
		Game.Companion.BEAR:
			companion.texture = load("res://assets/images/companions/bear.png")
		Game.Companion.LION:
			companion.texture = load("res://assets/images/companions/lion.png")
		Game.Companion.PANDA:
			companion.texture = load("res://assets/images/companions/panda.png")

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		Settings.save_settings()
		get_tree().quit()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			var paused := get_tree().paused

			if paused:
				_unpause_game()
			else:
				_pause_game()

func _on_pause_button_pressed() -> void:
	_pause_game()

func _on_settings_button_exited() -> void:
	_change_scene(Game.Scene.PAUSE_MENU)

func _on_challenge_list_button_pressed() -> void:
	finished_notification.hide()
	_change_scene(Game.Scene.CHALLENGE_PICK_MENU)

func _change_scene(scene: Game.Scene) -> void:
	_current_scene.hide()

	match scene:
		Game.Scene.CHALLENGE:
			_current_scene = challenge
		Game.Scene.CHALLENGE_PICK_MENU:
			_current_scene = challenge_pick_menu

			if _current_challenge_scene != null:
				_exit_challenge()
		Game.Scene.MAIN_MENU:
			var tree := get_tree()

			AudioManager.set_default_bg_music()
			tree.change_scene_to_file("res://scenes/main_scene.tscn")
			tree.paused = false

			return
		Game.Scene.PAUSE_MENU:
			_current_scene = pause_menu
		Game.Scene.SETTINGS_MENU:
			_current_scene = settings_menu
		_:
			return

	_current_scene.show()

func _pause_game() -> void:
	get_tree().paused = true
	_change_scene(Game.Scene.PAUSE_MENU)

func _unpause_game() -> void:
	if _current_challenge_scene != null:
		_change_scene(Game.Scene.CHALLENGE)
	else:
		_change_scene(Game.Scene.CHALLENGE_PICK_MENU)

	get_tree().paused = false

func _pick_challenge(challenge: Game.Challenge) -> void:
	var ambience: Dictionary = CHALLENGE_AMBIENCE[challenge]
	var challenge_scene: Challenge

	match challenge:
		Game.Challenge.LETTER_JIGSAW:
			challenge_scene = LETTER_JIGSAW.instantiate()
		Game.Challenge.MEMO:
			challenge_scene = MEMO.instantiate()
		Game.Challenge.ORTHOGRAPHY:
			challenge_scene = ORTHOGRAPHY.instantiate()
		Game.Challenge.SYLLABLES_AND_SOUNDS:
			challenge_scene = SYLLABLES_AND_SOUNDS.instantiate()
		Game.Challenge.WORD_JIGSAW:
			challenge_scene = WORD_JIGSAW.instantiate()

	background_image.texture = ambience["background"]
	AudioManager.set_bg_music(ambience["music"])

	challenge_scene.finished.connect(_show_finished_notification)
	challenge_scene.notification_sent.connect(_show_companion_notification)
	challenge_layer.add_child(challenge_scene)
	# Move the challenge scene behind the pause button.
	challenge_layer.move_child(challenge_scene, 0)

	_current_challenge_scene = challenge_scene
	_change_scene(Game.Scene.CHALLENGE)

func _exit_challenge() -> void:
	background_image.texture = default_background
	AudioManager.set_default_bg_music()

	challenge_layer.remove_child(_current_challenge_scene)
	_current_challenge_scene.queue_free()

	_current_challenge_scene = null
	get_tree().paused = false

func _show_finished_notification() -> void:
	finished_notification.show()

func _show_companion_notification(notification: CompanionNotification) -> void:
	_notification_queue.append(notification)

	if not _processing_notifications:
		_process_companion_notifications()

func _process_companion_notifications() -> void:
	var tree := get_tree()
	var notification = _notification_queue.pop_front()

	if notification != null:
		_processing_notifications = true
		challenge_layer.process_mode = Node.PROCESS_MODE_DISABLED
		companion_layer.show()

		while notification != null:
			var current_notification = notification

			companion_message.text = notification.message
			await confirm_button.pressed
			notification.disappeared.emit()
			notification = _notification_queue.pop_front()

		companion_message.text = ""
		_processing_notifications = false
		challenge_layer.process_mode = Node.PROCESS_MODE_INHERIT
		companion_layer.hide()
