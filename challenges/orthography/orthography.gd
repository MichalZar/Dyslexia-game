extends Challenge

const DICTIONARIES := {
	Game.Difficulty.EASY: {
		"buty": ["b", { "correct": "u", "incorrect": "ó" }, "ty"],
		"chleb": ["", { "correct": "ch", "incorrect": "h" }, "leb"],
		"długopis": ["dł", { "correct": "u", "incorrect": "ó" }, "gopis"],
		"drzwi": ["d", { "correct": "rz", "incorrect": "ż" }, "wi"],
		"grzebień": ["g", { "correct": "rz", "incorrect": "ż" }, "ebień"],
		"gumka": ["g", { "correct": "u", "incorrect": "ó" }, "mka"],
		"jabłko": ["ja", { "correct": "b", "incorrect": "p" }, "łko"],
		"kredka": ["kre", { "correct": "d", "incorrect": "t" }, "ka"],
		"krzesło": ["k", { "correct": "rz", "incorrect": "sz" }, "esło"],
		"książka": ["ksią", { "correct": "ż", "incorrect": "rz" }, "ka"],
		"kubek": ["k", { "correct": "u", "incorrect": "ó" }, "bek"],
		"lampka": ["lam", { "correct": "p", "incorrect": "b" }, "ka"],
		"lustro": ["l", { "correct": "u", "incorrect": "ó" }, "stro"],
		"ławka": ["ła", { "correct": "w", "incorrect": "f" }, "ka"],
		"łyżka": ["ły", { "correct": "ż", "incorrect": "rz" }, "ka"],
		"nóż": ["nó", { "correct": "ż", "incorrect": "rz" }, ""],
		"okulary": ["ok", { "correct": "u", "incorrect": "ó" }, "lary"],
		"ołówek": ["oł", { "correct": "ó", "incorrect": "u" }, "wek"],
		"pilot": ["pilo", { "correct": "t", "incorrect": "d" }, ""],
		"plecak": ["pleca", { "correct": "k", "incorrect": "g" }, ""],
		"rower": ["ro", { "correct": "w", "incorrect": "f" }, "er"],
		"stół": ["st", { "correct": "ó", "incorrect": "u" }, "ł"],
		"sufit": ["s", { "correct": "u", "incorrect": "ó" }, "fit"],
		"szkoła": ["", { "correct": "sz", "incorrect": "rz" }, "koła"],
		"talerz": ["tale", { "correct": "rz", "incorrect": "sz" }, ""],
		"ulica": ["", { "correct": "u", "incorrect": "ó" }, "lica"],
		"wazon": ["wa", { "correct": "z", "incorrect": "s" }, "on"],
		"wieś": ["wie", { "correct": "ś", "incorrect": "ź" }, ""],
		"zabawa": ["zaba", { "correct": "w", "incorrect": "f" }, "a"],
		"zupa": ["z", { "correct": "u", "incorrect": "ó" }, "pa"],
	},
	Game.Difficulty.NORMAL: {
		"chrzan": ["", { "correct": "ch", "incorrect": "h" }, { "correct": "rz", "incorrect": "ż" }, "an"],
		"cukier": ["c", { "correct": "u", "incorrect": "ó" }, "kier"],
		"czułość": ["cz", { "correct": "u", "incorrect": "ó" }, "ło", { "correct": "ś", "incorrect": "ź" }, "ć"],
		"czuły": ["cz", { "correct": "u", "incorrect": "ó" }, "ły"],
		"ćwiczenie": ["ć", { "correct": "w", "incorrect": "f" }, "iczenie"],
		"krzyż": ["k", { "correct": "rz", "incorrect": "ż" }, "y", { "correct": "ż", "incorrect": "rz" }, ""],
		"księżyc": ["księ", { "correct": "ż", "incorrect": "rz" }, "y", { "correct": "c", "incorrect": "dz" }, ""],
		"leniwy": ["leni", { "correct": "w", "incorrect": "f" }, "y"],
		"łańcuch": ["łańc", { "correct": "u", "incorrect": "ó" }, { "correct": "ch", "incorrect": "h" }, ""],
		"łaska": ["ła", { "correct": "s", "incorrect": "z" }, "ka"],
		"łóżko": ["ł", { "correct": "ó", "incorrect": "u" }, { "correct": "ż", "incorrect": "rz" }, "ko"],
		"mięso": ["mię", { "correct": "s", "incorrect": "z" }, "o"],
		"ogród": ["ogr", { "correct": "ó", "incorrect": "u" }, { "correct": "d", "incorrect": "t" }, ""],
		"pieszo": ["pie", { "correct": "sz", "incorrect": "rz" }, "o"],
		"przekrój": ["p", { "correct": "rz", "incorrect": "sz" }, "ekr", { "correct": "ó", "incorrect": "u" }, "j"],
		"przełom": ["p", { "correct": "rz", "incorrect": "sz" }, "ełom"],
		"pszczoła": ["p", { "correct": "sz", "incorrect": "rz" }, "czoła"],
		"spółka": ["sp", { "correct": "ó", "incorrect": "u" }, "łka"],
		"szczyt": ["sz", { "correct": "cz", "incorrect": "dż" }, "y", { "correct": "t", "incorrect": "d" }, ""],
		"ślub": ["śl", { "correct": "u", "incorrect": "ó" }, "b"],
		"światło": ["ś", { "correct": "w", "incorrect": "f" }, "iatło"],
		"wątroba": ["wątro", { "correct": "b", "incorrect": "p" }, "a"],
		"wędrówka": ["wędr", { "correct": "ó", "incorrect": "u" }, { "correct": "w", "incorrect": "f" }, "ka"],
		"wóz": ["w", { "correct": "ó", "incorrect": "u" }, { "correct": "z", "incorrect": "s" }, ""],
		"żaba": ["", { "correct": "ż", "incorrect": "rz" }, "a", { "correct": "b", "incorrect": "p" }, "a"],
		"żart": ["", { "correct": "ż", "incorrect": "rz" }, "art"],
		"żegluga": ["", { "correct": "ż", "incorrect": "rz" }, "egluga"],
		"żółw": ["", { "correct": "ż", "incorrect": "rz" }, { "correct": "ó", "incorrect": "u" }, "łw"],
		"żubr": ["", { "correct": "ż", "incorrect": "rz" }, { "correct": "u", "incorrect": "ó" }, "br"],
		"żyrafa": ["", { "correct": "ż", "incorrect": "rz" }, "yra", { "correct": "f", "incorrect": "w" }, "a"],
	},
	Game.Difficulty.HARD: {
		"charyzma": ["", { "correct": "ch", "incorrect": "h" }, "ary", { "correct": "z", "incorrect": "s" }, "ma"],
		"chrzest": ["", { "correct": "ch", "incorrect": "h" }, { "correct": "rz", "incorrect": "sz" }, "est"],
		"ciekawość": ["cieka", { "correct": "w", "incorrect": "f" }, "o", { "correct": "ś", "incorrect": "ź" }, "ć"],
		"cudowny": ["c", { "correct": "u", "incorrect": "ó" }, "do", { "correct": "w", "incorrect": "f" }, "ny"],
		"ekscytacja": ["ek", { "correct": "s", "incorrect": "z" }, "cyta", { "correct": "c", "incorrect": "dz" }, "ja"],
		"gżegżółka": ["g", { "correct": "ż", "incorrect": "rz" }, "egż", { "correct": "ó", "incorrect": "u" }, "łka"],
		"harcerz": ["", { "correct": "h", "incorrect": "ch" }, "arce", { "correct": "rz", "incorrect": "ż" }, ""],
		"honorowy": ["", { "correct": "h", "incorrect": "ch" }, "onoro", { "correct": "w", "incorrect": "f" }, "y"],
		"jaskółka": ["ja", { "correct": "s", "incorrect": "z" }, "k", { "correct": "ó", "incorrect": "u" }, "łka"],
		"krzywda": ["k", { "correct": "rz", "incorrect": "ż" }, "y", { "correct": "w", "incorrect": "f" }, "da"],
		"krzyżówka": ["k", { "correct": "rz", "incorrect": "ż" }, "yżó", { "correct": "w", "incorrect": "f" }, "ka"],
		"kwiatuszek": ["k", { "correct": "w", "incorrect": "f" }, "iat", { "correct": "u", "incorrect": "ó" }, "szek"],
		"mistrzostwa": ["mist", { "correct": "rz", "incorrect": "sz" }, "ost", { "correct": "w", "incorrect": "t" }, "a"],
		"mrówka": ["mr", { "correct": "ó", "incorrect": "u" }, { "correct": "w", "incorrect": "f" }, "ka"],
		"nieszczęście": ["nie", { "correct": "sz", "incorrect": "rz" }, "czę", { "correct": "ś", "incorrect": "ź" }, "cie"],
		"przedszkole": ["p", { "correct": "rz", "incorrect": "ż" }, "e", { "correct": "d", "incorrect": "t" }, "szkole"],
		"przeszkoda": ["p", { "correct": "rz", "incorrect": "sz" }, "e", { "correct": "sz", "incorrect": "rz" }, "koda"],
		"przyjaźń": ["p", {"correct": "rz", "incorrect": "ż"}, "yja", { "correct": "ź", "incorrect": "ś" }, "ń"],
		"rzemiosło": ["", { "correct": "rz", "incorrect": "ż" }, "emio", { "correct": "s", "incorrect": "z" }, "ło"],
		"rzodkiewka": ["", { "correct": "rz", "incorrect": "ż" }, "o", { "correct": "d", "incorrect": "t" }, "kiewka"],
		"szczupak": ["szcz", { "correct": "u", "incorrect": "ó" }, "pa", { "correct": "k", "incorrect": "g" }, ""],
		"truskawka": ["tr", { "correct": "u", "incorrect": "ó" }, "ska", { "correct": "w", "incorrect": "f" }, "ka"],
		"uśmiech": ["", { "correct": "u", "incorrect": "ś" }, "śmie", { "correct": "ch", "incorrect": "h" }, ""],
		"wędkarz": ["wę", { "correct": "d", "incorrect": "t" }, "ka", { "correct": "rz", "incorrect": "ż" }, ""],
		"źródlany": ["", { "correct": "ź", "incorrect": "ś" }, "r", { "correct": "ó", "incorrect": "u" }, "dlany"],
		"źródło": ["", { "correct": "ź", "incorrect": "ś" }, "r", { "correct": "ó", "incorrect": "u" }, "dło"],
		"żarówka": ["", { "correct": "ż", "incorrect": "rz" }, "aró", { "correct": "w", "incorrect": "f" }, "ka"],
		"żuraw": ["", { "correct": "ż", "incorrect": "rz" }, "ura", { "correct": "w", "incorrect": "f" }, ""],
		"życiorys": ["", { "correct": "ż", "incorrect": "rz" }, "yciory", { "correct": "s", "incorrect": "z" }],
		"żywopłot": ["", { "correct": "ż", "incorrect": "rz" }, "ywopło", { "correct": "t", "incorrect": "d" }, ""]
	},
}

var _difficulty := Game.Difficulty.NORMAL
var _words: Array[Word] = []
var _round: int = 1

@onready var difficulty_picker: Control = %DifficultyPicker
@onready var challenge: Control = %Challenge
@onready var words_container: Control = %WordsContainer
@onready var check_button: Button = %CheckButton

func _on_difficulty_picked(difficulty: Game.Difficulty) -> void:
	_difficulty = difficulty

	_pick_random_words()
	difficulty_picker.hide()
	challenge.show()

func _on_blank_changed(was_revealed: bool, changed_word: Word) -> void:
	# Enable the check button only if all blanks are filled in.
	check_button.disabled = not _words.all(
		func (word: Word) -> bool: return word.are_blanks_filled_in()
	)

	if was_revealed:
		for word in _words:
			if word != changed_word:
				word.conceal()

func _on_check_button_pressed():
	var correct := true

	for word in _words:
		word.reveal()

		if not word.are_blanks_filled_in_correctly():
			correct = false

	if correct:
		await notify_companion_approval()

		if _round < 5:
			await notify_companion("Czeka na nas następny poziom")
			_round += 1
			_pick_random_words()
		else:
			finished.emit()
	else:
		await notify_companion_correction()
		_pick_random_words()

func _pick_random_words() -> void:
	var dictionary = DICTIONARIES[_difficulty]
	var words = dictionary.keys()

	_words.clear()
	words.shuffle()
	_reset_words()

	for i in range(2):
		var fragments = dictionary[words[i]]
		var word = Word.new(fragments)

		word.blank_changed.connect(_on_blank_changed.bind(word))

		_words.append(word)
		words_container.add_child(word.container)

func _reset_words() -> void:
	check_button.disabled = true

	for child in words_container.get_children():
		words_container.remove_child(child)
		child.queue_free()

class Tile:
	enum Type {
		UNSELECTED,
		SELECTED,
		CORRECT,
		INCORRECT,
	}

	const _TILE_FOCUS := preload("res://assets/textures/square_button_focus.tres")
	const _GRAY_TILE_NORMAL := preload("res://assets/textures/square_button_gray_normal.tres")
	const _GRAY_TILE_HOVER := preload("res://assets/textures/square_button_gray_hover.tres")
	const _GRAY_TILE_PRESSED := preload("res://assets/textures/square_button_gray_pressed.tres")
	const _BLUE_TILE_NORMAL := preload("res://assets/textures/square_button_blue_normal.tres")
	const _BLUE_TILE_HOVER := preload("res://assets/textures/square_button_blue_hover.tres")
	const _BLUE_TILE_PRESSED := preload("res://assets/textures/square_button_blue_pressed.tres")
	const _GREEN_TILE_NORMAL := preload("res://assets/textures/square_button_green_normal.tres")
	const _GREEN_TILE_HOVER := preload("res://assets/textures/square_button_green_hover.tres")
	const _GREEN_TILE_PRESSED := preload("res://assets/textures/square_button_green_pressed.tres")
	const _RED_TILE_NORMAL := preload("res://assets/textures/square_button_red_normal.tres")
	const _RED_TILE_HOVER := preload("res://assets/textures/square_button_red_hover.tres")
	const _RED_TILE_PRESSED := preload("res://assets/textures/square_button_red_pressed.tres")

	var button: Button:
		get:
			return self._button

	var _button := Button.new()

	func _init(text: String) -> void:
		self._button.text = text.to_upper()
		self._button.custom_minimum_size = Vector2(96, 96)

		self._button.add_theme_font_size_override(&"font_size", 54)
		self._button.add_theme_stylebox_override(&"focus", self._TILE_FOCUS)
		self.set_type(self.Type.UNSELECTED)

	func set_type(type: Tile.Type) -> void:
		var texture_normal: StyleBox
		var texture_hover: StyleBox
		var texture_pressed: StyleBox

		match type:
			self.Type.UNSELECTED:
				texture_normal = self._GRAY_TILE_NORMAL
				texture_hover = self._GRAY_TILE_HOVER
				texture_pressed = self._GRAY_TILE_PRESSED
			self.Type.SELECTED:
				texture_normal = self._BLUE_TILE_NORMAL
				texture_hover = self._BLUE_TILE_HOVER
				texture_pressed = self._BLUE_TILE_PRESSED
			self.Type.CORRECT:
				texture_normal = self._GREEN_TILE_NORMAL
				texture_hover = self._GREEN_TILE_HOVER
				texture_pressed = self._GREEN_TILE_PRESSED
			self.Type.INCORRECT:
				texture_normal = self._RED_TILE_NORMAL
				texture_hover = self._RED_TILE_HOVER
				texture_pressed = self._RED_TILE_PRESSED

		self._button.add_theme_stylebox_override(&"normal", texture_normal)
		self._button.add_theme_stylebox_override(&"hover", texture_hover)
		self._button.add_theme_stylebox_override(&"pressed", texture_pressed)

class Blank:
	signal changed

	var container: Control:
		get:
			return self._container

	var _container := VBoxContainer.new()
	var _button_group := ButtonGroup.new()
	var _correct_tile: Tile
	var _incorrect_tile: Tile

	func _init(correct_tile: Tile, incorrect_tile: Tile) -> void:
		self._correct_tile = correct_tile
		self._incorrect_tile = incorrect_tile

		self._container.alignment = BoxContainer.ALIGNMENT_CENTER

		self._button_group.allow_unpress = true
		self._correct_tile.button.toggle_mode = true
		self._correct_tile.button.button_group = self._button_group
		self._incorrect_tile.button.toggle_mode = true
		self._incorrect_tile.button.button_group = self._button_group

		# Prevent the correct tile from always ending up in the same spot.
		if randi_range(0, 1) == 0:
			self._container.add_child(self._correct_tile.button)
			self._container.add_child(self._incorrect_tile.button)
		else:
			self._container.add_child(self._incorrect_tile.button)
			self._container.add_child(self._correct_tile.button)

		self._button_group.pressed.connect(self._on_pressed)

	func is_filled_in() -> bool:
		return self._button_group.get_pressed_button() != null

	func is_filled_in_correctly() -> bool:
		return self._button_group.get_pressed_button() == self._correct_tile.button

	func conceal() -> void:
		var button := self._button_group.get_pressed_button()

		if button == self._correct_tile.button:
			self._correct_tile.set_type(Tile.Type.SELECTED)

		if button == self._incorrect_tile.button:
			self._incorrect_tile.set_type(Tile.Type.SELECTED)

	func reveal() -> void:
		var button := self._button_group.get_pressed_button()

		if button == self._correct_tile.button:
			self._correct_tile.set_type(Tile.Type.CORRECT)

		if button == self._incorrect_tile.button:
			self._incorrect_tile.set_type(Tile.Type.INCORRECT)

	func _on_pressed(button: BaseButton) -> void:
		if button.button_pressed:
			if button == self._correct_tile.button:
				self._correct_tile.set_type(Tile.Type.SELECTED)
				self._incorrect_tile.set_type(Tile.Type.UNSELECTED)
			else:
				self._correct_tile.set_type(Tile.Type.UNSELECTED)
				self._incorrect_tile.set_type(Tile.Type.SELECTED)
		else:
			self._correct_tile.set_type(Tile.Type.UNSELECTED)
			self._incorrect_tile.set_type(Tile.Type.UNSELECTED)

		self.changed.emit()

class Word:
	signal blank_changed(was_revealed: bool)

	var container: Control:
		get:
			return self._container

	var _container := HBoxContainer.new()
	var _revealed := false
	var _blanks: Array[Blank] = []

	func _init(fragments: Array) -> void:
		for fragment in fragments:
			var child: Control

			if typeof(fragment) == TYPE_STRING:
				child = Label.new()
				child.text = fragment.to_upper()
				child.add_theme_font_size_override(&"font_size", 72)
			else:
				var correct_tile := Tile.new(fragment["correct"])
				var incorrect_tile := Tile.new(fragment["incorrect"])
				var blank := Blank.new(correct_tile, incorrect_tile)
				child = blank._container

				blank.changed.connect(self._emit_blank_change)

				_blanks.append(blank)

			self._container.add_child(child)

	func are_blanks_filled_in() -> bool:
		return self._blanks.all(
			func (blank: Blank) -> bool: return blank.is_filled_in()
		)

	func are_blanks_filled_in_correctly() -> bool:
		return self._blanks.all(
			func (blank: Blank) -> bool: return blank.is_filled_in_correctly()
		)

	func conceal() -> void:
		self._revealed = false

		for blank in self._blanks:
			blank.conceal()

	func reveal() -> void:
		self._revealed = true

		for blank in self._blanks:
			blank.reveal()

	func _emit_blank_change() -> void:
		var was_revealed := self._revealed
		self._revealed = false

		self.blank_changed.emit(was_revealed)
