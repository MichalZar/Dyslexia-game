extends Control

signal exited
signal companion_picked(companion: Game.Companion)

var _picked_companion := Game.Companion.NONE
var _button_group: ButtonGroup

@onready var bear: TextureButton = %Bear
@onready var lion: TextureButton = %Lion
@onready var panda: TextureButton = %Panda
@onready var select_button: Button = %SelectButton

func _ready() -> void:
	_button_group = ButtonGroup.new()
	_button_group.allow_unpress = true
	bear.button_group = _button_group
	lion.button_group = _button_group
	panda.button_group = _button_group

	_button_group.pressed.connect(_pick_companion)

func _pick_companion(_button: BaseButton) -> void:
	match _button_group.get_pressed_button():
		bear:
			_picked_companion = Game.Companion.BEAR
		lion:
			_picked_companion = Game.Companion.LION
		panda:
			_picked_companion = Game.Companion.PANDA
		_:
			_picked_companion = Game.Companion.NONE

	select_button.disabled = _picked_companion == Game.Companion.NONE

func _on_back_button_pressed():
	exited.emit()

func _on_select_button_pressed():
	companion_picked.emit(_picked_companion)
