extends Node

@onready var game_data_path = get_node("/root/GameDataPath")

var data = []

func get_data():
	return data

# Called when the node enters the scene tree for the first time.
func _ready():
	var file_path = "{0}\\loading\\sprites.txt".format({0:game_data_path.path})
	var string_data = loadStringFromFile(file_path)

	data = splitLinesAndWordsDigits(string_data)
	
	print(data)

func loadStringFromFile(file_path: String) -> String:
	var string_data = ""

	var file = FileAccess.open(file_path, FileAccess.READ)
	string_data = file.get_as_text()

	return string_data

func splitLinesAndWordsDigits(string_data: String) -> Array:
	var lines = string_data.split("\n")
	var result = []

	for line in lines:
		line = line.replace("\r", "")  # Remove carriage return characters
		var words_digits = line.split("\t",false)
		if !words_digits.is_empty():
			result.append(words_digits)

	return result


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
