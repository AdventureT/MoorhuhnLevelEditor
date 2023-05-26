extends Sprite2D

@onready var loading_sprites_data = get_node("/root/LoadEntities")


# Called when the node enters the scene tree for the first time.
func _ready():
	var data = loading_sprites_data.get_data()
	for data1 in data:
		var file_path = "C:\\Users\\Leon\\Desktop\\The Good the Egg and the Ugly\\Game\\data\\output\\data\\loading\\sprites\\{0}.jpg".format({0:data1[0]})
		var img = Image.new()
		img.load(file_path)
		var texture = ImageTexture.create_from_image(img)
		if data1[1] != "static":
				push_error("Not supporting RLE Sprites")
		if texture != null:
			$".".texture = texture
			$".".centered = false
			var viewportWidth = get_viewport().size.x
			var viewportHeight = get_viewport().size.y

			var scaleX = viewportWidth / $".".texture.get_size().x
			var scaleY = viewportHeight / $".".texture.get_size().y

			$".".set_scale(Vector2(scaleX, scaleY))
			
			
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
