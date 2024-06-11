extends Control

signal challenge_picked(challenge: Game.Challenge)

func _on_syllables_and_sounds_pressed():
	challenge_picked.emit(Game.Challenge.SYLLABLES_AND_SOUNDS)

func _on_memo_pressed():
	challenge_picked.emit(Game.Challenge.MEMO)

func _on_orthography_pressed():
	challenge_picked.emit(Game.Challenge.ORTHOGRAPHY)

func _on_letter_jigsaw_pressed():
	challenge_picked.emit(Game.Challenge.LETTER_JIGSAW)

func _on_word_jigsaw_pressed():
	challenge_picked.emit(Game.Challenge.WORD_JIGSAW)
