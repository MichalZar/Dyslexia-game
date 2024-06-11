extends Control

signal exited

@onready var tabs: TabContainer = %TabContainer
@onready var music_volume_slider: HSlider = %MusicVolumeLevel
@onready var ui_volume_slider: HSlider = %UIVolumeLevel
@onready var full_screen_button: CheckButton = %FullScreenButton

func _ready() -> void:
	music_volume_slider.value = Settings.music_volume
	ui_volume_slider.value = Settings.ui_volume

	tabs.set_tab_title(0, "Dźwięk")
	tabs.set_tab_title(1, "Obraz")
	_set_fullscreen()

func _process(_delta: float) -> void:
	if visible and tabs.current_tab == 1:
		_set_fullscreen()

func _on_music_volume_level_changed(value: float) -> void:
	Settings.music_volume = value
	AudioManager.set_music_volume(value)

func _on_ui_volume_level_changed(value: float) -> void:
	Settings.ui_volume = value
	AudioManager.set_ui_volume(value)

func _on_full_screen_button_toggled(toggled_on: bool) -> void:
	Settings.fullscreen = toggled_on

	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_back_button_pressed() -> void:
	exited.emit()

func _set_fullscreen() -> void:
	match DisplayServer.window_get_mode():
		Window.MODE_FULLSCREEN, Window.MODE_EXCLUSIVE_FULLSCREEN:
			full_screen_button.button_pressed = true
		_:
			full_screen_button.button_pressed = false
