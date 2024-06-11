extends Challenge

const DICTIONARIES = {
	Game.Difficulty.EASY: {
		"balon": {
			"syllables": ["ba", "lon"],
			"sounds": ["b", "a", "l", "o", "n"],
		},
		"biurko": {
			"syllables": ["biur", "ko"],
			"sounds": ["b", "i", "u", "r", "k", "o"],
		},
		"drzewo": {
			"syllables": ["drze", "wo"],
			"sounds": ["d", "rz", "e", "w", "o"],
		},
		"dzwonek": {
			"syllables": ["dzwo", "nek"],
			"sounds": ["dz", "w", "o", "n", "e", "k"],
		},
		"kolor": {
			"syllables": ["ko", "lor"],
			"sounds": ["k", "o", "l", "o", "r"],
		},
		"koło": {
			"syllables": ["ko", "ło"],
			"sounds": ["k", "o", "ł", "o"],
		},
		"kreda": {
			"syllables": ["kre", "da"],
			"sounds": ["k", "r", "e", "d", "a"],
		},
		"kwiatek": {
			"syllables": ["kwia", "tek"],
			"sounds": ["k", "w", "i", "a", "t", "e", "k"],
		},
		"lampa": {
			"syllables": ["lam", "pa"],
			"sounds": ["l", "a", "m", "p", "a"],
		},
		"ławka": {
			"syllables": ["ław", "ka"],
			"sounds": ["ł", "a", "w", "k", "a"],
		},
		"motyl": {
			"syllables": ["mo", "tyl"],
			"sounds": ["m", "o", "t", "y", "l"],
		},
		"piłka": {
			"syllables": ["pił", "ka"],
			"sounds": ["p", "i", "ł", "k", "a"],
		},
		"rodzina": {
			"syllables": ["ro", "dzi", "na"],
			"sounds": ["r", "o", "dz", "i", "n", "a"],
		},
		"rower": {
			"syllables": ["ro", "wer"],
			"sounds": ["r", "o", "w", "e", "r"],
		},
		"samolot": {
			"syllables": ["sa", "mo", "lot"],
			"sounds": ["s", "a", "m", "o", "l", "o", "t"],
		},
		"serce": {
			"syllables": ["ser", "ce"],
			"sounds": ["s", "e", "r", "c", "e"],
		},
		"słońce": {
			"syllables": ["słoń", "ce"],
			"sounds": ["s", "ł", "o", "ń", "c", "e"],
		},
		"szkoła": {
			"syllables": ["szko", "ła"],
			"sounds": ["sz", "k", "o", "ł", "a"],
		},
		"zamek": {
			"syllables": ["za", "mek"],
			"sounds": ["z", "a", "m", "e", "k"],
		},
		"zegar": {
			"syllables": ["ze", "gar"],
			"sounds": ["z", "e", "g", "a", "r"],
		},
	},
	Game.Difficulty.NORMAL: {
		"ananas": {
			"syllables": ["a", "na", "nas"],
			"sounds": ["a", "n", "a", "n", "a", "s"],
		},
		"cebula": {
			"syllables": ["ce", "bu", "la"],
			"sounds": ["c", "e", "b", "u", "l", "a"],
		},
		"choinka": {
			"syllables": ["cho", "in", "ka"],
			"sounds": ["ch", "o", "i", "n", "k", "a"],
		},
		"kanapa": {
			"syllables": ["ka", "na", "pa"],
			"sounds": ["k", "a", "n", "a", "p", "a"],
		},
		"komputer": {
			"syllables": ["kom", "pu", "ter"],
			"sounds": ["k", "o", "m", "p", "u", "t", "e", "r"],
		},
		"korona": {
			"syllables": ["ko", "ro", "na"],
			"sounds": ["k", "o", "r", "o", "n", "a"],
		},
		"malina": {
			"syllables": ["ma", "li", "na"],
			"sounds": ["m", "a", "l", "i", "n", "a"],
		},
		"melodia": {
			"syllables": ["me", "lo", "dia"],
			"sounds": ["m", "e", "l", "o", "d", "i", "a"],
		},
		"papuga": {
			"syllables": ["pa", "pu", "ga"],
			"sounds": ["p", "a", "p", "u", "g-", "a"],
		},
		"parasol": {
			"syllables": ["pa", "ra", "sol"],
			"sounds": ["p", "a", "r", "a", "s", "o", "l"],
		},
		"przedszkole": {
			"syllables": ["przed", "szko", "le"],
			"sounds": ["p", "rz", "e", "d", "sz", "k", "o", "l", "e"],
		},
		"samochód": {
			"syllables": ["sa", "mo", "chód"],
			"sounds": ["s", "a", "m", "o", "ch", "ó", "d"],
		},
		"słodycze": {
			"syllables": ["sło", "dy", "cze"],
			"sounds": ["s", "ł", "o", "d", "y", "cz", "e"],
		},
		"sukienka": {
			"syllables": ["su", "kien", "ka"],
			"sounds": ["s", "u", "k", "i", "e", "n", "k", "a"],
		},
		"trudność": {
			"syllables": ["trud", "ność"],
			"sounds": ["t", "r", "u", "d", "n", "o", "ś", "ć"],
		},
		"tulipan": {
			"syllables": ["tu", "li", "pan"],
			"sounds": ["t", "u", "l", "i", "p", "a", "n"],
		},
		"wiaderko": {
			"syllables": ["wia", "der", "ko"],
			"sounds": ["w", "i", "a", "d", "e", "r", "k", "o"],
		},
		"zabawa": {
			"syllables": ["za", "ba", "wa"],
			"sounds": ["z", "a", "b", "a", "w", "a"],
		},
		"zabawki": {
			"syllables": ["za", "baw", "ki"],
			"sounds": ["z", "a", "b", "a", "w", "k", "i"],
		},
		"zegarek": {
			"syllables": ["ze", "ga", "rek"],
			"sounds": ["z", "e", "g", "a", "r", "e", "k"],
		},
	},
	Game.Difficulty.HARD: {
		"akwarium": {
			"syllables": ["a", "kwa", "rium"],
			"sounds": ["a", "k", "w", "a", "r", "i", "u", "m"],
		},
		"bezpieczeństwo": {
			"syllables": ["bez", "pie", "czeń", "stwo"],
			"sounds": ["b", "e", "z", "p", "i", "e", "cz", "e", "ń", "s", "t", "w", "o"],
		},
		"bezprzewodowy": {
			"syllables": ["bez", "prze", "wo", "do", "wy"],
			"sounds": ["b", "e", "z", "p", "rz", "e", "w", "o", "d", "o", "w", "y"],
		},
		"biblioteka": {
			"syllables": ["bi", "blio", "te", "ka"],
			"sounds": ["b", "i", "b", "l", "i", "o", "t", "e", "k", "a"],
		},
		"biedronka": {
			"syllables": ["bied", "ron", "ka"],
			"sounds": ["b", "i", "e", "d", "r", "o", "n", "k", "a"],
		},
		"dezorientacja": {
			"syllables": ["dez", "orien", "ta", "cja"],
			"sounds": ["d", "e", "z", "o", "r", "i", "e", "n", "t", "a", "c", "j", "a"],
		},
		"drożdżówka": {
			"syllables": ["droż", "dżów", "ka"],
			"sounds": ["d", "r", "o", "ż", "dż", "ó", "w", "k", "a"],
		},
		"elektrownia": {
			"syllables": ["e", "lek", "trow", "nia"],
			"sounds": ["e", "l", "e", "k", "t", "r", "o", "w", "n", "i", "a"],
		},
		"hipermarket": {
			"syllables": ["hi", "per", "mar", "ket"],
			"sounds": ["h", "i", "p", "e", "r", "m", "a", "r", "k", "e", "t"],
		},
		"książeczka": {
			"syllables": ["ksią", "żecz", "ka"],
			"sounds": ["k", "s", "i", "ą", "ż", "e", "cz", "k", "a"],
		},
		"matematyka": {
			"syllables": ["ma", "te", "ma", "ty", "ka"],
			"sounds": ["m", "a", "t", "e", "m", "a", "t", "y", "k", "a"],
		},
		"mikrofalówka": {
			"syllables": ["mi", "kro", "fa", "lów", "ka"],
			"sounds": ["m", "i", "k", "r", "o", "f", "a", "l", "ó", "w", "k", "a"],
		},
		"niedźwiedź": {
			"syllables": ["nie", "dźwiedź"],
			"sounds": ["n", "i", "e", "dź", "w", "i", "e", "dź"],
		},
		"odpowiedź": {
			"syllables": ["od", "po", "wiedź"],
			"sounds": ["o", "d", "p", "o", "w", "i", "e", "dź"],
		},
		"pszczółka": {
			"syllables": ["pszczół", "ka"],
			"sounds": ["p", "sz", "cz", "ó", "ł", "k", "a"],
		},
		"przyjaciel": {
			"syllables": ["przy", "ja", "ciel"],
			"sounds": ["p", "rz", "y", "j", "a", "c", "i", "e", "l"],
		},
		"skrzyżowanie": {
			"syllables": ["skrzy", "żo", "wa", "nie"],
			"sounds": ["s", "k", "rz", "y", "ż", "o", "w", "a", "n", "i", "e"],
		},
		"synchronizacja": {
			"syllables": ["syn", "chro", "ni", "za", "cja"],
			"sounds": ["s", "y", "n", "ch", "r", "o", "n", "i", "z", "a", "c", "j", "a"],
		},
		"szczęście": {
			"syllables": ["szczęś", "cie"],
			"sounds": ["sz", "cz", "ę", "ś", "c", "i", "e"],
		},
		"truskawka": {
			"syllables": ["trus", "kaw", "ka"],
			"sounds": ["t", "r", "u", "s", "k", "a", "w", "k", "a"],
		},
	},
}
const VOWELS := ["a", "ą", "e", "ę", "i", "o", "u", "ó", "y"]
const TileNormal := preload("res://challenges/syllables_and_sounds/tile_normal.png")
const TileCorrect := preload("res://challenges/syllables_and_sounds/tile_correct.png")
const TileIncorrect := preload("res://challenges/syllables_and_sounds/tile_incorrect.png")

var _current_dictionary: Dictionary
var _current_word := ""
var _current_syllable_idx: int = 0
var _current_sound_idx: int = 0
var _current_sounds: Array[String] = []
var _round: int = 1

@onready var difficulty_picker: Control = %DifficultyPicker
@onready var syllables_challenge: Control = %SyllablesChallenge
@onready var sounds_challenge: Control = %SoundsChallenge
@onready var sound_types_challenge: Control = %SoundTypesChallenge
@onready var syllables_word_label: Label = %SyllablesWord
@onready var sounds_word_label: Label = %SoundsWord
@onready var syllable_buttons: Array[TextureButton] = [
	%Syllable1,
	%Syllable2,
	%Syllable3,
	%Syllable4,
	%Syllable5,
	%Syllable6,
]
@onready var sounds_counter: LineEdit = %SoundsCounter
@onready var current_sound: Label = %CurrentSound
@onready var vowel_button: Button = %Vowel
@onready var consonant_button: Button = %Consonant
@onready var icon_correct: Control = %IconCorrect
@onready var icon_incorrect: Control = %IconIncorrect

func _on_difficulty_picked(difficulty: Game.Difficulty) -> void:
	_current_dictionary = DICTIONARIES[difficulty].duplicate()

	_pick_word()
	_start_syllables_challenge()

func _on_syllable_pressed(idx: int) -> void:
	var syllables := _get_current_syllables()
	var button := syllable_buttons[idx]
	var label: Label = button.get_node("Label")

	if label.text == syllables[_current_syllable_idx]:
		button.texture_normal = TileCorrect

		if _current_syllable_idx < syllables.size() - 1:
			_current_syllable_idx += 1
		else:
			await notify_companion_approval()
			_start_sounds_challenge()
			await notify_companion("Teraz czas na głoski, policz z ilu głosek składa się wyraz")
	else:
		button.texture_normal = TileIncorrect
		await notify_companion_correction()
		_start_syllables_challenge()

func _on_sound_count_text_submitted(new_text: String) -> void:
	if new_text.is_valid_int():
		if new_text.to_int() == _get_current_sounds_count():
			sounds_counter.editable = false

			await notify_companion_approval()
			_show_current_sound()
			sound_types_challenge.show()
		else:
			await notify_companion("Hmm… niestety nie jest to poprawna liczba. Spróbuj jeszcze raz!")
	else:
		await notify_companion("Niestety wpisany przez ciebie tekst nie jest liczbą całkowitą.")

func _on_vowel_pressed() -> void:
	var sound := _get_current_sound()

	if VOWELS.find(sound) != -1:
		_show_next_sound()
	else:
		_reset_sounds()

func _on_consonant_pressed() -> void:
	var sound := _get_current_sound()

	if VOWELS.find(sound) == -1:
		_show_next_sound()
	else:
		_reset_sounds()

func _start_syllables_challenge() -> void:
	var syllables := _shuffle_syllables()
	_current_syllable_idx = 0

	for i in range(syllables.size()):
		var button := syllable_buttons[i]
		var label: Label = button.get_node("Label")
		button.texture_normal = TileNormal
		label.text = syllables[i]

	difficulty_picker.hide()
	syllables_challenge.show()

func _start_sounds_challenge() -> void:
	_current_sound_idx = 0
	_current_sounds.append_array(_current_dictionary[_current_word]["sounds"])

	syllables_challenge.hide()
	sound_types_challenge.hide()
	sounds_counter.clear()
	sounds_counter.editable = true
	sounds_challenge.show()

func _pick_word() -> void:
	_current_word = _current_dictionary.keys().pick_random()
	syllables_word_label.text = _current_word
	sounds_word_label.text = _current_word

func _shuffle_syllables() -> Array[String]:
	var all_syllables: Array[String] = []
	# Duplicate the array to prevent shuffling of the syllables array in the
	# dictionary.
	var syllables := _get_current_syllables().duplicate()

	if syllables.size() < 6:
		for word_data: Dictionary in _current_dictionary.values():
			all_syllables.append_array(word_data["syllables"])

		while syllables.size() < 6:
			var syllable = all_syllables.pick_random()

			# Make sure that the picked syllable isn't already present in the
			# array.
			if syllables.find(syllable) == -1:
				syllables.append(syllable)

	syllables.shuffle()

	return syllables

func _show_current_sound() -> void:
	current_sound.text = _get_current_sound()

func _show_next_sound() -> void:
	await _show_answer_icon(true)

	if _current_sound_idx < _get_current_sounds_count() - 1:
		_current_sound_idx += 1
		_show_current_sound()
	else:
		await notify_companion_approval()

		if _round < 5:
			await notify_companion("Czas na następny poziom")
			_round += 1
			_current_dictionary.erase(_current_word)
			_current_sounds.clear()
			syllables_challenge.hide()
			sounds_challenge.hide()
			sound_types_challenge.hide()
			sounds_counter.clear()
			_pick_word()
			_start_syllables_challenge()
		else:
			finished.emit()

func _reset_sounds() -> void:
	await _show_answer_icon(false)

	_current_sound_idx = 0
	_show_current_sound()

func _show_answer_icon(correct: bool) -> void:
	var icon = icon_correct if correct else icon_incorrect

	icon.show()
	vowel_button.disabled = true
	consonant_button.disabled = true

	await get_tree().create_timer(1).timeout

	icon.hide()
	vowel_button.disabled = false
	consonant_button.disabled = false

func _get_current_syllables() -> Array[String]:
	var syllables: Array[String] = []

	# `assign()` performs type conversion. Otherwise, Godot throws an error at
	# runtime. See: https://github.com/godotengine/godot/pull/71336.
	syllables.assign(_current_dictionary[_current_word]["syllables"])

	return syllables

func _get_current_sounds_count() -> int:
	return _current_sounds.size()

func _get_current_sound() -> String:
	return _current_sounds[_current_sound_idx]
