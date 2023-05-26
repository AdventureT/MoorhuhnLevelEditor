extends Node

var re = RegEx.new()
var regex = "\\b[\\w\\d]+\\b"

# Called when the node enters the scene tree for the first time.
func _ready():
	var file_path = "C:\\Users\\Leon\\Desktop\\The Good the Egg and the Ugly\\Game\\data\\output\\data\\loading\\sprites.txt"
	var string_data = loadStringFromFile(file_path)

	var result = splitLinesAndWordsDigits(string_data)
	print(result)

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
		var matches = []

		#for i in range(words_digits.size()):
			#matches.append(words_digits.get(i).get_string(0))

		result.append(matches)

	return result


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
