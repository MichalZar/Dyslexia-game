extends Challenge

const MEMO_CARD := preload("res://challenges/memo/memo_card.tscn")

var _difficulty := Game.Difficulty.NORMAL
var _picked_card = null
var _flipping := false
var _number_of_pairs: int = 12
var _time: float = 0
var _timer_on := false

@onready var difficulty_picker: Control = %DifficultyPicker
@onready var challenge: Control = %Challenge
@onready var timer: Label = %Timer
@onready var cards_container: GridContainer = %CardsContainer

func _process(delta: float) -> void:
	if _timer_on:
		_time += delta

		var seconds := int(_time)
		var hours := seconds / 3600
		seconds -= 3600 * hours
		var minutes := seconds / 60
		seconds -= 60 * minutes

		if hours > 0:
			timer.text = "%02d:%02d:%02d" % [hours, minutes, seconds]
		else:
			timer.text = "%02d:%02d" % [minutes, seconds]

func _on_difficulty_picked(difficulty: Game.Difficulty) -> void:
	_difficulty = difficulty

	difficulty_picker.hide()
	challenge.show()
	_pick_cards()
	await notify_companion("Spróbuj znaleźć wszystkie pary i pobij swój poprzedni czas!")
	_timer_on = true

func _pick_cards() -> void:
	var card_types := MemoCard.CardType.values()
	var cards: Array[MemoCard] = []

	match _difficulty:
		Game.Difficulty.EASY:
			_number_of_pairs = 8
		Game.Difficulty.NORMAL:
			_number_of_pairs = 12
		Game.Difficulty.HARD:
			_number_of_pairs = 16

	cards_container.columns = _number_of_pairs / 2

	card_types.shuffle()

	for i in range(_number_of_pairs):
		var card1: MemoCard = MEMO_CARD.instantiate()
		var card2: MemoCard = MEMO_CARD.instantiate()
		card1.card_type = card_types[i]
		card2.card_type = card_types[i]

		card1.flipped.connect(_flip_card.bind(card1))
		card2.flipped.connect(_flip_card.bind(card2))

		cards.append(card1)
		cards.append(card2)

	Game.shuffle_into_derangement(cards)

	for card in cards:
		cards_container.add_child(card)

func _flip_card(revealed: bool, card: MemoCard) -> void:
	if _flipping:
		return

	_flipping = true

	if not revealed:
		card.disabled = true
		await card.reveal()

	if _picked_card == null:
		_picked_card = card
	else:
		if _picked_card.card_type == card.card_type:
			AudioManager.play_correct_answer()
			_number_of_pairs -= 1

			if _number_of_pairs == 0:
				_timer_on = false
				await notify_companion_approval()
				finished.emit()
		else:
			await get_tree().create_timer(1).timeout
			await ConcealCards.new(_picked_card, card).completed
			_picked_card.disabled = false
			card.disabled = false

		_picked_card = null

	_flipping = false

class ConcealCards extends RefCounted:
	signal completed

	var _first_concealed := false
	var _second_concealed := false

	func _init(card1: MemoCard, card2: MemoCard) -> void:
		var conceal1 := func () -> void:
			await card1.conceal()
			self._first_concealed = true
			self._check()
		var conceal2 := func () -> void:
			await card2.conceal()
			self._second_concealed = true
			self._check()

		conceal1.call()
		conceal2.call()

	func _check() -> void:
		if _first_concealed and _second_concealed:
			self.completed.emit()
