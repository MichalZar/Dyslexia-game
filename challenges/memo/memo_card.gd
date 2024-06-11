class_name MemoCard
extends Control

signal flipped(revealed: bool)

enum CardType {
	BACKPACK,
	BOOK,
	CAR,
	CAT,
	CLOCK,
	CROWN,
	DOG,
	GRAND_PIANO,
	HEADPHONES,
	LAPTOP,
	MOUNTAIN,
	PIZZA,
	PLANE,
	RAINBOW,
	SOCCER_BALL,
	STADIUM,
	TEDDY_BEAR,
	TRAIN,
	TREE,
	WAVES,
}

@export var disabled: bool = false:
	get:
		if button != null:
			return button.disabled
		else:
			return _awaiting_disabled
	set(value):
		if button != null:
			button.disabled = value
		else:
			_awaiting_disabled = value
@export var card_type: CardType = CardType.TREE

var _revealed := false
var _awaiting_disabled: bool

@onready var button: TextureButton = %Button

func _ready() -> void:
	button.disabled = _awaiting_disabled

	_set_back_texture()

func _on_button_pressed() -> void:
	flipped.emit(_revealed)

func reveal() -> void:
	var tween := create_tween()
	var disabled = button.disabled
	button.disabled = true

	tween.tween_property(
		button,
		"scale",
		Vector2(0, 1),
		0.15,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

	tween.tween_callback(_set_front_texture)

	tween.tween_property(
		button,
		"scale",
		Vector2(1, 1),
		0.15,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

	tween.tween_callback(
		func () -> void:
			button.disabled = disabled
			_revealed = true
	)

	await tween.finished

func conceal() -> void:
	var tween := create_tween()
	var disabled = button.disabled
	button.disabled = true

	tween.tween_property(
		button,
		"scale",
		Vector2(0, 1),
		0.15,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

	tween.tween_callback(_set_back_texture)

	tween.tween_property(
		button,
		"scale",
		Vector2(1, 1),
		0.15,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

	tween.tween_callback(
		func () -> void:
			button.disabled = disabled
			_revealed = false
	)

	await tween.finished

func _set_front_texture() -> void:
	var texture: CompressedTexture2D

	match card_type:
		CardType.BACKPACK:
			texture = preload("res://challenges/memo/backpack.png")
		CardType.BOOK:
			texture = preload("res://challenges/memo/book.png")
		CardType.CAR:
			texture = preload("res://challenges/memo/car.png")
		CardType.CAT:
			texture = preload("res://challenges/memo/cat.png")
		CardType.CLOCK:
			texture = preload("res://challenges/memo/clock.png")
		CardType.CROWN:
			texture = preload("res://challenges/memo/crown.png")
		CardType.DOG:
			texture = preload("res://challenges/memo/dog.png")
		CardType.GRAND_PIANO:
			texture = preload("res://challenges/memo/grand_piano.png")
		CardType.HEADPHONES:
			texture = preload("res://challenges/memo/headphones.png")
		CardType.LAPTOP:
			texture = preload("res://challenges/memo/laptop.png")
		CardType.MOUNTAIN:
			texture = preload("res://challenges/memo/mountain.png")
		CardType.PIZZA:
			texture = preload("res://challenges/memo/pizza.png")
		CardType.PLANE:
			texture = preload("res://challenges/memo/plane.png")
		CardType.RAINBOW:
			texture = preload("res://challenges/memo/rainbow.png")
		CardType.SOCCER_BALL:
			texture = preload("res://challenges/memo/soccer_ball.png")
		CardType.STADIUM:
			texture = preload("res://challenges/memo/stadium.png")
		CardType.TEDDY_BEAR:
			texture = preload("res://challenges/memo/teddy_bear.png")
		CardType.TRAIN:
			texture = preload("res://challenges/memo/train.png")
		CardType.TREE:
			texture = preload("res://challenges/memo/tree.png")
		CardType.WAVES:
			texture = preload("res://challenges/memo/waves.png")

	button.texture_normal = texture

func _set_back_texture() -> void:
	button.texture_normal = preload("res://challenges/memo/card_back.png")
