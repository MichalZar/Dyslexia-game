extends Node

const SETTINGS_PATH := "user://settings.json";
const DEFAULT_SETTINGS := {
	"version": 1,
	"sound": {
		"music": 1,
		"ui": 1,
	},
	"display": {
		"fullscreen": false,
	},
}

var music_volume: float:
	get:
		return _settings["sound"]["music"]
	set(value):
		_settings["sound"]["music"] = value
var ui_volume: float:
	get:
		return _settings["sound"]["ui"]
	set(value):
		_settings["sound"]["ui"] = value
var fullscreen: bool:
	get:
		return _settings["display"]["fullscreen"]
	set(value):
		_settings["display"]["fullscreen"] = value

# The default value must be duplicated to prevent using the same object that is
# assigned to `DEFAULT_SETTINGS`. (Also, attempts to change that object would
# throw since it's assigned to a constant.)
var _settings := DEFAULT_SETTINGS.duplicate(true)
var _load_error := false

func _init():
	var file := FileAccess.open(SETTINGS_PATH, FileAccess.READ)

	if file != null:
		var settings := file.get_as_text()
		var result = _parse_settings(settings)

		if result != OK:
			_load_error = true

func has_load_error() -> bool:
	return _load_error

func save_settings() -> void:
	# Because opening a file with the `WRITE` mode is the only way to truncate a
	# file in Godot, this doesn't keep a reference to an open file.
	var file := FileAccess.open(SETTINGS_PATH, FileAccess.WRITE)

	if file != null:
		var content := JSON.stringify(_settings, "\t")

		file.store_string(content)

func _parse_settings(settings: String) -> Error:
	var parsed_settings := {}
	var json := JSON.new()
	var result := json.parse(settings)

	if result != OK:
		return result

	if typeof(json.data) != TYPE_DICTIONARY:
		return FAILED

	if _parse_version(json.data, parsed_settings) != OK:
		return FAILED

	if _parse_sound_settings(json.data, parsed_settings) != OK:
		return FAILED

	if _parse_display_settings(json.data, parsed_settings) != OK:
		return FAILED

	_settings = parsed_settings

	return OK

func _parse_version(data: Dictionary, settings: Dictionary) -> Error:
	var version = data.get("version")

	if typeof(version) != TYPE_FLOAT:
		return FAILED

	# JSON stores all numbers as floats so we need to check whether this is
	# an integer. (If it's not, then it won't be equal to truncated version
	# of itself.)
	if version != int(version):
		return FAILED

	settings["version"] = version

	return OK

func _parse_sound_settings(data: Dictionary, settings: Dictionary) -> Error:
	var sound = data.get("sound")

	if typeof(sound) != TYPE_DICTIONARY:
		return FAILED

	var music = sound.get("music")
	var ui = sound.get("ui")

	if typeof(music) != TYPE_FLOAT:
		return FAILED

	if typeof(ui) != TYPE_FLOAT:
		return FAILED

	settings["sound"] = {
		"music": music,
		"ui": ui,
	}

	return OK

func _parse_display_settings(data: Dictionary, settings: Dictionary) -> Error:
	var display = data.get("display")

	if typeof(display) != TYPE_DICTIONARY:
		return FAILED

	var fullscreen = display.get("fullscreen")

	if typeof(fullscreen) != TYPE_BOOL:
		return FAILED

	settings["display"] = {
		"fullscreen": fullscreen,
	}

	return OK
