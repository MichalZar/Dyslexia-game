extends Control

signal exited

@onready var load_button = %LoadButton

func _on_back_button_pressed():
	exited.emit()

func _on_load_button_pressed():
	print("Wciśnięto przycisk \"Wczytaj\"")

func _on_saved_games_save_selected(name):
	load_button.disabled = false
	print("Zaznaczono zapis \"{name}\"".format({ "name": name }))

func _on_saved_games_save_chosen(name):
	print("Wybrano zapis \"{name}\"".format({ "name": name }))
