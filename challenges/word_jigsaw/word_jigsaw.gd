extends Challenge

const DICTIONARIES := {
	Game.Difficulty.EASY: [
		"lubię grać w piłkę nożną",
		"kocham moich rodziców",
		"mam czarnego kota",
		"mam czterech przyjaciół",
		"zielony to mój ulubiony kolor",
		"tamten pies jest głodny",
		"muszę zawiązać buty",
		"idę do mojej szkoły",
		"lubię moją szkołę",
		"mój pies uwielbia się bawić",
		"dzisiaj świeci słońce",
		"często czytam książki",
		"lubię jeść lody",
		"idziemy razem do szkoły",
		"jutro zjem mnóstwo słodyczy",
		"znam język angielski",
		"kot śpi na kanapie",
		"posprzątam pokój przed obiadem",
		"często chodzę do kina",
	],
	Game.Difficulty.NORMAL: [
		"w górach znajduje się ogromna grota",
		"pies biega po zielonej łące",
		"lubię jeździć na rowerze",
		"w parku rosną wysokie drzewa",
		"w lesie liście opadają",
		"dwie sikorki poleciały na sosnę",
		"na stole stoi wazon z kwiatami",
		"wczoraj padał deszcz przez cały dzień",
		"słońce świeci jasno na niebie",
		"idziemy dzisiaj na plażę",
		"piszę list do przyjaciela",
		"kwiaty rosną w donicach",
		"słodycze są bardzo niezdrowe",
		"mam nową grę komputerową",
		"ona ma zielone oczy",
		"moja babcia piecze ciasto",
		"dziadek właśnie gra w szachy",
		"moja mama uwielbia czerwone tulipany",
		"spotkajmy się na placu zabaw",
	],
	Game.Difficulty.HARD: [
		"łapy kota są miękkie ale pazury są ostre",
		"w naszym ogrodzie rośnie wiele różnych kwiatów",
		"wczoraj poszliśmy na spacer do lasu gdzie słuchaliśmy śpiewu ptaków",
		"w weekend wybraliśmy się na wycieczkę do zoo",
		"podczas wakacji odwiedziliśmy dziadków mieszkających na wsi",
		"przygotowaliśmy śniadanie dla całej rodziny",
		"postanowiliśmy wybrać się na wycieczkę rowerową",
		"na lekcjach przyrody uczymy się o różnych gatunkach roślin",
		"w świąteczny poranek cała rodzina zebrała się przy choince",
		"mój brat jest zawsze bardzo miły",
		"mój tata ma strasznie szybki samochód",
		"każdego roku w wakacje jeździmy w góry",
		"muszę się uczyć ponieważ mam jutro sprawdzian z matematyki",
		"mój pies uwielbia swoją piłkę",
		"moja ciocia pracuje jako lekarz od 20 lat",
		"w zimę często pijemy gorące kakao",
		"musimy się pospieszyć bo pociąg zaraz wjedzie na peron",
		"chłopcy grają w piłkę na boisku",
		"mój wujek codziennie jeździ na rowerze",
	],
}

const TILE_FOCUS: StyleBoxFlat = preload("res://assets/textures/rect_button_focus.tres")
const TILE_NORMAL: StyleBoxFlat = preload("res://assets/textures/rect_button_blue_normal.tres")
const TILE_HOVER: StyleBoxFlat = preload("res://assets/textures/rect_button_blue_hover.tres")
const TILE_PRESSED: StyleBoxFlat = preload("res://assets/textures/rect_button_blue_pressed.tres")
const TILE_CORRECT_NORMAL: StyleBoxFlat = preload("res://assets/textures/rect_button_green_normal.tres")
const TILE_CORRECT_HOVER: StyleBoxFlat = preload("res://assets/textures/rect_button_green_hover.tres")
const TILE_CORRECT_PRESSED: StyleBoxFlat = preload("res://assets/textures/rect_button_green_pressed.tres")
const TILE_INCORRECT_NORMAL: StyleBoxFlat = preload("res://assets/textures/rect_button_red_normal.tres")
const TILE_INCORRECT_HOVER: StyleBoxFlat = preload("res://assets/textures/rect_button_red_hover.tres")
const TILE_INCORRECT_PRESSED: StyleBoxFlat = preload("res://assets/textures/rect_button_red_pressed.tres")

var _sentences: Array[String] = []
var _words: Array[String] = []
var _round: int = 1
var _animating := false

@onready var difficulty_picker: Control = %DifficultyPicker
@onready var challenge: Control = %Challenge
@onready var pending_tiles: Container = %PendingTiles
@onready var placed_tiles: Container = %PlacedTiles
@onready var animation_layer: Control = %AnimationLayer

func _on_difficulty_picked(difficulty: Game.Difficulty) -> void:
	_sentences.append_array(DICTIONARIES[difficulty].duplicate())
	_sentences.shuffle()

	_pick_sentence()
	difficulty_picker.hide()
	challenge.show()

func _pick_sentence() -> void:
	var shuffled_words = Array(_sentences.pop_back().to_upper().split(" "))
	_animating = false

	_words.clear()
	_words.append_array(shuffled_words)

	# It's important to make sure that the shuffled array is different than the
	# sentence itself because otherwise the challenge makes no sense. Derangements
	# guarantee this.
	Game.shuffle_into_derangement(shuffled_words)

	for child in pending_tiles.get_children():
		pending_tiles.remove_child(child)
		child.queue_free()

	for child in placed_tiles.get_children():
		placed_tiles.remove_child(child)
		child.queue_free()

	for word in shuffled_words:
		var tile := _create_tile(word)

		pending_tiles.add_child(tile)

func _create_tile(text: String) -> Button:
	var tile = Button.new()
	tile.text = text
	tile.custom_minimum_size = Vector2(96, 96)

	tile.pressed.connect(_move_tile.bind(tile))
	tile.add_theme_font_size_override(&"font_size", 48)
	tile.add_theme_stylebox_override(&"focus", TILE_FOCUS)
	_set_styleboxes_to_normal(tile)

	return tile

func _move_tile(tile: Button) -> void:
	if _animating:
		return

	_animating = true

	# This must be first to ensure that `dup` has correct stylebox.
	if pending_tiles.get_child_count() == 0:
		for child in placed_tiles.get_children():
			_set_styleboxes_to_normal(child)

	var tween = create_tween()
	# Do not duplicate signals, groups, and other irrelevant properties.
	var dup: Button = tile.duplicate(0)
	var new_parent := pending_tiles if tile.get_parent() == placed_tiles else placed_tiles
	var animate = func () -> void:
		var tweener = tween.tween_property(
			dup,
			"position",
			tile.global_position,
			0.2
		)

		tweener.set_trans(Tween.TRANS_QUAD)
		tweener.set_ease(Tween.EASE_IN_OUT)

		tween.tween_callback(
			func () -> void:
				tile.modulate = Color.WHITE
				dup.queue_free()

				_animating = false

				if pending_tiles.get_child_count() == 0:
					_check_solution()
		)
	dup.position = tile.global_position
	tile.modulate = Color.TRANSPARENT

	animation_layer.add_child(dup)
	tile.reparent(new_parent)

	# This is a very stupid work-around to animate tiles because apparently it's
	# pretty difficult to properly implement this.
	#
	# See: https://www.reddit.com/r/godot/comments/aleqem/gui_tweening_approach/
	new_parent.sort_children.connect(animate, Object.CONNECT_ONE_SHOT)

func _check_solution() -> void:
	var correct := true

	for i in placed_tiles.get_child_count():
		var tile = placed_tiles.get_child(i)

		if tile.text == _words[i]:
			_set_styleboxes_to_correct(tile)
		else:
			correct = false
			_set_styleboxes_to_incorrect(tile)

	if correct:
		await notify_companion_approval()

		if _round < 5:
			_round += 1
			_pick_sentence()
		else:
			finished.emit()
	else:
		await notify_companion_correction()

func _set_styleboxes_to_normal(tile: Button) -> void:
	tile.add_theme_stylebox_override(&"normal", TILE_NORMAL)
	tile.add_theme_stylebox_override(&"hover", TILE_HOVER)
	tile.add_theme_stylebox_override(&"pressed", TILE_PRESSED)

func _set_styleboxes_to_correct(tile: Button) -> void:
	tile.add_theme_stylebox_override(&"normal", TILE_CORRECT_NORMAL)
	tile.add_theme_stylebox_override(&"hover", TILE_CORRECT_HOVER)
	tile.add_theme_stylebox_override(&"pressed", TILE_CORRECT_PRESSED)

func _set_styleboxes_to_incorrect(tile: Button) -> void:
	tile.add_theme_stylebox_override(&"normal", TILE_INCORRECT_NORMAL)
	tile.add_theme_stylebox_override(&"hover", TILE_INCORRECT_HOVER)
	tile.add_theme_stylebox_override(&"pressed", TILE_INCORRECT_PRESSED)
