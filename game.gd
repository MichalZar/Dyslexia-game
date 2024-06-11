class_name Game
extends Object

enum Scene {
	CHALLENGE,
	CHALLENGE_PICK_MENU,
	NEW_GAME_MENU,
	LOAD_GAME_MENU,
	MAIN_MENU,
	PAUSE_MENU,
	SETTINGS_MENU,
}

enum Difficulty {
	EASY,
	NORMAL,
	HARD,
}

enum Challenge {
	LETTER_JIGSAW,
	MEMO,
	ORTHOGRAPHY,
	SYLLABLES_AND_SOUNDS,
	WORD_JIGSAW,
}

enum Companion {
	NONE,
	BEAR,
	LION,
	PANDA,
}

static var current_companion: Companion = Companion.NONE

# https://labdisia.disia.unifi.it/merlini/papers/Derangements.pdf
static func shuffle_into_derangement(array: Array) -> void:
	if array.size() < 2:
		return

	var n := array.size()
	var indices

	# Generate a derangement of indices.
	while indices == null:
		var v := range(n)
		var fixed := false

		for i in range(n - 1, -1, -1):
			var p := randi_range(0, n - 1)

			if v[p] == i:
				fixed = true
				break
			else:
				var tmp = v[i]
				v[i] = v[p]
				v[p] = tmp

		if not fixed and v[0] != 0:
			indices = v

	# Sort elements of `array` according to the generated derangement. This is
	# pretty inefficient but we operate on small arrays, so it's sufficient.
	var sorted_elements = []

	for i in range(n):
		sorted_elements.append([indices[i], array[i]])

	sorted_elements.sort_custom(func(a, b): return a[0] < b[0])

	for i in range(n):
		array[i] = sorted_elements[i][1]
