extends Node

func LoadTxt(filename):
	var result = {}
	var f = FileAccess.open(filename, FileAccess.READ)
	
	while f.get_position() < f.get_length():
		var str = f.get_line()
		RegEx.
		print(str)
		

# Called when the node enters the scene tree for the first time.
func _ready():
	LoadTxt("C:\\Users\\Leon\\Desktop\\The Good the Egg and the Ugly\\Game\\data\\output\\data\\loading\\sprites.txt")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
