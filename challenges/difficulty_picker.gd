extends Control

signal difficulty_picked(difficulty: Game.Difficulty);

func _on_easy_pressed():
	difficulty_picked.emit(Game.Difficulty.EASY)

func _on_normal_pressed():
	difficulty_picked.emit(Game.Difficulty.NORMAL)

func _on_hard_pressed():
	difficulty_picked.emit(Game.Difficulty.HARD)
