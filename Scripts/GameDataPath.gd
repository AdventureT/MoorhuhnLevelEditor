extends Node

var path : String

# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists("res://settings.txt"):
		var f = FileAccess.open("res://settings.txt", FileAccess.READ)
		path = f.get_line()
	else:
		var fileDialog = FileDialog.new()
		fileDialog.popup()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
