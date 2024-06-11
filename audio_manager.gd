extends Node

var _music_bus_idx := AudioServer.get_bus_index(&"Music")
var _ui_bus_idx := AudioServer.get_bus_index(&"UI")

@onready var background_music_player: AudioStreamPlayer = %BackgroundMusic
@onready var default_music := background_music_player.stream
@onready var button_hover_player: AudioStreamPlayer = %ButtonHover
@onready var button_pressed_player: AudioStreamPlayer = %ButtonPressed
@onready var tab_hover_player: AudioStreamPlayer = %TabHover
@onready var tab_pressed_player: AudioStreamPlayer = %TabPressed
@onready var slider_change_player: AudioStreamPlayer = %SliderChange
@onready var correct_answer_player: AudioStreamPlayer = %CorrectAnswer

func _enter_tree() -> void:
	var tree = get_tree()

	tree.root.child_entered_tree.connect(_on_child_added)
	tree.root.child_exiting_tree.connect(_on_child_removed)

func _on_child_added(node: Node) -> void:
	node.child_entered_tree.connect(_on_child_added)
	node.child_exiting_tree.connect(_on_child_removed)

	if node is BaseButton:
		node.mouse_entered.connect(_play_button_hover)
		node.pressed.connect(_play_button_pressed)
	elif node is TabContainer:
		node.tab_hovered.connect(_play_tab_hover.bind(node))
		node.tab_clicked.connect(_play_tab_pressed.bind(node))
	elif node is Slider:
		node.drag_ended.connect(_play_slider_change)

func _on_child_removed(node: Node) -> void:
	node.child_entered_tree.disconnect(_on_child_added)
	node.child_exiting_tree.disconnect(_on_child_removed)

	if node is BaseButton:
		node.mouse_entered.disconnect(_play_button_hover)
		node.pressed.disconnect(_play_button_pressed)
	elif node is TabContainer:
		# Apparently, bound `Callable`s are equal, so this should be fine.
		# https://github.com/godotengine/godot-docs/issues/8071
		node.tab_hovered.disconnect(_play_tab_hover.bind(node))
		node.tab_clicked.disconnect(_play_tab_pressed.bind(node))
	elif node is Slider:
		node.drag_ended.disconnect(_play_slider_change)

func set_music_volume(level: float) -> void:
	AudioServer.set_bus_volume_db(_music_bus_idx, linear_to_db(level))

func set_ui_volume(level: float) -> void:
	AudioServer.set_bus_volume_db(_ui_bus_idx, linear_to_db(level))

func set_bg_music(stream: AudioStream) -> void:
	background_music_player.stream = stream
	background_music_player.play()
	
func set_default_bg_music() -> void:
	background_music_player.stream = default_music
	background_music_player.play()

func play_correct_answer() -> void:
	correct_answer_player.play()

func _play_button_hover() -> void:
	button_hover_player.play()

func _play_button_pressed() -> void:
	button_pressed_player.play()

func _play_tab_hover(idx: int, container: TabContainer) -> void:
	if idx != container.current_tab:
		tab_hover_player.play()

func _play_tab_pressed(idx: int, container: TabContainer) -> void:
	if idx != container.get_previous_tab():
		tab_pressed_player.play()

func _play_slider_change(_value_changed: bool) -> void:
	slider_change_player.play()
