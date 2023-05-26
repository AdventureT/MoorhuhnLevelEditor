extends Node

var data = []

func get_data():
	return data

# Called when the node enters the scene tree for the first time.
func _ready():
	var file_path = "C:\\Users\\Leon\\Desktop\\The Good the Egg and the Ugly\\Game\\data\\output\\data\\loading\\sprites.txt"
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
